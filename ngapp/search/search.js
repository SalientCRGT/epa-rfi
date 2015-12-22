ngapp.controller('SearchCtrl', function($scope, $http, facilities, FacilityResource){
    $scope.facilities = facilities;
    
    $scope.search = function(){
        // trim unused attributes for cleaner request urls
        for (var i in $scope.searchParameters) {
            if ($scope.searchParameters[i] === null || $scope.searchParameters[i] === '') {
                delete $scope.searchParameters[i];
            }
            console.log(i, $scope.searchParameters[i]);
        }
        $scope.facilities = FacilityResource.query($scope.searchParameters);
    };

    $scope.getFacilities = function(){
    	console.log($scope.q);
    	if($scope.q.length > 3){
	    	$scope.facilities = $http.get('/api/facilities/search/' + $scope.q.split(' ').join('+'))
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