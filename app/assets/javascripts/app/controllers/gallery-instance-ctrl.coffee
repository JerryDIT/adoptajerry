GalleryInstanceCtrl = null
### @ngInject ###
GalleryInstanceCtrl = ($scope, $modalInstance, pictures) ->

  $scope.pictures = pictures

  $scope.close = ->
    $modalInstance.dismiss 'cancel'

angular
  .module 'app'
  .controller 'GalleryInstanceCtrl', GalleryInstanceCtrl
