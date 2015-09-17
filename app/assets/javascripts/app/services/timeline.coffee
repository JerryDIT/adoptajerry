Timeline = null
### @ngInject ###
Timeline = ($q, $http, Rails, CacheFactory) ->

  base = "//#{Rails.host}/api/timelines"
  timelinesCache = CacheFactory.get("timelinesCache.#{Rails.apiNamespace}") or
    CacheFactory "timelinesCache.#{Rails.apiNamespace}",
      maxAge: (1).second()

  for: (timelinableType, timelinableId) ->
    deferred = $q.defer()
    url = base + '/' + "?#{timelinableType.toLowerCase()}_id=#{timelinableId}"
    $http.get(url, cache: timelinesCache).success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Timeline', Timeline
