var app = angular.module('app', ['ngRoute']);//,'oc.lazyLoad']);

app.config(function($routeProvider){

	$routeProvider
		.when('/', {
			templateUrl: 'ngapp/splash/splash.html',
			controller: 'SplashCtrl'
		})
		.otherwise({
			redirectTo: '/'
		});

});

// force the reoute event
//app.run(['$route', function($route)  {
//	$route.reload();
//}]);

app.controller('SplashCtrl', function(){
    console.log('splashCtrl');
});