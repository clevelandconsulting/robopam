angular.module('app').controller 'AccountController', ['$scope','$routeParams','$location','AccountRepository', 'NewUserRepository', 'UserRepository', 'Notifications','Authentication',
 class AccountController extends FirebaseViewController
  constructor: (scope, @routeParams, @location, @AccountRepository, @NewUserRepository, @UserRepository, notifications, @authentication) ->
   super(scope, notifications)
   @scope.newaccount = {}
   @scope.newuser = {}
  
  firebaseError: (error) ->
   window.history.back()
   super(error)
   
   
  select: (account) ->
   @location.path('/account/'+account.$id)
  
  accounts: () ->
   @getAll(@AccountRepository)
   
  account: () ->
   acc = @getOne(@AccountRepository,@routeParams.id)
   if !@users?
    @users = @AccountRepository.users(acc)
   if !@new_users?
    @new_users = @AccountRepository.new_users(acc)
   acc 
   
  deactivate: (user) ->
   u = @UserRepository.one(user.$id)
   console.log user
   u.$loaded().then (data) =>
	   u.active = false
	   console.log u
	   
	   u.$save().then (data) =>
	    console.log @users
	    @users.$loaded().then (list) =>
	     found = -1
		    for us, i in @users
		     if us.$id == user.$id
		      us.deactive = false
		      found = i
		    if found > -1
			    @users.$save(found)
		 	   .catch (error) => 
		 	    console.error error
		 	    @notifications.error 'ERROR', error
     
   
  remove_newuser: (u) ->
   console.log 'removing', u.$id
   @NewUserRepository.remove(@routeParams.id,u.$id)
  
  add_user: (newuser) ->
   if newuser.email? && newuser.password?
	   @authentication.createUser(newuser.email,newuser.password)
	   .then (data) =>
	    console.log 'added user!', data
	    @NewUserRepository.add(@routeParams.id,newuser.email)
	    .then (result) =>
	     console.log 'user completed'
	 	   newuser = {}
	 	  .catch (error) =>
	 	   @notifications.error error, 'Could Not Complete User Addition'
	 	   console.error "Error: ", error
	 	   
				.catch (error) =>
				 @notifications.error error, 'Could Not Add User'
				 console.error "Error: ", error
   
   ###
   newuser.account_id= @routeParams.id
   a = @account()
   if !a.users?
    a.users = {}
   console.log 'a.users', a.users
   a.users[newuser.username] = newuser
   a.$save()
   ###
   
   
  
  add: (newaccount) ->
   @all.$add(newaccount)
   newaccount = {}
]