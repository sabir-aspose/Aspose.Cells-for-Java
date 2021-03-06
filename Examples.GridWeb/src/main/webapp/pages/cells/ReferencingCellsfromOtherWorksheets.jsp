<%@page language="java" contentType="text/html; charset=UTF-8" import="com.aspose.gridweb.*"  pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/head.jsp" %>
<script type="text/javascript" src="grid/acw_client/jquery-2.1.4.min.js"></script>
<title>Referencing cells from other worksheets</title>
<%
ExtPage BeanManager=ExtPage.getInstance();
GridWebBean gridweb=BeanManager.getBean(request);
out.println(gridweb.getHTMLHead());
%>
</head>
<body>
<%

String filePath = application.getRealPath("/data.xls");

gridweb.setReqRes(request, response);
gridweb.importExcelFile(filePath);

//Accessing the worksheet of the Grid that is currently active
GridWorksheet sheet = gridweb.getWorkSheets().get(gridweb.getActiveSheetIndex());

//Adding a bit complex formula to "A1" cell
sheet.getCells().get("A1").setFormula("=SUM(F1:F7)/ AVERAGE (E1:E7)-Sheet1!C6");

gridweb.prepareRender();

out.print(gridweb.getHTMLBody());

%>
</body>
</html>