GalleryCtrl = null
### @ngInject ###
GalleryCtrl = ($scope, $modal, $location, Jerry, Picture) ->

  splittedURL = $location.absUrl().split('/')
  $scope.id = if splittedURL.last() is 'edit'
    splittedURL.last(2).first()
  else
    splittedURL.last()

  Jerry.find($scope.id).then (jerry) ->
    $scope.pictures = jerry.pictures

  $scope.open = ->

    modalInstance = $modal.open
      animation: true
      templateUrl: 'gallery.html'
      controller: 'GalleryInstanceCtrl'
      size: 'lg'
      resolve:
        pictures: ->
          $scope.pictures

  $scope.delete = (picture) ->
    pictureId = picture.id
    Picture.delete(pictureId)

angular
  .module 'app'
  .controller 'GalleryCtrl', GalleryCtrl
