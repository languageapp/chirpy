(function() {
  var app = angular.module('chirpy', []);


  app.controller('ApplicationController', ['$http','$timeout','$window', function($http,$timeout,$window) {

    var self = this;
    var onlinePoll = function() {
      (function checkIn() {
        $http.post('/online/'+$window.currentUser).success(function(data,status) {
          console.log('Post online success: '+status);
          console.log(data.users);
          self.usersOnline = data.users;
          $timeout(checkIn, 2997);
        }).error(function(data, status) {
          console.log('error in online poll: '+status);
        });
      })();
    };

    onlinePoll();
  }]);

  app.controller('LanguageFilterController', [function() {


    this.selectedLanguage = "";



  }]);

})();
