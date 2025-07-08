<%@ tag description="Contruit l'url à multiple paramètres du dashboard" pageEncoding="UTF-8"%>

<%@ attribute name="search" required="false" rtexprValue="true" %>
<%@ attribute name="sortBy" required="false" rtexprValue="true" %>
<%@ attribute name="currentPage" required="false" rtexprValue="true" %>
<%@ attribute name="pageSize" required="false" rtexprValue="true" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url value="${pageContext.request.contextPath}/dashboard" var="dashboardUrl">
    <c:if test="${not empty search}">
        <c:param name="search" value="${search}" />
    </c:if>
    <c:if test="${not empty sortBy}">
        <c:param name="sortBy" value="${sortBy}" />
    </c:if>
    <c:if test="${not empty currentPage}">
        <c:param name="currentPage" value="${currentPage}" />
    </c:if>
    <c:if test="${not empty pageSize}">
        <c:param name="pageSize" value="${pageSize}" />
    </c:if>
</c:url>