angular.module('app').config ['$routeProvider', (routeProvider) ->
 routeProvider
 .when('/user', {controller: 'UserController', controllerAs:'user', templateUrl: 'users.html'})
 .when('/account', {controller: 'AccountController', controllerAs:'account', templateUrl: 'accounts.html'})
 .when('/account/:id', {controller: 'AccountController', controllerAs:'account', templateUrl: 'account.html'})
 .otherwise {redirectTo:'/user'}

]
