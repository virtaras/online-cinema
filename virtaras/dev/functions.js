function afterSetSessionKeyValue(res){
	//alert(res);
}
function setSessionKeyValue(key,value){
	$.post("/virtaras/ajax.php",{action:"setSessionKeyValue",key:key,value:value},afterSetSessionKeyValue);
}
function showAlert(msg){
	alert(msg);
}
$(".wh-centered").each(function(){
	h_center(this);
})
$(".w-centered").each(function(){
	w_center(this);
})
$(".wh-centered").each(function(){
	h_center(this);
	w_center(this);
})
function w_center(elem){
	var magin_w=($(elem).parent().width()-$(elem).width())/2;
	$(elem).css({ display : "inline-block", "margin-left" : magin_w, "margin-right" : magin_w});
}
function h_center(elem){
	var magin_h=($(elem).parent().height()-$(elem).height())/2;
	$(elem).css({ display : "inline-block", "margin-top" : magin_h, "margin-bottom" : magin_h});
}