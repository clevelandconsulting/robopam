angular.module("app")
 .constant 'api', 
  { name: 'firebase', url:'https://robopam-io.firebaseio.com/' }

###  
angular.module("app").config ['localStorageServiceProvider', '$logProvider', (localStorageServiceProvider, logProvider) ->
 localStorageServiceProvider.setPrefix('skillsEvaluation')
 logProvider.debugEnabled(true)

]
###