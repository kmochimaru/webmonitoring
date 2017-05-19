(function(){
  'use strict';
  angular.module('sortApp', [])

  .controller('mainController', function($scope, $http) {
    $scope.sortType     = 'name'; // set the default sort type
    $scope.sortReverse  = false;  // set the default sort order
    $scope.searchFish   = '';     // set the default search/filter term
    var jsonArr = []
    var json = {}
    $http.get("../StudentController?action=read")
        .then(function(response){
            $scope.student = response.data
        })
    
    $scope.toggleSelection = function toggleSelection(studentId, state){
        //console.log(studentId)
        //console.log(state)
        if(state == "YES"){
            //console.log('......ok.....')
            json = {id:studentId}
            jsonArr.push(json)
        }else{
            for(let i=0;i<jsonArr.length;i++){
                if(jsonArr[i].id == studentId){
                    jsonArr.splice(i,1);
                }
            }
        }
        //console.log(jsonArr)
    }
    
    $scope.addList = function addList(){
        /*$http.defaults.headers.post['Content-Type'] = 'application/json';
        $http.post("../ListInClassController",
            {INSERT:jsonStr})
            .then(function(response){
                console.log('success')
            })*/
        $.ajax({
            url: '../ListInClassController',
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