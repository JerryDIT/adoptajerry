AuthCtrl = null
### @ngInject ###
AuthCtrl = ($scope, $location, authService, Rails, Maker, AccessToken) ->

  setLoggedIn = ->
    if Rails.user # user is logged in
      token = AccessToken.get()
    authService.loginConfirmed 'success', (config) ->
      if Rails.user and config.url.indexOf("//#{Rails.host}") is 0
        config.headers['Authorization'] = "Bearer #{token}"
      config

  $scope.$on 'event:auth-loginRequired', ->
    logIn()

  logIn = ->

    if Rails.user # user is logged in
      Maker.me().then (data) ->
        if data.token
          setLoggedIn()
    else
      setLoggedIn()


  logIn()

  # Used when the user changes of language.
  # We need to reload the page for the change to take effect.
  if $location.absUrl().split('?').last() is 'changed=true'
    window.location = $location.absUrl().split('?').first()

angular
  .module 'app'
  .controller 'AuthCtrl', AuthCtrl
