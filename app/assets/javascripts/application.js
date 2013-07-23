// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap
//= require_tree .

//Ordenar productos por columna
function sort_column(column, direction){
	$("#sort_field").val(column);
	$("#direction_field").val(direction);
	$("#search_form").submit();
}

//submit search form
$(function(){
	$(".product_ft").click(function(){
		$("#search_form").submit();
	});
	$(".product_ft_select").change(function(){
		$("#search_form").submit();
	});
});

//Cambiar imagenes de productos
$(function(){
	$("#small-product-img img").click(function(){
		var c = $(this).attr("src");
		$("#product-img").html('<img src="'+c+'" class="img-polaroid"/>');
		$("#product-img").fadeIn(2000);
	});
});

$(function(){
	$("#selected_items p").click(function(){
		$("#item-list-toolbox").slideToggle("slow");
	});
});

$(function(){
	$("#new_product_img").change(function(){
		var c = $("#new_product_img").val();
		$("#new-product-img-preview").html('<img src="/assets/'+c+'" width="100" height="100"/>');
		$("#new-product-img-preview").fadeIn(2000);
	});
});
