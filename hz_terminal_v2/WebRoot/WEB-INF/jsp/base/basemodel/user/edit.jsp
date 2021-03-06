<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ include file="/include/inc.jsp"%>
  <script>

	var flagForDeptAdd=true;
  	window.setTimeout(function(){
	  		$("#uaccount").next("span").children("input").eq(0).bind("blur",judgeAccount);
  	  	},1000);

  	function judgeAccount(){
  		$.post("<%=basePath%>Main/user/ifExistAccount", {account:$('#uaccount').val().trim(),uid:${user.user_id}},
				function (data, textStatus){
					if(!data.success){
						$("#uaccount").next("span").tooltip('destroy');
						$("#uaccount").next("span").children("input").eq(0).removeClass("custombox-invalid");
						flagForDeptAdd=true;
					}
					else{
						$("#uaccount").next("span").tooltip({
							position:'right',
							content:'登录帐号已存在',
							onShow: function(){
							$(this).tooltip('tip').css({
								backgroundColor: 'rgb(255, 255, 204)',
								borderColor: ' rgb(204, 153, 51)'
							});
					    }
						});
						$("#uaccount").next("span").addClass("textbox-invalid");
						$("#uaccount").next("span").children("input").eq(0).addClass("custombox-invalid");
						flagForDeptAdd=false;
					}
				}, "json");
  	}
    
  	function onSubmit(){
  		$('#form1').form('submit',{
  			onSubmit:function(){
				return $(this).form('enableValidation').form('validate') && flagForDeptAdd;
			},
			success:function(result){
				var obj=$.parseJSON(result);
				if(obj.success){
					$('#editDialog').dialog('close');
					refreshGrid();
				}
			}
		});
  	}

  </script>

<form id="form1" method="post" action="<%=basePath %>Main/user/save" style="width: 100%;">
	<input type="hidden" name="act" value="update" />
	<input type="hidden" name="t_Sys_User.user_id" value="${user.user_id }" />
	<table id="table" class="sp-table" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td class="sp-td1">用户姓名</td>
			<td>
				<input type="text" name="t_Sys_User.user_name" data-options="prompt:'请输入用户姓名',required:true,icons:iconClear"
					class="easyui-textbox" style="width: 180px;" value="${user.user_name }" />
			</td>
		</tr>
		<tr>
			<td class="sp-td1">用户帐号</td>
			<td>
				<input type="text" name="t_Sys_User.user_account" id="uaccount" required="true"
					data-options="prompt:'请输入登录帐号',icons:iconClear" class="easyui-textbox" style="width: 180px;"
					value="${user.user_account }" />
			</td>
		</tr>
		<tr>
			<td class="sp-td1">密码</td>
			<td>
				<input id="pwd" type="password" name="password" data-options="validType:'password'" class="easyui-textbox"
					style="width: 180px;" value="${password}" />
			</td>
		</tr>
		<tr>
			<td class="sp-td1">确认密码</td>
			<td>
				<input type="password" name="password2" value="${password}" class="easyui-textbox" style="width: 180px;"
					validType="equals['#pwd']" />
			</td>
		</tr>
		<tr>
			<td class="sp-td1">所属部门</td>
			<td>
				<input class="easyui-combotree" name="t_Sys_User.dept_id"
					data-options="url:'<%=basePath%>Main/department/getComboTree',method:'get',required:true,value:${user.dept_id}"
					style="width: 180px;">
			</td>
		</tr>
		<tr>
			<td class="sp-td1">坐席编号</td>
			<td>
				<input type="text" name="t_Sys_User.seatID" data-options="prompt:'请输入坐席编号',required:true,icons:iconClear"
					class="easyui-textbox" style="width: 180px;" value="${user.seatID}"/>
			</td>
		</tr>
		<tr>
			<td class="sp-td1">技能组</td>
			<td>
				<input class="easyui-combotree" name="t_Sys_User.ugrpno"
					data-options="url:'Main/busParam/getTypeTree/UGRP-1-1',method:'get',required:true,value:'${user.ugrpNO}'"
					style="width: 180px;">
			</td>
		</tr>
		<tr>
			<td class="sp-td1">级别</td>
			<td>
				<input class="easyui-combotree" name="t_Sys_User.oplevel"
					data-options="url:'Main/busParam/getTypeTree/OPLEVEL-1-1',method:'get',required:true,value:'${user.opLevel}'"
					style="width: 180px;">
			</td>
		</tr>
		<tr>
			<td class="sp-td1">拨打权限</td>
			<td>
				<input class="easyui-combotree" name="t_Sys_User.calllevel"
					data-options="url:'Main/busParam/getTypeTree/CALLLEVEL-1-1',method:'get',required:true,value:'${user.callLevel}'"
					style="width: 180px;">
			</td>
		</tr>
		<tr>
			<td class="sp-td1">是否启用</td>
			<td>
				<select name="t_Sys_User.status" class="easyui-combobox" style="width: 80px;"
					data-options="editable:false,value:${user.status }">
					<option value="1">启用</option>
					<option value="2">禁用</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="sp-td1">默认排序</td>
			<td>
				<input type="text" name="t_Sys_User.orderid" class="easyui-numberbox"
					data-options="precision:0,min:0,max:999,icons:iconClear" style="width: 180px;" />
			</td>
		</tr>
	</table>
</form>

