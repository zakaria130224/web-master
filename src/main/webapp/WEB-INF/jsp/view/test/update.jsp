<c:if test="${sideMenu.size() > 0}">
    <c:forEach var="item" items="${sideMenu}">

        <!--No Child-->
        <c:if test="${item.child.size() == 0}">

            <c:choose>
                <c:when test="${item.hasLink == true}">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/${item.menuUrl}">
                            <i class="${item.iconClass}"></i>
                            <span class="nav-link-text">${item.name}</span>
                        </a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="${item.iconClass}"></i>
                            <span class="nav-link-text">${item.name}</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:if>
        <!--No Child-->
        <!--First Childes-->
        <c:if test="${item.child.size() > 0}">
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" data-target="#${item.id}">
                    <i class="${item.iconClass}"></i>
                    <span class="nav-link-text">${item.name}</span>
                </a>
                <ul id="${item.id}" class="nav flex-column collapse collapse-level-1">
                    <li class="nav-item">
                        <ul class="nav flex-column">
                            <c:forEach var="child1" items="${item.child}">

                                <!--No Child-->
                                <c:if test="${child1.size() == 0}">

                                    <c:choose>
                                        <c:when test="${child1.hasLink == true}">
                                            <li class="nav-item">
                                                <a class="nav-link"
                                                   href="${pageContext.request.contextPath}/${child1.menuUrl}">
                                                    <i class="${child1.iconClass}"></i>
                                                    <span class="nav-link-text">${child1.name}</span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="nav-item">
                                                <a class="nav-link" href="#">
                                                    <i class="${child1.iconClass}"></i>
                                                    <span class="nav-link-text">${child1.name}</span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>
                                <!--No Child-->
                            </c:forEach>
                        </ul>
                    </li>
                </ul>
            </li>
        </c:if>
        <!--First Childes-->
    </c:forEach>
</c:if>

<c:if test="${sideMenu.size() > 0}">
    <c:forEach var="item" items="${sideMenu}">
        <c:if test="${item.child.size() == 0}">
            <li class="nav-item dropdown">
                <c:choose>
                    <c:when test="${item.hasLink == true}">
                        <a class="nav-link dropdown-toggle py-0" href="javascript:void(0);">
                                      <span class="icon-holder">
                                        <i class="${item.iconClass}"></i>
                                      </span>
                            <span class="title">${item.name}</span>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav-link dropdown-toggle py-0"
                                <c:choose>
                                    <c:when test="${item.parent ==true}">
                                        href="javascript:void(0);">
                                    </c:when>
                                    <c:otherwise>
                                        href="${pageContext.request.contextPath}/${item.menuUrl}">
                                    </c:otherwise>
                                </c:choose>
                        <span class="icon-holder">
                                        <i class="${item.iconClass}"></i>
                                      </span>
                        <span class="title">${parentItems.NAME}</span>
                            <c:if test="${parentItems.IS_PARENT > 0}">
                                            <span class="arrow">
                                                <i class="fas fa-angle-right"></i>
                                            </span>
                            </c:if>
                        </a>
                    </c:otherwise>
                </c:choose>
            </li>
        </c:if>
    </c:forEach>
</c:if>
</ul>

</div>
</div>
</nav>
