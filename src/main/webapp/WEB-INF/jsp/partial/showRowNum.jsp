<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <div class="row" style="margin-bottom: 10px;">
                                <div class="col-auto mr-auto">
                                </div>
                                <div class="col-auto">
                                    <ul class="pagination">
                                        <li class="inline-lable">Show</li>
                                        <li class="page-item">
                                            <select class=" " name="perPage" id="perPage">
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="15">15</option>
                                                <option value="20">20</option>
                                                <option value="25">25</option>
                                            </select>
                                        </li>
                                        <li class="inline-lable"> entries &nbsp;</li>
                                    </ul>
                                </div>
                            </div>