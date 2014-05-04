<?php
function save_content($id)
{
	$path = "../inc/static/";
	$page = $id;
	if(isset($_POST["page_content"]))
	{
		if(file_exists($path.$page.".inc"))
		{
			$handle = fopen($path.$page.".inc", 'w' );
			fwrite($handle,stripslashes($_POST["page_content"]));
			fclose($handle);
		}
		else
		{
			$handle = fopen($path.$page.".inc", 'x' );
			fwrite($handle,stripslashes($_POST["page_content"]));
			fclose($handle);
		}
	
	}
	
}
function after_insert($id)
{
	save_content($id);
	
}
function after_update($id)
{
	save_content($id);
}
function before_delete($id)
{
	$path = "../inc/static/";
	$page = $id;
	if(file_exists($path.$page.".inc"))
	{
		unlink($path.$page.".inc");
	}
}
?>