angular.module('app').service 'AccountRepository', [ 'FirebaseRepository', (FirebaseRepository) ->
 class AccountRepository extends FirebaseRepository
  constructor: () ->
   FirebaseRepository.call @, 'account'
  
 new AccountRepository()
]