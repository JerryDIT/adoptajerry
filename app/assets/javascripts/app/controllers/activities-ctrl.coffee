ActivitiesCtrl = null
### @ngInject ###
ActivitiesCtrl = ($scope, $timeout, Timeline) ->

  $scope.$on 'jerryChanged', (event, args) ->

    $scope.jerryId = args.jerry.id
    updateTimeline()

  $scope.$on 'commentCreated', (event, args) ->

    $scope.activitiesLoaded = false
    updateTimeline()

  updateTimeline = ->

    if $scope.jerryId

      Timeline.forJerry($scope.jerryId).then (timeline) ->
        $timeout ->
          $scope.activitiesLoaded = true
          $scope.activities = timeline.activities

angular
  .module 'app'
  .controller 'ActivitiesCtrl', ActivitiesCtrl
