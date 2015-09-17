PagesCtrl = null
### @ngInject ###
PagesCtrl = ($element) ->

  # Allows image maps to be used in a responsive design
  $element.find('img[usemap]').rwdImageMaps()

angular
  .module 'app'
  .controller 'PagesCtrl', PagesCtrl
