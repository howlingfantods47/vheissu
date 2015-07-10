'use strict'

###*
 # @ngdoc directive
 # @name vheissuApp.directive:librarydirective
 # @description
 # # librarydirective
###
angular.module 'vheissuApp'
  .directive 'libraryDirective', ->
    restrict: 'E'
    scope: {}
    templateUrl: '/views/library.html'
    controller: ['$scope', '$rootScope', '$http', ($scope, $rootScope, $http) ->

      $scope.show = "Artists"

      $scope.viewClass = 'list-view'

      #single image for now, TODO - fetch relevant image etc
      $scope.imageUrl = 'cover.jpg'

      $scope.showList = []

      #individual variables for entire lists, single variable for current view
      $http.get('http://localhost:9000/artists').then (response) ->
        $scope.artists = response.data
        return

      $http.get('http://localhost:9000/albums').then (response) ->
        $scope.albums = response.data
        return

      $http.get('http://localhost:9000/song_titles').then (response) ->
        $scope.allTracks = response.data
        return

      #TODO : perform cache-based updates here
      $scope.showArtists = ->
        $scope.show = "Artists"
        return

      $scope.showAlbums = ->
        $scope.show = "Albums"
        return

      $scope.showAllTracks = ->
        $scope.show = "Tracks"
        return

      $scope.showAlbumsByArtist = (artist) ->
        $http.get('http://localhost:9000/albums/' + artist).then (response) ->
          $scope.showList = response.data
          return
        $scope.show = "AlbumsByArtist"
        return

      $scope.showTracksByArtist = (artist) ->
        $http.get('http://localhost:9000/song_titles/artist/' + artist).then (response) ->
          $scope.showList = response.data
          return
        $scope.show = "TracksByArtist"
        return

      $scope.showTracksByAlbum = (album) ->
        $http.get('http://localhost:9000/song_titles/album/' + album).then (response) ->
          $scope.showList = response.data
          return
        $scope.show = "TracksByAlbum"
        return

      $scope.addTracksByArtist = (artist) ->
        return

      $scope.addTracksByAlbum = (album) ->
        return

      $scope.addTrackSingle = (track) ->
        $rootScope.$broadcast('playlist.add', track)
        return

      return
    ]
