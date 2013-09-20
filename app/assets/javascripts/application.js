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
  $("#number_products_type").val($("#number_products_type").val() - 1);
  $(link).parent().remove();
}

function add_fields(link) {
  var product_attributes = $(".product_attributes").first().clone();
  
  var number_of_products = $("#number_products_type");

  number_of_products.val(new Number(number_of_products.val()) + 1);

  var product_id = $(product_attributes).children("[type=hidden]").first();
  var input = $(product_attributes).children("[name*=quantity]").first();
  var code = $(product_attributes).children("[name*=code]").first();
  var color = $(product_attributes).children("[name*=color]").first();
  var size = $(product_attributes).children("[name*=size]").first();
  var select = $(product_attributes).children("select").first();

  
  //console.log(select);

  code.attr("name", "code_" + (new Number(number_of_products.val()) - 1));
  code.attr("ng-model", "a[" + (new Number(number_of_products.val()) - 1) + "].name");
  
  color.attr("name", "color_" + (new Number(number_of_products.val()) - 1));
  color.attr("ng-model", "a[" + (new Number(number_of_products.val()) - 1) + "].color");

  size.attr("name", "size_" + (new Number(number_of_products.val()) - 1));
  size.attr("ng-model", "a[" + (new Number(number_of_products.val()) - 1) + "].size");
  

  select.attr("name", "product_id_" + (new Number(number_of_products.val()) - 1));
  select.attr("id", "product_id_" + (new Number(number_of_products.val()) - 1));
  select.attr("ng-model", "product_id[" + (new Number(number_of_products.val()) - 1) + "]");
  select.attr("ng-options", "p.name for p in products | filter : a[" + (new Number(number_of_products.val()) - 1) + "] ");
  select.attr("ng-change", "updateProductId(product_id[" + (new Number(number_of_products.val()) - 1) + "], " + (new Number(number_of_products.val()) - 1));
  select.removeAttr("disabled");

  product_id.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_product_id");
  product_id.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][product_id]");

  product_id.removeAttr("disabled");

  input.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_quantity");
  input.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][quantity]");
  input.val('');
  

  $(".products_fields").append(product_attributes);
}

$(function() {
  $("#startdate").datepicker({
    dateFormat: "dd/mm/yy"
  });
  $("#enddate").datepicker({
    dateFormat: "dd/mm/yy"
  });
});
