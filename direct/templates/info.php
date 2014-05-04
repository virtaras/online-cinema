<textarea id="info" name="info"><?=htmlspecialchars_decode($this->value)?></textarea>
<script language="JavaScript">

function show_info()
{
	CKEDITOR.replace( '<?=$this->name?>',{
 filebrowserBrowseUrl : 'ckfinder/ckfinder.html',
 filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',
 filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',
 filebrowserUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
 filebrowserImageUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Images',
 filebrowserFlashUploadUrl : 'ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Flash'
} );
}
 show_info();
</script>