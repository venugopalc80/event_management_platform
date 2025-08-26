<%
    if(session.getAttribute("user")!=null){   
    ResultSet rs = DBConnect.getResultFromSqlQuery("select * from event_list");
    %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="eventmgt_servlet.*, java.sql.*"%>
<%@include file="header.jsp" %>
<section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
        <h2>
          Add New Event
        </h2>
        </div>
        <form action="AddEvents" method="POST">
            <div class="row">
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <div class="col-sm-12 col-md-4 col-lg-4">                                    
                    <input type="text" name="name" class="form-control" placeholder="Enter Name" />
                    <br>
                    <select class="form-control" name="type">
                        <% while(rs.next()){ %>
                        <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                        <% } %>
                    </select>
                    <br>
                    <input type="date" name="event_date" class="form-control" placeholder="Enter Event Date" />
                    <br>
                    <input type="text" name="location" class="form-control" placeholder="Enter Location" />
                    <br>
                    <textarea class="form-control" name="detail" placeholder="Enter Detail"></textarea>
                    <br>
                    <input type="submit" class="form-control btn-info" name="addevent" value="Add New"><br>
                    <input type="reset" class="form-control btn-info" value="clear">
                    <%
                        String message = (String) session.getAttribute("errormsg");
                        if (message != null) {
                            session.removeAttribute("errormsg");
                    %>
                    <br>
                    <br>
                    <div class="alert alert-danger" id="danger"><%= message %></div>
                    <%
                          }
                    %>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
        </div>
        </form>
    </div>
  </section>
<%@include file="footer.jsp" %>
<% } else {
    response.sendRedirect("signin.jsp");
}
%>