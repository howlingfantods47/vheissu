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

      # initializations
      $scope.audio = new Audio()
      $scope.currentTime = 0
      $scope.audio.volume = 0.7
      $scope.volumeBarShow = false
      $scope.currentFile = '1.mp3'
      $scope.audio.src = $scope.currentFile

      # functions
      $scope.togglePlay = ->
        if $scope.audio.paused then $scope.audio.play() else $scope.audio.pause()

      $scope.toggleVolumeBar = ->
        $scope.volumeBarShow = not $scope.volumeBarShow

      $scope.toggleMute = ->
        $scope.audio.volume = if $scope.audio.volume != 0 then 0 else 0.7

      # refresh
      setInterval ->
        $scope.$apply()
      , 500

      return

    templateUrl: '/views/audioplayer.html'
