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
    controller: ($scope)->
      $scope.files = [1..10].map (i) -> i + '.mp3'
    #controllerAs: 'vm'
    #bindToController: true
    templateUrl: '/views/playlist.html'
