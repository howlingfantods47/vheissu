'use strict'

###*
 # @ngdoc function
 # @name vheissuApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the vheissuApp
###
angular.module 'vheissuApp'
  .controller 'MainCtrl', ($scope) ->
    @temp = 'hi'
    $scope.boo = 'boo'
    return
