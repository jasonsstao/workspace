<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/include/inc.jsp"%>
	 
	 <form id="eventReportform" method="post" action="<%=basePath %>Main/eventReport/save" style="width:100%;">
	    <input type="hidden" name="act" value="add"/>
	    <input type="hidden" name="t_Bus_EventReport.eventid" value="${eventid}"/>
	    <table  id="table" class="sp-table" width="100%" cellpadding="0" cellspacing="0">
		    	<tr>
		    	<td class="sp-td1">编号-年：</td>
		    	<td >
		    	<input type="text" name="t_Bus_EventReport.er_noyear" data-options="prompt:'请输入编号-年',required:true,icons:iconClear" 
		    	class="easyui-textbox" style="width: 180px;"/>
		    	</td>
		    	<td class="sp-td1">编号：</td>
		    	<td >
		    		<input type="text" name="t_Bus_EventReport.er_no" data-options="prompt:'请输入编号',required:true,icons:iconClear" 
		    		class="easyui-textbox" style="width: 180px;"/>
		    	</td>
		    	
		    	</tr>
		    	
		    	<tr>
		    	<td class="sp-td1">上报单位：</td>
		    	<td >
		    	<input type="text" name="t_Bus_EventReport.er_reportunit" data-options="prompt:'上报单位',required:true,icons:iconClear" 
		    	class="easyui-textbox" style="width: 180px;"/>
		    	
		  		</td>
		  		<td class="sp-td1">报告单位：</td>
		    	<td >
		    	<input type="text" name="t_Bus_EventReport.er_unit" data-options="prompt:'报告单位',required:true,icons:iconClear" 
		    	class="easyui-textbox" style="width: 180px;" value="${rOrgan}"/>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		<td class="sp-td1">报告时间：</td>
		    	<td >
		    	<input type="text"  name="t_Bus_EventReport.er_date"  class="easyui-datetimebox"   style="width: 180px;" 
		    	 data-options="editable:false,required:true,icons:iconClear,value:'${nowdate}'"/>
		    	</td>
		    	<td class="sp-td1">签发人：</td>
		    	<td >
		    	<input type="text"  name="t_Bus_EventReport.er_issuer"  class="easyui-textbox"  data-options="icons:iconClear"  style="width: 180px;" />
		    	</td>
		    	</tr>
		    	<tr>
		  		<td class="sp-td1">签发单位：</td>
		    	<td >
		    	<input type="text" name="t_Bus_EventReport.er_issueunit"  class="easyui-textbox" data-options="icons:iconClear" style="width: 180px;"/>
		    	</td>
		    	<td class="sp-td1">签发日期：</td>
		    	<td >
		    	<input type="text"  name="t_Bus_EventReport.er_issuedate"  class="easyui-datetimebox" data-options="icons:iconClear"  style="width: 180px;" 
		    	 data-options="editable:false"/>
		    	</td>
		    	</tr>

		    	<tr>
		  		<td class="sp-td1">主送：</td>
		    	<td >
		    		<input type="text" name="t_Bus_EventReport.er_mainsupply"  class="easyui-textbox" data-options="icons:iconClear" style="width: 180px;"/>
		    	</td>
		    	<td class="sp-td1">抄送：</td>
		    	<td >
		    		<input type="text" name="t_Bus_EventReport.er_copysupply"  class="easyui-textbox" data-options="icons:iconClear" style="width: 180px;"/>
		    	</td>
		    	</tr>
		    	
		    	
		    	<tr>
		  		<td class="sp-td1">联系人：</td>
		    	<td >
		    		<input type="text" name="t_Bus_EventReport.er_contact"  class="easyui-textbox"  data-options="icons:iconClear" style="width: 180px;"/>
		    	</td>
		    	<td class="sp-td1">联系电话：</td>
		    	<td >
		    		<input type="text" name="t_Bus_EventReport.er_contactphone"  class="easyui-textbox" data-options="icons:iconClear" style="width: 180px;"/>
		    	</td>
		    	</tr>
		    	
	    </table>
    </form>
