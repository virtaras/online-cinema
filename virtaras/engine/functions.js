function afterAddToBasket(res){
	//alert(res);
}
function addToBasket(id,quantity,params){
	id = id || -1;
	quantity = quantity || 1;
	params = params || "";
	if(id!=-1){
		$.post("/virtaras/ajax.php",{action:"addToBasket",id:id,quantity:quantity,params:params},afterAddToBasket);
	}else{
		alert("INVALID_ID");
	}
}
function afterRemoveFromBasket(res){
	//alert(res);
}
function removeFromBasket(id){
	$.post("/virtaras/ajax.php",{action:"removeFromBasket",id:id},afterRemoveFromBasket);
}
function clear_basket(){
	$.post("/virtaras/ajax.php",{action:"clear_basket"},function(r){document.location.reload(true);});
}