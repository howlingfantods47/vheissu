'use strict'

###*
 # @ngdoc directive
 # @name vheissuApp.directive:playlistDirective
 # @description
 # # playlistDirective
###
angular.module 'vheissuApp'
  .directive 'playlistDirective', ->
    restrict: 'E'
    scope: {}
    templateUrl: '/views/playlist.html'
    controller: ['$scope', '$rootScope', '$http', ($scope, $rootScope, $http)->
      $scope.nowPlaying = []

      $scope.clearPlaylist = ->
        $scope.nowPlaying = []
        $rootScope.$broadcast('playlist.clear')
        return

      $scope.playPlaylist = ->
        if $scope.nowPlaying.length != 0
          $rootScope.$broadcast 'playlist.play', $scope.nowPlaying[0].absolute_path
        return

      $scope.playThisSong = (song) ->
        $rootScope.$broadcast 'playlist.play', song.absolute_path
        return

      $rootScope.$on 'playlist.add', (r, track)->
        $http.get('http://localhost:9000/track/' + track).then (response) ->
          $scope.nowPlaying.push response.data
          return
        return

      return
    ]

