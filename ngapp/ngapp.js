var ngapp = angular.module('ngapp', ['ngRoute','ngResource','ngAnimate']);

ngapp.config(function($routeProvider, $resourceProvider){

	$routeProvider
		.when('/', {
			templateUrl: 'ngapp/search/search.html',
			controller: 'SearchCtrl',
			resolve: {
				facilities: function(FacilityResource){
					return FacilityResource.query();
				}
			}
		})
		.otherwise({
			redirectTo: '/'
		});
	
	// reduces response from {code:"", msg:"", data:{}} to just data
	function transformOne(data){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || {};
		result.$code = jsonData.code;
		result.$msg = jsonData.msg;
		return result;
	}

	// reduces response from {code:"", msg:"", data:[]} to just data
	function transformAll(data){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || [];
		result.$code = jsonData.code;
		result.$msg = jsonData.msg;
		return result;
	}

	$resourceProvider.defaults.actions = {
		get: {
			method: 'GET',
			params: {id:'@registryId'},
			transformResponse: transformOne
		},
		query: {
			method: 'GET',
			isArray: true,
			transformResponse: transformAll
		}
	};

});

ngapp.factory('FacilityResource',function($resource){
	return $resource('/api/facilities/:id');
});