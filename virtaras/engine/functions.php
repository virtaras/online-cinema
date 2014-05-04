<?
function get_images($source,$parentid,$where=""){
	return sql_arr("SELECT images.* FROM images WHERE source=$source AND parentid=$parentid $where");
}
function addToBasket($id,$quantity=1,$params=""){
	if($id>0 && $quantity>0){
		$basket_array = isset($_SESSION["basket"]) ? unserialize($_SESSION["basket"]) :   array();
		$basket_array[$id]=new BasketItem($quantity,$params);
		$_SESSION["basket"] = serialize($basket_array);
		return true;
	}
	return false;
}
function removeFromBasket($id){
	if($id>0){
		$basket_array = isset($_SESSION["basket"]) ? unserialize($_SESSION["basket"]) :   array();
		unset($basket_array[$id]);
		$_SESSION["basket"] = serialize($basket_array);
		return true;
	}
	return false;
}
function get_goods_filters($good,$filtercode,$goods_where=""){
	$filters=array();
	$goodsid=($good['goodsid']) ? $good['goodsid'] : $good['id'];
	$filters_sql="SELECT F.* FROM `$filtercode` F WHERE EXISTS (SELECT * FROM `goods` WHERE `goodsid`='$goodsid' AND `$filtercode`=F.id $goods_where)";
	return sql_arr($filters_sql);
}
function checkLogged(){
	return (bool)(isset($_SESSION["login_user"]["id"]) && ($_SESSION["login_user"]["id"]>0));
}
function getTovarByFieldsFromArr($goods,$fields){
	foreach($goods as $good){
		$found=true;
		foreach($fields as $key=>$value){
			if($good[$key]!=$value) $found=false;
		}
		if($found)
			return $good;
	}
	return false;
}
// ORDER
function get_sub_summ(){
	$sub_summ=0;
	$basket_array = isset($_SESSION["basket"]) ? unserialize($_SESSION["basket"]) :   array();
	$basket_array = isset($_SESSION["basket"]) ? unserialize($_SESSION["basket"]) :   array();
	$key = implode(",",array_keys($basket_array));
	$sql_text = "SELECT goods.* FROM goods WHERE goods.id IN (".$key.")";
	$sql=mysql_query($sql_text);
	while($tovar = mysql_fetch_assoc($sql)){
		$price = get_price($tovar["price_action"] > 0 ? $tovar["price_action"] : $tovar["price"],_DISPLAY_CURRENCY,$tovar["goodsid"],$tovar["currency"],(setting("discount_mode") == 3 && isset($_SESSION["login_user"])) ? true : false);
		$quantity = $basket_array[$tovar["id"]]->q;
		$full_price = $price*$quantity;
		$sub_summ+=$full_price;
	}
	$sub_summ=max($sub_summ,0);
	return $sub_summ;
}
function get_card_summ(){
	$card_summ=0;
	if(isset($_SESSION["card"])){
		$card_session=unserialize($_SESSION["card"]);
		$card=execute_row_assoc("SELECT site_cards.* FROM site_cards WHERE id=".$card_session["id"]."");
		if($card["status"]==1)
			$card_summ=$card["price"];
	}
	return $card_summ;
}
function get_bonus_summ(){
	$bonus_summ=0;
	if(isset($_SESSION["bonus"]) && checkLogged()){
		$user=execute_row_assoc("SELECT clients.* FROM clients WHERE id='".$_SESSION["login_user"]["id"]."'");
		$bonus_summ=max(min($_SESSION["bonus"],$user["bonus"]),0);
		$_SESSION["bonus"]=$bonus_summ;
	}
	return $bonus_summ;
}
function get_delivery($id=0){
	$where_id=($id>0) ? " WHERE id=".$id." " : ((isset($_SESSION["b_delivery"]) && $_SESSION["b_delivery"]>0) ? " WHERE id=".$_SESSION["b_delivery"]." " : "");
	$delivery=execute_row_assoc("SELECT * FROM delivery $where_id");
	return $delivery;
}
function get_order_sum(){
	$sub_summ=get_sub_summ();
	$delivery=get_delivery();
	$delivery_summ=$delivery["price"];
	$card_summ=get_card_summ();
	$bonus_summ=get_bonus_summ();
	$full_summ=$sub_summ+$delivery_summ-$card_summ-$bonus_summ;
	$res=array("sub_summ"=>$sub_summ,"delivery_summ"=>$delivery_summ,"card_summ"=>$card_summ,"bonus_summ"=>$bonus_summ,"full_summ"=>$full_summ);
	return $res;
}
//!ORDER

