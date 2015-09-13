AccessToken = null
### @ngInject ###
AccessToken = (Rails, CacheFactory) ->

  accessTokenCache = CacheFactory.get("accessTokenCache.#{Rails.apiNamespace}") or
    CacheFactory "accessTokenCache.#{Rails.apiNamespace}",
      maxAge: (5).minutes()
      storageMode: 'sessionStorage'

  get:         -> accessTokenCache.get 'accessToken'
  set: (token) -> accessTokenCache.put 'accessToken', token
  delete:      -> accessTokenCache.remove 'accessToken'

angular
  .module 'app'
  .service 'AccessToken', AccessToken
