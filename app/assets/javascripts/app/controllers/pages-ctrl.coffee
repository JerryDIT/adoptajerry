PagesCtrl = null
### @ngInject ###
PagesCtrl = ($rootScope, $scope, $element, $location, $timeout) ->

  $scope.id = $location.absUrl().split('/').last()
  $scope.id = null if $scope.id is 'build'

  $timeout ->
    $rootScope.$broadcast 'pageChanged',
      page: { id: $scope.id }

  # Allows image maps to be used in a responsive design
  $element.find('img[usemap]').rwdImageMaps()

angular
  .module 'app'
  .controller 'PagesCtrl', PagesCtrl
