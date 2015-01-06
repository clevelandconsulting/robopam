angular.module('app').controller 'UserController', ['$scope', 'UserRepository', 
 class UserController extends FirebaseViewController
  constructor: (scope, @UserRepository) ->
   super(scope)
   
  users: () ->
   @getAll(@UserRepository)
  
  email: (user) ->
   user.email

]