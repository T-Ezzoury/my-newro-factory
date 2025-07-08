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
                    <h1><spring:message code="addStagiaire.title" /></h1>
                    <form action="/stagiaire/add" method="POST">
                        <fieldset>
                            <div class="form-group">
                                <label for="lastName"><spring:message code="stagiaire.form.nom" /></label>
                                <input type="text" class="form-control" name="nom" id="nom" placeholder=<spring:message code="stagiaire.form.nom.placeholder" /> value="" required>
                            </div>
                            <div class="form-group">
                                <label for="firstName"><spring:message code="stagiaire.form.prenom" /></label>
                                <input type="text" class="form-control" name="prenom" id="prenom" placeholder=spring:message code="stagiaire.form.prenom.placeholder" /> value="" required>
                            </div>
                            <div class="form-group">
                                <label for="arrival"><spring:message code="stagiaire.form.dateArrivee" /></label>
                                <input type="date" class="form-control" name="dateArrivee" id="dateArrivee" value="" required>
                            </div>
                            <div class="form-group">
                                <label for="finFormation"><spring:message code="stagiaire.form.dateDepart" /></label>
                                <input type="date" class="form-control" name="dateDepart" id="dateDepart" value="" required>
                            </div>
                            <div class="form-group">
                                <label for="promotionId"><spring:message code="stagiaire.form.promotion" /></label>
                                <select class="form-control" name="promotionId" id="promotionId" required>
                                    <option value="0">--</option>
                                    <c:forEach var="promotion" items="${promotions}">
                                        <option value="${promotion.id()}">${promotion.nom()}</option>
                                    </c:forEach>
                                </select>
                            </div>                  
                        </fieldset>
                        <div class="actions pull-right">
                            <input type="submit" value=<spring:message code="valider" /> class="btn btn-primary">
                            <spring:message code="ou" />
                            <a href="dashboard" class="btn btn-default"><spring:message code="annuler" /></a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>