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
    templateUrl: '/views/audioplayer.html'
