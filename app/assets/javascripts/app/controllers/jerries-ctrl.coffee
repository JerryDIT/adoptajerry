JerriesCtrl = null
### @ngInject ###
JerriesCtrl = ($rootScope, $scope, $location, $timeout) ->

  $scope.id = $location.absUrl().split('/').last()

  $timeout ->
    $rootScope.$broadcast 'jerryChanged',
      jerry: { id: $scope.id }

angular
  .module 'app'
  .controller 'JerriesCtrl', JerriesCtrl
