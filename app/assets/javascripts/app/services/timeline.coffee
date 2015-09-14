Timeline = null
### @ngInject ###
Timeline = ($q, $http, Rails, CacheFactory) ->

  base = "//#{Rails.host}/api/timelines"
  timelinesCache = CacheFactory.get("timelinesCache.#{Rails.apiNamespace}") or
    CacheFactory "timelinesCache.#{Rails.apiNamespace}",
      maxAge: (1).second()

  forJerry: (jerryId) ->
    deferred = $q.defer()
    url = base + '/' + "?jerry_id=#{jerryId}"
    $http.get(url, cache: timelinesCache).success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Timeline', Timeline
