angular.module('app').factory 'FirebaseRepository', ['$rootScope', 'fb', (@rootScope, @fb) ->

 class FirebaseRepository
  constructor: (@base) ->
   @setBase(base)
   
  setBase: (base) ->
   @base = base
   @ref = fb.getConnection(base)
  
  all: ()->
   fb.getAll(@ref)
   
  one: (key) ->
   fb.get(@ref, key)
   
  
]