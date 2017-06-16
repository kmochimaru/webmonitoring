(function () {
    'use strict';
    angular.module('stateApp', [])
            .controller('updateController', function ($scope, $http) {
                var jsonArr = []
                var json = {}
                $http.get("../ReportActivityController?action=editActivity&activityId=" + getUrlVars()['activityId'])
                        .then(function (response) {
                            //console.log(response.data)
                            $scope.listStudent = response.data
                            $scope.sizeStudent = response.data.length
                            for (var i = 0; i < response.data.length; i++) {
                                json = {id: response.data[i].id, state: response.data[i].state, point: response.data[i].point}
                                jsonArr.push(json)
                            }
                        })

                $scope.editList = function editList() {
                    $.ajax({
                        url: '../ReportActivityController?action=updateReport',
                        type: 'GET',
                        data: {UPDATE: JSON.stringify(jsonArr)}
                    })
                            .done(function () {
                                console.log("success")
                                location.reload()
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                //console.log("complete");
                            });
                }
                
                $scope.toggleSelection = function toggleSelection(id, state) {
                    for (let i = 0; i < jsonArr.length; i++) {
                        if (jsonArr[i].id == id) {
                            jsonArr.splice(i, 1);
                        }
                    }
                    if (state == "attend" ||
                            state == "absent") {
                        if(state == "attend")
                            json = {id: id, state: state, point:getUrlVars()['point']}
                        else
                            json = {id: id, state: state, point:0}
                        jsonArr.push(json)
                    }
                }
                
            })
            .controller('mainController', function ($scope, $http) {
                var jsonArr = []
                var json = {}
                $http.get("../ListInClassController?action=read")
                        .then(function (response) {
                            $scope.listStudent = response.data
                            $scope.sizeStudent = response.data.length
                            $.each(response.data, function () {
                                $.each(this, function (key, value) {
                                    if (key == "studentId") {
                                        json = {id: value, state: "absent"}
                                        jsonArr.push(json)
                                    }
                                });
                            });
                        })

                $scope.toggleSelection = function toggleSelection(studentId, state) {
                    for (let i = 0; i < jsonArr.length; i++) {
                        if (jsonArr[i].id == studentId) {
                            jsonArr.splice(i, 1);
                        }
                    }
                    if (state == "attend" ||
                            state == "absent") {
                        json = {id: studentId, state: state}
                        jsonArr.push(json)
                    }
                }

                $scope.addList = function addList() {
                    $.ajax({
                        url: '../ReportActivityController',
                        type: 'POST',
                        data: {INSERT: JSON.stringify(jsonArr)}
                    })
                            .done(function () {
                                console.log("success")
                                window.location.href = "activity.jsp"
                            })
                            .fail(function () {
                                console.log("error");
                            })
                            .always(function () {
                                console.log("complete");
                            });

                }
            });


    function getUrlVars() {
        var vars = {};
        var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
                function (m, key, value) {
                    vars[key] = value;
                });
        return vars;
    }
})();