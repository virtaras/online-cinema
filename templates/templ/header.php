<div class="menu">
<?
$menus=sql_arr("SELECT mainmenu.* FROM mainmenu WHERE invisible=0 ORDER BY showorder");
foreach($menus as $menu){?>
	<div class="item"><a href="<?=$menu["link"]?>"><?=$menu["title"]?></a></div>
<?}?>
<?if(isset($_SESSION["login_user"]["id"])){?><a href="/logout.html">Вийти</a><?}else{?><a href="/new">Вхід/реєстрація</a><?}?>
</div>