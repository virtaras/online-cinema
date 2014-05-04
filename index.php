<?php
session_start();
ini_set("display_errors","On");
include("inc/protection.php");
include("inc/constant.php");
include("inc/connection.php");
include("inc/global.php");
@include("inc/cache/mainmenu.php");
include("virtaras/functions.php");
$content_type = "content";
$title = "";
$description = "";
$keywords = "";

global $tmdb_api_key;
$tmdb_api_key="62f80b94c8e6c0b81a4653e1c7a66afe";
global $tmdb_api_url;
$tmdb_api_url="https://api.themoviedb.org/";
global $tmdb_api_img_url;
$tmdb_api_img_url="http://image.tmdb.org/t/p/w500/";

if(isset($_GET["content"]))
{
	$content_type = $_GET["content"];
}
if(file_exists("inc/".$content_type.".php"))
{
	require("inc/".$content_type.".php");
}
if($title == "")
{
	$title = setting("title");
}
if($description == "")
{
	$description= setting("description");
}
if($keywords == "")
{
	$keywords = setting("keywords");
}
if(!isset($_SESSION["basket"]) && isset($_COOKIE["basket"]))
{
	$_SESSION["basket"] = stripslashes($_COOKIE["basket"]); 
}
$_SESSION["template"] = _TEMPLATE;

require(_DIR._TEMPLATE."template.html");
$_SESSION["url"] = "http://".$_SERVER['HTTP_HOST'].$_SERVER["REQUEST_URI"];

?>