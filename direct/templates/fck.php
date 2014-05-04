<?php
	if(!isset($base_path))
	{
		$base_path = "";
	}
	include($base_path."fckeditor/fckeditor.php") ; 
	$sBasePath = "fckeditor/" ;
	$oFCKeditor = new FCKeditor('FCKeditor') ;
	$oFCKeditor->Config["AutoDetectLanguage"] = false ;
	$oFCKeditor->Config["DefaultLanguage"] = "ru" ;
	$oFCKeditor->BasePath = $sBasePath ;
	$oFCKeditor->Config['SkinPath'] = "skins/office2003/" ;
	$oFCKeditor->Config['BaseHref'] = "http://".$_SERVER['HTTP_HOST']."/" ;
	$oFCKeditor->Config['EditorAreaCSS'] = "http://".$_SERVER['HTTP_HOST']."/style.css" ;
	$oFCKeditor->Config['BodyClass'] = "fcontent";
	$oFCKeditor->Config['EnableSourceXHTML'] = true;
	$oFCKeditor->Config['EnableXHTML'] = true;
	$oFCKeditor->Config['StartupFocus'] = true;
	$oFCKeditor->ToolbarSet = "Default";
?>