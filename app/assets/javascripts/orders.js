// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function ordersCtrl($scope, $http, $compile) {
//	$scope.size_id ;
  $scope.a = [{}]; 
  for (var i = 0; i < 100; i++) {
    $scope.a.push({});  
  }
  //$scope.a[].values = {};
  //$scope.a[0].color_filter = ;
  $scope.products = [];
  $scope.product_id = [];
  // $scope.filter = {}
  // $scope.filter.code_filter = [];
  // $scope.filter.color_filter = [];

  
  
  $http({method: 'GET', url: '/products'}).success(function(data, status, headers, config) {
    $scope.products = data
  });

  console.log($(".product_attributes").children("select").first());

  // var selects = $(".product_attributes").children("select");
  // var product_ids = $(".product_attributes").children("[name*=product_name_id]");
  // for(i = 0; i < selects.length; i++) {
  //   console.log(product_ids[i].value);
    
  //   $scope.product_id[i] = product_ids[i].value
  //   console.log($scope.product_id);
  //   console.log(selects[i].value);
  // }

  $scope.updateProductId = function(param, index) {
    //order_product_orders_attributes_1_product_id
  	$("#order_product_orders_attributes_" + index + "_product_id").val(param.id);

  };

  $scope.addProduct = function() {
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
      select.attr("ng-change", "updateProductId(product_id[" + (new Number(number_of_products.val()) - 1) + "], " + (new Number(number_of_products.val()) - 1) + ")");
      select.removeAttr("disabled");

      product_id.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_product_id");
      product_id.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][product_id]");

      product_id.removeAttr("disabled");

      input.attr("id", "order_product_orders_attributes_" + (new Number(number_of_products.val()) - 1) +  "_quantity");
      input.attr("name", "order[product_orders_attributes][" + (new Number(number_of_products.val()) - 1) + "][quantity]");
      input.removeAttr("disabled");
      input.val('');
    
      code = $compile(code)($scope);
      input = $compile(input)($scope);
      color = $compile(color)($scope);
      size = $compile(size)($scope);
      select = $compile(select)($scope);

      $(".products_fields").append(product_attributes);
  }

}

ordersCtrl.$inject = ['$scope', '$http', '$compile'];