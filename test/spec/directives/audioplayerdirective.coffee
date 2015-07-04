'use strict'

describe 'Directive: audioPlayerDirective', ->

  # load the directive's module
  beforeEach module 'vheissuApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<audio-player-directive></audio-player-directive>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the audioPlayerDirective directive'
