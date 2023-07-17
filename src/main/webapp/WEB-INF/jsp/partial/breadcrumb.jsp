<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="hk-breadcrumb" aria-label="breadcrumb">
	<ol class="breadcrumb breadcrumb-light bg-transparent">
	<c:if test="${not empty title.getTitle1()}">
		<li class="breadcrumb-item">
			<a href="${pageContext.request.contextPath}/${title.getLink1()}">${title.getTitle1()}</a>
		</li>
	</c:if>

	<c:if test="${not empty title.getTitle2()}">
	<li class="breadcrumb-item">
    			<a href="${pageContext.request.contextPath}/${title.getLink2()}">${title.getTitle2()}</a>
    		</li>
	</c:if>

    <c:if test="${not empty title.getTitle3()}">
    <li class="breadcrumb-item">
    			<a href="${pageContext.request.contextPath}/${title.getLink3()}">${title.getTitle3()}</a>
    		</li>
    </c:if>

    <c:if test="${not empty title.getTitle4()}">
    <li class="breadcrumb-item">
    			<a href="${pageContext.request.contextPath}/${title.getLink4()}">${title.getTitle4()}</a>
    		</li>
    </c:if>

    <c:if test="${not empty title.getTitle5()}">
    <li class="breadcrumb-item">
    			<a href="${pageContext.request.contextPath}/${title.getLink5()}">${title.getTitle5()}</a>
    		</li>
    </c:if>
	</ol>
</nav>
