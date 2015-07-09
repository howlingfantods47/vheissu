'use strict'

describe 'Directive: librarydirective', ->

  # load the directive's module
  beforeEach module 'vheissuApp'

  scope = {}

  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()

  it 'should make hidden element visible', inject ($compile) ->
    element = angular.element '<librarydirective></librarydirective>'
    element = $compile(element) scope
    expect(element.text()).toBe 'this is the librarydirective directive'
