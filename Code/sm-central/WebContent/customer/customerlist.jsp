
<%@ include file="../common/specialheader.jsp" %>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ page import="com.salesmanager.central.web.*" %>
<%@ page import="com.salesmanager.core.util.*" %>
<%@ page import="com.salesmanager.central.profile.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<%


LabelUtil label = LabelUtil.getInstance();



%>


<head>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><s:text name="label.system.name" /> - <s:text name="label.customer.customerlist.title" /></title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/layout-navtop-1col.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/struts/xhtml/styles.css" type="text/css"/>
	<s:include value="../common/headerinc.jsp"/>




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
                		<s:text name="label.customer.customerlist.title" />
                        </legend>

<table width="100%" bgcolor="#ffffe1">
<tr><td><a href="<s:url action="showcreatecustomer"/>"><s:text name="label.button.createcustomer"/></a></td></tr>
</table>
<br>
<br>

				<form name="searchcriteria" method="post" action="<%=request.getContextPath()%>/customer/customerlist.action">
                <table width="100%" border="0">
				<thead>
                <tr>


                    <!-- last name search -->
                	<th valign="top" colspan="2">
                		<table>
                		<tr>
                			<td><label for="name" class="label"><s:text name="label.customer.lastname" />:</label></td>
                			<td>
                			<input type="text" size="15" name="customerSearchCriteria.customerName" value="">
                			</td>
                		</tr>
                		<tr>
                			<td colspan="2" align="right">

                			</td>
                		</tr>
                		</table>
                	</th>

                	 <!-- company search -->
                	<th valign="top">
                		<table>
                		<tr>
                			<td><label for="company" class="label"><s:text name="label.customer.companyname" />:</label></td>
                			<td>
                			<input type="text" size="15" name="customerSearchCriteria.companyName" value="">
                			</td>
                		</tr>
                		<tr>
                			<td colspan="2" align="right">

                			</td>
                		</tr>
                		</table>
                	</th>

                	<!-- email search -->
                	<th valign="top">
                		<table>
                		<tr>
                			<td><label for="email" class="label"><s:text name="label.customer.email" />:</label></td>
                			<td>
                			<input type="text" size="15" name="customerSearchCriteria.email" value="">
                			</td>
                		</tr>
                		<tr>
                			<td colspan="2" align="right">

                			</td>
                		</tr>
                		</table>
                	</th>





                </tr>

                <tr>
                	<th colspan="4" align="right">
                	<input type="submit" value="<s:text name="label.generic.search" />" name="search"/>&nbsp;
                	<input type="submit" id="reset" name="action:customerlist" value="<s:text name="button.label.reset" />"/>
                	</th>
                </tr>

               </form>
               </thead>
              <tbody>
              </tbody>
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
						               
			<table  width="100%" border="1" id="list-table">
			<thead>
                <tr>
                	<th><s:text name="label.customer.id" /></th>
                	<th><s:text name="label.customer.name" /></th>
                	<th><s:text name="label.customer.companyname" /></th>
                  <th><s:text name="label.customer.registered" /></th>
                	<th><s:text name="label.customer.email" /></th>
                </tr>
				</thead>
				
				<tbody>
                <s:iterator value="customers">
					<tr>
						<td><s:property value="customerId" /></td>
						<td><a href="<%=request.getContextPath() %>/customer/customerdetails.action?customer.customerId=<s:property value="customerId" />"><s:property value="name" /></a></td>
						<td><s:property value="customerCompany" /></td>
						<td><s:if test="customerAnonymous==false"><img src="<%=request.getContextPath() %>/common/img/green-check.jpg"></s:if><s:else>&nbsp;</s:else></td>
						<td><s:property value="customerEmailAddress" /></td>
					</tr>
				</s:iterator>



			 </tbody>
			 <tfoot>

			</tfoot>


          </table>

               	   <!--This is required for page navigation -->
	               <form name="movepage" action="<%=request.getContextPath()%>/customer/customerlist.action">
	               <s:hidden name="customerSearchCriteria.company" id="company" value="%{customerSearchCriteria.company}"/>
	               <s:hidden name="customerSearchCriteria.name" id="name" value="%{customerSearchCriteria.name}"/>
	               <s:hidden name="customerSearchCriteria.email" id="email" value="%{customerSearchCriteria.email}"/>
				   <s:hidden name="pageStartIndex" id="pageStartIndex" value="%{pageStartIndex}"/>
					<s:include value="../common/pagination.jsp"/>

	               </form>


		   </fieldset>


            </div><!-- end main -->




        </div><!-- end content -->


        <s:include value="../common/footer.jsp"/>

    </div><!-- end page -->




</body>
</html>
