<?
function getExtension($filename) {
	$path_info = pathinfo($filename);
	return $path_info['extension'];
}

function resize_image($source,$sizes,$colour){

	$result_width = $sizes["width"];
	$result_height = $sizes["height"];
	
	$size = getimagesize($source);         //розмір оригіналу
	
	$original_width = $size[0];
	$original_height = $size[1];
	
	$extension = getExtension($source);
	
	switch ($extension){                  //заносимо оригінал в память для роботи з ним
	
	case 'jpg':

		$original_image = imagecreatefromjpeg($source)
	    or die('Cannot load original JPEG');
		break;
	
	case 'png':

		$original_image = imagecreatefrompng($source)
	    or die('Cannot load original PNG');
		break;
		
	case 'gif':

		$original_image = imagecreatefromgif($source)
	    or die('Cannot load original GIF');
		break;
		
	}
	
	$resized_width = 0;
	$resized_height = 0;
	$resized_x_coord = 0;
	$resized_y_coord = 0;
	
	$resized_width_proportion = $result_width/$original_width;
	$resized_height_proportion = $result_height/$original_height;
	
	$resized_image = imagecreatetruecolor($result_width, $result_height);                //створюємо в памяті картинку-елемент колажу
		
	if (abs($resized_width_proportion - $resized_height_proportion)<0.01) {              //визначаємо параметри, до яких будемо ресайзити наш оригінал відповідно до пропорцій шаблону
	$resized_width = $result_width;
	$resized_height = $result_height;
	}else 
	if ($resized_width_proportion < $resized_height_proportion){                  
	$resized_width = $result_width;                                               
	$resized_height = (integer)($original_height*$resized_width_proportion);
	$resized_y_coord = (integer)(($result_height - $resized_height)/2);
	}else
	if ($resized_width_proportion > $resized_height_proportion){
	$resized_height = $result_height;
	$resized_width = (integer)($original_width*$resized_height_proportion);
	$resized_x_coord = (integer)(($result_width - $resized_width)/2);
	}
	
	imagecopyresampled(                                                   //підганяємо розмір оригінальної картинки під розмір шаблону
	$resized_image,  // Идентификатор нового изображения
	$original_image,  // Идентификатор исходного изображения
	0,0,      // Координаты (x,y) верхнего левого угла в новом изображении
	0,0,      // Координаты (x,y) верхнего левого угла копируемого блока существующего изображения
	$resized_width,     // Новая ширина копируемого блока
	$resized_height,     // Новая высота копируемого блока
	$original_width, // Ширина исходного копируемого блока
	$original_height  // Высота исходного копируемого блока
	);
	
	imagedestroy($original_image);

	$result = array ("resized_image"=>$resized_image,"resized_width"=>$resized_width,"resized_height"=>$resized_height,"x_coord"=>$resized_x_coord,"y_coord"=>$resized_y_coord);
	return $result;

}

function create_image_block($source,$sizes,$colour){
	
	$result_width = $sizes["width"];
	$result_height = $sizes["height"];
	
	$result = imagecreatetruecolor($result_width, $result_height);      //пуста картинка, куди будемо заливати складові
	
	$filing_colour = imagecolorallocatealpha($result, $colour["Red"], $colour["Green"], $colour["Blue"], $colour["alpha"]);     //заливаємо фон потрібним коьором
	imagesavealpha($result,true);
	imagefill($result, 0, 0, $filing_colour);

	$resized_result = resize_image($source,$sizes,$colour);
	$resized_image = $resized_result["resized_image"];
	$resized_x_coord = $resized_result["x_coord"];
	$resized_y_coord = $resized_result["y_coord"];
	$resized_width = $resized_result["resized_width"];
	$resized_height = $resized_result["resized_height"];
	
	imagecopyresampled(                                              //ліпимо наш елемент в колаж
	$result,  // Идентификатор нового изображения 
	$resized_image,  // Идентификатор исходного изображения
	$resized_x_coord,$resized_y_coord,      // Координаты (x,y) верхнего левого угла в новом изображении
	0,0,      // Координаты (x,y) верхнего левого угла копируемого блока существующего изображения
	$resized_width,     // Новая ширина копируемого блока
	$resized_height,     // Новая высота копируемого блока
	$resized_width, // Ширина исходного копируемого блока
	$resized_height  // Высота исходного копируемого блока
	);
	
	imagedestroy($resized_image);
	
	return $result;

}

function create_thumb($source,$target,$sizes,$colour){

	$counter = 0;
	foreach ($source as $image){
	$thumb = create_image_block($image,$sizes,$colour);
	$path = $target[$counter];
	imagepng($thumb,$path);
	$counter++;
	}
}

function image_merger($image_array,$target,$params,$colour){

	$image_ammount = count($image_array);
		
	$result_width = $params["width"];
	$result_height = $params["height"];
	
	$result = imagecreatetruecolor($result_width*$image_ammount, $result_height);      //пуста картинка, куди будемо заливати складові
	$filing_colour = imagecolorallocatealpha($result, $colour["Red"], $colour["Green"], $colour["Blue"], $colour["alpha"]);     //заливаємо фон потрібним коьором
	imagesavealpha($result,true);
	imagefill($result, 0, 0, $filing_colour);
	
	$result_x_coord=0;                       //ця змінна відповідає за координату в результуючій картинці, куди будемо ліпити наші елементи колажу
	
	foreach ($image_array as $image)
	{
	
	$resized_result = resize_image($image,$params,$colour);
	$resized_image = $resized_result["resized_image"];
	$resized_x_coord = $resized_result["x_coord"];
	$resized_y_coord = $resized_result["y_coord"];
	$resized_width = $resized_result["resized_width"];
	$resized_height = $resized_result["resized_height"];
	
	imagecopyresampled(                                              //ліпимо наш елемент в колаж
	$result,  // Идентификатор нового изображения 
	$resized_image,  // Идентификатор исходного изображения
	$result_x_coord+$resized_x_coord,$resized_y_coord,      // Координаты (x,y) верхнего левого угла в новом изображении
	0,0,      // Координаты (x,y) верхнего левого угла копируемого блока существующего изображения
	$resized_width,     // Новая ширина копируемого блока
	$resized_height,     // Новая высота копируемого блока
	$resized_width, // Ширина исходного копируемого блока
	$resized_height  // Высота исходного копируемого блока
	);
	
	$result_x_coord+=$result_width;
	imagedestroy($resized_image);
	}
	
	imagepng($result, $target);
	imagedestroy($result);
}
?>