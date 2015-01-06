angular.module('app').service 'AccountRepository', [ 'FirebaseRepository', 'UserRepository' (FirebaseRepository, UserRepository) ->
 class AccountRepository extends FirebaseRepository
  constructor: () ->
   FirebaseRepository.call @, 'account'
   
  new_users: (one) ->
   @getChild(one,'newuser')
  
  users: (one) ->
   @getChild(one,'users')
   
  user_activation: (id, active) ->
   u = UserRepository.one(id)
   console.log user
   u.$loaded().then (data) =>
	   u.active = active
	   console.log u
	   
	   u.$save().then (data) =>
	    console.log @users
	    @users.$loaded().then (list) =>
	     found = -1
		    for us, i in @users
		     if us.$id == user.$id
		      if active
		       us.deactive = undefined
		      else
 		      us.deactive = false
		      found = i
		    if found > -1
			    @users.$save(found)
		 	   .catch (error) => 
		 	    console.error error
		 	    @notifications.error 'ERROR', error
  
 new AccountRepository()
]