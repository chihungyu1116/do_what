ThingController = ($scope, $http) ->
  $scope.thing = {};

  $scope.suggest = ->
    $http.post '/suggest', {thing: $scope.thing}
      .success (data) ->
        console.log(data, 'success')
      .error (data) ->
        console.log(data, 'error')

    console.log('submit')

  $scope.reset = ->
    $scope.thing = {};


angular.module 'TodoApp', []
  .controller 'ThingController', ThingController



