<?php
session_start();
require("inc/constant.php");
unset($_SESSION["login_user"]);
setcookie("alttab","",(time()+60*60*24*30),"/");
header("Location: "._SITE);
?>