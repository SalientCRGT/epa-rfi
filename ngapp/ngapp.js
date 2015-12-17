var app = angular.module('app', ['ngRoute','ngResource']);//,'oc.lazyLoad']);

app.config(function($routeProvider, $resourceProvider){

	$routeProvider
		.when('/', {
			templateUrl: 'ngapp/splash/splash.html',
			controller: 'SplashCtrl'
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

app.factory('FacilityResource',function($resource){
	return $resource('/api/facilities/:id');
});

app.controller('SplashCtrl', function($scope, FacilityResource){
    $scope.facilities = FacilityResource.query({});
});