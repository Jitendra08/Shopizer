	<%@page contentType="text/html"%>
	<%@page pageEncoding="UTF-8"%>
<%@ page import="com.salesmanager.central.web.*" %>
<%@ page import="com.salesmanager.central.profile.*" %>
<%@ page import="com.salesmanager.core.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@taglib prefix="s" uri="/struts-tags" %>
    <title><s:text name="label.storefront.featureditems" /></title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/main.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/draganddrop.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/jqueryFileTree.css"/>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/common/styles/layout-navtop-localleft.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/struts/xhtml/styles.css" type="text/css"/>

    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/interface/AddProduct.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/dwr/util.js'></script>




      <s:include value="../common/headerinc.jsp"/>

	<script type="text/javascript" src="<%=request.getContextPath()%>/common/js/jquery-ui-1.7.3.custom.min.js"></script>
	





<%

LabelUtil label = LabelUtil.getInstance();
Context ctx = (Context)request.getSession().getAttribute(ProfileConstants.context);
int langId = LanguageUtil.getLanguageNumberCode(ctx.getLang());

%>


<script type='text/javascript'>
var errorMessage = '<s:text name="errors.technical" />';



var successCreate = 0;


function selectTemplate(template,countryCode) {
	document.getElementById('ajaxMessage').innerHTML='';
	SelectStoreTemplate.selectTemplate(template,countryCode,handleCallBack);
}

function handleCallBack(data) {
	if(!data) {
		setErrorMessage(errorMessage);
	} else {
		document.getElementById('templateName').innerHTML=data.coreModuleServiceDescription;
		document.getElementById('templateImage').innerHTML='<img src=\"<%=request.getContextPath()%>/common/img/'+data.coreModuleServiceLogoPath + '\" width=\"75\" height=\"75\" alt=\"' + data.coreModuleServiceDescription + '\">';
	}
}

function setErrorMessage(message) {
	document.getElementById('ajaxMessage').innerHTML='<div class=\"icon-error\">'+message+'</div>';
}

function createRelationship(productId) {
	successCreate = 0;
	document.getElementById('ajaxMessage').innerHTML='';
      document.getElementById('ajaxMessage').style.display='none';
	AddProduct.addRelationshipItem(productId,'<s:property value="product.productId" />','10',fillRelationship);
}

function fillRelationship(data) {
	if(data && data!="") {
		successCreate = 1;
		document.getElementById('ajaxMessage').innerHTML=data;
		document.getElementById('ajaxMessage').style.display='block';
	} 
	jQuery.unblockUI();
}


function removeRelationship(productId) {
	document.getElementById('ajaxMessage').innerHTML='';
	AddProduct.removeRelationshipItem(productId,'<s:property value="product.productId" />','10',unfillRelationship);
}

function unfillRelationship(data) {
	if(data && data!="") {
		document.getElementById('ajaxMessage').innerHTML=data;
		document.getElementById('ajaxMessage').style.display='block';
	} 
}

function setCategory() {
	 document.getElementById('ajaxMessage').innerHTML='';
	 document.getElementById('ajaxMessage').style.display='none';
	 var categoryId = document.getElementById('categories').value;
	 if(categoryId==-1) {

	 } else {
	 	AddProduct.getProductsHtmlListByCategoryId(categoryId,fillProducts);
	}
}

function fillProducts(data) {

	  	if(data) {
			DWRUtil.removeAllOptions(products);
			var container = document.getElementById('products');
			for (i=0; i<data.length; i++) {
				var new_element = document.createElement('li');
				new_element.id=data[i].productId;
                        new_element.setAttribute('class','file drag');
                        new_element.setAttribute('className','file drag');
				new_element.innerHTML = data[i].name;
				container.appendChild(new_element);
				applyDraggable();
			}
	  	} else {
			var container = document.getElementById('products');
			while(container.hasChildNodes() ) { 
				container.removeChild(container.lastChild ); 
			}
		}
}

