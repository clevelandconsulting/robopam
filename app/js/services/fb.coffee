angular.module('app').service 'FB', ['api', '$firebase',
 class fb
  constructor: (@api, @firebase) ->
  
  getConnection: (path)->
   url = @api.url
   if path?
    url = url + path
   new Firebase(url)

 
  getAll: (ref) ->
   sync = @firebase(ref, {arrayFactory: "FbArray"})
	  sync.$asArray()

  get: (ref,key) ->
   sync = @firebase(ref.child(key))
   sync.$asObject()
  
]