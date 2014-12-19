angular.module('app').controller 'UserController', ['$scope','UserRepository', 
 class UserController
  constructor: (@scope, @UserRepository) ->
   @scope.newuser = {}
   
  users: () ->
   if !@all?
    @all = @UserRepository.all()
   @all
   
  add: (newuser) ->
   @all.$add(newuser)
   newuser = {}
]