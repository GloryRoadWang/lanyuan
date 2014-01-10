<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../../common/taglib.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="../../common/common-css.jsp" %>
<%@include file="../../common/common-js.jsp" %>

<script type="text/javascript"
	src="${pageContext.servletContext.contextPath }/js/jquery_1_7_2_min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/css/fenyecss.css" />
<script type="text/javascript">
function permissio(id){
	 var url = "${pageContext.servletContext.contextPath }/background/resources/permissioUser.html?userId="+id;
	 var h_sp1 = 400;
	 var w_sp1 = 350;
	//兼容IE，firefox,google.模态窗口居中问题
	 var iTop2 = (window.screen.availHeight - 20 - h_sp1) / 2;
	 var iLeft2 = (window.screen.availWidth - 10 - w_sp1) / 2;
	 var params = 'menubar:no;dialogHeight=' + h_sp1 + 'px;dialogWidth=' + w_sp1 + 'px;dialogLeft=' + iLeft2 + 'px;dialogTop=' + iTop2 + 'px;resizable=yes;scrollbars=0;resizeable=0;center=yes;location:no;status:no;scroll:no'
	 window.showModalDialog(url, window, params);
	 //location.href=url;
}
function userRole(id){
	 var url = "${pageContext.servletContext.contextPath }/background/user/userRole.html?userId="+id;
	 var h_sp1 = 420;
	 var w_sp1 = 600;
	//兼容IE，firefox,google.模态窗口居中问题
	 var iTop2 = (window.screen.availHeight - 20 - h_sp1) / 2;
	 var iLeft2 = (window.screen.availWidth - 10 - w_sp1) / 2;
	 var params = 'menubar:no;dialogHeight=' + h_sp1 + 'px;dialogWidth=' + w_sp1 + 'px;dialogLeft=' + iLeft2 + 'px;dialogTop=' + iTop2 + 'px;resizable=yes;scrollbars=0;resizeable=0;center=yes;location:no;status:no;scroll:no'
	 window.showModalDialog(url, window, params);
	 //location.href=url;
}

