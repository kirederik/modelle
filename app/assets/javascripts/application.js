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
//= require jquery.ui.all
//= require twitter/bootstrap
//= require_tree .
//= require autocomplete-rails

var a;

function remove_fields(link) {
  //$(link).previous("input[type=hidden]").value = "1";
  //console.log($(link).parent());
  
  $(link).parent().remove();
}

function add_fields(link) {
  var product_attributes = $(".product_attributes").first().clone();
  
  var number_of_products = $("#number_products_type");

  number_of_products.val(new Number(number_of_products.val()) + 1);

  var select = $(product_attributes).children("select").first();
  var input = $(product_attributes).children("input").first();

  //console.log(select);
  
  select.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_product_id");
  select.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][product_id]");

  select.removeAttr("disabled");

  input.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_quantity");
  input.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][quantity]");

  input.removeAttr("disabled");

  $(".products_fields").append(product_attributes);
}