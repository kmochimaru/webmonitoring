(function () {
    'use strict';
    angular.module('stateApp', [])

            .controller('updateController', function ($scope, $http) {
                var subjectId = getUrlVars()['subjectId']
                var jsonArr = []
                var json = {}
                $http.get("../ReportAttendanceController?action=reportDate&subjectId=" + subjectId)
                        .then(function (response) {
                            $scope.date = response.data
                        })

                $scope.loadReport = function (date) {
                    jsonArr = []
                    json = {}
                    $http.get("../ReportAttendanceController?action=reportByDate&subjectId=" + subjectId + "&date=" + date)
                            .then(function (response) {
                                $scope.sizeStudent = response.data.length
                                $scope.listStudent = response.data
                                for (var i = 0; i < response.data.length; i++) {
                                    json = {id: response.data[i].id, state: response.data[i].state}
                                    jsonArr.push(json)
                                }
                            })
                }

                $scope.toggleSelection = function toggleSelection(id, state) {
                    for (let i = 0; i < jsonArr.length; i++) {
                        if (jsonArr[i].id == id) {
                            jsonArr.splice(i, 1);
                        }
                    }
                    if (state == "attend" ||
                            state == "late" ||
                            state == "absent" ||
                            state == "pbl" ||
                            state == "sl") {
                        json = {id: id, state: state}
                        jsonArr.push(json)
                    }
                }

                $scope.editList = function editList() {
                    $.ajax({
                        url: '../ReportAttendanceController?action=updateReport',
                        type: 'GET',
                        data: {UPDATE: JSON.stringify(jsonArr)}
                    })
                            .done(function () {
                                toastr.success("","แก้ไขสำเร็จ")
                                //location.reload()
                            })
                            .fail(function () {
                                console.log("error");
                            })

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
                            state == "late" ||
                            state == "absent" ||
                            state == "pbl" ||
                            state == "sl") {
                        json = {id: studentId, state: state}
                        jsonArr.push(json)
                    }
                }

                $scope.addList = function addList() {
                    $.ajax({
                        url: '../ReportAttendanceController',
                        type: 'POST',
                        data: {INSERT: JSON.stringify(jsonArr)}
                    })
                            .done(function () {
                                console.log("success")
                                location.reload()
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