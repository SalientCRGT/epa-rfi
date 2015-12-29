/*global angular,ngapp*/
ngapp.controller('SearchCtrl', function($scope, $http, FacilityResource, $timeout,$location,$httpParamSerializerJQLike){
    
    $scope.pager = {
        pageSize: 50
    };
    $scope.pages = [];
    
    // build a new json object as the request parameters from the search and pager
    // the resource has defaults {page: 1, pageSize: 50}
    function searchParams(){

        var formattedParams = {};
        // trim unused attributes for cleaner request urls
        for (var i in $scope.searchParameters) {
            if ($scope.searchParameters[i] === null || $scope.searchParameters[i] === '') {
                delete $scope.searchParameters[i];
                break;
            }else if(i == "q"){
                var str = $scope.searchParameters[i];
                formattedParams[i] = str.replace(/\s+/g, '|');
                break;
            }
            formattedParams[i] = $scope.searchParameters[i];
        }
        
        // todo : alter q to pass in regexp syntax similar to google-style searching
        // https://support.google.com/websearch/answer/2466433?hl=en
        // e.g. quotes, asterisk, minus, number range

        var params = angular.extend({}, formattedParams, $scope.pager);
        return params;
    }
    
    $scope.search = function(page){
        if (page === 0 || page > $scope.pages[$scope.pages.length - 1]){
            // bad page parameter
            return;
        }
        
        $scope.pager.page = page || 1;
        $scope.pages = [];
        
        $scope.facilities = FacilityResource.query(searchParams());

        // manage the array of pages
        // we'll limit it to 5 with the current page in the center
        $scope.facilities.$promise.then(function(data){
            var page;
            if (data.$pages - $scope.pager.page < 2){
                // it's close to the end, load the pages backwards
                for(page = data.$pages; page > 1 && $scope.pages.length < 5; page--)
                    $scope.pages.unshift(page);
            } else {
                // start from 1 or current page minus 2 (whichever is larger)
                for(page = Math.max($scope.pager.page - 2,1); page <= data.$pages && $scope.pages.length < 5; page++)
                    $scope.pages.push(page);
            }
        });
    };
    
    $scope.search();

    $scope.update = function(){
       $http({
          method: 'GET',
          url: '/api/files?type=FRS&subtype=VA'
        }).then(function successCallback(response) {
            // this callback will be called asynchronously
            // when the response is available
          }, function errorCallback(response) {
            // called asynchronously if an error occurs
            // or server returns response with an error status.
          });

    }

	$scope.toggleForm = function(){
        $scope.searchParameters = {};
        $('form').collapse('toggle');
	};
	
	$scope.requestUrl = function(){
	    return $location.protocol() + '://' + $location.host() + '/api/facilities?' + $httpParamSerializerJQLike(searchParams());
	};
});