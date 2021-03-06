<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sec:authentication var="authCdn" property="cdn"/>
<sec:authentication var="authCdnUrl" property="cdnUrl"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<c:set value="${true}" var="isUpdating" />
	<c:if test="${empty pullout.uuid}">
		<c:set value="${false}" var="isUpdating" />
	</c:if>
	
	<c:choose>
	<c:when test="${isUpdating}">
	<title>${pullout.material.name} | Edit Pull-Out</title>
	</c:when>
	<c:when test="${!isUpdating}">
	<title>Create New Pull-Out</title>
	</c:when>
	</c:choose>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<c:if test="${authCdn}">
		<link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.4.3/jquery.datetimepicker.min.css" rel="stylesheet" type="text/css" />
	</c:if>
	<c:if test="${!authCdn}">
	   	<link href="<c:url value="/resources/lib/datetimepicker/jquery.datetimepicker.css" />"rel="stylesheet" type="text/css" />
	</c:if>
	<style>
	  ul {         
	      padding:0 0 0 0;
	      margin:0 0 0 0;
	  }
	  ul li {     
	      list-style:none;
	      margin-bottom:25px;           
	  }
	  ul li img {
	      cursor: pointer;
	  }
	</style>
</head>
<body class="skin-blue">
	<c:import url="/resources/header.jsp" />
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!--  -->
		<aside class="right-side">
		<!-- Content Header (Page header) -->
	        <section class="content-header">
	            <c:choose>
				<c:when test="${isUpdating}">
	            <h1>
	            	${pullout.material.name}
		            <small>Edit Pull-Out</small>
	            </h1>
				</c:when>

				<c:when test="${!isUpdating}">
				<h1>
	            	${pullout.material.name}
		            <small>Create Pull-Out</small>
	            </h1>
				</c:when>
				</c:choose>
	        </section>
	        <section class="content">
                <div class="row">
                    <div class="col-md-12">
                    	<c:url var="urlBack" value="/project/edit/${pullout.project.id}" />
	                    <a href="${urlBack}">
							<button class="btn btn-cebedo-back btn-flat btn-sm">Back to Project</button>
						</a><br/><br/>
                    	${uiParamAlert}
                        <!-- Custom Tabs -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_1" data-toggle="tab">Details</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                	<div class="row">
                   						<div class="col-md-6">
                   							<div class="box box-body box-default">
                   								<div class="box-body">
									                <c:if test="${!empty staffList}">
									                <table class="table table-bordered table-striped">
									                <tr>
									                	<td><label>Delivery</label></td>
									                	<td>
									                	<c:url var="urlLink" value="/project/edit/delivery/${pullout.delivery.getKey()}-end"/>
									                	<a class="general-link" href="${urlLink}">
									                	${pullout.delivery.name}
									                	</a>
									                	<fmt:formatDate pattern="yyyy/MM/dd hh:mm a" value="${pullout.delivery.datetime}" var="deliveryDateTime"/>
									                	(${deliveryDateTime})
									                	</td>
									                </tr>
									                <tr>
									                	<td><label>Material Category</label></td>
									                	<td>${pullout.material.materialCategory.getLabel()}</td>
									                </tr>
									                <tr>
									                	<td><label>Specific Name</label></td>
									                	<td>
									                		<c:url var="urlLink" value="/project/edit/material/${pullout.material.getKey()}-end"/>
						                                    <a href="${urlLink}" class="general-link">
									                		${pullout.material.name}
						                                    </a>
									                	</td>
									                </tr>
									                <tr>
									                	<td><label>Available</label></td>
									                	<td>${pullout.material.available}</td>
									                </tr>
									                <tr>
									                	<td><label>Units</label></td>
									                	<td>${pullout.material.getUnitName()}</td>
									                </tr>
									                </table>
									                <br/>
									                
													<c:set value="${contextPath}/project/do-pullout/material" var="formURL" />

				                                    <c:choose>
													<c:when test="${isUpdating}">
													<form:form modelAttribute="pullout"
														id="pulloutForm"
														method="post"
														action="${formURL}">
				                                        <div class="form-group">
				                                            <label>Quantity</label><br/>
				                                            <fmt:formatNumber type="number" pattern="###,##0.0###" value="${pullout.quantity}" />
				                                            <p class="help-block">The number of units that was pulled-out</p>

				                                            <label>Staff</label><br/>
				                                            ${pullout.staff.getFullName()}
	 		                                    			<p class="help-block">The staff who pulled-out the material</p>

				                                            <label>Date and Time</label><br/>
	 		                                    			<fmt:formatDate pattern="yyyy/MM/dd hh:mm a" value="${pullout.datetime}" var="pulloutDateTime"/>
				                                            ${pulloutDateTime}
				                                            <p class="help-block">Date and time of the pull-out</p>

				                                            <label>Remarks</label><br/>
				                                            ${pullout.remarks}
				                                            <p class="help-block">Additional remarks</p>
				                                        </div>
				                                    </form:form>
				                                    
				                                    <sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_DELETE')">
				                                    <div class="btn-group">
				                                    <button type="button" class="btn btn-cebedo-delete btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">Delete</button>
				                                    <ul class="dropdown-menu">
				                                    	<li>
	            											<c:url value="/project/delete/pullout/${pullout.getKey()}-end" var="urlDelete"/>
	            		                                    <a href="${urlDelete}" class="cebedo-dropdown-hover">
				                                        		Confirm Delete
				                                        	</a>
				                                    	</li>
				                                    </ul>
				                                    </div>
				                                    </sec:authorize>

													</c:when>

													<c:when test="${!isUpdating}">

													<form:form modelAttribute="pullout"
														id="pulloutForm"
														method="post"
														action="${formURL}">
				                                        <div class="form-group">
				                                            <label>Quantity</label>
				                                            <form:input type="text" class="form-control" path="quantity"/>
				                                            <p class="help-block">Enter the number of units that was pulled-out</p>
				                                            <label>Staff</label>
				                                            <form:select class="form-control" path="staffID"> 
	                                     						<c:forEach items="${staffList}" var="staff"> 
	                                     							<form:option value="${staff.id}" label="${staff.getFullName()}"/> 
	                                     						</c:forEach> 
	 		                                    			</form:select>
	 		                                    			<p class="help-block">Choose the staff who pulled-out the material</p>

	 		                                    			<fmt:formatDate pattern="yyyy/MM/dd hh:mm a" value="${pullout.datetime}" var="pulloutDateTime"/>
				                                            <label>Date and Time</label>
				                                            <form:input type="text" placeholder="Sample: 2015/06/24 08:15" class="form-control" id="date-picker" path="datetime" value="${pulloutDateTime}"/>
				                                            <p class="help-block">Choose the date and time of the pull-out</p>
				                                            <label>Remarks</label>
				                                            <form:input type="text" placeholder="Sample: The pull-out was delayed due to rain." class="form-control" path="remarks"/>
				                                            <p class="help-block">Add additional remarks</p>
				                                        </div>
				                                    </form:form>

                                            		<button onclick="submitForm('pulloutForm')" class="btn btn-cebedo-create btn-flat btn-sm" id="detailsButton">Create</button>
													</c:when>
													</c:choose>
                                            		</c:if>
                   								</div>
                   							</div>
                   						</div>
              						</div>
                                </div><!-- /.tab-pane -->
                            </div><!-- /.tab-content -->
                        </div><!-- nav-tabs-custom -->
                    </div><!-- /.col -->
                </div> <!-- /.row -->
            </section><!-- /.content -->
        </aside>
	</div>
</body>
<c:if test="${authCdn}">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.4.3/jquery.datetimepicker.min.js" type="text/javascript"></script>
</c:if>
<c:if test="${!authCdn}">
	<script src="${contextPath}/resources/lib/datetimepicker/jquery.datetimepicker.js" type="text/javascript"></script>
</c:if>
<script>
$(function () {
	$('#date-picker').datetimepicker();
});
function submitForm(id) {
	$('#'+id).submit();
}
</script>
</html>