(function(){
  'use strict';
  angular.module('stateApp', [])

  .controller('mainController', function($scope, $http) {
    var jsonArr = []
    var json = {}
    $http.get("../ListInClassController?action=read")
        .then(function(response){
            $scope.listStudent = response.data
            $scope.sizeStudent = response.data.length
        })
    
    $scope.toggleSelection = function toggleSelection(studentId, state){
        for(let i=0;i<jsonArr.length;i++){
            if(jsonArr[i].id == studentId){
                jsonArr.splice(i,1);
            }
        }
        if(state == "attend" || 
           state == "late"   || 
           state == "absent" || 
           state == "pbl"    || 
           state == "sl" ){
            json = {id:studentId,state:state}
            jsonArr.push(json)
        }
    }
    
    $scope.addList = function addList(){
        $.ajax({
            url: '../ReportAttendanceController',
            type: 'POST',
            data: {INSERT: JSON.stringify(jsonArr)}
         })
         .done(function() {
             console.log("success")
             location.reload()
         })
         .fail(function() {
             console.log("error");
         })
         .always(function() {
             console.log("complete");
         });
            
    }
    
  });
})();