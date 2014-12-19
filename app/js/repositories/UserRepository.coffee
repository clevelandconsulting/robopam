angular.module('app').service 'UserRepository', [ 'FirebaseRepository', (FirebaseRepository) ->
 class UserRepository extends FirebaseRepository
  constructor: () ->
   FirebaseRepository.call @, 'user'
  
 new UserRepository()
]