CommentsCtrl = null
### @ngInject ###
CommentsCtrl = ($rootScope, $scope, $element, $translate, Comment, Rails) ->

  $scope.user = Rails.userName
  $scope.verb = "commented"
  $scope.commentable = {}

  editor = ->
    angular.element($element.find('.ta-editor')).scope()

  resetEditor = ->
    editor().html = "" if editor()
    $scope.saving = false
    $scope.saved = false

  $scope.$on 'jerryChanged', (event, args) ->
    resetEditor()
    $scope.commentable =
      type: "Jerry"
      id: args.jerry.id

  $scope.$on 'fileUploaded', (event, args) ->
    data = args.file.result
    icon = "<i class='fa fa-download'></i>"
    editor().html += " <a href='#{data.url}' target='_blank'>#{icon} #{data.name}</a>"

  $scope.submit = (comment) ->
    $scope.saving = true
    Comment.create(comment, $scope.commentable).then (comment) ->
      $scope.createdAt = moment()
      $scope.saving = false
      $scope.saved = true
      resetEditor()
      $rootScope.$broadcast 'commentCreated'

  # TODO make this code work so that the placeholder doesn't use Rails
  $translate('leave_a_comment').then (placeholder) ->
    editor().displayElements.text.attr 'placeholder', placeholder
    editor().displayElements.html.attr 'placeholder', placeholder
    $element.find(".placeholder-text:before").addRule content: placeholder

angular
  .module 'app'
  .controller 'CommentsCtrl', CommentsCtrl
