<%@ page import="java.sql.*, eventmgt_servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
  <!-- shop section -->
  <section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
        <h2>
          Sign in
        </h2>
        </div>
        <form action="UserSignIn" method="POST">
            <div class="row">
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <div class="col-sm-12 col-md-4 col-lg-4">
                    <%
                        String errormsg = (String) session.getAttribute("errormsg");
                        if (errormsg != null) {
                        session.removeAttribute("errormsg");
                    %>
                    <div class="alert alert-danger" id="danger"><%= errormsg %></div>
                    <%
                        }
                    %>
                    <input class="form-control" name="username" type="text" placeholder="Enter Username">
                    <br>
                    <input class="form-control" name="password" type="password" placeholder="Enter Password">
                    <br>
                    <input class="form-control btn-info" type="submit" name="login" value="login">
                    <br>
                    <a href="signup.jsp">Not registered yet? Register Now</a>
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
        </div>
        </form>
    </div>
  </section>
<%@include file="footer.jsp" %>