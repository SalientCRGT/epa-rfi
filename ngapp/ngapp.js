var ngapp = angular.module('ngapp', ['ngRoute','ngResource','ngAnimate']);

ngapp.config(function($routeProvider, $resourceProvider){

	$routeProvider
		.when('/', {
			templateUrl: 'ngapp/search/search.html',
			controller: 'SearchCtrl'
		})
		.when('/developer', {
			templateUrl: 'ngapp/developer/developer.html'
		})
		.otherwise({
			redirectTo: '/'
		});
	
	// reduces response from {code:"", msg:"", data:{}} to just data
	function transformOne(data, headersGetter, status){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || {};
		result.$code = jsonData.code;
		result.$msg = jsonData.msg;
		return result;
	}

	// reduces response from {code:"", msg:"", data:[]} to just data
	function transformAll(data, headersGetter, status){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || [];
		result.$code = jsonData.code;
		result.$msg = jsonData.msg;
		result.$pages = jsonData.pages;
		return result;
	}
	
	function responseInterceptor(response){
		console.log('responseInterceptor',response);
		response.resource.$code = response.data.$code;
		response.resource.$msg = response.data.$msg;
		response.resource.$pages = response.data.$pages;
		return response.resource;
	}
	
	function responseErrorInterceptor(){
		// todo ?
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
			transformResponse: transformAll,
			interceptor: {
				response: responseInterceptor
			}
		}
	};

});

ngapp.factory('FacilityResource',function($resource){
	return $resource('/api/facilities/:id',{page: 1, pageSize: 50});
});