Picture = null
### @ngInject ###
Picture = ($q, $http, Rails, CacheFactory) ->

  base = "//#{Rails.host}/api/pictures"

  delete: (id) ->
    deferred = $q.defer()
    $http.delete(base + "/#{id}").success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Picture', Picture
