// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function ordersCtrl($scope, $http) {
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

  $scope.updateProductId = function(param, index) {
    //order_product_orders_attributes_1_product_id
    console.log("Mah oi");
  	$("#order_product_orders_attributes_" + index + "_product_id").val(param.id);


  };


}