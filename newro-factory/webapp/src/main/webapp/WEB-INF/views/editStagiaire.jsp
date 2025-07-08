<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html>
<head>
<title>Newro Factory</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/resources/css/font-awesome.css" rel="stylesheet" media="screen">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" media="screen">
</head>
<body>
    <header class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <a class="navbar-brand" href="dashboard"> Newro Factory </a>
        </div>
    </header>
    <section id="main">
        <div class="container">
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2 box">
                    <div class="label label-default pull-right">
                        id: ${stagiaire.id}
                    </div>
                    <h1><spring:message code="editStagiaire.title" /></h1>

                    <spring:form action="/stagiaire/${stagiaire.id()}" method="PATCH">
                        <fieldset>
                            <div class="form-group">
                                <label for="lastName"><spring:message code="stagiaire.form.nom" /></label>
                                <input type="text" class="form-control" name="nom" id="nom" placeholder=<spring:message code="stagiaire.form.nom.placeholder" /> value="${stagiaire.nom}" required>
                            </div>
                            <div class="form-group">
                                <label for="firstName">Prén<spring:message code="stagiaire.form.prenom" />om</label>
                                <input type="text" class="form-control" name="prenom" id="prenom" placeholder=<spring:message code="stagiaire.form.prenom.placeholder" /> value="${stagiaire.prenom}" required>
                            </div>
                            <div class="form-group">
                                <label for="arrival"><spring:message code="stagiaire.form.dateArrivee" /></label>
                                <input type="date" class="form-control" name="dateArrivee" id="dateArrivee"
                                    value="${stagiaire.dateArriveeIso()}" required>
                            </div>
                            <div class="form-group">
                                <label for="finFormation"><spring:message code="stagiaire.form.dateDepart" /></label>
                                <input type="date" class="form-control" name="dateDepart" id="dateDepart"
                                    value="${stagiaire.dateDepartIso()}" required>
                            </div>
                            <div class="form-group">
                                <label for="promotionId"><spring:message code="stagiaire.form.promotion" /></label>
                                <select class="form-control" name="promotionId" id="promotionId" required>
                                    <option value="0">--</option>
                                    <c:forEach var="promotion" items="${promotions}">
                                        <option value="${promotion.id()}"<c:if test="${promotion.id == stagiaire.promotion.id}">selected</c:if>>
                                            ${promotion.nom()}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>                  
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value=<spring:message code="modifier" /> class="btn btn-primary">
                            <spring:message code="ou" />
                            <a href="dashboard.html" class="btn btn-default"><spring:message code="annuler" /></a>
                        </div>
                    </spring:form>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-8 col-xs-offset-2">
                    <div class="alert alert-danger" role="alert">
                        <c:if test="${not empty error}">
                            ${error}
                        </c:if>
                    </div>
                </div>
        </div>
    </section>
</body>
</html>