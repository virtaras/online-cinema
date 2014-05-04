<?php 
	ini_set("display_errors","off");
	session_start();
	require("config/global.php");
	require("function/auth.php");
	include("language/$language/$language.php");
	require("lib/user.php");
	require("function/connection.php");
    require("function/db.php");
	
	
	require("function/global.php");
	require("lib/engine.php");
	
	db_action();//insert,update,delete
	
	get_content();//get content html
	
	if($engine_db == "fb")
	{
		ibase_close($db);
	}
	
?>