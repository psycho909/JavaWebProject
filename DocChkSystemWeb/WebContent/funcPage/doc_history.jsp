<%@ page import="sun.applet.resources.MsgAppletViewer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="DocChkDbAccess.*"%>
<!DOCTYPE html>

<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if (!login.equals("Employee"))
{
    response.sendRedirect("../login.jsp");
}
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>歷史查詢</title>
<style>
*{
    margin:0px 0px;
    padding:0px 0px;
    }
#table-warp{
    width:800px;
    margin:6px auto;
    text-align:center;
    box-shadow: 0 1px 3px rgba(0,0,0,0.2);
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
    padding-right:17px;
    background-color:#0dadb7;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:430px;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
    }
.table-head th:first-of-type,.table-body td:first-of-type{
    width:50px;
}
.table-head th:nth-child(2),.table-body td:nth-child(2)
{
    width:50px;
}
.table-head th:nth-child(3),.table-body td:nth-child(3)
{
    width:100px;
}
.table-head th:last-of-type,.table-body td:last-of-type
{
    width:600px;
}
.table-head table,.table-body table{
    width:100%;
    }
.table-body table tr:nth-child(2n+1){
    background-color:#f6f6f6;
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
a{
    text-decoration: none;
    color:black;
}
a:hover{
    color:#58C3E5;
}
</style>
</head>
<body>
<%
    DocLibraryListDAODBImpl  impl = new DocLibraryListDAODBImpl();
    DocLibraryList[] r = impl.findAll();
%>
<div id="table-warp">
    <div class="table-head">
        <div class="title">歷史查詢</div>
        <table id="table-h">
            <thead>
                <tr>
                <th>件速</th>
                <th>類型</th>
                <th>日期</th>
                <th>主旨</th>              
                </tr>
            </thead>
        </table>
    </div>
    <div class="table-body">
        <table id="table-b">
            <tbody>
                <!--更改下面-->              
            <%
            if( ( r != null ) && ( r.length != 0 ) )
            {
                for (int i=0;i<r.length;i++)
                {
            %>
	            <tr>
	                <td><% out.print(r[i].getDou_Speed());  %></td>
	                <td><% out.print(r[i].getDou_Type()); %></td>      
	                <td>
	                <%  if (r[i].getDou_Date() !=null)
	                    {
	                        out.print(r[i].getDou_Date().substring(0,11));
	                    }
	                    else
	                    {
	                        out.print(" ");
	                    }
	                %>
	                </td>
	                <td>
	                    <a href="doc_list.jsp?Lib_TmpId=<% out.print(r[i].getLib_TmpId()); %>"><%=r[i].getDou_Keynote()%></a>
	                </td> 
	            </tr>
            <%  }
            }
            else
            {
            %>
                <tr><td colspan="4" >無歷史資料</td></tr> 
            <%
            }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>