angular.module('cart_checkout_controller', [])
.controller 'CartCheckoutCtrl', ($scope, DataSeed, Customer) ->
  DataSeed.then (data) ->
    _.extend $scope, data
    $scope.errors = {}
    $scope.customer ||= {}

  $scope.total = (shirt) ->
    shirt.quantity * shirt.price

  $scope.create_customer = ->
    Customer.save
      customer: $scope.customer
      ((data) -> window.location = data.path), $scope.saveError

  $scope.update_customer = ->
    Customer.update
      id: $scope.customer.id
      customer: $scope.customer
      ((data) -> window.location = data.path), $scope.saveError

  $scope.save_customer = ->
    if $scope.validate()
      return $scope.create_customer() if _isNew $scope.customer
      $scope.update_customer()

  $scope.saveError = (response) ->
    return $scope.errors = response.data.errors if response.status == 422
    $scope.errors.server = 'Your request could not be saved. Please try again.'

  $scope.validate = ->
    $scope.errors = {}
    $scope.errors.first_name = "First name can't be blank" if _.isEmpty $scope.customer.first_name
    $scope.errors.last_name = "Last name can't be blank" if _.isEmpty $scope.customer.last_name
    $scope.errors.email = "Email can't be blank" if _.isEmpty $scope.customer.email

    _.isEmpty $scope.errors

  _isNew = (model) ->
    _.isUndefined(model.id) || _.isNull(model.id)