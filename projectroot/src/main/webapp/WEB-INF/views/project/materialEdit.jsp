<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Material Edit</title>
   	<link href="<c:url value="/resources/lib/datetimepicker/jquery.datetimepicker.css" />"rel="stylesheet" type="text/css" />
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
	            	${material.name}
		            <small>Edit Material</small>
	            </h1>
	        </section>
	        <section class="content">
                <div class="row">
                    <div class="col-md-12">
                    	<c:url var="urlBack" value="/project/edit/${material.project.id}" />
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
                   								<div class="box-header">
                   									<h3 class="box-title">Edit Material</h3>
                   								</div>
                   								<div class="box-body">
                   									<div class="callout callout-info callout-cebedo">
									                    <p>Instructions regarding this section Instructions regarding this section Instructions regarding this section Instructions regarding this section Instructions regarding this section .</p>
									                </div>
									                <table class="table table-bordered table-striped">
									                <tr>
									                	<td><label>Label</label></td>
									                	<td><label>Data</label></td>
									                </tr>
									                <tr>
									                	<td><label>Delivery</label></td>
									                	<td>
									                	<c:url var="urlLink" value="/project/edit/delivery/${material.delivery.getKey()}-end"/>
									                	<a href="${urlLink}" class="general-link">
									                	${material.delivery.name}
									                	</a>
									                	</td>
									                </tr>
									                <tr>
									                	<td><label>Available</label></td>
									                	<td align="right">${material.available}</td>
									                </tr>
									                <tr>
									                	<td><label>Used / Pulled-Out</label></td>
									                	<td align="right">${material.used}</td>
									                </tr>
									                <tr>
									                	<td><label>Total Quantity</label></td>
									                	<td align="right">${material.quantity}</td>
									                </tr>
									                <tr>
									                	<td><label>Cost (Per Unit)</label></td>
									                	<td align="right">${material.getCostPerUnitMaterialAsString()}</td>
									                </tr>
									                <tr>
									                	<td><label>Total Cost</label></td>
									                	<td align="right">${material.getTotalCostPerUnitMaterialAsString()}</td>
									                </tr>
									                </table>
									                <br/>
									                <div class="progress">
														<div class="progress-bar progress-bar-${material.getAvailableCSS()} progress-bar-striped" 
														    role="progressbar" 
														    aria-valuenow="${material.available}" 
														    aria-valuemin="0" 
														    aria-valuemax="${material.quantity}"
														    style="width:${material.getAvailableAsPercentage()}">
														    <c:if test="${material.available <= 0}">
														    	Out of Stock
														    </c:if>
														    <c:if test="${material.available > 0}">
														    	${material.available} out of ${material.quantity} (${material.getAvailableAsPercentageForDisplay()})
														    </c:if>
													    </div>
													</div>
									                
                   									<form:form modelAttribute="material"
														id="materialForm"
														method="post"
														action="${contextPath}/project/update/material">
				                                        <div class="form-group">
				                                        
				                                        	<label>
				                                        	<c:url var="urlLink" value="/materialcategory/list"/>
										                	<a href="${urlLink}" class="general-link">
				                                        	Material Category
										                	</a>
				                                        	</label>
				                                            <form:select class="form-control" path="materialCategoryKey"> 
	                                     						<c:forEach items="${materialCategoryList}" var="materialCategory"> 
	                                     							<form:option value="${materialCategory.getKey()}" label="${materialCategory.name}"/> 
	                                     						</c:forEach> 
	 		                                    			</form:select>
				                                            <p class="help-block">Choose the category of the material</p>
				                                        
				                                            <label>Specific Name</label>
				                                            <form:input type="text" class="form-control" path="name"/>
				                                            <p class="help-block">Enter the specific name of the material</p>
				                                            
				                                            <label>
				                                            <c:url var="urlLink" value="/unit/list"/>
										                	<a href="${urlLink}" class="general-link">
				                                            Unit of Measure
										                	</a>
				                                            </label>
				                                            <form:select class="form-control" path="unitKey"> 
	                                     						<c:forEach items="${unitList}" var="unit"> 
	                                     							<form:option value="${unit.getKey()}" label="${unit.name}"/> 
	                                     						</c:forEach> 
	 		                                    			</form:select>
				                                            <p class="help-block">Choose the unit of measure</p>
				                                            
				                                            <label>Remarks</label>
				                                            <form:input type="text" class="form-control" path="remarks"/>
				                                            <p class="help-block">Add more information regarding this material</p>
				                                        </div>
				                                    </form:form>
                                            		<button onclick="submitForm('materialForm')" class="btn btn-cebedo-create btn-flat btn-sm" id="detailsButton">Update</button>
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
<script src="${contextPath}/resources/lib/datetimepicker/jquery.datetimepicker.js" type="text/javascript"></script>
<script>
function submitForm(id) {
	$('#'+id).submit();
}
</script>
</html>