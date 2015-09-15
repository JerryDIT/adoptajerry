Maker = null
### @ngInject ###
Maker = ($q, $http, Rails, CacheFactory, AccessToken) ->

  base = "//#{Rails.host}/api/makers"
  makersCache = CacheFactory.get("makersCache.#{Rails.apiNamespace}") or
    CacheFactory "makersCache.#{Rails.apiNamespace}",
      maxAge: (10).minutes()

  accessTokenUrl = "//#{Rails.host}/api/v1/makers/me"
  makerAccessTokenCache = CacheFactory.get("makerAccessTokenCache.#{Rails.apiNamespace}") or
    CacheFactory "makerAccessTokenCache.#{Rails.apiNamespace}",
      maxAge: (15).minutes()
      storageMode: 'sessionStorage'
      onExpire: (key, value) ->
        if value
          $http.get(accessTokenUrl, cache: false).success (data) ->
            AccessToken.set data.token
            makersCache.put(key, data)

  me: ->
    deferred = $q.defer()
    $http.get(accessTokenUrl, cache: makerAccessTokenCache).success (data) ->
      data = humps.camelizeKeys(data)
      AccessToken.set data.token
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Maker', Maker
