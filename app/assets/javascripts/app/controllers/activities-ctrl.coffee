ActivitiesCtrl = null
### @ngInject ###
ActivitiesCtrl = ($scope, $timeout, Timeline) ->

  $scope.$on 'event:auth-loginConfirmed', (event, args) ->
    $scope.makerSignedIn = true

  $scope.$on 'commentableChanged', (event, args) ->

    $scope.commentable = args.commentable

  $scope.$on 'jerryChanged', (event, args) ->

    $scope.timelinable =
      type: "Jerry"
      id: args.jerry.id
    updateTimeline()

  $scope.$on 'pageChanged', (event, args) ->

    $scope.timelinable =
      type: "Page"
      id: args.page.id
    updateTimeline()

  $scope.$on 'commentCreated', (event, args) ->

    $scope.activitiesLoaded = false
    updateTimeline()

  updateTimeline = ->

    if $scope.timelinable

      Timeline.for($scope.timelinable.type, $scope.timelinable.id).then (timeline) ->
        $timeout ->
          $scope.activitiesLoaded = true
          $scope.activities = timeline.activities

angular
  .module 'app'
  .controller 'ActivitiesCtrl', ActivitiesCtrl
