ngapp.controller('SearchCtrl', function($scope, $http, FacilityResource, $timeout){
    
    $scope.pager = {
        pageSize: 50
    };
    $scope.pages = [];
    
    $scope.search = function(page){
        if (page == 0 || page > $scope.pages[$scope.pages.length - 1]){
            // bad page parameter
            return;
        }
        
        $scope.pager.page = page || 1;
        $scope.pages = [];
        
        // trim unused attributes for cleaner request urls
        for (var i in $scope.searchParameters) {
            if ($scope.searchParameters[i] === null || $scope.searchParameters[i] === '') {
                delete $scope.searchParameters[i];
            }
        }
        
        // build a new json object as the request parameters from the search and pager
        // the resource has defaults {page: 1, pageSize: 50}
        $scope.facilities = FacilityResource.query(
            angular.extend({}, $scope.searchParameters, $scope.pager)
        );
        
        // manage the array of pages
        // we'll limit it to 5 with the current page in the center
        $scope.facilities.$promise.then(function(data){
            if (data.$pages - $scope.pager.page < 2){
                // it's close to the end, load the pages backwards
                for(var i = data.$pages; i > 1 && $scope.pages.length < 5; i--)
                    $scope.pages.unshift(i);
            } else {
                // start from 1 or current page minus 2 (whichever is larger)
                for(var i = Math.max($scope.pager.page - 2,1); i <= data.$pages && $scope.pages.length < 5; i++)
                    $scope.pages.push(i);
            }
        });
    };
    
    $scope.search();

	$scope.toggleForm = function(){
        $scope.searchParameters = {};
        $('form').collapse('toggle');
	};
	
});