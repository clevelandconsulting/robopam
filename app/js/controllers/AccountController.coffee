angular.module('app').controller 'AccountController', ['$scope','$routeParams','$location', 'AccountRepository',
 class AccountController
  constructor: (@scope, @routeParams, @location, @AccountRepository) ->
   @scope.newaccount = {}
   @scope.newuser = {}
  
  select: (account) ->
   console.log account
   @location.path('/account/'+account.$id)
  
  accounts: () ->
   if !@all?
    @all = @AccountRepository.all()
   @all
  
  account: () ->
   if !@one?
    @one = @AccountRepository.one(@routeParams.id)
   @one
  
  add_user: (newuser) ->
   newuser.account_id= @routeParams.id
   a = @account()
   if !a.users?
    a.users = []
   a.users.push(newuser)
   a.$save()
   newuser = {}
    
  add: (newaccount) ->
   @all.$add(newaccount)
   newaccount = {}
]