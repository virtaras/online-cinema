
<?php 
$path = "../inc/static/";?>
<div>&nbsp;</div>
<div class="title">Содержимое страницы </div>
<textarea name="page_content" id="page_content" ><?
	$pagename = $row["id"];
	if(file_exists($path.$pagename.".inc"))
	{
		echo file_get_contents($path.$pagename.".inc");
	}
	?></textarea>
<div>&nbsp;</div>

<script language="JavaScript">
function show_pages_editor()
{
CKEDITOR.replace( 'page_content',{
 filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
 filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',
 filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',
 filebrowserUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
 filebrowserImageUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
 filebrowserFlashUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
} );
}
show_pages_editor();
</script>