<%@page contentType="text/html" import="eventmgt_servlet.DBConnect, java.sql.*" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<% 
        ResultSet rs;
        String eventDate = request.getParameter("eventDate");
        String eventLocation = request.getParameter("eventLocation");
        String eventType = request.getParameter("eventType");
        String qry = null;
        //String query = "SELECT * FROM events";
        if(session.getAttribute("user")!=null){
            //rs = DBConnect.getResultFromSqlQuery("select * from events where uid="+session.getAttribute("uid"));
            qry = "select * from events where uid="+session.getAttribute("uid");
            if(eventDate != null && !eventDate.trim().isEmpty()){
                qry += " AND date = '" + eventDate + "'";
            }
            if(eventLocation != null && !eventLocation.trim().isEmpty()){
                qry += " AND location LIKE '%"+eventLocation+"%'";
            }
            if(eventType != null && !eventType.trim().isEmpty()){
                qry += " AND type LIKE '%" + eventType + "%'";
            }
            rs = DBConnect.getResultFromSqlQuery(qry);
        } else {
            rs = DBConnect.getResultFromSqlQuery("select * from event_list");
        
        }%>
  <section class="shop_section layout_padding">
    <div class="container">
      <div class="heading_container heading_center">
        <h2>
          Events
        </h2>
      </div>
        <div class="btn-box">
        <a href="AddEvent.jsp">
          Add New Event
        </a>
      </div>
      <div class="row">
          <% 
                if(session.getAttribute("user")!=null){
                
                if(rs!=null){
                if(rs.next()){
            %>
            <div class="col-sm-12 col-md-12 col-lg-12">                
                <br>
                <h3 align="center">Hello, <%=session.getAttribute("user") %></h3>
                <p align="center">Your registered event list</p>
            </div>
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <div class="col-sm-12 col-md-4 col-lg-4">
                    <form method="get" action="events.jsp">
                        <div class="form-group">
                            <label>Select Event Date</label>
                            <input type="date" id="eventDate" name="eventDate" placeholder="Select Event Date" class="form-control" value="<%= eventDate != null ? eventDate : ""%>">
                        </div>
                        <div class="form-group">
                            <input type="text" id="eventLocation" name="eventLocation" class="form-control" placeholder="Enter location" value="<%= eventLocation != null ? eventLocation : "" %>">
                        </div>
                        <div class="form-group">
                            <input type="text" id="eventType" name="eventType" class="form-control" placeholder="Enter event type" value="<%= eventType != null ? eventType : "" %>">
                        </div>
                        <input type="submit" class="btn btn-info" value="Filter Event">
                    </form>
      
                </div>
                      <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <%
                do{
            %>
        <div class="col-sm-6 col-md-6 col-lg-6">
          <div class="box">
              <div class="detail-box" style="display:block;">
                  <h6 align="center"><%=rs.getString(3) %><hr></h6>
                  <p>Type: <%=rs.getString(4) %></p>
                  <p>Date: <%=rs.getString(5) %></p>
                  <p>Location: <%=rs.getString(6) %></p>
                  <p>Detail: <%=rs.getString(7) %></p>
                  <form method="POST" action="RSVP.jsp">
                      <input type="hidden" name="uid" value="<%=rs.getString(2) %>">
                      <input type="hidden" name="eid" value="<%=rs.getString(1) %>">
                      <input type="submit" class="btn btn-info" value="Manage RSVP">
                  </form>
                      <br>
                  <form method="POST" action="DeleteEventByUser">
                      <input type="hidden" name="eid" value="<%=rs.getString(1) %>">
                      <input type="submit" class="btn btn-info" name="delete_event" value="Delete Event">
                  </form>    
                </div>
          </div>
        </div>
        <% }while(rs.next()); 
        } else {
            out.println("<h3>There is no any registered event found.</h3>");
        } } else {
            out.println("<h3>Error in Connection</h3>");
        }
        } else {
%>
<div class="col-sm-12 col-md-12 col-lg-12">
    <br>
<h3 align="center">We provide events like...</h3>
</div>
<%
                if(rs!=null){
                if(rs.next()){  
                do{
            %>
        <div class="col-sm-6 col-md-6 col-lg-6">
          <div class="box">
              <div class="detail-box" style="display:block;">
                  <h6 align="center"><%=rs.getString(2) %></h6>
                </div>
          </div>
        </div>
        <% }while(rs.next()); 
        } else {
            out.println("<h3>There is no any registered event found.</h3>");
        } } else {
            out.println("<h3>Error in Connection</h3>");
        }
        }
            %>
        
      </div>
    </div>
  </section>

  <!-- end shop section -->
  <%@include file="footer.jsp" %>