<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>    
    <form>
        <div class="col-xs-6">
        <div class="form-group">
          <div class="input-group">
              <div class="input-group-addon"><i class="fa fa-search"></i></div>
              <input type="text" class="form-control" placeholder="ค้นหาข้อมูลนักศึกษา" ng-model="searchStudent">
          </div>      
        </div>
        </div>
    </form>
  
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>
                    <a href="#" ng-click="sortType = 'studentId'; sortReverse = !sortReverse">
                    รหัสนักศึกษา
                    <span ng-show="sortType == 'studentId' && !sortReverse" class="fa fa-caret-down"></span>
                    <span ng-show="sortType == 'studentId' && sortReverse" class="fa fa-caret-up"></span>
                    </a>
                </th>
                <th>
                    <a href="#" ng-click="sortType = 'name'; sortReverse = !sortReverse">
                    ชื่อ
                    <span ng-show="sortType == 'name' && !sortReverse" class="fa fa-caret-down"></span>
                    <span ng-show="sortType == 'name' && sortReverse" class="fa fa-caret-up"></span>
                    </a>
                </th>
                <th>
                    <a href="#" ng-click="sortType = 'surname'; sortReverse = !sortReverse">
                    นามสกุล
                    <span ng-show="sortType == 'surname' && !sortReverse" class="fa fa-caret-down"></span>
                    <span ng-show="sortType == 'surname' && sortReverse" class="fa fa-caret-up"></span>
                    </a>
                </th>
                <th>
                    <a href="#" ng-click="sortType = 'major'; sortReverse = !sortReverse">
                    หลักสูตร
                    <span ng-show="sortType == 'major' && !sortReverse" class="fa fa-caret-down"></span>
                    <span ng-show="sortType == 'major' && sortReverse" class="fa fa-caret-up"></span>
                    </a>
                </th>
                <th>
                    <a href="#" ng-click="sortType = 'level'; sortReverse = !sortReverse">
                    ระดับชั้น
                    <span ng-show="sortType == 'level' && !sortReverse" class="fa fa-caret-down"></span>
                    <span ng-show="sortType == 'level' && sortReverse" class="fa fa-caret-up"></span>
                    </a>
                  </th>
                <th>
                    <a herf="#">เลือก</a> <!--input type="checkbox" ng-model="master"-->
                </th>
            </tr>
        </thead>
        <tbody>
            <tr ng-repeat="std in student | orderBy:sortType:sortReverse | filter:searchStudent">
                <td>{{ std.studentId }}</td>
                <td>{{ std.name }}</td>
                <td>{{ std.surname }}</td>
                <td>{{ std.major }}</td>
                <td>{{ std.level }}</td>
                <td>
                    <input type="checkbox" value="{{ std.studentId }}" 
                        ng-checked="master" 
                        ng-model="state"
                        ng-click="toggleSelection(std.studentId, state)" 
                        ng-true-value="'YES'" 
                        ng-false-value="'NO'"
                    />
                </td>
            </tr>
        </tbody>
    </table> 