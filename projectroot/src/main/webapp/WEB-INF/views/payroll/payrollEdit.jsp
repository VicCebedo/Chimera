<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<c:choose>
   	<c:when test="${!projectPayroll.saved}">
    	<title>Payroll Create</title>
   	</c:when>
   	<c:when test="${projectPayroll.saved}">
		<title>Payroll Edit</title>
   	</c:when>
   	</c:choose>
	
	<!-- Ignite UI Required Combined CSS Files -->
	<link href="<c:url value="/resources/lib/igniteui/infragistics.theme.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="/resources/lib/igniteui/infragistics.css" />"rel="stylesheet" type="text/css" />
	<link href="<c:url value="/resources/lib/igniteui/infragistics.ui.treegrid.css" />"rel="stylesheet" type="text/css" />
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
		<c:import url="/resources/sidebar.jsp" />
		<aside class="right-side">
		<!-- Content Header (Page header) -->
	        <section class="content-header">
	            <h1>
	            	<c:choose>
	            	<c:when test="${!projectPayroll.saved}">
		            	New Payroll
		                <small>Create Payroll</small>
	            	</c:when>
	            	<c:when test="${projectPayroll.saved}">
	            		<fmt:formatDate pattern="yyyy/MM/dd" value="${projectPayroll.startDate}" var="startDate"/>
	            		<fmt:formatDate pattern="yyyy/MM/dd" value="${projectPayroll.endDate}" var="endDate"/>
		            	${startDate} to ${endDate}
		                <small>Edit Payroll</small>
	            	</c:when>
	            	</c:choose>
	            </h1>
	        </section>
	        <section class="content">
                <div class="row">
                    <div class="col-xs-12">
                        <c:url var="urlBack" value="/project/edit/${projectPayroll.projectID}" />
	                    <a href="${urlBack}">
							<button class="btn btn-default btn-flat btn-sm">Back to Project</button>
						</a><br/><br/>
                        <!-- Custom Tabs -->
                        <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab_1" data-toggle="tab">Details</a></li>
                                <c:if test="${!empty projectStructManagers && !empty projectPayroll.staffIDs && !empty payrollJSON}">
                                <li><a href="#tab_computation" data-toggle="tab">Computation</a></li>
                                </c:if>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                	<div class="row">
                   						<div class="col-md-6">
                   							<div class="box box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Details</h3>
                   								</div>
                   								<div class="box-body">
                   									<c:choose>
                   									<c:when  test="${empty payrollApproverOptions}">
                   									<i>Cannot create Payroll without a Project Manager.<br/>
                   									Only assigned Project Managers are allowed to approve or reject a Payroll.</i>
                   									</c:when>
                   									<c:when  test="${!empty payrollApproverOptions}">
                   									<form:form modelAttribute="projectPayroll"
														id="detailsForm"
														method="post"
														action="${contextPath}/project/create/payroll">
				                                        <div class="form-group">
				                                        
				                                        	<!-- List of all staff as Project Manager -->
				                                            <label>Approver</label>
				                                            <form:select class="form-control" path="approverID">
				                                            	<c:forEach items="${payrollApproverOptions}" var="manager">
				                                            	<form:option class="form-control" value="${manager.user.id}" label="${manager.getFullName()}"/>
				                                            	</c:forEach>
				                                            </form:select>
				                                            <br/>
				                                            
				                                            <!-- List of all in PayrollStatus enum -->
				                                            <label>Status</label>
				                                            <form:select class="form-control" path="statusID">
				                                            	<c:forEach items="${payrollStatusArr}" var="payrollStatus">
				                                            	<form:option class="form-control" value="${payrollStatus.id()}" label="${payrollStatus.label()}"/>
				                                            	</c:forEach>
				                                            </form:select>
				                                            <br/>
				                                            
				                                            <!-- Date pickers -->
				                                            <label>Start Date</label>
				                                            <form:input type="text" class="form-control date-picker" path="startDate" value="${startDate}"/><br/>
				                                            <label>End Date</label>
				                                            <form:input type="text" class="form-control date-picker" path="endDate" value="${endDate}"/>
				                                        </div>
				                                        <c:if test="${projectPayroll.saved}">
	                                            		<button class="btn btn-default btn-flat btn-sm" id="detailsButton">Update</button>
				                                        </c:if>
				                                        <c:if test="${!projectPayroll.saved}">
	                                            		<button class="btn btn-default btn-flat btn-sm" id="detailsButton">Create</button>
				                                        </c:if>
				                                    </form:form>
				                                    </c:when>
                   									</c:choose>
                   								</div>
                   							</div>
                   							<c:if test="${projectPayroll.saved}">
                   							<div class="box box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Include to Payroll</h3>
                   								</div>
                   								<div class="box-body">
                   									<p><i>This feature should only be used when adding Team/Staff members that were not automatically added to the checklist.</i></p>
			                                        <table>
                   									<form:form modelAttribute="payrollIncludeTeam"
														id="detailsForm"
														method="post"
														action="${contextPath}/project/payroll/include/team">
				                                        	<tr>
				                                        	<td><label>Teams</label></td>
				                                        	<td>&nbsp;</td>
				                                        	<td style="width: 100%">
				                                            <form:select class="form-control" path="teamID">
				                                            	<c:forEach items="${manualTeamList}" var="team">
				                                            	<form:option class="form-control" value="${team.id}" label="${team.name}"/>
				                                            	</c:forEach>
				                                            </form:select>
				                                        	</td>
				                                        	<td>&nbsp;</td>
				                                        	<td>
				                                        	<button class="btn btn-default btn-flat btn-sm" id="detailsButton">Include</button>
				                                        	</td>
				                                        	</tr>
				                                    </form:form>
				                                    <tr>
			                                        	<td>&nbsp;</td>
			                                        	<td>&nbsp;</td>
			                                        	<td>&nbsp;</td>
			                                        	<td>&nbsp;</td>
			                                        	<td>&nbsp;</td>
		                                        	</tr>
				                                    <form:form modelAttribute="projectPayroll"
														id="detailsForm"
														method="post"
														action="${contextPath}/project/create/payroll">
				                                        	<tr>
				                                        	<td><label>Staff</label></td>
				                                        	<td>&nbsp;</td>
				                                        	<td style="width: 100%">
				                                            <form:select class="form-control" path="statusID">
				                                            	<c:forEach items="${manualStaffList}" var="staff">
				                                            	<form:option class="form-control" value="${staff.id}" label="${staff.getFullName()}"/>
				                                            	</c:forEach>
				                                            </form:select>
				                                        	</td>
				                                        	<td>&nbsp;</td>
				                                        	<td>
				                                        	<button class="btn btn-default btn-flat btn-sm" id="detailsButton">Include</button>
				                                        	</td>
				                                        	</tr>
				                                    </form:form>
			                                        </table>
                   								</div>
                   							</div>
                   							</c:if>
                   						</div>
                   						<c:if test="${projectPayroll.saved}">
                   						<div class="col-md-6">
                   							<div class="box box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Payroll Checklist</h3>
                   								</div>  
                   								<div class="box-body">
                   									<label>All</label>&nbsp;
													<a href="#" onclick="checkAll('include-checkbox')" class="general-link">Check All</a>&nbsp;
													<a href="#" onclick="uncheckAll('include-checkbox')" class="general-link">Uncheck All</a>
													<br/>
													<br/>
													<c:set value="" var="alreadyRendered"/>
                   									<form:form modelAttribute="projectPayroll"
														id="checkboxesForm"
														method="post"
														action="${contextPath}/project/create/payroll/clear/computation">
				                                        <div class="form-group">



															<label>Managers</label>&nbsp;
															<a href="#" onclick="checkAll('manager-checkboxes')" class="general-link">Check All</a>&nbsp;
															<a href="#" onclick="uncheckAll('manager-checkboxes')" class="general-link">Uncheck All</a>
															<br/>
															<c:choose>
															<c:when test="${empty projectStructManagers}">
															<i>No manager assigned.</i><br/><br/>
															</c:when>
															<c:when test="${!empty projectStructManagers}">
			                                            	<table class="table table-bordered table-striped">
															<thead>
					                                    		<tr>
						                                            <th>Add</th>
						                                            <th>Manager</th>
						                                        </tr>
					                                    	</thead>
															<tbody>
															<c:forEach items="${projectStructManagers}" var="manager">
																<tr>
																	<td align="center">
																		<c:if test="${!fn:contains(alreadyRendered, manager.id)}">
																		<c:set value="${alreadyRendered}-${manager.id}-" var="alreadyRendered"/>
								                                		<form:checkbox class="form-control include-checkbox manager-checkboxes" 
								                                			path="staffIDs" 
								                                			value="${manager.id}"
								                                			/>
																		</c:if>
																	</td>
																	<td>
																		<c:url value="/staff/edit/${manager.id}/from/project/${projectPayroll.projectID}" var="staffLink"/>
																		<a href="${staffLink}" class="general-link">
																		${manager.getFullName()}
																		</a>
																	</td>
																</tr>
															</c:forEach>
															</tbody>
															</table><br/>
															</c:when>
															</c:choose>
															
															
															
															<label>Teams</label>&nbsp;
															<a href="#" onclick="checkAll('team-checkboxes')" class="general-link">Check All</a>&nbsp;
															<a href="#" onclick="uncheckAll('team-checkboxes')" class="general-link">Uncheck All</a>
															<br/>
															<c:choose>
															<c:when test="${empty projectStructTeams}">
															<i>No team assigned.</i><br/><br/>
															</c:when>
															<c:when test="${!empty projectStructTeams}">
			                                            	<table class="table table-bordered table-striped">
															<thead>
					                                    		<tr>
						                                            <th>Add</th>
						                                            <th>Team</th>
						                                            <th>Payroll Type</th>
						                                            <th>Staff</th>
						                                        </tr>
					                                    	</thead>
															<tbody>
															<c:forEach items="${projectStructTeams}" var="teamStaffMap">
																<c:set value="${teamStaffMap.key}" var="team"/>
						                                		<c:set value="${teamStaffMap.value}" var="staffList"/>
						                                		<c:if test="${!empty staffList}">
						                                		<c:forEach items="${staffList}" var="teamMember">
																<tr>
																	<td align="center">
																		<c:if test="${!fn:contains(alreadyRendered, teamMember.id)}">
																		<c:set value="${alreadyRendered}-${teamMember.id}-" var="alreadyRendered"/>
								                                		<form:checkbox class="form-control include-checkbox team-checkboxes" 
								                                			path="staffIDs" 
								                                			value="${teamMember.id}"
								                                			/>
																		</c:if>
																	</td>
																	<td>
																		<c:url value="/team/edit/${team.id}" var="urlTeamLink"/>
																		<a href="${urlTeamLink}" class="general-link">
																		${team.name}
																		</a>
																	</td>
																	<td>
																		${team.getPayrollTypeEnum().label()}
																	</td>
																	<td>
																		<c:url value="/staff/edit/${teamMember.id}/from/project/${projectPayroll.projectID}" var="staffLink"/>
																		<a href="${staffLink}" class="general-link">
																		${teamMember.getFullName()}
																		</a>
																	</td>
																</tr>
						                                		</c:forEach>
						                                		</c:if>
															</c:forEach>
															</tbody>
															</table><br/>
															</c:when>
															</c:choose>
															


															<label>Tasks</label>&nbsp;
															<a href="#" onclick="checkAll('task-checkboxes')" class="general-link">Check All</a>&nbsp;
															<a href="#" onclick="uncheckAll('task-checkboxes')" class="general-link">Uncheck All</a>
															<br/>
															<c:choose>
															<c:when test="${empty projectStructTasks}">
															<i>No task assigned.</i><br/><br/>
															</c:when>
															<c:when test="${!empty projectStructTasks}">
															
			                                            	<table class="table table-bordered table-striped">
															<thead>
					                                    		<tr>
						                                            <th>Add</th>
						                                            <th>Task</th>
						                                            <th>Staff</th>
						                                        </tr>
					                                    	</thead>
															<tbody>
															<c:forEach items="${projectStructTasks}" var="taskStaffMap">
																<c:set value="${taskStaffMap.key}" var="task"/>
						                                		<c:set value="${taskStaffMap.value}" var="staffList"/>
						                                		<c:forEach items="${staffList}" var="staff">
																<tr>
																	<td align="center">
																		<c:if test="${!fn:contains(alreadyRendered, staff.id)}">
																		<c:set value="${alreadyRendered}-${staff.id}-" var="alreadyRendered"/>
								                                		<form:checkbox class="form-control include-checkbox task-checkboxes" 
								                                			path="staffIDs" 
								                                			value="${staff.id}"
								                                			/>
																		</c:if>
																	</td>
																	<td>
																		<c:url value="/task/edit/${task.id}" var="urlTaskLink"/>
																		<a href="${urlTaskLink}" class="general-link">
																		${task.title}
																		</a>
																	</td>
																	<td>
																		<c:url value="/staff/edit/${staff.id}/from/project/${projectPayroll.projectID}" var="staffLink"/>
																		<a href="${staffLink}" class="general-link">
																		${staff.getFullName()}
																		</a>
																	</td>
																</tr>
						                                		</c:forEach>
															</c:forEach>
															</tbody>
															</table><br/>
															</c:when>
															</c:choose>
															
															
															
															<label>Deliveries</label>&nbsp;
															<a href="#" onclick="checkAll('delivery-checkboxes')" class="general-link">Check All</a>&nbsp;
															<a href="#" onclick="uncheckAll('delivery-checkboxes')" class="general-link">Uncheck All</a>
															<br/>
															<c:choose>
															<c:when test="${empty projectStructDeliveries}">
															<i>No deliveries.</i><br/>
															</c:when>
															<c:when test="${!empty projectStructDeliveries}">
			                                            	<table class="table table-bordered table-striped">
															<thead>
					                                    		<tr>
						                                            <th>Add</th>
						                                            <th>Delivery</th>
						                                            <th>Staff</th>
						                                        </tr>
					                                    	</thead>
															<tbody>
															<c:forEach items="${projectStructDeliveries}" var="deliveryStaffMap">
																<c:set value="${deliveryStaffMap.key}" var="delivery"/>
						                                		<c:set value="${deliveryStaffMap.value}" var="deliveryStaffList"/>
						                                		<c:forEach items="${deliveryStaffList}" var="deliveryStaff">
																<tr>
																	<td align="center">	
																		<c:if test="${!fn:contains(alreadyRendered, deliveryStaff.id)}">
																		<c:set value="${alreadyRendered}-${deliveryStaff.id}-" var="alreadyRendered"/>
								                                		<form:checkbox class="form-control include-checkbox delivery-checkboxes" 
								                                			path="staffIDs" 
								                                			value="${deliveryStaff.id}"
								                                			/>
																		</c:if>
																	</td>
																	<td>
																		${delivery.name}
																	</td>
																	<td>
																		<c:url value="/staff/edit/${deliveryStaff.id}/from/project/${projectPayroll.projectID}" var="staffLink"/>
																		<a href="${staffLink}" class="general-link">
																		${deliveryStaff.getFullName()}
																		</a>
																	</td>
																</tr>
						                                		</c:forEach>
															</c:forEach>
															</tbody>
															</table>
															</c:when>
															</c:choose>
				                                        </div>
				                                    </form:form>
				                                    
			                                        <c:if test="${!empty projectStructManagers || !empty projectStructTeams || !empty projectStructTasks || !empty projectStructDeliveries}">
                                            		<button onclick="submitForm('checkboxesForm')" class="btn btn-default btn-flat btn-sm" id="detailsButton">Update</button>
			                                        </c:if>
			                                        
				                                    <c:if test="${!empty projectPayroll.staffIDs && fn:length(projectPayroll.staffIDs) > 0}">
                                            		<c:url var="urlCompute" value="/project/compute/payroll" />
                                            		<a href="${urlCompute}">
														<button class="btn btn-default btn-flat btn-sm">Compute Payroll</button>
													</a>
													<c:choose>
													<c:when test="${empty projectPayroll.lastComputed}">
													<br/>
													Not yet computed
													</c:when>
													<c:when test="${!empty projectPayroll.lastComputed}">
													<br/>
													Last Computed: ${projectPayroll.lastComputed}
													</c:when>
													</c:choose>
													</c:if>
													
                   								</div>
                   							</div>
                   						</div>
                   						</c:if>
              						</div>
                                </div><!-- /.tab-pane -->
                                <c:if test="${!empty projectStructManagers && !empty projectPayroll.staffIDs && !empty payrollJSON}">
                                <div class="tab-pane" id="tab_computation">
              						<div class="row">
                   						<div class="col-xs-12">
                   							<div class="box box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Computation as of ${projectPayroll.lastComputed}</h3>
                   								</div>
                   								<div class="box-body table-responsive">
                   									<table id="treegrid1"></table>
                   								</div>
                							</div>
                						</div>
                					</div>
                   				</div>
           						</c:if>
                            </div><!-- /.tab-content -->
                        </div><!-- nav-tabs-custom -->
                    </div><!-- /.col -->
                </div> <!-- /.row -->
            </section><!-- /.content -->
        </aside>
	</div>
	
	<!-- Ignite UI Required Combined JavaScript Files -->
	<script src="<c:url value="/resources/lib/modernizr.js" />"type="text/javascript"></script>
	<script src="<c:url value="/resources/lib/igniteui/infragistics.core.js" />"type="text/javascript"></script>
	<script src="<c:url value="/resources/lib/igniteui/infragistics.lob.js" />"type="text/javascript"></script>
	<script src="<c:url value="/resources/lib/igniteui/infragistics.ui.treegrid.js" />"type="text/javascript"></script>
	
	<c:if test="${!empty payrollJSON}">
	<script>
	$(document).ready(function() {
		
		// Tree grid.
		var flatDS = ${payrollJSON};
        $("#treegrid1").igTreeGrid({
            dataSource: flatDS,
            width: "100%",
            primaryKey: "primaryKey",
            foreignKey: "foreignKey",
            features:[
                { name: "MultiColumnHeaders" }
            ],
            columns: [
               	{ headerText: "primaryKey", key: "primaryKey", dataType: "number", hidden: true },
               	{ headerText: "foreignKey", key: "foreignKey", dataType: "number", hidden: true },
               	{ headerText: "Name", width: "26%", key: "name", dataType: "string" },
               	{ headerText: "Total", width: "8%", key: "value", dataType: "string" },
               	{ headerText: "Overtime", key: "breakdownOvertime", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownOvertimeCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownOvertimeWage", dataType: "string" }
               		]},
               	{ headerText: "Present", key: "breakdownPresent", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownPresentCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownPresentWage", dataType: "string" }
               		]},
               	{ headerText: "Late", key: "breakdownLate", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownLateCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownLateWage", dataType: "string" }
               		]},
               	{ headerText: "Half-day", key: "breakdownHalfday", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownHalfdayCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownHalfdayWage", dataType: "string" }
               		]},
               	{ headerText: "Leave", key: "breakdownLeave", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownLeaveCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownLeaveWage", dataType: "string" }
               		]},
               	{ headerText: "Absent", key: "breakdownAbsent", group: [
               			{ headerText: "Count", width: "4%", key: "breakdownAbsentCount", dataType: "string" },
               			{ headerText: "Subtotal", width: "7%", key: "breakdownAbsentWage", dataType: "string" }
               		]}
            ],
            dataRendered: function (evt, ui) {
                ui.owner.element.find("tr td:nth-child(2)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(3)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(4)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(5)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(6)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(7)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(8)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(9)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(10)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(11)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(12)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(13)").css("text-align", "right");
                ui.owner.element.find("tr td:nth-child(14)").css("text-align", "right");
            }
        });
	});
	</script>
	</c:if>
	
	<script>
		function submitForm(id) {
			$('#'+id).submit();
		}
		
		function checkAll(checkboxClass) {
			$('.'+checkboxClass).each(function() { //loop through each checkbox
	             this.checked = true;  //select all checkboxes with class "checkbox1"
	             $(this).parent().attr('class', 'icheckbox_minimal checked');
	        });
			return false;
		}
		
		function uncheckAll(checkboxClass) {
			$('.'+checkboxClass).each(function() { //loop through each checkbox
	             this.checked = false;  //select all checkboxes with class "checkbox1"
	             $(this).parent().attr('class', 'icheckbox_minimal');
	        });
			return false;
		}
		
		$(document).ready(function() {
			$('.date-picker').datepicker({
			    format: 'yyyy/mm/dd'
			});
		});
	</script>
</body>
</html>