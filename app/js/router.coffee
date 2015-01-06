angular.module('app').config ['$routeProvider', (routeProvider) ->
 routeProvider
 .when('/', {controller:'HomeController', controllerAs: 'home', templateUrl: 'home.html'})
 .when('/login', {controller:'LoginController', controllerAs: 'login', templateUrl:'login.html'})
 .when('/logout',{controller:'LogoutController', controllerAs: 'logout', template:'<p>Logging Out...</p>'})
 .when('/user', {controller: 'UserController', controllerAs:'user', templateUrl: 'users.html'})
 .when('/account', {controller: 'AccountController', controllerAs:'account', templateUrl: 'accounts.html'})
 .when('/account/:id', {controller: 'AccountController', controllerAs:'account', templateUrl: 'account.html'})
 .otherwise {redirectTo:'/'}

]

angular.module('app').run [ '$rootScope', '$location', 'RouteValidation', ($rootScope,$location,routeValidation) -> 
#angular.module('app').run [ '$rootScope', 'routeValidation', ($rootScope,routeValidation) ->
 routeValidation.addNonValidationRoute '/login'
 $rootScope.$on '$locationChangeStart', routeValidation.validateRoute
]
