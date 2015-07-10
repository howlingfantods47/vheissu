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
    controller: ($scope, $rootScope) ->

      # initializations
      $scope.audio = new Audio()
      $scope.currentTime = 0
      $scope.audio.volume = 0.7
      $scope.volumeBarShow = false

      # functions
      $scope.togglePlay = ->
        if $scope.audio.paused then $scope.audio.play() else $scope.audio.pause()
        return

      $scope.toggleVolumeBar = ->
        $scope.volumeBarShow = not $scope.volumeBarShow
        return

      $scope.toggleMute = ->
        $scope.audio.volume = if $scope.audio.volume != 0 then 0 else 0.7
        return

      $rootScope.$on 'playlist.clear', ->
        $scope.audio.pause()
        $rootScope.$broadcast('audio.pause')
        return

      # TODO take care of URL inconsistencies
      $rootScope.$on 'playlist.play', (r,path) ->
        correct_path = path.replace './public', 'http://localhost:9000'
        $scope.audio.pause()
        $scope.audio.src = correct_path
        $scope.audio.play()
        $rootScope.$broadcast('audio.play')
        return

      # refresh to show progression
      setInterval ->
        $scope.$apply()
      , 500

      return

    templateUrl: '/views/audioplayer.html'
