
<%@ include file="../common/specialheader.jsp" %>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page import="com.salesmanager.central.web.*" %>
<%@ page import="com.salesmanager.core.util.*" %>
<%@ page import="com.salesmanager.central.profile.*" %>
<%@ page import="com.salesmanager.central.payment.*" %>
<%@ page import="com.salesmanager.central.entity.reference.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%


LabelUtil label = LabelUtil.getInstance();

String customername = (String)request.getAttribute("customername");
if(customername==null) {
	customername = "";
}


%>


<head>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><s:text name="label.system.name" /> - <s:text name="label.order.orderlist.title" /></title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/layout-navtop-1col.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/struts/xhtml/styles.css" type="text/css"/>

     <s:include value="../common/headerinc.jsp"/>
    <script type="text/javascript" src="../common/js/calendarDateInput.js"></script>

    <script type="text/javascript">
    function deleteCust() {
          document.getElementById('customernamefield').value='';
          document.getElementById('hiddencustomernamefield').value='';
    }
    </script>
</head>






<body id="page-home">

    <div id="page">

	  <s:include value="../common/header.jsp"/>


        <div id="content" class="clearfix">


            <div id="main">
				<s:actionerror/>
				<s:actionmessage/>
				<s:fielderror />
				<%=MessageUtil.displayMessages(request)%>
				<p>
                		<fieldset>
                		<legend>
                		<s:text name="label.order.orderlist.title" />
                        </legend>

                <%
				    String sdate = (String)request.getAttribute("sdate");
			   		String edate = (String)request.getAttribute("edate");

			   		Calendar currDate= Calendar.getInstance();
			   		currDate.add(Calendar.DATE, -180); //go back 6 months
			   		Date sixmonths = currDate.getTime();
			   		String sdatesixmonths = DateUtil.formatDate(sixmonths);
			   		if(sdate==null) {
			   			sdate = sdatesixmonths;
			   		}
			   		if(edate==null) {
			   			Date now = new Date(new Date().getTime());
			   			edate = DateUtil.formatDate(now);
			   		}


				%>


                <table width="100%" border="0">
                <form name="searchcriteria" method="post" action="<%=request.getContextPath()%>/orders/searchcriteria.action">
				<thead>
                <tr>


                    <!-- OrderId search -->
                	<th valign="top">
                		<table>
                		<tr>
                			<td><label for="id" class="label"><s:text name="label.order.orderid" />:</label></td>
                			<td>
                			<input type="text" size="6" name="orderId" value="<s:property value="orderId" />">
                			</td>
                		</tr>
                		<tr>
                			<td colspan="2" align="right">

                			</td>
                		</tr>
                		</table>
                	</th>



                    <!-- Date search -->
                    <th colspan="2">

                    	<table>
                    	<tr>
                    		<td><label for="date" class="label"><s:text name="label.generic.between" />:</label></td>
                    		<td>
								<script>DateInput('startdate', true, 'YYYY-MM-DD','<%=sdate%>')</script>
							</td>
				        </tr>
				        <tr>
					        <td><label for="date" class="label"><s:text name="label.generic.and" />:</label></td>
                    		<td>
								<script>DateInput('enddate', true, 'YYYY-MM-DD','<%=edate%>')</script>
                    		</td>
                    	</tr>
                    	</table>

                    </th>



                	<!-- Customer name search -->
                	<th valign="top" colspan="3">
                		<table>
                		<tr>
                			<td><label for="name" class="label"><s:text name="label.dashboard.customer" />:</label></td>
                			<td><input type="text" name="customername" id="customernamefield" value="<%=customername %>"></td>
                		</tr>
                		<tr>
                			<td colspan="2" align="right">
					        <%if(customername!=null && !customername.trim().equals("")) {%>
                				<input type="button" value="<s:text name="button.label.clear" />" name="clearcustomer" onClick="deleteCust();"/>
                			<%}%>
                			</td>
                		</tr>
                		</table>
                	</th>


                	</tr>

                	<tr>
                	<th><input type="submit" value="<s:text name="label.button.searchorderid" />" name="searchbyorderid"/></th>
                	<th colspan="4" align="center">
                		<input type="submit" value="<s:text name="label.generic.search" />" name="searchbycustomer"/>
                		&nbsp;
                		<input type="submit" id="reset" name="action:orderlist" value="<s:text name="button.label.reset" />"/>
                	</th>
                	<th align="right">
                		<input type="submit" id="report" name="action:orderReport" value="<s:text name="button.label.printreport" />"/>
                	</th>

                	</tr>
                </tr>
               </form>

			   </thead>
				<tbody></tbody>
			   </table>

		    <div class="line-10px">
                <div class="pagination">
					<table border="0" width="100%">
						<tr>
							<td><div class="pagination-left"><s:text name="label.generic.Entries" /> <s:property value="firstItem" /> - <s:property value="lastItem" /> of <s:property value="listingCount" /></td>
							<td><div id="Pagination" class="pagination"></td>
						</tr>
					</table>
				</div>
			</div>


			<table width="100%" border="1" id="list-table">
			<tbody>
                <tr>
                	<th><s:text name="label.order.orderdate" /></th>
                	<th><s:text name="label.order.orderid" /></th>
                	<th align="left"><s:text name="label.order.orderstatus" /></th>
                	<th><s:text name="label.dashboard.customer" /></th>
                	<th><s:text name="label.order.ordertotal" /></th>
                	<th><s:text name="label.order.orderstatus" /></th>
                </tr>
				</thead>
				<tbody>
                <s:iterator value="orders">


				<tr>
					<td><s:property value="datePurchasedString" /></td>
					<td><s:property value="orderId" /></td>
					<td align="left"><img src="<%=request.getContextPath() %>/common/img/<s:property value="statusmark" />"></td>
					<td><a href="<%=request.getContextPath() %>/orders/orderdetails.action?order.orderId=<s:property value="orderId" />"><s:property value="customerName" /></a></td>
					<td><s:if test="orderStatus==5 && total==0.00"><strike></s:if><s:property value="orderTotalText" /><s:if test="orderStatus==5"></strike></s:if></td>
					<td><s:property value="status" /></td>
					<!--<td><a href='<%=request.getContextPath() %>/orders/invoiceReport.action?order.orderId=<s:property value="orderId" />'>Download</a></td>-->
				</tr>


		    </s:iterator>



			</tbody>
			<tfoot>

			</tfoot>


               </table>

               <form name="page" action="<%=request.getContextPath()%>/orders/orderlistpage.action">
               <input type="hidden" name="navstartdate" id="" value="<s:property value="criteria.startDateString" />">
               <input type="hidden" name="navenddate" id="" value="<s:property value="criteria.endDateString" />">
		   <s:hidden name="pageStartIndex" id="pageStartIndex" value="%{pageStartIndex}"/>
               <input type="hidden" name="customername" id="hiddencustomernamefield" value="<s:property value="criteria.customerName" />">
		       <s:include value="../common/pagination.jsp"/>
               </form>


		   </fieldset>


            </div><!-- end main -->




        </div><!-- end content -->


        <s:include value="../common/footer.jsp"/>

    </div><!-- end page -->




</body>
</html>

