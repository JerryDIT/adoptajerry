angular

  .module 'app',
    ['templates', 'ngStorage', 'ui.bootstrap'
    'formly', 'formlyBootstrap', 'LocalStorageModule', 'angular-cache',
    'ngSanitize', 'angular-timeline', 'angularMoment',
    'pascalprecht.translate', 'angular.filter', 'textAngular', 'ngFileUpload',
    'http-auth-interceptor', 'angular-growl']

  .constant "Modernizr", Modernizr

  .config (CacheFactoryProvider) ->
    angular.extend CacheFactoryProvider.defaults,
      maxAge: (10).minutes()
      deleteOnExpire: 'aggressive'
      storageMode: 'localStorage'

  .config ($translateProvider, Rails) ->
    $translateProvider.useSanitizeValueStrategy 'sanitize'
    $translateProvider.useStaticFilesLoader
      prefix: '/locales/'
      suffix: '.json'
    $translateProvider.preferredLanguage Rails.locale

  .run ($http, CacheFactory, Rails) ->
    defaultCache = CacheFactory.get "defaultCache.#{Rails.apiNamespace}"
    $http.defaults.cache = defaultCache or CacheFactory "defaultCache.#{Rails.apiNamespace}",
      maxAge: (30).minutes()
      cacheFlushInterval: (1).week()
      deleteOnExpire: 'aggressive'
      storageMode: 'localStorage'

  .run (amMoment, $translate, Rails) ->
    amMoment.changeLocale Rails.locale

  .config (growlProvider) ->
    growlProvider.globalPosition 'bottom-left'
    growlProvider.globalTimeToLive
      success: 5000
      error: 8000
      warning: 8000
      info: 5000

  .factory 'tokenInterceptor', (AccessToken, Rails) ->
    request: (config) ->
      # Send AccessToken only to our API
      if config.url.indexOf("//#{Rails.host}") is 0
        token = AccessToken.get()
        config.headers['Authorization'] = "Bearer #{token}" if token
      config

  .config ($httpProvider) ->
    $httpProvider.interceptors.push 'tokenInterceptor'

$(document).on 'ready page:load', ->
  angular.bootstrap document.body, ['app'], { strictDi: true }
