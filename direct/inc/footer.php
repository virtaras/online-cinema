<?php
global $currentuser;
?>
<div class="info" ><?=_DATABASE?>:&nbsp;<b><?=$currentuser->DataBaseTitle?></b>&nbsp;&nbsp;&nbsp;&nbsp;<?=_USERNAME?>:&nbsp;<b><?=execute_scalar("SELECT name FROM users WHERE id = '$currentuser->ID'")?></b>&nbsp;&nbsp;&nbsp;&nbsp;Powered by <a style="font-size:9px;" title="Data management system eDataDecision" href="http://www.edatadecision.com">eDataDecision 20090705</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="info.php" title="PHP version" target="_blank">PHP <?=phpversion()?></a></div>
</body>
</html>