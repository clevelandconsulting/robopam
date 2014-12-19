angular.module('app').config ['$routeProvider', (routeProvider) ->
 routeProvider
 .when('/', {controller: 'UserController', controllerAs:'user', templateUrl: 'user.html'})
 .otherwise {redirectTo:'/hi'}

]
