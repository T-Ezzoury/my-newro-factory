<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags" %>

<c:set var="dashboardUrl" value="${pageContext.request.contextPath}/dashboard"/>

<!DOCTYPE html>
<html>
<head>
<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
        <a class="navbar-brand" href="${dashboardUrl}">Newro Factory</a>
        </div>
    </header>

    <section id="main">
        <div class="container">
           <h1 id="homeTitle">
                <c:choose>
                    <c:when test="${empty stagiaires}">
                        <spring:message code="dashboard.stagiaires.vide" />
                    </c:when>
                    <c:otherwise>
                        <spring:message code="dashboard.stagiaires.existent">
                            <spring:argument value="${totalStagiaires}" />
                            <spring:argument value="${totalStagiaires > 1 ? 's' : ''}" />
                        </spring:message>
                    </c:otherwise>
                </c:choose>
            </h1>

            <div id="actions" class="form-horizontal">
                <div class="pull-left">
                    <form id="searchForm" 
                          action="${dashboardUrl}" 
                          method="GET" 
                          class="form-inline">

                        <input type="search" 
                               id="searchbox" 
                               name="search" 
                               class="form-control" 
                               placeholder="Search name"
                               value="${fn:escapeXml(param.search)}" />

                        <input type="submit" id="searchsubmit" value="Filter by name"
                        class="btn btn-primary" />
                    </form>
                </div>

                <div class="pull-right">
                    <a class="btn btn-success" id="addStagiaire" href="addStagiaire">Ajout stagiaire</a> 
                    <a class="btn btn-default" id="editStagiaire" href="#" onclick="$.fn.toggleEditMode();">Modifier</a>
                </div>
            </div>
        </div>

        <!-- TODO -->
        <form id="deleteForm" action="#" method="POST">
            <input type="hidden" name="selection" value="">
        </form>

        <div class="container" style="margin-top: 10px;">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <!-- Variable declarations for passing labels as parameters -->
                        <!-- Table header for Computer Name -->

                         <th class="editMode" style="width: 60px; height: 22px;">
                            <input type="checkbox" id="selectall" /> 
                            <span style="vertical-align: top;">
                                 -  <a href="#" id="deleteSelected" onclick="$.fn.deleteSelected();">
                                        <i class="fa fa-trash-o fa-lg"></i>
                                    </a>
                            </span>
                        </th>
                        <th>
                            Stagiaire
                        </th>
                        <th>
                            Date d'arrivée
                        </th>
                        <!-- Table header for Discontinued Date -->
                        <th>
                            Date de fin de formation
                        </th>
                        <!-- Table header for Company -->
                        <th>
                            Promotion
                        </th>

                    </tr>
                </thead>
                <!-- Browse attribute computers -->
                <tbody id="results">
                   		<tr>
                   			<td class="editMode">
                   				<input type="checkbox" name="cb" class="cb" value="0">
                   			</td> 
                        </td>
                   			</td> 
                        </td>
                   			</td> 
                        </td>
                   			</td> 
                   			<td><a href="editStagiaire.html" onclick="">Jean Dupont</a></td>
                   			<td>07/02/2022</td>
                   			<td></td>
                   			<td>Février 2022</td>
                   		</tr>
                   		<tr>
                   			<td class="editMode"></td> 
                   			<td><a href="editStagiaire.html" onclick="">Ulysse Coscoy</a></td>
                   			<td>07/02/2021</td>
                   			<td>08/04/2021</td>
                   			<td>Février 2021</td>
                   		</tr>
                   		<tr>
                   			<td class="editMode"></td> 
                   			<td><a href="editStagiaire.html" onclick="">Mathéo Allard</a></td>
                   			<td>01/03/2021</td>
                   			<td>01/05/2021</td>
                   			<td>Mars 2021</td>
                   		</tr>
                   		<tr>
                   			<td class="editMode"></td> 
                   			<td><a href="editStagiaire.html" onclick="">Walid Aloui</a></td>
                   			<td>03/05/2021</td>
                   			<td>03/07/2021</td>
                   			<td>Mai 2021</td>
                   		</tr>
                </tbody>
            </table>
        </div>
    </section>

    <footer class="navbar-fixed-bottom">
        <div class="container text-center">
            <ul class="pagination">
                <li>
                    <a href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                  </a>
              </li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>

        <div class="btn-group btn-group-sm pull-right" role="group" >
            <button type="button" class="btn btn-default">10</button>
            <button type="button" class="btn btn-default">50</button>
            <button type="button" class="btn btn-default">100</button>
        </div>
	</div>
    </footer>

  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>

</body>
</html>
