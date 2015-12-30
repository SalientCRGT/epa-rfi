/*global angular,ngapp*/
ngapp.controller('SearchCtrl', function($scope, $http, FacilityResource, UpdateResource, $timeout,$location,$httpParamSerializerJQLike){
    
    $scope.pager = {
        pageSize: 10
    };
    $scope.pages = [];
    
    $scope.state = "-1";
    
    // build a new json object as the request parameters from the search and pager
    // the resource has defaults {page: 1, pageSize: 50}
    function searchParams(isPaged){

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

        if(isPaged){
            return angular.extend({}, formattedParams, $scope.pager);
        }else{
            return formattedParams;
        }
    }
    
    $scope.search = function(page){
        if (page === 0 || page > $scope.pages[$scope.pages.length - 1]){
            // bad page parameter
            return;
        }
        
        $scope.pager.page = page || 1;
        $scope.pages = [];
        
        $scope.facilities = FacilityResource.query(searchParams(true));

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

    $scope.update = function(state){
        var params = {};
        params["type"] = "FRS";
        params["subtype"] = state;
        $scope.updated = UpdateResource.query(params);
        $scope.updated.$promise.then(function(){
            $scope.search(1);
        });
    };

	$scope.toggleForm = function(clicked,toggleTo){
	    
        if($(toggleTo).hasClass('in')){
            return;
        }
        $('.alert.alert-success').removeClass('alert-success').addClass('alert-warning');
        $(clicked).removeClass('alert-warning').addClass('alert-success');
        $('#toggler .collapse').collapse('hide');
        $(toggleTo).collapse('show');
	};
	
	$scope.requestUrl = function(){
	    return $location.protocol() + '://' + $location.host() + '/api/facilities?' + $httpParamSerializerJQLike(searchParams(false));
	};
	
	$scope.states = [
	    {
            "name": "--Choose State--",
            "abbr": "-1"
        },
        {
            "name": "Alabama",
            "abbr": "AL"
        },
        {
            "name": "Alaska",
            "abbr": "AK"
        },
        {
            "name": "Arizona",
            "abbr": "AZ"
        },
        {
            "name": "Arkansas",
            "abbr": "AR"
        },
        {
            "name": "California",
            "abbr": "CA"
        },
        {
            "name": "Colorado",
            "abbr": "CO"
        },
        {
            "name": "Connecticut",
            "abbr": "CT"
        },
        {
            "name": "Delaware",
            "abbr": "DE"
        },
        {
            "name": "Florida",
            "abbr": "FL"
        },
        {
            "name": "Georgia",
            "abbr": "GA"
        },
        {
            "name": "Hawaii",
            "abbr": "HI"
        },
        {
            "name": "Idaho",
            "abbr": "ID"
        },
        {
            "name": "Illinois",
            "abbr": "IL"
        },
        {
            "name": "Indiana",
            "abbr": "IN"
        },
        {
            "name": "Iowa",
            "abbr": "IA"
        },
        {
            "name": "Kansas",
            "abbr": "KS"
        },
        {
            "name": "Kentucky",
            "abbr": "KY"
        },
        {
            "name": "Louisiana",
            "abbr": "LA"
        },
        {
            "name": "Maine",
            "abbr": "ME"
        },
        {
            "name": "Maryland",
            "abbr": "MD"
        },
        {
            "name": "Massachusetts",
            "abbr": "MA"
        },
        {
            "name": "Michigan",
            "abbr": "MI"
        },
        {
            "name": "Minnesota",
            "abbr": "MN"
        },
        {
            "name": "Mississippi",
            "abbr": "MS"
        },
        {
            "name": "Missouri",
            "abbr": "MO"
        },
        {
            "name": "Montana",
            "abbr": "MT"
        },
        {
            "name": "Nebraska",
            "abbr": "NE"
        },
        {
            "name": "Nevada",
            "abbr": "NV"
        },
        {
            "name": "New Hampshire",
            "abbr": "NH"
        },
        {
            "name": "New Jersey",
            "abbr": "NJ"
        },
        {
            "name": "New Mexico",
            "abbr": "NM"
        },
        {
            "name": "New York",
            "abbr": "NY"
        },
        {
            "name": "North Carolina",
            "abbr": "NC"
        },
        {
            "name": "North Dakota",
            "abbr": "ND"
        },
        {
            "name": "Ohio",
            "abbr": "OH"
        },
        {
            "name": "Oklahoma",
            "abbr": "OK"
        },
        {
            "name": "Oregon",
            "abbr": "OR"
        },
        {
            "name": "Pennsylvania",
            "abbr": "PA"
        },
        {
            "name": "Rhode Island",
            "abbr": "RI"
        },
        {
            "name": "South Carolina",
            "abbr": "SC"
        },
        {
            "name": "South Dakota",
            "abbr": "SD"
        },
        {
            "name": "Tennessee",
            "abbr": "TN"
        },
        {
            "name": "Texas",
            "abbr": "TX"
        },
        {
            "name": "Utah",
            "abbr": "UT"
        },
        {
            "name": "Vermont",
            "abbr": "VT"
        },
        {
            "name": "Virginia",
            "abbr": "VA"
        },
        {
            "name": "Washington",
            "abbr": "WA"
        },
        {
            "name": "West Virginia",
            "abbr": "WV"
        },
        {
            "name": "Wisconsin",
            "abbr": "WI"
        },
        {
            "name": "Wyoming",
            "abbr": "WY"
        }
    ];
});