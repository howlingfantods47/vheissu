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

      $scope.showArtistsFlag = true
      $scope.showAlbumsFlag = false
      $scope.showAllTracksFlag = false

      $scope.viewClass = 'list-view'

      #single image for now, TODO - fetch relevant image etc
      $scope.imageUrl = 'cover.jpg'

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
        $scope.showArtistsFlag = true
        $scope.showAlbumsFlag = false
        $scope.showAllTracksFlag = false
        return

      $scope.showAlbums = ->
        $scope.showArtistsFlag = false
        $scope.showAlbumsFlag = true
        $scope.showAllTracksFlag = false
        return

      $scope.showAllTracks = ->
        $scope.showArtistsFlag = false
        $scope.showAlbumsFlag = false
        $scope.showAllTracksFlag = true
        return

      return
    ]