//IMAGES
function catalog_thumb($images_thumbs_array,$thumbs_array,$params_thumbs){
	$colour_thumb_array=array("Red"=>hexdec($colour_thumb_split[0]),"Green"=>hexdec($colour_thumb_split[1]),"Blue"=>hexdec($colour_thumb_split[2]),"alpha"=>127);
	return create_thumb($images_thumbs_array,$thumbs_array,$params_thumbs,$colour_thumb_array);
}
//!IMAGES
//GOODS
function get_goods_filter($filters){
	global $catalog_array;
	global $currency_array;
	global $base_currency;
	$catalogID = explode(",",$filters["id"]);
	$child_array = array();
	foreach($catalogID as $ID){
		$child_array[] = $ID;
		get_child_id($ID,&$child_array);
	}
	$where_parentid="";
	if(trim(implode(",",$child_array))!="")
		$where_parentid=" AND goods.parentid IN (".implode(",",$child_array).") ";
	$where = "";
	
	$fields = mysql_query("SELECT f.* FROM `fields` as f
    LEFT JOIN categoryfields cf ON   cf.fieldid = f.id
    WHERE f.id IS NOT NULL  AND f.search = 1 AND f.isgeneral = 1  
    ORDER BY cf.hide_default ASC,cf.showorder");
			while($field = mysql_fetch_assoc($fields))
			{
				if(!isset($filters[$field["rname"]]) || $filters[$field["rname"]]=="")
				{
					continue;
				}
				switch($field["field_type"])
				{
					case "1": //?????
						if(isset($filters[$field["rname"]]) != "")
						{
							$where .= " AND goods.".$field["rname"]." RLIKE '%".$filters[$field["rname"]]."%'";
						}
						break;
					case "2": //??????
						if(isset($filters[$field["rname"]]))
						{
							$where .= " AND goods.".$field["rname"]." IN (".$filters[$field["rname"]].") ";
						}
						break;
					case "3": //?????
						
						if($field["isinterval"] == 1)
						{
							if(isset($filters[$field["rname"]."s"]) && intval($filters[$field["rname"]."s"]) > 0)
							{
								$where .= " AND goods.".$field["rname"]." >=  ".$filters[$field["rname"]."s"];
							}
							if(isset($filters[$field["rname"]."f"]) && intval($filters[$field["rname"]."f"]) > 0)
							{
								$where .= " AND goods.".$field["rname"]." <= ".$filters[$field["rname"]."f"];
							}	
						}
						else
						{
							if(isset($filters[$field["rname"]]))
							{
								$where .= " AND goods.".$field["rname"]." = ".$filters[$field["rname"]]."";
							}
						}
						break;
						
					case "5":
							$where .= " AND goods.id IN (SELECT goodsid FROM s" . $field["table_name"] . " WHERE valueid IN (".$filters[$field["rname"]].") ) "; 
						break;
				}
			}
			$where .= " AND goods.goodsid = 0 ";
			if(isset($filters["date"]) && $filters["date"]!= ""){
				$where.=" AND (";
				$dates=explode(",",prep(stripslashes($filters["date"])));
				foreach($dates as $date){
					$date_arr=explode("--",$date);
					$date_start=$date_arr[0];
					$date_finish=$date_arr[1];
					$date_values[]=" (goods.sdate>='$date_start' AND goods.sdate<'$date_finish') ";
					$date_values[]=" EXISTS(SELECT * FROM goods G WHERE G.goodsid=goods.id AND G.sdate>='$date_start' AND G.sdate<'$date_finish') ";
				}
				$where.=implode(" OR ",$date_values);
				$where.=" )";
			}
		//$where.=" AND (goods.sdate>NOW() OR goods.sdate='0000-00-00')";
		$orderby="  ORDER BY YEAR(goods.sdate) ASC, MONTH(goods.sdate) ASC, DAY(goods.sdate) ASC ";
		//echo $where;
				$sql_text = "SELECT goods.*,IF(catalog.one_name != '',catalog.one_name,catalog.name) as cname,brands.name as brandname,brands.urlname as brandurl,goods.id as gid,goods.currency as gcurrency,
				IF(goods.price_action > 0,goods.price_action,goods.price)*(SELECT course FROM currency_course WHERE from_currency = gcurrency AND to_currency = $base_currency) as vprice,exist_type.name as extype,
				(SELECT id FROM images WHERE source = 3 AND parentid = goods.id AND is_main = 1 LIMIT 0,1) as imid,
			(SELECT format FROM images WHERE source = 3 AND parentid = goods.id AND is_main = 1 LIMIT 0,1) as imformat
			FROM goods
			INNER JOIN catalog ON catalog.id = goods.parentid
			LEFT JOIN brands ON brands.id = goods.brand
			LEFT JOIN exist_type ON exist_type.id = goods.exist_type
			WHERE 1=1 $where_parentid AND goods.exist_type != 2 AND goods.price > 0  $where $orderby";
			
			$count_sql_str = "SELECT count(goods.id)
			FROM goods
			INNER JOIN catalog ON catalog.id = goods.parentid
			WHERE 1=1 $where_parentid AND goods.exist_type != 2 AND goods.price > 0 $where ";
	$result=array("sql_text"=>$sql_text,"count_sql_str"=>$count_sql_str);
	//echo $sql_text;
	return $result;
}
//!GOODS
function check_comment_form(){
	$allow=true;
	$ip=$_SERVER['REMOTE_ADDR'];
	$ban=execute_scalar("SELECT COUNT(*) FROM comments_ipban WHERE ipaddress='$ip' LIMIT 0,1");
	$allow=($allow && $ban<1);
	$status=setting("comments_show_status");
	switch($status){
		case "2":
			$allow=($allow && checkLogged());
			break;
		case "3":
			$allow=($allow && false);
			break;
	}
	return $allow;
}
function get_comment_link($commentid){
	$comment=execute_row_assoc("SELECT comments.* FROM comments WHERE id='$commentid'");
	$link="http://".$_SERVER["HTTP_HOST"]."/";
	switch($comment["source"]){
		case "1":
			$tovar=execute_row_assoc("SELECT goods.* FROM goods WHERE id='".$comment["parentid"]."'");
			$link.=$tovar["urlname"]."-p".$tovar["id"];
			break;
		case "2":
			$news=execute_row_assoc("SELECT content.* FROM content WHERE id='".$comment["parentid"]."'");
			$link.=$news["url"];
			break;
	}
	return $link;
}