function applyDraggable() { 
        jQuery(".drag").draggable({ helper: "clone", opacity: "1.0" }); 
}

    
function deleteRelatedItem(id) {
		document.getElementById('ajaxMessage').innerHTML='';
		document.getElementById('ajaxMessage').style.display='none';
		removeRelationship(id);
		jQuery(".dropZone").children().remove("#" + id);
}
        
jQuery(document).ready(function()        {

	  applyDraggable();

        jQuery(".dropZone").droppable( 
        
        { 
            accept: ".drag", 
            hoverClass: "dropHover", 
            drop: function(ev, ui) {


				     //4 maximum 

				     var itemsInBin = jQuery(".dropZone div");


                             var droppedItem = ui.draggable.clone().addClass("droppedItemStyle");
                          
                                                                  
                             var product = droppedItem[0].id; 


				     block();

				     createRelationship(product);

					var textNode = document.createTextNode("  -  ");
					
				     	var removeLink = document.createElement("a");
				     	removeLink.innerHTML = "<s:text name="label.generic.delete" />";
				     	removeLink.className = "deleteLink";
				     	removeLink.href = "#";
				     	removeLink.onclick = function()
				     	{
						document.getElementById('ajaxMessage').innerHTML='';
						document.getElementById('ajaxMessage').style.display='none';
						removeRelationship(droppedItem[0].id);
						jQuery(".dropZone").children().remove("#" + droppedItem[0].id);

				     	}

					
					droppedItem[0].appendChild(textNode);
				     	droppedItem[0].appendChild(removeLink);
                             	jQuery(this).append(droppedItem);

	


            } 

        } 
     ); 

        
});
</script>


</head>


<body id="featureditems">











		<div id="page">



	  		<s:include value="../common/header.jsp"/>


            <div id="content" class="clearfix">

            <div id="main">
				<s:actionerror template="smactionerror"/>
				<s:fielderror template="smfielderror"/>
				<s:actionmessage/>
				<%=MessageUtil.displayMessages(request)%>
				<div id="ajaxMessage" class="icon-error" style="display:none"></div>

			<fieldset>
				<legend>
					<s:text name="label.storefront.crosssellitems" />
           		      </legend>




    <form id="productRelationship">


	<table border="0">
		<tr>
			<td colspan="2">

				  <div class="notes">
					<h4><s:text name="label.storefront.crosssellitems.configuration" />&nbsp;
					<s:text name="label.payment.generic.information" /></h4>
					<p class="last">
						<s:text name="label.storefront.crosssellitems.text" />
					</p>
				  </div>

		
			</td>

		</tr>
		<tr>

		
			<td>

            	<!--Category drop down box -->
            	<div>
				<%
				String opt = label.getText("label.productedit.choosecategory");
				request.setAttribute("option1",opt);
				request.setAttribute("javascriptonchange","setCategory();");
				%>

				<s:text name="label.productedit.categoryname" />&nbsp;
				<s:include value="../common/categoriesselectbox.jsp"/>
            	</div>


            	<div class="dragZoneContainer">
                                <ul id="products" class="jqueryFileTree">
                                        <s:iterator value="products" >
                                        	<li class="file drag" id="${productId}"><a href="#" rel="${name}">${name}</a></li> 
                                        </s:iterator>
                                </ul>
            	</div>
			</td>

			<td>

            		<div class="dropZoneHeader" style="width:260px">
					<s:text name="label.storefront.crosssellitems" />
				</div>
				<div id="interaction" class="dropZoneContainer" style="width:260px;">
                    		<div class="dropZone" style="width:260px;">
				    		<s:iterator value="crossSellItems" >
                                     	<li class="file droppedItemStyle" id="${productId}"><a href="#" rel="${name}">${name}</a>  -  <a href="#" class="deleteLink" onClick="deleteRelatedItem(${productId})"><s:text name="label.generic.delete" /></a></li> 
                            		</s:iterator>
                    		</div>
            		</div>
			</td>
		</tr>
		</table>


    </form>





 			</fieldset>




			</div><!-- end main -->

			<s:include value="productleftmenu.jsp"/>



		</div><!-- end content -->
<s:include value="../common/footer.jsp"/>
</div><!-- end page -->
</body>
</html>
















