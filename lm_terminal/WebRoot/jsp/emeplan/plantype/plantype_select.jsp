<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head><base href="<%=basePath%>">
<title>事件类型选择</title>
<meta name="content-type" content="text/html; charset=UTF-8">
<jsp:include page="/include/pub.jsp"></jsp:include>
<link rel="stylesheet" href="lauvanUI/zTree/metroStyle/metroStyle.css" type="text/css"></link>

</head>

<body>
<ul id="treeDemo" class="ztree"></ul>

<script type="text/javascript" src="lauvanUI/zTree/jquery.ztree.min.js"></script>
<script type="text/javascript">

var zTree;
var setting = {
		check: {
			enable: true,
			chkStyle: "radio",
			radioType: "all"
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
$(function(){
	$.post('emeplan/plantype/tree2', {}, function(j) {
		zTree = $.fn.zTree.init($("#treeDemo"), setting, j);
	});
});
function selectType(index,window){
	var nodes = zTree.getCheckedNodes(true);
	if(nodes.length>0){
		window.$("#planTypeId").val(nodes[0].id);
		window.$("#planTypeName").val(nodes[0].name);
	}
	parent.layer.close(index);
}
</script>
</body>
</html>