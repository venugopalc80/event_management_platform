<%@page contentType="text/html" import="eventmgt_servlet.DBConnect, java.sql.*" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
  <!-- shop section -->

  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h1>
            Welcome to Event Management System
          </h1>
          
        <h2>
            We organize the events like!!!
        </h2>
      </div>
        <% 
        ResultSet rs = DBConnect.getResultFromSqlQuery("select * from event_list");
        %>
      <div class="row">
        <%
                if(rs!=null){
                if(rs.next()){  
                do{
            %>
        <div class="col-sm-6 col-md-3 col-lg-3">
          <div class="box">
              <div class="detail-box" style="display:block;">
                  <a href="index.jsp?type=<%=rs.getString(2) %>"><h6 align="center"><%=rs.getString(2) %></h6></a>
                </div>
          </div>
        </div>
        <% }while(rs.next()); 
        } else {
            out.println("<h3>There is no any registered event found.</h3>");
        } } else {
            out.println("<h3>Error in Connection</h3>");
        }
        
            %>

      </div>
            <div class="btn-box">
        <a href="events.jsp">
          Register your event now
        </a>
      </div>
            <div class="row m-5">
                <div class="col-sm-12 col-md-12 col-lg-12">
                    <h3 align="center">Registered Events</h3>
                </div>
                <%
                    ResultSet rs_event;
                    String type = request.getParameter("type");
                    if(type!=null)
                        rs_event = DBConnect.getResultFromSqlQuery("SELECT `eid`, `uid`, `name`, `type`, `date`, `location`, `detail`,(SELECT `attendees` FROM `rsvp_attendance` WHERE `eid` = `events`.`eid`) as 'Total', (SELECT COUNT(*) FROM `rsvp_attendees_count` WHERE `eid` = `events`.`eid`) FROM `events` WHERE `type`='"+type+"'");
                    else
                        rs_event = DBConnect.getResultFromSqlQuery("SELECT `eid`, `uid`, `name`, `type`, `date`, `location`, `detail`,(SELECT `attendees` FROM `rsvp_attendance` WHERE `eid` = `events`.`eid`) as 'Total', (SELECT COUNT(*) FROM `rsvp_attendees_count` WHERE `eid` = `events`.`eid`) FROM `events`");
                    if(rs_event!=null){
                if(rs_event.next()){  
                do{
            %>
        <div class="col-sm-12 col-md-4 col-lg-4">
          <div class="box">
              <div class="box">
              <div class="detail-box" style="display:block;">
                  <h6 align="center"><%=rs_event.getString(3) %></h6>
                  <p>Type: <%=rs_event.getString(4) %></p>
                  <p>Date: <%=rs_event.getString(5) %></p>
                  <p>Location: <%=rs_event.getString(6) %></p>
                  <p>Detail: <%=rs_event.getString(7) %></p>
                  <p>Capacity: <%=rs_event.getString(8) %></p>
                  <p>Number of Attendees: <b><%=rs_event.getString(9) %></b><br>(Excluding Organizer)</p>
                  <% if(session.getAttribute("user")!=null) {
                  if(!rs_event.getString(2).equals(session.getAttribute("uid"))){
                      
                  ResultSet rs_rsvp_count = DBConnect.getResultFromSqlQuery("select count(uid) from rsvp_attendees_count where eid = "+rs_event.getString(1) + " AND uid = "+session.getAttribute("uid"));
                  
                  if(rs_rsvp_count!=null) {
                    rs_rsvp_count.next();
                      }  
                  if(!rs_rsvp_count.getString(1).equals("0")){
                  %>
                  <b>Your Attendance : Checked</b>
                  <%
                     rs_rsvp_count.close(); } else { 
                  %>
                  <form method="POST" action="RSVP_count">
                      <input type="hidden" name="uid" value="<%=session.getAttribute("uid") %>">
                      <input type="hidden" name="eid" value="<%=rs_event.getString(1) %>">
                      <input type="submit" class="btn btn-info" value="Will You Attend?" name="user_attendance">
                  </form>
                      <% } } else { %>
                      <i><u>You are the organizer</u></i>    
                  <%}}%>
                </div>
          </div>
          </div>
        </div>
        <% }while(rs_event.next()); 
        } else {
            out.println("<h3>There is no any registered event found.</h3>");
        } } else {
            out.println("<h3>Error in Connection</h3>");
        }
            %>
        
            </div>
    </div>
  </section>

  <!-- end shop section -->

 
 
<%@include file="footer.jsp" %>
