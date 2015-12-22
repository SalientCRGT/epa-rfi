ngapp.controller('SearchCtrl', function($scope, $http, FacilityResource){
    $scope.facilities = FacilityResource.query();

    $scope.search = function(){
        // trim unused attributes for cleaner request urls
        for (var i in $scope.searchParameters) {
            if ($scope.searchParameters[i] === null || $scope.searchParameters[i] === '') {
                delete $scope.searchParameters[i];
            }
        }
        $scope.facilities = FacilityResource.query($scope.searchParameters);
    };

	$scope.toggleForm = function(){
        $scope.searchParameters = {};
        $('form').collapse('toggle');
	};
	
});