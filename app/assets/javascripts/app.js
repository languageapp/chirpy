(function() {
  var app = angular.module('chirpy', []);


  app.controller('ApplicationController', ['$http','$timeout','$window', function($http,$timeout,$window) {

    var self = this;

    self.onlineOnly = false;

    self.usersOnline = [];


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

    self.isUserOnline = function(userID) {
      if (!self.onlineOnly) {
        return true;
      }
      else {
        return self.usersOnline.indexOf(userID) > -1;
      }

    };





   }]);

  app.controller('LanguageFilterController', [function() {


    this.selectedLanguage = "";

  }]);

})();
