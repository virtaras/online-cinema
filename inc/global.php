<?php
if (!function_exists("htmlspecialchars_decode")) {
function htmlspecialchars_decode($string,$style=ENT_COMPAT)
    {
        $translation = array_flip(get_html_translation_table(HTML_SPECIALCHARS,$style));
        if($style === ENT_QUOTES){ $translation['&#039;'] = '\''; }
        return strtr($string,$translation);
    } }
function execute_scalar($query)
{
	$res = mysql_query($query);
	$row =  mysql_fetch_array($res);
	return $row[0];
}
function execute_row_assoc($query)
{
	$res = mysql_query($query);
	return mysql_fetch_assoc($res);
}
function execute_row_array($query)
{
	$res = mysql_query($query);
	return mysql_fetch_array($res);
}
function get_last_id($table)
{
	$lastidsql = mysql_query("select LAST_INSERT_ID() as ID from $table ");
	$lastid = mysql_fetch_assoc($lastidsql);
	return $lastid["ID"];
}
function get_main_image($id,$resize = 130,$source = 0)
{
	$images = execute_scalar("SELECT id FROM images WHERE parentid = '$id' AND source = '$source'  ORDER BY is_main DESC LIMIT 0,1");
	if($images != "")
	{
		return _SITE."images/$resize/$images.jpg";
	}
	else
	{
		return _TEMPL."images/nofoto.jpg";;
	}
}
function get_main_image_path($id,$source = 0,$index = 0)
{
	$images = execute_scalar("SELECT image FROM images WHERE parentid = '$id' AND source = '$source'  ORDER BY is_main DESC LIMIT $index,1");
	if($images != "")
	{
		return "/images/files/$images";
	}
	else
	{
		return "";
	}
}
function get_main_image_id($id,$source = 0)
{
	return execute_scalar("SELECT id FROM images WHERE parentid = '$id' AND source = '$source'  ORDER BY is_main DESC LIMIT 0,1");
}
function get_content_info($parent=0, $where = "",$limit_from = '', $limit = '') {
    $arr = array();
     $sql=mysql_query("SELECT *	FROM content WHERE parentid IN ($parent)  AND ispublish='1' $where ORDER BY showorder".($limit ? " LIMIT ".$limit_from.",".$limit  : '')."");
				while ($r=mysql_fetch_assoc($sql)){
                    array_push($arr, $r);
                }

     return $arr;
}

function get_gallery($parent ='', $source = '', $is_main = '', $limit = '') {
    $arr = array();
     $sql=mysql_query("SELECT *	FROM images WHERE parentid='$parent' AND source='$source' ".($is_main == 0 ? " AND is_main = '$is_main'" : '')." ORDER BY showorder".($limit ? "LIMIT 0,$limit " : '')." ");
				while ($r=mysql_fetch_assoc($sql)){
                    array_push($arr, $r);
                }

     return $arr;
}
function get_parent_category($id,$table)
{
	$sql = mysql_query("SELECT * FROM $table WHERE id = '$id' ");
	$r = mysql_fetch_assoc($sql);
	$arr = array();
      if ($r['parentid'] == 0) {
            return $r;
      }
       return   get_parent_category($r['parentid'],$table);
}

