<?session_start();
include($_SERVER["DOCUMENT_ROOT"]."/inc/protection.php");
include($_SERVER["DOCUMENT_ROOT"]."/inc/constant.php");
include($_SERVER["DOCUMENT_ROOT"]."/inc/connection.php");
include($_SERVER["DOCUMENT_ROOT"]."/inc/global.php");
include($_SERVER["DOCUMENT_ROOT"]."/virtaras/functions.php");
if(isset($_POST["action"])){
	$action=mysql_real_escape_string($_POST["action"]);
	switch($action){
		case "addViewed":
			$user_id=mysql_real_escape_string($_POST["user_id"]);
			$movie_id=mysql_real_escape_string($_POST["movie_id"]);
			$viewed=execute_row_assoc("SELECT site_users_movies.* FROM site_users_movies WHERE user_id='".$user_id."' AND movie_id='".$movie_id."'");
			if(!(isset($viewed["id"]) && $viewed["id"]>0)){
				mysql_query("INSERT INTO site_users_movies (user_id,movie_id,sdate) VALUES ('$user_id','$movie_id',NOW())");
				echo "VIEW ADDED";
			}else{
				echo "VIEW EXISTED";
			}
			break;
	}
}