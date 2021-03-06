<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>List Staff</title>
</head>
<body class="skin-blue">
	<c:import url="/resources/header.jsp" />
	<div class="wrapper row-offcanvas row-offcanvas-left">
		<!--  -->
		<aside class="right-side">
			<section class="content-header">
	            <h1>
	                List Staff
	                <small>Complete list of all staff members</small>
	            </h1>
	        </section>
	         <section class="content">
                <div class="row">
                    <div class="col-md-12">
                    	${uiParamAlert}
                        <!-- Custom Tabs -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_list" data-toggle="tab">List</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_list">
                                	<div class="row">
					                    <div class="col-md-12">
					                        <div class="box">
					                                <div class="box-header">
					<!--                                     <h3 class="box-title">Data Table With Full Features</h3> -->
					                                </div><!-- /.box-header -->
					                                <div class="box-body">
					                                	
					                                	<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_CREATE')">
					                                	<c:url var="urlCreateStaff" value="/staff/edit/0"/>
					                                	<a href="${urlCreateStaff}">
					                                		<button class="btn btn-cebedo-create btn-flat btn-sm">Create Staff</button>
					                                	</a>
					                                	<br/><br/>
					                                	</sec:authorize>
					                                	
					                                    <table id="example-1" class="table table-bordered table-striped">
					                                        <thead>
					                                            <tr>
																	<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_UPDATE', 'STAFF_DELETE')">
					                                            	<th>&nbsp;</th>
					                                            	</sec:authorize>
					                                            	
					                                                <th>Full Name</th>
					                                                <sec:authorize access="hasAnyRole('ADMIN_COMPANY')">
					                                                <th>User Account</th>
					                                                </sec:authorize>
					                                                <sec:authorize access="hasRole('ADMIN_SUPER')">
					                                                <th>Company</th>
					                                                </sec:authorize>
					                                                <th>Company Position</th>
					                                                <th>Salary (&#8369; Daily)</th>
					                                                <th>E-Mail</th>
					                                                <th>Contact Number</th>
					                                            </tr>
					                                        </thead>
					                                        <tbody>
					                                        	<c:if test="${!empty staffList}">
					                                        		<c:forEach items="${staffList}" var="staff">
							                                            <tr>
																			<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_UPDATE', 'STAFF_DELETE')">
							                                            	<td>
							                                            		<center>
																					<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_UPDATE')">
							                                            			<c:url var="urlEditStaff" value="/staff/edit/${staff.id}"/>
																					<a href="${urlEditStaff}">
																						<button class="btn btn-cebedo-view btn-flat btn-sm">View</button>
																					</a>
																					</sec:authorize>
																					
																					<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_DELETE')">
																					<div class="btn-group">
																					<button type="button" class="btn btn-cebedo-delete btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">Delete</button>
																					<ul class="dropdown-menu">
																						<li>
																					    	<c:url var="urlDeleteStaff" value="/staff/delete/${staff.id}"/>
																							<a href="${urlDeleteStaff}" class="cebedo-dropdown-hover">
																					    		Confirm Delete
																					    	</a>
																						</li>
																					</ul>
																					</div>
																					</sec:authorize>

																				</center>
																			</td>
																			</sec:authorize>
																			
							                                                <td>${staff.getFullName()}</td>
						                                                	<sec:authorize access="hasAnyRole('ADMIN_COMPANY')">
							                                                <td>
																				<a href="<c:url value="/systemuser/edit/${staff.user.id}"/>" class="general-link">
							                                                	${staff.user.username}
																				</a>
							                                                </td>
																			</sec:authorize>
																			<sec:authorize access="hasRole('ADMIN_SUPER')">
							                                                <td>(${staff.company == null ? "No Company" : staff.company.id}) ${staff.company.name}</td>
							                                                </sec:authorize>
							                                                <td>${staff.companyPosition}</td>
							                                                <td style="text-align: right;">${staff.wage}</td>
							                                                <td>${staff.email}</td>
							                                                <td>${staff.getContactNumberAsString()}</td>
							                                            </tr>
						                                            </c:forEach>
					                                            </c:if>
					                                        </tbody>
					                                        <tfoot>
					                                            <tr>
					                                            	<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'STAFF_UPDATE', 'STAFF_DELETE')">
					                                            	<th>&nbsp;</th>
					                                            	</sec:authorize>
					                                            	
					                                                <th>Full Name</th>
					                                                <sec:authorize access="hasAnyRole('ADMIN_COMPANY')">
					                                                <th>User Account</th>
					                                                </sec:authorize>
					                                                <sec:authorize access="hasRole('ADMIN_SUPER')">
					                                                <th>Company</th>
					                                                </sec:authorize>
					                                                <th>Company Position</th>
					                                                <th>Salary (&#8369; Daily)</th>
					                                                <th>E-Mail</th>
					                                                <th>Contact Number</th>
					                                            </tr>
					                                        </tfoot>
					                                    </table>
					                                </div><!-- /.box-body -->
					                            </div><!-- /.box -->
					                    </div>
                                	</div>
                               	</div>
                            </div>
                         </div>
                     </div>
                 </div>
              </section>
        </aside>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#example-1").DataTable({
		        "order": [[ 1, "asc" ]]
		    });
		});
	</script>
</body>
</html>