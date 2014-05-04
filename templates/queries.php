<?
echo "QUERIES"."<br/>";
/*$tmdb_api_key="62f80b94c8e6c0b81a4653e1c7a66afe";
$tmdb_api_url="https://api.themoviedb.org/";
$tmdb_url=$tmdb_api_url."3/genre/list?api_key=$tmdb_api_key&language=ru";
$json=file_get_contents($tmdb_url);
$json_arr=json_decode($json,true);
$genres_arr=$json_arr["genres"];
foreach($genres_arr as $genre){
	$sql_text="INSERT INTO tmdb_genres (name,tmdb_id) VALUES ('$genre[name]','$genre[id]')";
	//mysql_query($sql_text);
}
*/
$limit_from=0;
$limit_cnt=5;
$limit=" LIMIT $limit_from,$limit_cnt";
$site_users=sql_arr("SELECT clients.* FROM clients");
foreach($site_users as $site_user){
	$site_user_movies_arr=array();
	$site_user_movies=sql_arr("SELECT site_users_movies.* FROM site_users_movies WHERE user_id='".$site_user["id"]."'");
	foreach($site_user_movies as $site_user_movie){
		$site_user_movies_arr[]=$site_user_movie["movie_id"];
	}
	if(count($site_user_movies_arr)){
		$site_user_movies_sql=" AND movie_id IN (".implode(",",$site_user_movies_arr).")";
		$site_user_movies_not_sql=" AND movie_id NOT IN (".implode(",",$site_user_movies_arr).")";
	}else{
		$site_user_movies_sql="";
		$site_user_movies_not_sql="";
	}
	$site_user_closest_sql="SELECT SUM.*, (SELECT COUNT(*) FROM site_users_movies WHERE user_id=SUM.user_id $site_user_movies_sql) as closest_cnt FROM site_users_movies SUM WHERE SUM.user_id<>'".$site_user["id"]."' $site_user_movies_not_sql GROUP BY movie_id ORDER BY closest_cnt $limit";
	$site_user_closest=sql_arr($site_user_closest_sql);
	//echo "site_user-"; print_r($site_user);
	//echo "site_user_closest-"; print_r($site_user_closest);
	$site_user_closest_arr=array();
	foreach($site_user_closest as $site_user_closes){
		$site_user_closest_arr[]=$site_user_closes["movie_id"];
	}
	$site_user_closest_upd="UPDATE clients SET recomended_movies='".implode(",",$site_user_closest_arr)."' WHERE id='".$site_user["id"]."'";
	mysql_query($site_user_closest_upd);
}