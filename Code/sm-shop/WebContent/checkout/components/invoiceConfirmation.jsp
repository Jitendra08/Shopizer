<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<script type='text/javascript'>


var submited = 0;
function submitForm() {

	if(submited==1) {
		return;
	}
	submited=0;
	document.CheckoutProcessForm.submit();
}



</script>


	<style type="text/css">


	.payment_info_line{
		width:250px;
		float:left;}






	#dr_help_underline a {
		color:white;
		float:right;
		text-decoration: underline;
	}
	</style>


			<div id="wrapper" class="clearfix" >



				<div id="maincol" >



	<p>


	<div id="checkoutform" class="formcontent">

      <s:form name="CheckoutProcessForm" id="CheckoutProcessForm" theme="simple" method="post" action="comitInvoice">




				<fieldset>

								<br>
								<div id="sectionheader">
								<p><span><s:text name="label.paymentinformation"/></span></p>
								</div>
								<br><br>
											<div class="formelement">
													<a href="<%=request.getContextPath()%>/checkout/displayInvoice.action" id="postItems">
														<div>
															<span class="button1-box1"></span>
															<span class="button1-box2a"><s:text name="label.checkout.modifypaymentoption" /></span>
															<span class="button1-box3"></span>
														</div>
													</a>
													<br>

													<s:if test="#request.CARD!=null">
														<b><s:text name="label.paybycreditcard" /></b><br>
														<s:property value="#request.CARD.creditCardName" />
														<br>
														<s:property value="#request.CARD.encryptedCreditCardNumber" />
														<br>
														<s:property value="#request.CARD.expirationMonth" />-<s:property value="#request.CARD.expirationYear" /><br><br>
													</s:if>
													<s:elseif test="#session.PAYMENTMETHOD.paymentModuleName=='paypal'">
														<img  src="https://www.paypal.com/en_US/i/logo/PayPal_mark_60x38.gif" border=0 alt=Acceptance Mark>
													</s:elseif>
													<s:elseif test="#session.PAYMENTMETHOD.paymentModuleName=='moneyorder'">
														<b><s:property value="#session.PAYMENTMETHOD.paymentMethodName"/></b>
														<br>
															<u><s:text name="label.checkout.moneyorder" /></u>
														<br><br>
															<s:property value="#session.PAYMENTMETHOD.paymentMethodConfig['key']" escape="false"/>
														<br>
													</s:elseif>
													<s:else>
														<b><s:property value="#session.PAYMENTMETHOD.paymentMethodName"/></b><br><br>
													</s:else>
											</div>
											<s:if test="hasPayment==true">
											<div class="formelement">


												<s:if test="#request.REQUESTTYPE=='subscription'">
													<a href="<%=request.getContextPath()%>/checkout/payment.action">
												</s:if>
											</div>
											</s:if>
				
				</fieldset>
				</br>
				<s:if test="#session.PAYMENTMETHOD.paymentModuleName=='moneyorder'">
					<br><br><br>
				</s:if>
			     </br></br>
			     <fieldset >
						<legend><s:text name="label.checkout.requests"/></legend>
				          	<h3><s:text name="label.checkout.requestsandsuggestions"/></h3>

								<div id="formcontainer">



								  		<div class="formelement">




								          <label class="formlabel">
								            <s:text name="label.checkout.requestsandsuggestions"/>
								          </label>


									      <s:textarea id="orderHistory.comments" name="orderHistory.comments" label="%{getText('label.checkout.requestsandsuggestions')}" rows="3" cols="38" value="%{orderHistory.comments}" required="true"></s:textarea>




								        </div>

								        <div class="formelement">
								        	&nbsp;
								        </div>




							      </div>

		        </fieldset>







	    <div class="mboxDefault">

	    </div>

	    
		  <a href="javascript:submitForm();">
				<div class="href-button-checkout">
					<span class="button1-box1"></span>
					<span class="button1-box2a"><s:text name="label.generic.process" /></span>
					<span class="button1-box3"></span>
				</div>
		  </a>
	      <br><br>





</s:form>



