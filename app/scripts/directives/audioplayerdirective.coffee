'use strict'

###*
 # @ngdoc directive
 # @name vheissuApp.directive:audioPlayerDirective
 # @description
 # # audioPlayerDirective
###
angular.module 'vheissuApp'
  .directive 'audioPlayerDirective', ->
    restrict: 'E'
    scope: {}
    controller: ($scope, $element, $rootScope) ->
      $scope.audio = new Audio('1.mp3')
      $scope.currentTime = 0
      $scope.togglePlay = ->
        if $scope.audio.paused then $scope.audio.play() else $scope.audio.pause()
      setInterval ->
        $scope.$apply()
      , 500
    templateUrl: '/views/audioplayer.html'
