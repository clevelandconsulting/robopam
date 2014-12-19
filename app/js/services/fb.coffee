angular.module('app').service 'fb', ['api', '$firebase',
 class fb
  constructor: (@api, @firebase) ->
  
  getConnection: (path)->
   url = @api.url
   if path?
    url = url + path
   new Firebase(url)
  
  getAll: (ref) ->
   sync = @firebase(ref)
	  sync.$asArray()

  get: (ref,key) ->
   sync = @firebase(ref.child(key))
   sync.$asObject()
  
]