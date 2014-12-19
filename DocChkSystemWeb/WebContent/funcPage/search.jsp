<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String login = "";
if (session.getAttribute("Login") != null )
{
    login = session.getAttribute("Login").toString();
}

if ( ( !login.equals("administrator") ) && ( !login.equals("Employee") ) )
{
    response.sendRedirect("../login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文件簽核系統-文件查詢</title>
    <link rel="stylesheet" href="../css/input_button_g.css">
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
    background:#ea6153;
    color:white;
    font-family: 微軟正黑體;
    text-align:left;
    }
.table-body{
    width:100%; 
    height:100%;
    overflow-y:scroll;
    text-align:left;
    background:#e9e9e9;
    font-family: 微軟正黑體;
    font-size: 16px;
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
.tdselect{
    text-align: left;
}
#delete{
    text-align: center;
    background:#0dadb7;
    padding: 6px;
}
</style>
</head>
<body>
<div id="table-warp">
    <form action="" method="post">
        <div class="table-head">
            <div class="title">文件查詢</div>
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
                        <td>查詢編號</td>
                        <td><input type="text" name="doctype"></td>
                        <td>關鍵字</td>
                        <td><input type="text" name="key"></td>
                    </tr>
                    <tr>
                        <td>文件類型</td>
                        <td colspan="3" class="tdselect">
                            <select name="select" id="select">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>開始日期</td>
                        <td><input type="text" name="start"></td>
                        <td>結束日期</td>
                        <td><input type="text" name="end"></td>
                    </tr>
                    <tr>
                        <td>部門</td>
                        <td class="tdselect">
                            <select name="select" id="select">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                            </select>
                        </td>
                        <td>承辦人</td>
                        <td><input type="text" name="承辦人"></td>
                    </tr>
                </tbody>
            </table>
        </div>
            <div id="delete">
                <input type="button" value="搜尋" name='delete' class="input_button_g">
                <input type="reset" value="重填" name='delete' class="input_button_g" >
            </div>
    </form>
    <div class"iframe-warp">
        <iframe name="s" width="100%" height="350" src="subSearchResult.jsp" frameborder="0" scrolling="no"></iframe>
    </div>
</div>
</body>
</html>