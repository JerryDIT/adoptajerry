JerriesCtrl = null
### @ngInject ###
JerriesCtrl = ($rootScope, $scope, $location, $timeout, Jerry) ->

  $scope.id = $location.absUrl().split('/').last()

  $timeout ->
    $rootScope.$broadcast 'jerryChanged',
      jerry: { id: $scope.id }

  Jerry.all().then (jerries) ->
    $scope.jerries = jerries

angular
  .module 'app'
  .controller 'JerriesCtrl', JerriesCtrl
