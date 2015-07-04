'use strict'

###*
 # @ngdoc overview
 # @name vheissuApp
 # @description
 # # vheissuApp
 #
 # Main module of the application.
###
angular
  .module 'vheissuApp', [
    'ngAnimate',
    'ngResource',
    'ngRoute',
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'

