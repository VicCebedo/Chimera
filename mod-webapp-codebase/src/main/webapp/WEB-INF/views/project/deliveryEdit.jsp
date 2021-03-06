<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<sec:authentication var="authCdn" property="cdn"/>
<sec:authentication var="authCdnUrl" property="cdnUrl"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<c:set value="${false}" var="isUpdating"/>
	<c:choose>
   	<c:when test="${empty delivery.uuid}">
    	<title>Create New Delivery</title>
   	</c:when>
   	<c:when test="${!empty delivery.uuid}">
		<title>${delivery.name} | Edit Delivery</title>
		<c:set value="${true}" var="isUpdating"/>
   	</c:when>
   	</c:choose>
   	
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
	            <h1>
	            	<c:choose>
	            	<c:when test="${!isUpdating}">
		            	New Delivery
		                <small>Create Delivery</small>
	            	</c:when>
	            	<c:when test="${isUpdating}">
	            		${delivery.name}
		                <small>Edit Delivery</small>
	            	</c:when>
	            	</c:choose>
	            </h1>
	        </section>
	        <section class="content">
                <div class="row">
                    <div class="col-md-12">
                    	<c:url var="urlBack" value="/project/edit/${delivery.project.id}" />
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
												
                   									<form:form modelAttribute="delivery"
														id="detailsForm"
														method="post"
														action="${contextPath}/project/create/delivery">
				                                        <div class="form-group">
				                                            
				                                            <label>Name</label>
				                                            <form:input type="text" placeholder="Sample: Cement for Flooring" class="form-control" path="name"/>
				                                            <p class="help-block">Enter the name of this delivery</p>
				                                            
				                                            <label>Date and Time</label>
				                                            
				                                            <fmt:formatDate pattern="yyyy/MM/dd hh:mm a" value="${delivery.datetime}" var="deliveryDateTime"/>
				                                            <form:input type="text" placeholder="Sample: 2015/06/25 07:40" class="form-control" id="date-picker" path="datetime" value="${deliveryDateTime}"/>
				                                            <p class="help-block">Choose the date and time when the delivery was made</p>
				                                            
				                                            <label>Description</label>
				                                            <form:input type="text" placeholder="Sample: Initial cement delivery for flooring" class="form-control" path="description"/>
				                                            <p class="help-block">Enter additional details</p>
				                                            
				                                        </div>
				                                    </form:form>
			                                        <c:if test="${isUpdating}">
			                                        
			                                        <sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_UPDATE')">
                                            		<button onclick="submitForm('detailsForm')" class="btn btn-cebedo-update btn-flat btn-sm" id="detailsButton">Update</button>
                                            		</sec:authorize>
                                            		
			                                        <sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_DELETE')">
				                                    <div class="btn-group">
				                                    <button type="button" class="btn btn-cebedo-delete btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">Delete</button>
				                                    <ul class="dropdown-menu">
				                                    	<li>
		                                            		<c:url value="/project/delete/delivery/${delivery.getKey()}-end" var="urlDeleteDelivery"/>
						                                    <a href="${urlDeleteDelivery}" class="cebedo-dropdown-hover">
				                                        		Confirm Delete
				                                        	</a>
				                                    	</li>
				                                    </ul>
				                                    </div>
				                                    </sec:authorize>
				                                    
			                                        </c:if>
			                                        
			                                        <sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_CREATE')">
			                                        <c:if test="${!isUpdating}">
                                            		<button onclick="submitForm('detailsForm')" class="btn btn-cebedo-create btn-flat btn-sm" id="detailsButton">Create</button>
			                                        </c:if>
			                                        </sec:authorize>
                   								</div>
                   							</div>
                   						</div>
                   						<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_CREATE')">
                   						<c:if test="${isUpdating}">
                   						<div class="col-md-6">
                   							<div class="box box-body box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Add Materials</h3>
                   								</div>
                   								<div class="box-body">
                   								
                   									<form:form modelAttribute="material"
														id="materialForm"
														method="post"
														action="${contextPath}/project/add/material">
				                                        <div class="form-group">
				                                        
				                                        	<label>Material Category</label>
				                                            <form:select class="form-control" path="materialCategory"> 
				                                            	<form:option value="" label=""/> 
	                                     						<c:forEach items="${materialCategoryList}" var="materialCategory"> 
	                                     							<form:option value="${materialCategory}" label="${materialCategory.getLabel()}"/> 
	                                     						</c:forEach> 
	 		                                    			</form:select>
				                                            <p class="help-block">Choose the category of the material</p>
				                                            
				                                            <label>Specific Name</label>
				                                            <form:input type="text" placeholder="Sample: Ordinary Portland Cement" class="form-control" path="name"/>
				                                            <p class="help-block">Enter the specific name of the material</p>

				                                            <label>Unit of Measure</label>
				                                            <form:select class="form-control" path="unitOfMeasure"> 
				                                            	<form:option value="" label=""/> 
				                                            	<form:option value="" label="----- Length Units"/> 
	                                     						<c:forEach items="${unitListLength}" var="unit"> 
	                                     							<form:option value="${unit}" label="${unit.getLabel()}"/> 
	                                     						</c:forEach> 
	                                     						<form:option value="" label=""/> 
				                                            	<form:option value="" label="----- Mass Units"/> 
	                                     						<c:forEach items="${unitListMass}" var="unit"> 
	                                     							<form:option value="${unit}" label="${unit.getLabel()}"/> 
	                                     						</c:forEach> 
	                                     						<form:option value="" label=""/> 
				                                            	<form:option value="" label="----- Volume Units"/> 
	                                     						<c:forEach items="${unitListVolume}" var="unit"> 
	                                     							<form:option value="${unit}" label="${unit.getLabel()}"/> 
	                                     						</c:forEach> 
	                                     						<form:option value="" label=""/> 
	                                     						<form:option value="" label="----- Others"/> 
				                                            	<form:option value="Pieces" label="Pieces"/>
	 		                                    			</form:select>
				                                            <p class="help-block">Choose the unit of measure</p>
				                                            
				                                            <label>Quantity</label>
				                                            <form:input type="text" placeholder="Sample: 100, 200, 350, 500" class="form-control" path="quantity"/>
				                                            <p class="help-block">Enter the total amount of materials</p>
				                                            
				                                            <label>Cost (Per Unit)</label>
				                                            <form:input type="text" placeholder="Sample: 30.50, 25.10, 100, 200" class="form-control" path="costPerUnitMaterial"/>
				                                            <p class="help-block">Enter the cost of one material per unit</p>
				                                            
				                                            <label>Remarks</label>
				                                            <form:input type="text" placeholder="Sample: Delivery was on time" class="form-control" path="remarks"/>
				                                            <p class="help-block">Add more information regarding this material</p>
				                                            
				                                        </div>
				                                    </form:form>
                                            		<button onclick="submitForm('materialForm')" class="btn btn-cebedo-create btn-flat btn-sm" id="detailsButton">Add</button>
                                            		
                                            		<br/>
                                            		<br/>
                   									<form:form modelAttribute="massUploadBean"
														action="${contextPath}/project/mass/upload/materials"
														method="post"
														enctype="multipart/form-data">
													
														<div class="form-group">
														<label>Excel File</label>
														<form:input type="file" class="form-control" path="file"/><br/>
														<button class="btn btn-cebedo-create btn-flat btn-sm">Upload</button>
														</div>
													</form:form>
                   								</div>
                   							</div>
                   						</div>
                   						</c:if>
                   						</sec:authorize>
              						</div>
              						<c:if test="${isUpdating}">
              						<div class="row">
                   						<div class="col-md-12">
                   							<div class="box box-body box-default">
                   								<div class="box-header">
                   									<h3 class="box-title">Materials</h3>
                   								</div>
                   								<div class="box-body">
									                <div class="pull-right">
									                <h3>Delivered Materials Total <b><u>
				                                	${delivery.getGrandTotalOfMaterialsAsString()}
													</u></b></h3>
									                </div>
                                            		<table id="material-table" class="table table-bordered table-striped">
				                                    	<thead>
				                                            <tr>
				                                            	<th>&nbsp;</th>
																<th>Material Category</th>
																<th>Specific Name</th>
																<th>Unit</th>
																<th>Status</th>
																<th>Available</th>
																<th>Pulled-Out</th>
																<th>Quantity</th>
																<th>(&#8369;)/Unit</th>
																<th>Total (&#8369;)</th>
				                                            </tr>
		                                        		</thead>
				                                        <tbody>
					                                		<c:forEach items="${materialList}" var="row">
				                                            <tr>
				                                            	<td>
				                                            		<center>
				                                            			<c:url var="urlEdit" value="/project/edit/material/${row.getKey()}-end"/>
				                                            			<a href="${urlEdit}">
								                                    	<button class="btn btn-cebedo-view btn-flat btn-sm">View</button>
				                                            			</a>
				                                            			
				                                            			<sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_CREATE')">
				                                            			<c:if test="${row.available > 0}">
				                                            			<c:url var="urlPullout" value="/project/pullout/material/${row.getKey()}-end"/>
									                                    <a href="${urlPullout}">
		                   													<button class="btn btn-cebedo-pullout btn-flat btn-sm">Pull-Out</button>
									                                    </a>
									                                    </c:if>
									                                    </sec:authorize>
									                                    
									                                    <sec:authorize access="hasAnyRole('ADMIN_COMPANY', 'INVENTORY_DELETE')">
                            		                                    <div class="btn-group">
                            		                                    <button type="button" class="btn btn-cebedo-delete btn-flat btn-sm dropdown-toggle" data-toggle="dropdown">Delete</button>
                            		                                    <ul class="dropdown-menu">
                            		                                    	<li>
                            		                                    		<c:url var="urlDelete" value="/project/delete/material/${row.getKey()}-end"/>
                            		                                    		<a href="${urlDelete}" class="cebedo-dropdown-hover">
                            		                                        		Confirm Delete
                            		                                        	</a>
                            		                                    	</li>
                            		                                    </ul>
                            		                                    </div>
                            		                                    </sec:authorize>
																	</center>
																</td>
																<td>${row.materialCategory.getLabel()}</td>
																<td>${row.name}</td>
																<td>${row.getUnitName()}</td>
																
																<td align="center">
																<div class="progress">
																	<div class="progress-bar progress-bar-${row.getAvailableCSS()} progress-bar-striped" 
																	    role="progressbar" 
																	    aria-valuenow="${row.available}" 
																	    aria-valuemin="0" 
																	    aria-valuemax="${row.quantity}"
																	    style="width:${row.getAvailableAsPercentage()}">
																	    <c:if test="${row.available <= 0}">
																	    	Out of Stock
																	    </c:if>
																    </div>
																</div>
															    <c:if test="${row.available > 0}">
															    	<fmt:formatNumber type="number" pattern="###,##0.0###" value="${row.available}" /> (${row.getAvailableAsPercentage()})
															    </c:if>
																</td>
																
																<td align="right">${row.available}</td>
																
																<td align="right">
																	<fmt:formatNumber type="number" pattern="###,##0.0###" value="${row.used}" />
																</td>
																
																<td align="right">
																	<fmt:formatNumber type="number" pattern="###,##0.0###" value="${row.quantity}" />
																</td>
																<td align="right">${row.costPerUnitMaterial}</td>
																<td align="right">${row.totalCostPerUnitMaterial}</td>
				                                            </tr>
			                                            	</c:forEach>
					                                    </tbody>
					                                </table>
                   								</div>
                   							</div>
                   						</div>
              						</div>
              						</c:if>
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
	$('#material-table').dataTable();
});
function submitForm(id) {
	$('#'+id).submit();
}
</script>
</html>