function highlight_this($text, $words) {
   $words = trim($words);
    $wordsArray = explode(' ', $words);
    foreach($wordsArray as $word) {
        if(strlen(trim($word)) != 0)
           $text = eregi_replace($word, '<span class="highlight">\\0</span>', $text); 
    }

    return $text;
} 
function cyr_strtolower($a) {
        $offset=32;
        $m=array();
        for($i=192;$i<224;$i++)$m[chr($i)]=chr($i+$offset);
        return strtr($a,$m);
}
function cyr_strtoupper($a) {
        $offset=32;
        $m=array();
        for($i=192;$i<224;$i++)$m[chr($i+$offset)]=chr($i);
        return strtr($a,$m);
}
function maxsite_str_word($text, $counttext = 30, $sep = ' ') {
	$words = split($sep, $text);

	if ( count($words) > $counttext )
		$text = join($sep, array_slice($words, 0, $counttext));

	return $text;
}
function html($name)
{
	echo htmlspecialchars_decode(execute_scalar("SELECT html FROM contentarea WHERE strongname = '$name'"),ENT_QUOTES);
}
function html2($name)
{
	return strip_tags(htmlspecialchars_decode(execute_scalar("SELECT html FROM contentarea WHERE strongname = '$name'"),ENT_QUOTES));
}
function html3($name)
{
	return htmlspecialchars_decode(execute_scalar("SELECT html FROM contentarea WHERE strongname = '$name'"),ENT_QUOTES);
}
function content($name = "content",$id = "")
{
	switch($name)
	{
		case "content":
			if(function_exists("get_content"))
			{
				get_content();
			}
		break;
		case "meta":
			global $title;
			global $description;
			global $keywords;
			?>
			<title><?=$title?></title>
			<meta name="description" content="<?=$description?>" />
			<meta name="keywords" content="<?=$keywords?>" />
			<?
		break;
	case "form":
		include("form.php");
		get_fields($id);
		break;	
	}
}
function setting($name)
{
	return execute_scalar("SELECT val FROM settings WHERE name = '$name'");
}
function check_email($email)
{
	if(eregi('^([a-z0-9_]|\\-|\\.)+'.'@'.'(([a-z0-9_]|\\-)+\\.)+'.'[a-z0-9]{2,4}$', $email))
	{
		return true;
	}
	else
	{
		return false;
	}
}
function get_path_array($id,&$arr = array())
{
		$sql_text = "SELECT parentid FROM content WHERE id = '$id'";
    if(!is_numeric($id))
    {
        $sql_text = "SELECT parentid FROM content WHERE urlname = '$id'";
    }
    $parent = execute_scalar($sql_text);
	
	if($parent != "0")
	{
		array_push($arr,$parent);
		get_path_array($parent,$arr);
	}
	

	
}

function set_visited($id)
{
	if(setcookie("content".$id,"1",time()+60*60*24*30,"/"))
	{
		
	}
	else
	{
		$_SESSION["content".$id] = "1";
	}
}
function check_visited($id)
{
	if(isset($_COOKIE["content".$id]) || isset($_SESSION["content".$id]))
	{
		return true;
	}
	else
	{
		return false;
	}
}

function get_content_positions($parent = 0,$limit = "",$is_url = false)
{
	$arr = array();
	$sql = mysql_query("SELECT id,name,url FROM content WHERE parentid = '$parent' AND ispublish = 1 ORDER BY showorder ASC ".($limit != "" ? "LIMIT 0,".$limit : ""));
	while($r = mysql_fetch_assoc($sql))
	{
		if($is_url)
		{
			$arr[$r["url"]] = $r["name"];
		}
		else
		{
			$arr[$r["id"]] = $r["name"];
		}	
	}
	return $arr;
}

function get_field($table,$id,$field = "name")
{
	return execute_scalar("SELECT $field FROM $table WHERE id = '$id'");
}
function get_child($parentid,&$childarray)
{
	$sql = mysql_query("SELECT id FROM catalog WHERE parentid = '$parentid'");
	while($r = mysql_fetch_assoc($sql))
	{
		array_push($childarray,$r["id"]);
		get_child($r["id"],&$childarray);
	}
}
function cp1251_utf8( $sInput )
{
    $sOutput = "";

    for ( $i = 0; $i < strlen( $sInput ); $i++ )
    {
        $iAscii = ord( $sInput[$i] );

        if ( $iAscii >= 192 && $iAscii <= 255 )
            $sOutput .=  "&#".( 1040 + ( $iAscii - 192 ) ).";";
        else if ( $iAscii == 168 )
            $sOutput .= "&#".( 1025 ).";";
        else if ( $iAscii == 184 )
            $sOutput .= "&#".( 1105 ).";";
        else
            $sOutput .= $sInput[$i];
    }

    return $sOutput;
}
function get_title()
{
	global $content_type;
	switch($content_type)
	{
		case "static":
			global $currentpage;
			echo $currentpage["caption"];
			break;
		case "content":
			global $head;
			echo $head["name"];
			break;
        case "news":
            global $title;
			echo $title;
             break;
		default:
			global $title;
			echo $title;
			break;
		 case "questions":
            global $title;
			echo $title;
             break;
	}
}
 
