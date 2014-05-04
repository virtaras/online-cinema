<?
require($_SERVER["DOCUMENT_ROOT"]."//inc/constant.php");
require($_SERVER["DOCUMENT_ROOT"]."//inc/connection.php");
require($_SERVER["DOCUMENT_ROOT"]."//inc/global.php");
require($_SERVER["DOCUMENT_ROOT"]."//inc/emarket.php");
require($_SERVER["DOCUMENT_ROOT"]."//inc/engine.php");
require($_SERVER["DOCUMENT_ROOT"]."//virtaras/functions.php");
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";?>
<КоммерческаяИнформация xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="commerceml_2.04.xsd" ВерсияСхемы="2.04" ДатаФормирования="2008-01-09T18:13:34">
	<?if(isset($_GET["type"])){
		switch($_GET["type"]){
			case"goods":
				$goods=getRowsFromDB("SELECT goods.* FROM goods");
				foreach($goods as $good){
					
				}
				break;
		}
	}?>
</КоммерческаяИнформация>