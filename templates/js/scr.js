$(document).ready(function(){
	documentReady();
});
function documentReady(){
	$(".filters .checkbox").click(function(){
		$(this).toggleClass("active");
	})
	$("#reload_movies").click(function(){
		reload_movies();
	})
	reload_movies();
}
function reload_movies(){
	var url="/search.html?type=movies";
	var filters={};
    $("#filter-output").text("");
	$(".filters .filter").each(function(){
		var filtername=$(this).attr("data-filter-name");
		filters[filtername]=new Array();
		$(this).find(".checkbox").each(function(){
			if($(this).hasClass("active")){
				filters[filtername].push($(this).attr("data-filter-value"));
//                dataVal = $(this).attr("data-filter-value");
//                $("#filter-output").append("<span>"+$(this).text()+" </span><span class='del' data-filter-value='"+dataVal+"'>x</span>");
			}
		})
	});
	for(var filtername in filters) {
		var filtervalue=filters[filtername].join(",");
		if(filtervalue!=""){
			url = url + "&"+filtername+"="+filtervalue;
		}
	}
	var year=$("#year").val();
	url = url + "&year="+year;
	//console.log(JSON.stringify(filters));
	console.log(url);
	$.post(url,{},function(r){
		//console.log("res="+r);
		$("#catalog_inner").html(r);
	});
}

function showMessage(message){
	alert(message);
}