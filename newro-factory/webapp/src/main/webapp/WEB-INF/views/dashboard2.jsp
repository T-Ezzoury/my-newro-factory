

<%
  // Formatter pour les LocalDate
  pageContext.setAttribute(
    "dateFormat",
    java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy"));
%>



<%-- Calcul des pages précédentes / suivantes --%>
<c:choose>
  <c:when test="${currentPage > 1}">
    <c:set var="prevPage" value="${currentPage - 1}"/>
  </c:when>
  <c:otherwise>
    <c:set var="prevPage" value="1"/>
  </c:otherwise>
</c:choose>
<c:choose>
  <c:when test="${currentPage < totalPages}">
    <c:set var="nextPage" value="${currentPage + 1}"/>
  </c:when>
  <c:otherwise>
    <c:set var="nextPage" value="${totalPages}"/>
  </c:otherwise>
</c:choose>

<%-- Query-string pour “Précédent” --%>
<c:set var="prevQuery" value="?currentPage=${prevPage}"/>
<c:if test="${not empty pageSize}">
  <c:set var="prevQuery" value="${prevQuery}&amp;pageSize=${pageSize}"/>
</c:if>
<c:if test="${not empty sortBy}">
  <c:set var="prevQuery" value="${prevQuery}&amp;sortBy=${sortBy}"/>
</c:if>
<c:if test="${not empty param.search}">
  <c:set var="prevQuery"
         value="${prevQuery}&amp;search=${fn:escapeXml(param.search)}"/>
</c:if>

<%-- Query-string pour “Tri par nom” --%>
<c:set var="sortLastnameQuery" value="?currentPage=${currentPage}"/>
<c:if test="${not empty pageSize}">
  <c:set var="sortLastnameQuery"
         value="${sortLastnameQuery}&amp;pageSize=${pageSize}"/>
</c:if>
<c:set var="sortLastnameQuery"
       value="${sortLastnameQuery}&amp;sortBy=lastname"/>
<c:if test="${not empty param.search}">
  <c:set var="sortLastnameQuery"
         value="${sortLastnameQuery}&amp;search=${fn:escapeXml(param.search)}"/>
</c:if>

<%-- Query-string pour “Suivant” --%>
<c:set var="nextQuery" value="?currentPage=${nextPage}"/>
<c:if test="${not empty pageSize}">
  <c:set var="nextQuery" value="${nextQuery}&amp;pageSize=${pageSize}"/>
</c:if>
<c:if test="${not empty sortBy}">
  <c:set var="nextQuery" value="${nextQuery}&amp;sortBy=${sortBy}"/>
</c:if>
<c:if test="${not empty param.search}">
  <c:set var="nextQuery"
         value="${nextQuery}&amp;search=${fn:escapeXml(param.search)}"/>
</c:if>

<!DOCTYPE html>
<html>

<body>


  <section id="main" class="container" style="margin-top:70px;">
    
   
    <table class="table table-striped table-bordered" style="margin-top:10px;">
      <thead>
        <tr>
          <th class="editMode" style="width:60px">
            <input type="checkbox" id="selectall"/>
            <a href="#" class="text-danger" onclick="$.fn.deleteSelected()">
              <i class="fa fa-trash-o fa-lg"></i>
            </a>
          </th>
          <th>
            <a href="${dashboardUrl}${sortLastnameQuery}">
              Stagiaire
            </a>
          </th>
          <th>Date d'arrivée</th>
          <th>Date de fin</th>
          <th>Promotion</th>
        </tr>
      </thead>
      <tbody id="results">
        <c:forEach var="stagiaire" items="${stagiaires}">
          <tr>
            <td class="editMode">
              <input type="checkbox"
                     name="selection"
                     value="${stagiaire.id}"
                     class="cb"/>
            </td>
            <td>
              <a href="editStagiaire?id=${stagiaire.id}">
                ${stagiaire.nom} ${stagiaire.prenom}
              </a>
            </td>
            <td>
              <c:choose>
                <c:when test="${empty stagiaire.dateArrivee}">-</c:when>
                <c:otherwise>
                  ${stagiaire.dateArrivee.format(dateFormat)}
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <c:choose>
                <c:when test="${empty stagiaire.dateDepart}">-</c:when>
                <c:otherwise>
                  ${stagiaire.dateDepart.format(dateFormat)}
                </c:otherwise>
              </c:choose>
            </td>
            <td>${stagiaire.promotion.nom}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <c:if test="${not empty error}">
      <div class="alert alert-danger">
        <strong>Erreur !</strong> ${error}
      </div>
    </c:if>
  </section>

  <footer class="navbar-fixed-bottom container">
    <ul class="pagination">

      <%-- Précédent --%>
      <c:choose>
        <c:when test="${currentPage == 1}">
          <li class="disabled"><span>&laquo;</span></li>
        </c:when>
        <c:otherwise>
          <li><a href="${dashboardUrl}${prevQuery}">&laquo;</a></li>
        </c:otherwise>
      </c:choose>

      <%-- Pages --%>
      <c:choose>
        <%-- Si ≤ 10 pages : afficher toutes --%>
        <c:when test="${totalPages <= 10}">
          <c:forEach var="i" begin="1" end="${totalPages}">
            <c:set var="pageQuery" value="?currentPage=${i}"/>
            <c:if test="${not empty pageSize}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;pageSize=${pageSize}"/>
            </c:if>
            <c:if test="${not empty sortBy}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;sortBy=${sortBy}"/>
            </c:if>
            <c:if test="${not empty param.search}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;search=${fn:escapeXml(param.search)}"/>
            </c:if>
            <c:set var="link" value="${dashboardUrl}${pageQuery}"/>

            <c:choose>
              <c:when test="${i == currentPage}">
                <li class="active"><a href="${link}">${i}</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="${link}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </c:when>

        <%-- Sinon : 5 premières, “…”, 5 dernières --%>
        <c:otherwise>
          <c:forEach var="i" begin="1" end="5">
            <c:set var="pageQuery" value="?currentPage=${i}"/>
            <c:if test="${not empty pageSize}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;pageSize=${pageSize}"/>
            </c:if>
            <c:if test="${not empty sortBy}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;sortBy=${sortBy}"/>
            </c:if>
            <c:if test="${not empty param.search}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;search=${fn:escapeXml(param.search)}"/>
            </c:if>
            <c:set var="link" value="${dashboardUrl}${pageQuery}"/>

            <c:choose>
              <c:when test="${i == currentPage}">
                <li class="active"><a href="${link}">${i}</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="${link}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>

          <li class="disabled"><span>…</span></li>

          <c:set var="start" value="${totalPages - 4}"/>
          <c:forEach var="i" begin="${start}" end="${totalPages}">
            <c:set var="pageQuery" value="?currentPage=${i}"/>
            <c:if test="${not empty pageSize}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;pageSize=${pageSize}"/>
            </c:if>
            <c:if test="${not empty sortBy}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;sortBy=${sortBy}"/>
            </c:if>
            <c:if test="${not empty param.search}">
              <c:set var="pageQuery"
                     value="${pageQuery}&amp;search=${fn:escapeXml(param.search)}"/>
            </c:if>
            <c:set var="link" value="${dashboardUrl}${pageQuery}"/>

            <c:choose>
              <c:when test="${i == currentPage}">
                <li class="active"><a href="${link}">${i}</a></li>
              </c:when>
              <c:otherwise>
                <li><a href="${link}">${i}</a></li>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </c:otherwise>
      </c:choose>

      <%-- Suivant --%>
      <c:choose>
        <c:when test="${currentPage == totalPages}">
          <li class="disabled"><span>&raquo;</span></li>
        </c:when>
        <c:otherwise>
          <li><a href="${dashboardUrl}${nextQuery}">&raquo;</a></li>
        </c:otherwise>
      </c:choose>
    </ul>

    <%-- Boutons pageSize --%>
    <div class="btn-group btn-group-sm pull-right">
      <c:forEach var="size" items="${[10,50,100]}">
        <c:set var="sizeQuery"
               value="?pageSize=${size}&amp;currentPage=${currentPage}"/>
        <c:if test="${not empty sortBy}">
          <c:set var="sizeQuery"
                 value="${sizeQuery}&amp;sortBy=${sortBy}"/>
        </c:if>
        <c:if test="${not empty param.search}">
          <c:set var="sizeQuery"
                 value="${sizeQuery}&amp;search=${fn:escapeXml(param.search)}"/>
        </c:if>
        <c:choose>
          <c:when test="${pageSize == size}">
            <c:set var="btnClass" value="btn btn-default active"/>
          </c:when>
          <c:otherwise>
            <c:set var="btnClass" value="btn btn-default"/>
          </c:otherwise>
        </c:choose>
        <button type="button"
                class="${btnClass}"
                onclick="window.location='${dashboardUrl}${sizeQuery}'">
          ${size}
        </button>
      </c:forEach>
    </div>
  </footer>


</body>
</html>
