<%@page contentType="text/html" pageEncoding="UTF-8" import="eventmgt_servlet.*, java.sql.*"%>
<%@include file="header.jsp" %>
<% ResultSet rs = DBConnect.getResultFromSqlQuery("select * from rsvp_attendance where uid="+request.getParameter("uid")+" AND eid="+request.getParameter("eid")); 
boolean flag=false;
%>
  <!-- shop section -->
  <section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
        <h2>
          Manage RSVP
        </h2>
        </div>
        <form action="ManageRSPV">
            <div class="row">
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <div class="col-sm-12 col-md-4 col-lg-4">
                    <% if(rs!=null){
                        if(rs.next()){  
                        flag = true;
                        
                        do{
                        
                    %>
                    
                    <p>Number of Attendees: <%=rs.getString(5) %></p>
                    <p>Your Attendance status: <%=rs.getString(4) %></p>
                  <% }while(rs.next()); 
                    } } else {
                        out.println("Error in Connection");
                    }
                        %>
                        
                    <input class="form-control" type="number" name="attendees" placeholder="Enter Number of Attendees" required>
                    <br>
                    <label>Select your attendance status</label>
                    <input type="hidden" name="eid" value="<%=request.getParameter("eid") %>">
                  
                    <select name="status" class="form-control" required>
                        <option value="required">Required</option>
                        <option value="not-required">Not Required</option>
                    </select>
                    <br>
                    <% if(flag == true) { %>
                    <input class="form-control btn-info btn-info" type="submit" name="addrsvp" value="Update">
                    <% } else { %>
                    <input class="form-control btn-info btn-info" type="submit" name="addrsvp" value="Add">
                    <% } %>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
        </div>
        </form>
    </div>
  </section>
<%@include file="footer.jsp" %>