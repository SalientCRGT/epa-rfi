ngapp.controller('SplashCtrl', function($scope, $http, FacilityResource){
    $scope.facilities = FacilityResource.query();
    $scope.getFacilities = function(){
    	console.log($scope.search);
    	if($scope.search.length > 3){
	    	$scope.facilities = $http.get('/api/facilities/search/' + $scope.search.split(' ').join('+'))
	    		.then(function(response) {
	    			$scope.facilities = $scope.transformAll(response.data);
	    			console.log('facilities: ' + $scope.facilities);
	    		});
    	}
    };
    
    $scope.transformAll = function(data){
		var jsonData = angular.fromJson(data);
		var result = jsonData.data || [];
		result.$code = jsonData.code;
		result.$msg = jsonData.msg;
		return result;
	};
});