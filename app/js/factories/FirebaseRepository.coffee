angular.module('app').factory 'FirebaseRepository', ['$rootScope', '$q', 'FB', (rootScope, q, fb) ->

 class FirebaseRepository
  constructor: (@base) ->
   @fb = fb
   @q = q
   @setBase(base)
   
  setBase: (base) ->
   @base = base
   @ref = @fb.getConnection(base)
  
  get: (ref,key) ->
   if key?
    obj = @fb.get(ref,key)
   else
    obj = @fb.getAll(ref)
   obj
   
  all: ()->
   @fb.getAll(@ref)
   
  one: (key) ->
   @fb.get(@ref, key)
   
  getChild: (obj, child) ->
   @get(obj.$inst().$ref().child(child))
]