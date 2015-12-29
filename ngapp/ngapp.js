/*global angular*/
var ngapp = angular.module('ngapp', ['ngRoute','ngResource','ngAnimate']);

ngapp.config(function($routeProvider, $resourceProvider){

	$routeProvider
		.when('/search', {
			templateUrl: 'ngapp/search/search.html',
			controller: 'SearchCtrl'
		})
		.when('/', {
			templateUrl: 'ngapp/developer/developer.html'
		})
		.otherwise({
			redirectTo: '/'
		});
	
	// reduces response from {code:"", msg:"", data:{}} to just data
	function transformOne(data, headersGetter, status){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || {};
		Object.getOwnPropertyNames(jsonData).forEach(function(propertyName){
			if (propertyName !== 'data')
				result['$' + propertyName] = jsonData[propertyName];
		});
		return result;
	}

	// reduces response from {code:"", msg:"", data:[]} to just data
	function transformAll(data, headersGetter, status){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || [];
		Object.getOwnPropertyNames(jsonData).forEach(function(propertyName){
			if (propertyName !== 'data')
				result['$' + propertyName] = jsonData[propertyName];
		});
		return result;
	}
	
	function responseInterceptor(response){
		// move any $ data properties over to the resource
		Object.getOwnPropertyNames(response.data).forEach(function(propertyName){
			if (propertyName.substring(0,1) === '$')
				response.resource[propertyName] = response.data[propertyName];
		});
		return response.resource;
	}
	
	function responseErrorInterceptor(response){
		console.log("error interceptor status: " + response.status);
		
		return response.resource;
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
				response: responseInterceptor,
				responseError: responseErrorInterceptor
			}
		}
	};

});

ngapp.factory('FacilityResource',function($resource){
	return $resource('/api/facilities/:id',{page: 1, pageSize: 50});
});