function get_path()
{
	global $content_type;
	switch($content_type)
	{
		case "static":
			global $currentpage;
			if($currentpage["name"] == "index")
			{
				?>
				<a  href="<?=_SITE.$currentpage["name"]?>.html"><?=$currentpage["caption"]?></a>
				<?
			}
			else
			{
			?>
			<span class="sep">&larr;</span><a  href="<?=_SITE?>">На главную</a><span class="sep">&larr;</span> <a href="<?=_SITE.$currentpage["name"]?>.html"><?=$currentpage["caption"]?></a>
			<?
			}
			break;
		case "content":
			global $head;
			$arr = array($head["id"]);
			get_path_array($head["id"],&$arr);
			$arr = array_reverse($arr);
			reset($arr);
			?>
			 <span class='sep'>&larr;</span><a  href="<?=_SITE?>">На главную</a>
			<?
			foreach($arr as $key)
			{
			  $urlname = execute_scalar("SELECT url FROM content WHERE id = $key");
			  $path .= " <span class='sep'>&larr;</span><a href='"._SITE."".(  $urlname != "" ?   $urlname : $key )."'>".execute_scalar(is_numeric($key) ? "SELECT name FROM content WHERE id = '$key'" :"SELECT name FROM content WHERE urlname = '$key'" )."</a>";
			}
			echo $path;
			break;
        case "news":
           global $head;
			$arr = array($head["id"]);
			get_path_array($head["id"],&$arr);
			$arr = array_reverse($arr);
			reset($arr);
			?>
			 <span class='sep'>&larr;</span><a  href="<?=_SITE?>">На главную</a>
			<?
			foreach($arr as $key)
			{
			  $urlname = execute_scalar("SELECT url FROM content WHERE id = $key");
			  $path .= " <span class='sep'>&larr;</span><a href='"._SITE."".(  $urlname != "" ?   $urlname : $key )."'>".execute_scalar(is_numeric($key) ? "SELECT name FROM content WHERE id = '$key'" :"SELECT name FROM content WHERE urlname = '$key'" )."</a>";
			}
			echo $path;
			break;
		case "shops_category":
            global $head;
		?>
           <span class="sep">&larr;</span> <a  href="<?=_SITE?>">На главную</a>  <span class="sep">&larr;</span> <a href="<?=_SITE?>magaziny">Магазины</a> <span class="sep">&larr;</span><a href="<?=_SITE.$head["url"]?>"><?=$head["name"]?></a><?
             break;
        case "shop":
			global $head;
			$arr = array($head["id"]);
			get_path_array($head["id"],&$arr);
			$arr = array_reverse($arr);
			reset($arr);
			?>
			 <span class='sep'>&larr;</span><a  href="<?=_SITE?>">На главную</a>
			<?
			foreach($arr as $key)
			{
			  $urlname = execute_scalar("SELECT url FROM content WHERE id = $key");
			  $path .= " <span class='sep'>&larr;</span><a href='"._SITE."".(  $urlname != "" ?   $urlname : $key )."'>".execute_scalar(is_numeric($key) ? "SELECT name FROM content WHERE id = '$key'" :"SELECT name FROM content WHERE urlname = '$key'" )."</a>";
			}
			echo $path;
			break;
         case "blogs":
		?>
           <a  href="<?=_SITE?>">На главную</a> &nbsp;»&nbsp; <a href="<?=_SITE?>blogs.html">Колумнисты</a><?
             break;     
              case "blog":
              global $head;
		?>
           <a  href="<?=_SITE?>">На главную</a> &nbsp;»&nbsp; <a href="<?=_SITE?>blogs.html">Колумнисты</a> &nbsp;»&nbsp; <a href="/blog/<?=$head["id"]?>.html"><?=$head["title"]?></a><?
             break;     
		case "search": 
		?>
			<a  href="<?=_SITE?>">На главную</a> &nbsp;»&nbsp; <a  href="<?=_SITE?>search/<?=$_GET["stext"]?>.html">Результаты поиска по запросу:" <?=urldecode($_GET["stext"])?>"</a><?
			break;
			
		case "allquestion":
		?>
           <a  href="<?=_SITE?>">На главную</a> &nbsp;»&nbsp; <a href="<?=_SITE?>questions.html">Опросы</a><?
             break;
		default:
            global $head;
			$arr = array($head["id"]);
			get_path_array($head["id"],&$arr);
			$arr = array_reverse($arr);
			reset($arr);
			?>
			 <span class='sep'>&larr;</span><a  href="<?=_SITE?>">На главную</a>
			<?
			foreach($arr as $key)
			{
			  $urlname = execute_scalar("SELECT url FROM content WHERE id = $key");
			  $path .= " <span class='sep'>&larr;</span><a href='"._SITE."".(  $urlname != "" ?   $urlname : $key )."'>".execute_scalar(is_numeric($key) ? "SELECT name FROM content WHERE id = '$key'" :"SELECT name FROM content WHERE urlname = '$key'" )."</a>";
			}
			echo $path;
			break;
	}
}
function send_mime_mail($name_from, // имя отправителя
                        $email_from, // email отправителя
                        $name_to, // имя получателя
                        $email_to, // email получателя
                        $data_charset, // кодировка переданных данных
                        $send_charset, // кодировка письма
                        $subject, // тема письма
                        $body // текст письма
                        ) {
  $to = mime_header_encode($name_to, $data_charset, $send_charset)
                 . ' <' . $email_to . '>';
  $subject = mime_header_encode($subject, $data_charset, $send_charset);
  $from =  mime_header_encode($name_from, $data_charset, $send_charset) 
                     .' <' . $email_from . '>'; 
  if($data_charset != $send_charset) {
    $body = iconv($data_charset, $send_charset, $body); 
  }
  $headers = "From: $from\r\n";
  $headers .= "Content-type: text/html; charset=$send_charset\r\n";
  $headers .= "Mime-Version: 1.0\r\n";
  $headers .= "X-Mailer: PHP/".phpversion()."\r\n";  

  return mail($to, $subject, $body, $headers);
}
function mime_header_encode($str, $data_charset, $send_charset) {
  if($data_charset != $send_charset) {
    $str = iconv($data_charset, $send_charset, $str);
  }
  return '=?' . $send_charset . '?B?' . base64_encode($str) . '?=';
}
function strtolower_utf8($string){
  $convert_to = array(
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u",
    "v", "w", "x", "y", "z", "à", "á", "â", "ã", "ä", "å", "æ", "ç", "è", "é", "ê", "ë", "ì", "í", "î", "ï",
    "ð", "ñ", "ò", "ó", "ô", "õ", "ö", "ø", "ù", "ú", "û", "ü", "ý", "а", "б", "в", "г", "д", "е", "ё", "ж",
    "з", "и", "й", "к", "л", "м", "н", "о", "п", "р", "с", "т", "у", "ф", "х", "ц", "ч", "ш", "щ", "ъ", "ы",
    "ь", "э", "ю", "я"
  );
  $convert_from = array(
    "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U",
    "V", "W", "X", "Y", "Z", "À", "Á", "Â", "Ã", "Ä", "Å", "Æ", "Ç", "È", "É", "Ê", "Ë", "Ì", "Í", "Î", "Ï",
    "Ð", "Ñ", "Ò", "Ó", "Ô", "Õ", "Ö", "Ø", "Ù", "Ú", "Û", "Ü", "Ý", "А", "Б", "В", "Г", "Д", "Е", "Ё", "Ж",
    "З", "И", "Й", "К", "Л", "М", "Н", "О", "П", "Р", "С", "Т", "У", "Ф", "Х", "Ц", "Ч", "Ш", "Щ", "Ъ", "Ы",
    "Ь", "Э", "Ю", "Я"
  );
    return str_replace($convert_from, $convert_to, $string);
  }
  function random_password($length = 8, $allow_uppercase = true, $allow_numbers = true)
					{
						$out = '';
						$arr = array();
						for($i=97; $i<123; $i++) $arr[] = chr($i);
						if ($allow_uppercase) for($i=65; $i<91; $i++) $arr[] = chr($i);
						if ($allow_numbers) for($i=0; $i<10; $i++) $arr[] = $i;
						shuffle($arr);
						for($i=0; $i<$length; $i++)
						{
							$out .= $arr[mt_rand(0, sizeof($arr)-1)];
						}
						return $out;
					}
	   function ruslat ($string) # Задаём функцию перекодировки кириллицы в транслит.
{
$string = mb_eregi_replace("ж","zh",$string);
$string = mb_eregi_replace("ё","yo",$string);
$string = mb_eregi_replace("й","i",$string);
$string = mb_eregi_replace("ю","yu",$string);
$string = mb_eregi_replace("ь","",$string);
$string = mb_eregi_replace("ч","ch",$string);
$string = mb_eregi_replace("щ","sh",$string);
$string = mb_eregi_replace("ц","c",$string);
$string = mb_eregi_replace("у","u",$string);
$string = mb_eregi_replace("к","k",$string);
$string = mb_eregi_replace("е","e",$string);
$string = mb_eregi_replace("н","n",$string);
$string = mb_eregi_replace("г","g",$string);
$string = mb_eregi_replace("ш","sh",$string);
$string = mb_eregi_replace("з","z",$string);
$string = mb_eregi_replace("х","h",$string);
$string = mb_eregi_replace("ъ","",$string);
$string = mb_eregi_replace("ф","f",$string);
$string = mb_eregi_replace("ы","y",$string);
$string = mb_eregi_replace("в","v",$string);
$string = mb_eregi_replace("а","a",$string);
$string = mb_eregi_replace("п","p",$string);
$string = mb_eregi_replace("р","r",$string);
$string = mb_eregi_replace("о","o",$string);
$string = mb_eregi_replace("л","l",$string);
$string = mb_eregi_replace("д","d",$string);
$string = mb_eregi_replace("э","ye",$string);
$string = mb_eregi_replace("я","ja",$string);
$string = mb_eregi_replace("с","s",$string);
$string = mb_eregi_replace("м","m",$string);
$string = mb_eregi_replace("и","i",$string);
$string = mb_eregi_replace("т","t",$string);
$string = mb_eregi_replace("б","b",$string);
$string = mb_eregi_replace("Ё","yo",$string);
$string = mb_eregi_replace("Й","I",$string);
$string = mb_eregi_replace("Ю","YU",$string);
$string = mb_eregi_replace("Ч","CH",$string);
$string = mb_eregi_replace("Ь","",$string);
$string = mb_eregi_replace("Щ","SH",$string);
$string = mb_eregi_replace("Ц","C",$string);
$string = mb_eregi_replace("У","U",$string);
$string = mb_eregi_replace("К","K",$string);
$string = mb_eregi_replace("Е","E",$string);
$string = mb_eregi_replace("Н","N",$string);
$string = mb_eregi_replace("Г","G",$string);
$string = mb_eregi_replace("Ш","SH",$string);
$string = mb_eregi_replace("З","Z",$string);
$string = mb_eregi_replace("Х","H",$string);
$string = mb_eregi_replace("Ъ","",$string);
$string = mb_eregi_replace("Ф","F",$string);
$string = mb_eregi_replace("Ы","Y",$string);
$string = mb_eregi_replace("В","V",$string);
$string = mb_eregi_replace("А","A",$string);
$string = mb_eregi_replace("П","P",$string);
$string = mb_eregi_replace("Р","R",$string);
$string = mb_eregi_replace("О","O",$string);
$string = mb_eregi_replace("Л","L",$string);
$string = mb_eregi_replace("Д","D",$string);
$string = mb_eregi_replace("Ж","Zh",$string);
$string = mb_eregi_replace("Э","Ye",$string);
$string = mb_eregi_replace("Я","Ja",$string);
$string = mb_eregi_replace("С","S",$string);
$string = mb_eregi_replace("М","M",$string);
$string = mb_eregi_replace("И","I",$string);
$string = mb_eregi_replace("Т","T",$string);
$string = mb_eregi_replace("Б","B",$string);
return $string;
}
function create_urlname($name)
{
	$name = htmlspecialchars_decode($name);
	$name = trim(ruslat(mb_strtolower(str_replace(array("«","»","+","_","/","\\","(",")","*",":","'",".",";","`","'"," ","	","#","`","~","+","=","-","*",",","<",">","!","?","@","¶","%","{","}","_","[","]","|","®","©","\""),"!",trim($name)))));
    $name = mb_ereg_replace("!!!","-",$name);
    $name = mb_ereg_replace("!!","-",$name);
	 $name = mb_ereg_replace("!","-",$name);
    return $name;
} 		
function get_content_url($id)
{
	
}		
?>
