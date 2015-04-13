(function() {
  var app = angular.module('chirpy', []);

  app.controller('LanguageFilterController', ['$window',function($window) {


    this.selectedLanguage = "";

    this.onlineUsers = "";

  }]);

}());
