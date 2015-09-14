Comment = null
### @ngInject ###
Comment = ($q, $http, Rails, CacheFactory) ->

  base = "//#{Rails.host}/api/comments"

  create: (comment, commentable) ->
    deferred = $q.defer()
    $http.post(base,
      content: comment.content
      commentable_type: commentable.type
      commentable_id: commentable.id
    ).success (data) ->
      data = humps.camelizeKeys(data)
      deferred.resolve data
    deferred.promise

angular
  .module 'app'
  .service 'Comment', Comment
