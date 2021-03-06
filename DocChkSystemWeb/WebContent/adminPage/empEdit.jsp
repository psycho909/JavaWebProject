<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*,java.util.ArrayList" %>

<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("administrator"))
{
    response.sendRedirect("../login.jsp");
}

int emp_No = Integer.valueOf(request.getParameter("Emp_No"));
String No="empAdd.jsp?msg=1&Emp_No=" + emp_No;
EmpolyeeDAOImpl impl = new EmpolyeeDAOImpl();
Empolyee emp =  impl.findByNo(emp_No);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>員工資料維護-編輯</title>
    <link rel="stylesheet" href="../css/input_button_g.css"> 
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#warp{
    width:100%;
    }
#table-warp{
    width:800px;
    margin:0px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
    position: relative;
    float: left;
    left: 50%;
    margin: 100px -400px;
    }
.title{
    width: 788px;
    background:#43464c;
    color:white;
    font-family: 微軟正黑體;
    text-align:center;
    font-size: 22px;
    padding: 6px;
}
.table-head{
    padding-right:15px;
    background:#ea6153;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:100%;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:150px;
    text-align: right;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:250px;
    text-align: left;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
    width:150px;
    text-align: right;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:250px;
    text-align: left;
}

.table-head table,.table-body table{
    width:100%;
    }
#table-b{
    border-collapse:collapse;
     border: 0px;
    }
#table-h,tr,th{
    border-collapse:collapse;
    border: 0px;
    padding: 6.5px;
    }
#table-b,tr,td{
    border-collapse:collapse;
    border: 0px;
    padding: 6px;
    }
.tdselect{
    text-align: left;
}
#delete{
    text-align: center;
    padding: 6px;
}
a{
    text-decoration: none;
    color:white;
    display: inline-block;
}
</style>
</head>
<body>
<div id="warp">
<div id="table-warp">
<form action="<% out.print(No); %>"  method="post">
    <div class="table-head">
        <div class="title">編輯員工基本資料</div>
        <table id="table-h">
            <thead>
            </thead>
        </table>
    </div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->
                <tr>
                    <td>員工編號</td>
                    <td>
                        <input type="text" name="Id" id="Id" value="<%out.print(emp.getId()); %>" >
                    </td>
                    <td>員工密碼</td>
                    <td>
                        <input type="password" name="Pwd" id="Pwd" value="<%out.print(emp.getPwd()); %>">
                    </td>
                </tr>
                <tr>
                    <td>員工姓名</td>
                    <td>
                        <input type="text" name="Name" id="Name" value="<%out.print(emp.getName()); %>">
                    </td>
                    <!--  <td>員工性別</td>
                    <td>
                        <input type="radio" name="sex" id="sex1" value="1">男性
                        <input type="radio" name="sex" id="sex2" value="2">女性
                    </td> -->
                </tr>
                <tr>
                    <td>員工生日</td>
                    <td>
                        <input type="date" name="BirthD" id="BirthD" value="<%out.print(emp.getBirthD()); %>">
                    </td>
                    <td>電子郵件</td>
                    <td>
                        <input type="email" name="Email" id="Email" value="<%out.print(emp.getEmail()); %>" size="30">
                    </td>
                </tr>
                <tr>
                    <td>電話(住家)</td>
                    <td>
                        <input type="text" name="" id="" size="2" maxlength="5">-<input type="text" name="Tel" id="Tel" value="<%out.print(emp.getTel()); %>" size="13" maxlength="20" >
                    </td>
                    <td>電話手機</td>
                    <td>
                        <input type="text" name="CellPhone" id="CellPhone" value="<%out.print(emp.getCellPhone()); %>" size="20" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>通訊地址</td>
                    <td colspan="3">
                        <input type="text" name="Addr" id="Addr" value="<%out.print(emp.getAddr()); %>" size="50" maxlength="20">
                    </td>
                </tr>
                <tr>
                    <td>員工到職日</td>
                    <td>
                        <input type="date" name="InD" id="InD" value="<%out.print(emp.getInD()); %>">
                    </td>
                   <!-- <td>員工Title</td> -->
                    <td>
                        <input type="hidden" name="Title" id="Title" size="20" value="0">
                    </td>
                </tr>
                <tr>
                    <td>員工Depart</td>
                    <td>
                    	<select name="Depart" id="Depart" >
                    	
                    	<option value=<%out.print(emp.getDepart());%> SELECTED> <%out.print(emp.getDepart());%> </option>
                    	<option value=總經理室>總經理室  </option>
                    	<option value=管理部>管理部  </option>
                    	<option value=財務部>財務部  </option>
                    	<option value=資訊部>資訊部  </option>
                    	<option value=業務部>業務部  </option>
                    	<option value=製造部>製造部  </option>
                    	
                    	</select>
                    	<!--<script>document.Depart.value = "<%out.print(emp.getDepart()); %>"</script>
                          <input type="text" name="Depart" size="10"> -->
                    </td>
                    <td>直屬主管</td>
                    <td>
						<select name="BossPosId" id="BossPosId" value="<%out.print(emp.getBossPosId()); %>">
						<%
						Document_PositionDAOImpl impl2=new Document_PositionDAOImpl();
						ArrayList<Document_Position> flowList = impl2.getAll();
						for(Document_Position o : flowList )
						{
						%>
							<option value=<%=o.getPosID() %> > <%=o.getPosTitle() %></option>
						<% } %>	
						</select>
					</td>
                </tr>
                <tr>
                    <td>員工離職日</td>
                    <td colspan="3">
                        <input type="date" name="OutD" id="OutD" value="<%out.print(emp.getOutD()); %>">
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
        <div id="delete">
            <input type="submit" value="送出" name='delete' class="input_button_g">
            <input type="reset" value="重填" name='delete' class="input_button_g">
            <button type="button" class="input_button_g"><a href="empData.jsp" >返回</a>
        </div>
</form>
</div>
</div>
</body>
</html>