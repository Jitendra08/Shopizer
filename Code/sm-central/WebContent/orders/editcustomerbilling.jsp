	<%@page contentType="text/html"%>
	<%@page pageEncoding="UTF-8"%>
<%@ page import="com.salesmanager.central.web.*" %>
<%@ page import="com.salesmanager.core.util.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.salesmanager.central.entity.reference.*" %>
<%@ page import="com.salesmanager.core.entity.orders.*" %>
<%@ page import="com.salesmanager.central.profile.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <title><s:text name="label.order.editcustomer.title" /></title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/layout-navtop-1col.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/struts/xhtml/styles.css" type="text/css"/>
    <s:include value="../common/headerinc.jsp"/>


<script language="javascript">


</script>

</head>

<%


Context ctx = (Context)request.getSession().getAttribute(ProfileConstants.context);


String orderid = (String)request.getAttribute("orderid");
if(orderid==null) {
	orderid = (String)request.getParameter("orderid");
}



%>

<body id="editcustomermain">

    <div id="pagecontent">

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
                <s:text name="label.order.editcustomer.title" />
                </legend>

 		<s:action id="refAction" namespace="/ref" name="ref"/>
<p>
<s:text name="label.order.orderid" /> <b><s:property value="order.orderId" /></b>
<br><br>
<b><s:text name="label.order.billingaddress" />:</b>
<p>
<s:form name="editbilling" action="editbilling" method="post">
    <s:textfield name="customerinformation.billingName" value="%{order.billingName}" label="%{getText('label.order.billingname')}" size="40" />
    <s:textfield name="customerinformation.billingStreetAddress" value="%{order.billingStreetAddress}" label="%{getText('label.order.billingaddress')}" size="40" />
    <s:textfield name="customerinformation.billingCity" value="%{order.billingCity}" label="%{getText('label.order.billingcity')}" size="40" />
    <s:textfield name="customerinformation.billingPostcode" value="%{order.billingPostcode}" label="%{getText('label.order.billingpostalcode')}" size="10" />
    <s:textfield name="customerinformation.billingState" value="%{order.billingState}" label="%{getText('label.order.billingstateprovince')}" size="40" />
    <s:textfield name="customerinformation.billingCountry" value="%{order.billingCountry}" label="%{getText('label.order.billingcountry')}" size="40" />
    <s:hidden value="%{order.orderId}" name="order.orderId"/>
    <s:submit value="%{getText('button.label.submit')}"/>

</s:form>
<br><br>
<table width="100%" border="0" bgcolor="#ffffe1">
<tr><td><a href="<%=request.getContextPath()%>/orders/orderdetails.action?order.orderId=<s:property value="order.orderId"/>"><s:text name="label.order.orderdetails.title" /></a></td></tr>
</table>


                 </fieldset>


            </div><!-- end main -->



        </div><!-- end content -->

        <s:include value="../common/footer.jsp"/>

    </div><!-- end page -->


</body>
</html>