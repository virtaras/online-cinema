var scripts=["/virtaras/dev/functions.js","/virtaras/engine/functions.js"];
for(var i=0;i<scripts.length;++i){
	$.getScript(scripts[i], function( data, textStatus, jqxhr ) {
		//console.log( data ); // Data returned //console.log( textStatus ); // Success //console.log( jqxhr.status ); // 200 //console.log( "Load was performed." );
	});
}