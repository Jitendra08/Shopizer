<%@taglib prefix="s" uri="/struts-tags" %>


		<div id="local">
                <h2><s:text name="label.shipping.leftmenu.title" /></h2>
                <ul>
                    <li><a href="<%=request.getContextPath()%>/shipping/shipping.action"><s:text name="leftmenu.shipping.shippingzones" /></a></li>
                    <li><a href="<%=request.getContextPath()%>/shipping/shippingrates.action"><s:text name="leftmenu.shipping.shippingrates" /></a></li>
                    <li><a href="<%=request.getContextPath()%>/shipping/shippingconfig.action"><s:text name="leftmenu.shipping.shippinghandling" /></a></li>
                    <li><a href="<%=request.getContextPath()%>/shipping/packing.action"><s:text name="label.shipping.packing.title" /></a></li>

                </ul>


         </div><!-- local -->