function checkUser(userId){
	window.location.href="${pageContext.servletContext.contextPath }/background/user/checkUserStatus.html?userId="+userId;   
}
</script>
</head>
<body>
<form id="fenye" name="fenye" action="${pageContext.servletContext.contextPath }/background/user/query.html" method="post">
<table width="100%">
  <tr>
    <td height="30" background="${pageContext.servletContext.contextPath }/images/tab_05.gif"><table width="100%">
      <tr>
        <td width="12" height="30"><img src="${pageContext.servletContext.contextPath }/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%">
          <tr>
            <td width="46%" valign="middle"><table width="100%">
              <tr>
                <td width="5%"><div align="center"><img src="${pageContext.servletContext.contextPath }/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：系统管理-用户列表</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="${pageContext.servletContext.contextPath }/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  <td align="center">
  <!-- 这里的表单 name 必须是fenye -->
  	<div class="search_k" align="left">
		<fieldset class="search">
			<legend><img src="${pageContext.servletContext.contextPath }/images/search_btn.gif" align="middle"/>&nbsp;<span class="STYLE1" style="color: blue;">高级查找</span></legend>
			<div class="search_content">
				用户名：<input type="text" name="userName" value="${param.userName}" style="height: 20px"/>　　
				<input type="submit" value="开始查询" class="input_btn_style1"/>&nbsp;&nbsp;
				<input type="reset" value="重置" class="input_btn_style1"/>
				<c:if test="${userSession.roleName eq 'admin' || userSession.roleName eq 'super'}">
				<input type="hidden" value="${param.statusFlag}" class="input_btn_style1" name="statusFlag"/>
				</c:if>
				
			</div>
		</fieldset>
	</div>
  </td>
  </tr>
  <tr>
    <td>
    <div style="padding-left: 10px;padding-bottom: 5px;">
         <input type="button" value="批量删除" class="input_btn_style1" onclick="return deleteAll()"/>&nbsp;&nbsp;
     </div>
    <table class="listtable" width="100%">
      <tr>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_12.gif">&nbsp;</td>
        <td><table class="ttab" width="100%" cellspacing="1" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" >
              <input id="chose" type="checkbox" name="checkbox" onclick="selectAllCheckBox()" />
            </td>
 
            <td width="12%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">用户名</span></td>
           <%--  <td width="12%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif" ><span class="STYLE1">所属组</span></td> --%>
            <td width="12%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">所属通道</td>
            
            <td width="15%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">账号类型</td>
            <td width="15%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">注册时间</td>
            <td width="5%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">状态</td>
            <td width="30%" height="22" background="${pageContext.servletContext.contextPath }/images/bg.gif"  class="STYLE1">基本操作</td>
          </tr>
          
          <c:forEach var="key" items="${pageView.records}">
          <c:if test="${key.level ne '0'}">
          
          <tr>
            <td height="20" >
              <input type="checkbox" name="check" value="${key.userId}" />
            </td>
            
            <td height="20" ><span class="STYLE1"><a href="${pageContext.servletContext.contextPath }/background/user/getById.html?userId=${key.userId}&&type=0">${key.userName}</a></span></td>
            <%-- <td height="20" ><span class="STYLE1" style="color: blue;">${key.roleName}</span></td> --%>
            <td height="20" ><span class="STYLE1">${key.channelname}</span></td>
            <td height="20" ><span class="STYLE1">
           ${key.accountType}
            </span></td>
            <td height="20" ><span class="STYLE1">
             <fmt:parseDate value="${key.regTime}" var="date" pattern="yyyy-MM-dd HH:mm:ss" />
			<fmt:formatDate value="${date}" pattern="yyyy-MM-dd HH:mm:ss" />
            </span></td>
            <td height="20" ><span class="STYLE1">
			<c:if test="${key.status eq '0'}">
			<font color="red">待审核</font>
			</c:if>
			<c:if test="${key.status eq '1'}">
			<font color="blue">审核通过</font>
			</c:if>
            </span></td>
            <td height="20" ><span class="STYLE4">
             <sec:authorize ifAnyGranted="ROLE_sys_user_shenhe">
            &nbsp; &nbsp;
            <a href="javascript:void(0);" onclick="checkUser('${key.userId}')">审核客户
            </a>
            </sec:authorize>
             <sec:authorize ifAnyGranted="ROLE_sys_user_fenpeirole">
             &nbsp; &nbsp;
             <img src="${pageContext.servletContext.contextPath }/images/role.png" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="userRole('${key.userId}')">
            	分配角色</a>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_sys_user_permissions">
            <img src="${pageContext.servletContext.contextPath }/images/resc.png" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="permissio('${key.userId}')">分配权限</a>&nbsp;&nbsp;&nbsp;&nbsp;
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_sys_user_edit">
            <img src="${pageContext.servletContext.contextPath }/images/edt.gif" width="16" height="16" />
            <a href="${pageContext.servletContext.contextPath }/background/user/getById.html?userId=${key.userId}&&type=1">
                                     编辑
            </a>
           </sec:authorize>
           <sec:authorize ifAnyGranted="ROLE_sys_user_delete">
            <img src="${pageContext.servletContext.contextPath }/images/del.gif" width="16" height="16" />
            	<a href="javascript:void(0);" onclick="deleteId('${pageContext.servletContext.contextPath }/background/user/deleteById.html?userId=${key.userId}');">
            	删除</a>
            	</sec:authorize>
            	</span></td>
          </tr>
          </c:if>
          </c:forEach>
        </table></td>
        <td width="8" background="${pageContext.servletContext.contextPath }/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="${pageContext.servletContext.contextPath }/images/tab_19.gif"><%@include file="../../common/webfenye.jsp" %>
    </td>
  </tr>
</table>
</form>
</body>
</html>