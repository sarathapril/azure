<%--

  ADOBE CONFIDENTIAL
  __________________

   Copyright 2015 Adobe Systems Incorporated
   All Rights Reserved.

  NOTICE:  All information contained herein is, and remains
  the property of Adobe Systems Incorporated and its suppliers,
  if any.  The intellectual and technical concepts contained
  herein are proprietary to Adobe Systems Incorporated and its
  suppliers and are protected by trade secret or copyright law.
  Dissemination of this information or reproduction of this material
  is strictly forbidden unless prior written permission is obtained
  from Adobe Systems Incorporated.

--%><%
%><%@include file="/libs/granite/ui/global.jsp" %><%
%><%@ page session="false" contentType="text/html" pageEncoding="utf-8"
         import="com.adobe.granite.ui.components.formbuilder.FormResourceManager,
         		 org.apache.sling.api.resource.Resource,
         		 org.apache.sling.api.resource.ValueMap,
                 com.adobe.granite.ui.components.Config,
         		 java.util.HashMap" %><% 

    ValueMap fieldProperties = resource.adaptTo(ValueMap.class);
    Config cfg = new Config(resource);

    HashMap<String, Object> values = new HashMap<String, Object>();
    values.put("class",     "checkbox-label readonly");
    values.put("text",      i18n.get("Multivalue Field"));
    values.put("value",     cfg.get("multiple", false));
    values.put("checked",   cfg.get("multiple", false));
    values.put("name",      "./items/" + resource.getName() + "/multiple");

    FormResourceManager formResourceManager = sling.getService(FormResourceManager.class);
    Resource placeholderFieldResource = formResourceManager.getDefaultPropertyFieldResource(resource, values);

%><sling:include resource="<%= placeholderFieldResource %>" resourceType="granite/ui/components/foundation/form/checkbox"/>

<input type="hidden" name="./items/<%= resource.getName() %>/disabled@Delete" value="true">
<input type="hidden" name="./items/<%= resource.getName() %>/disabled@TypeHint" value="Boolean">

