<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/include/inc.jsp"%>
<script type="text/javascript">
var basePath = '<%=basePath %>';
$(function(){		
	$("#eventTXfile").uploadify({
		buttonText: "上传", //按钮上的文字 
        uploader: basePath+"plugins/uploadify/scripts/uploadify.swf",
        script:  basePath+"Main/attachment/save/eventTxFile-${loginModel.userAccount}-${loginModel.userId}",
        cancelImg: basePath+"plugins/uploadify/cancel.png",
        auto: true, //是否自动开始     
        multi: true, //是否支持多文件上传
        fileDataName:'file',
        fileQueue:'fileQueue',
        fileDesc:'*.jpg;*.png;*.gif;',
        fileExt:'**.jpg;*.png;*.gif;',
        onComplete:_eventTXonComplete
        });
});

function _eventTXonComplete(event, queueId, fileObj, response, data){	
var obj = eval( "(" + response + ")" );//转换后的JSON对象
var htmlBody="";
htmlBody+="<div id='evTxfile_"+obj.id+"' style='height:25px;line-height:25px;font-size:12px;'>";
htmlBody+="<span style='display:none'><input type='checkbox' name='ectxid' value='"+obj.id+"' checked/></span>";
htmlBody+="<a title='请点击另存为' target='_blank' href='"+basePath+"Main/attachment/downloadFJ/"+obj.id+"'>"+obj.name+"<a/> （"
			+obj.size+"）<a href='javascript:deletetxFile("+obj.id+");'><img src='"+basePath+"plugins/uploadify/cancel.png' height='13' align='middle'/></a>";
htmlBody+="</div>";
$("#eventTXfileList").html(htmlBody);
}
//删除文件ajax请求
function deletetxFile(id){
$("#evTxfile_"+id).load(basePath+"Main/attachment/delete/"+id);
$("#evTxfile_"+id).remove();
}
function ephoneClickFN_r(){
	var phone = $("#_evphone_r").val();
	var eid = '${t.id}';
	if(phone==null || phone=='' || phone==undefined){
		alert("请输入电话号码进行拨打！");
		return;
	}
	callout(phone, eid);
}
function ephoneRECEClickFN_r(){
	var phone = $("#_evphonerece_r").val();
	var eid = '${t.id}';
	if(phone==null || phone=='' || phone==undefined){
		alert("请输入电话号码进行拨打！");
		return;
	}
	callout(phone, eid);
}
function ephoneAddClickFN_r(){
	var phone = $("#_evphone_r").val();
	var pname = $("#_evpname_r").val();
	if(phone==null || phone=='' || phone==undefined){
		alert("请输入电话号码进行添加通讯录到工作联络网！");
		return;
	}
	tel_addWN(phone, pname);
}
</script>	 
	 <form id="routineform" method="post" action="<%=basePath %>Main/eventRoutine/save" style="width:100%;">
	    <input type="hidden" name="act" value="upd"/>
	    <input type="hidden" name="t_Bus_EventInfo.id" value="${t.id}"/>
	    <table  id="table" class="sp-table" width="100%" cellpadding="0" cellspacing="0">
		    	<tr>
		    	<td class="sp-td1">事件名称：</td>
		    	<td colspan="3">
		    	<input type="text" name="t_Bus_EventInfo.ev_name" data-options="prompt:'请输入事件名称',required:true,icons:iconClear" 
		    	class="easyui-textbox" style="width: 565px;" value="${t.ev_name}"/></td>
		    	</tr>
		    	<tr>
		    	<td class="sp-td1">事发单位：</td>
		    	<td colspan="3">
		    		<input class="easyui-combotree" name="t_Bus_EventInfo.organid"
		    		 data-options="url:'<%=basePath%>Main/event/getComboTree',method:'get',value:'${t.organid}'" style="width:565px;">
		    	</td>
		  		
		    	</tr>
		    	
		    	<tr>
		    	<td class="sp-td1">事件类型：</td>
		    	<td >
		    	<input class="easyui-combotree" name="t_Bus_EventInfo.ev_type" 
		    	data-options="url:'<%=basePath%>Main/event/getTypeTree',method:'get',editable:false,required:true,value:'${t.ev_type}'" style="width:180px;">
		  		</td>
		  		<td class="sp-td1">接报方式：</td>
		    	<td >
		    	<select class="easyui-combobox" name="t_Bus_EventInfo.ev_reportmode"  panelHeight="auto" code="EVRP"
		    	 style="width: 180px;" data-options="editable:false,required:true,value:'${t.ev_reportmode}'" ></select>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		<td class="sp-td1">事发时间：</td>
		    	<td >
		    	<input type="text"  name="t_Bus_EventInfo.ev_date"  class="easyui-datetimebox"   
		    	style="width: 180px;"  data-options="editable:false,required:true,value:'${t.ev_date}'"/>
		    	</td>
		    	<td class="sp-td1">接报时间：</td>
		    	<td >
		    	<input type="text"  name="t_Bus_EventInfo.ev_reportdate"  class="easyui-datetimebox"   
		    	style="width: 180px;"  data-options="editable:false,required:true" value="${t.ev_reportdate}"/>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		<td class="sp-td1">接报人姓名：</td>
		    	<td >
		    		<input type="text" id="_evprecename_r" name="t_Bus_EventInfo.ev_receername" data-options="prompt:'请输入接报人姓名',icons:iconClear" 
		    		class="easyui-textbox" style="width: 180px;" value="${t.ev_receername}"/>
		    	</td>
		    	<td class="sp-td1">接报人电话：</td>
		    	<td >
		    		<input type="text" id="_evphonerece_r" name="t_Bus_EventInfo.ev_recetel" 
		    		data-options="prompt:'请输入接报人电话',required:true,icons:[{iconCls:'icon-phonereceived',handler:ephoneRECEClickFN_r}]" 
		    		class="easyui-textbox" style="width: 180px;" value="${t.ev_recetel}"/>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		<td class="sp-td1">报告人姓名：</td>
		    	<td >
		    		<input type="text" id="_evpname_r" name="t_Bus_EventInfo.ev_reporter" data-options="prompt:'请输入报告人姓名',icons:iconClear" 
		    		class="easyui-textbox" style="width: 180px;" value="${t.ev_reporter}"/>
		    	</td>
		    	<td class="sp-td1">报告人电话：</td>
		    	<td >
		    		<input type="text" id="_evphone_r" name="t_Bus_EventInfo.ev_reporttel" 
		    		data-options="prompt:'请输入报告人电话',required:true,icons:[{iconCls:'icon-phonereceived',handler:ephoneClickFN_r},{iconCls:'icon-reportedit',handler:ephoneAddClickFN_r}]" 
		    		class="easyui-textbox" style="width: 180px;" value="${t.ev_reporttel}"/>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		
		    	<td class="sp-td1">事发地点：</td>
		    	<td colspan="3">
		    	<input class="easyui-combotree" name="t_Bus_EventInfo.occurarea" data-options="url:'<%=basePath%>Main/event/getoccurAreaTree',method:'get',editable:false,value:'${t.occurarea}'" style="width:180px;">
		    	（区/县）
		    	<input type="text" name="t_Bus_EventInfo.ev_address" data-options="prompt:'请输入事发地点',icons:iconClear" 
		    	class="easyui-textbox" style="width: 328px;" value="${t.ev_address}"/></td>
		    	</tr>
		    	
		    	<tr>
		    	<td  class="sp-td1" >使用情况：</td>
		    	<td >
		    		<select class="easyui-combobox" name="t_Bus_EventInfo.ev_usestatus"  panelHeight="auto" code="EVUS" style="width: 180px;" data-options="editable:false,icons:iconClear,value:'${t.ev_usestatus}'" ></select>
		    	</td>
		    	<td  class="sp-td1" >报送时效：</td>
		    	<td >
		    		<select class="easyui-combobox" name="t_Bus_EventInfo.ev_bssx"  panelHeight="auto" code="EVSX" style="width: 180px;" data-options="editable:false,icons:iconClear,value:'${t.ev_bssx}'" ></select>
		    	</td>
		    	</tr>
		    	<tr>
		    	<td class="sp-td1" >现场图片：</td>
		    	<td colspan="3">
		    	<input  id="eventTXfile"  type="file" name="file"/>
		    	<div id="eventTXfileList" style="width: 270px;">
		    	<c:if test="${!empty t.ev_img}">
		    	<div id='evTxfile_${t.ev_img}' style='height:25px;line-height:25px;font-size:12px;'>
		    	<a title="请点击打开" target="_blank" href="<%=basePath%>Main/attachment/downloadFJ/${t.ev_img}">${imgfj.name}<a/> 
		    	</c:if>
		    	</div>
		    	</td>
		    	</tr>
		    	
		    	<tr>
		  		<td class="sp-td1">事件基本情况</td>
		    	<td colspan="3">
		    		<textarea name="t_Bus_EventInfo.ev_basicsituation" class="textarea" 
		    		data-options="validType:'length[0,500]'"  style="width: 573px;height: 50px;" >${t.ev_basicsituation}</textarea>
		    	</td>
		    	</tr>
		    	<tr>
		  		<td  class="sp-td1" >国家领导批示：</td>
		    	<td colspan="3">
		    		<textarea name="t_Bus_EventInfo.ev_guops" class="textarea" 
		    		data-options="validType:'length[0,1000]'"  style="width: 573px;height: 50px;" >${t.ev_guops}</textarea>
		    	</td>
		    	</tr>
		    	<tr>
		  		<td  class="sp-td1" >省领导批示：</td>
		    	<td colspan="3">
		    		<textarea name="t_Bus_EventInfo.ev_shengps" class="textarea" 
		    		data-options="validType:'length[0,1000]'"  style="width: 573px;height: 50px;" >${t.ev_shengps}</textarea>
		    	</td>
		    	</tr>
		    	<tr>
		  		<td  class="sp-td1" >市领导批示：</td>
		    	<td colspan="3">
		    		<textarea name="t_Bus_EventInfo.ev_ships" class="textarea" 
		    		data-options="validType:'length[0,1000]'"  style="width: 573px;height: 50px;" >${t.ev_ships}</textarea>
		    	</td>
		    	</tr>
	    </table>
    </form>
