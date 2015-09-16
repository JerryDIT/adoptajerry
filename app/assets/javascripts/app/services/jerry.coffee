Jerry = null
### @ngInject ###
Jerry = ($q, $http, Rails, CacheFactory) ->

  base = "//#{Rails.host}/api/jerries"
  jerriesCache = CacheFactory.get("jerriesCache.#{Rails.apiNamespace}") or
    CacheFactory "jerriesCache.#{Rails.apiNamespace}",
      maxAge: (10).seconds()

  all: ->
    deferred = $q.defer()
    $http.get(base,
      cache: jerriesCache
    ).success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

  find: (id) ->
    deferred = $q.defer()
    $http.get(base + "/#{id}",
      cache: jerriesCache
    ).success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Jerry', Jerry
