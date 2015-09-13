capitalize = null
### @ngInject ###
capitalize = ->

  (item) ->
    if item?
      item.capitalize()
    else
      item

angular
  .module 'app'
  .filter 'capitalize', capitalize
