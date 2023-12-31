<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@taglib prefix="s" uri="/struts-tags" %>


<%@ page import="com.salesmanager.central.web.*" %>
<%@ page import="com.salesmanager.core.util.*" %>
<%@ page import="com.salesmanager.central.catalog.*" %>
<%@ page import="com.salesmanager.central.profile.*" %>
<%@ page import="com.salesmanager.core.entity.catalog.*" %>
<%@ page import="com.salesmanager.core.entity.reference.*" %>
<%@ page import="com.salesmanager.core.service.cache.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">



<head>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/layout-navtop-localleft.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/struts/xhtml/styles.css" type="text/css"/>
    
    <s:include value="../common/headerinc.jsp"/>
    
    <s:include value="../common/pagination.jsp"/>

<script type="text/javascript">


function remove(reviewId) {
	
	
			var answer = confirm('<s:text name="message.confirm.removereview" />');
			if (answer){
				submitReviewRemoval(reviewId);
			} else {
				return false;
			}
}

function submitReviewRemoval(reviewId) {
	document.getElementById('reviewId').value=reviewId;
	document.removeReview.submit();
}


</script> 
	
 

</head>

<body id="productReview">



    <div id="page">

	  <s:include value="../common/header.jsp"/>


        <div id="content" class="clearfix">


            <div id="main">
                <s:actionerror template="smactionerror" />
				<s:fielderror template="smfielderror" />
				<%=MessageUtil.displayMessages(request)%>
				<p>
                <fieldset>
                  <legend>
                    <s:text name="label.product.review" />
                  </legend>
                  
                  <br><br>
                  
                            <div>
							

							<s:form name="removeReview" action="removeReview" method="post">
								<input type="hidden" id="reviewId" name="reviewId" value="">
								<input type="hidden" id="productId" name="product.productId" value="<s:property value="product.productId" />">
							</s:form>
							<table border="0" width="100%">
									<tr>
										<td><div class="pagination"><s:text name="label.generic.Entries" /> <s:property value="firstItem" /> - <s:property value="lastItem" /> of <s:property value="listingCount" /></td>
										<td align="right"><div id="Pagination" class="pagination"></td>
									</tr>
							</table>
							</div>
							<div>
							<table id="box-table-a" border="0" width="100%" summary="Product reviews">
    								<thead>
            							<tr>
            								<th scope="col"><s:text name="label.customer.name" /></th>
										<th scope="col"><s:text name="label.product.review" /></th>
										<th scope="col"><s:text name="label.product.rating" /></th>
            								<th scope="col"><s:text name="label.generic.date" /></th>
            								<th scope="col">&nbsp;</th>

        								</tr>
    								</thead>
    								<tbody>

      							<s:iterator value="reviews">
      								<tr>
         								<td align="left"><a href="<%=request.getContextPath()%>/customer/customerdetails.action?customer.customerId=<s:property value="customerId" />"><s:property value="customerName"/></a></td>
										<td align="left"><s:property value="description"/></td>
										<td align="left" width="98">

											<s:set name="reviewRating" value="reviewRating" scope="request"/> 

											<c:forEach var="i" begin="0" end="4" step="1">
												<c:choose>
													<c:when  test="${i<request.reviewRating}">
																<img   src="<%=request.getContextPath()%>/common/img/redStar.gif"  border="0">
													</c:when>
													<c:otherwise>
																<img   src="<%=request.getContextPath()%>/common/img/whiteStar.gif"  border="0">
													</c:otherwise>
												</c:choose>
											</c:forEach>
											 


										</td>
         									<td align="left" width="75"> <s:date name="dateAdded" format="yyyy-MM-dd" /></td>
		 								<td align="left"> <img src="<%=request.getContextPath()%>/common/img/icon_delete.gif"  border="0" onClick="javascript:remove(<s:property value="reviewId"/>)"></td>
        								</tr>
      							</s:iterator>

    								</tbody>
							</table>



				</fieldset>


                <hr />
            </div><!-- end main -->


			<s:include value="productleftmenu.jsp"/>




        </div><!-- end content -->


        <s:include value="../common/footer.jsp"/>

 </div><!-- end page -->



</body>
</html>
