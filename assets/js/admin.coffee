AdminController = ($scope, $http) ->
  $scope.thing = {}
  $scope.eat = {}
  $scope.type = 'thing'
  $scope.types = [
    'thing'
    'eat'
  ]

  $scope.suggest = ->
    data =
      switch $scope.type
        when 'thing' then $scope.thing
        when 'eat' then $scope.eat

    uri = "/suggest/#{$scope.type}"

    $http.post uri, {data: data}
      .success (data) -> console.log(data, 'success')
      .error (data) -> console.log(data, 'error')

  $scope.reset = ->
    $scope.thing = {};

angular.module 'TodoApp', []
  .controller 'AdminController', AdminController



