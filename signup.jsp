<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
  <!-- shop section -->
  <section class="shop_section layout_padding">
    <div class="container">
        <div class="heading_container heading_center">
        <h2>
          Sign up
        </h2>
        </div>
        <form action="UserSignUp">
            <div class="row">
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
                <div class="col-sm-12 col-md-4 col-lg-4">
                    <%
                        String message = (String) session.getAttribute("registration");
                        //Checking creditionals whether there are null or not
                        if (message != null) {
                            session.removeAttribute("credential");
                    %>
                    <br>
                    <div class="alert alert-danger" id="danger"><%= message %></div>
                    <%
                          }
                    %>
                    <input class="form-control" type="text" name="username" placeholder="Enter Username" required>
                    <br>
                    <input class="form-control" type="email" name="email" placeholder="Enter Email" required>
                    <br>
                    <input class="form-control" type="number" name="contact" placeholder="Enter Contact Detail" required>
                    <br>
                    <input class="form-control" type="password" name="password" placeholder="Enter Password" required>
                    <br>
                    <input class="form-control btn-info btn-info" type="submit" name="user_signup" value="Sign Up">
                </div>
                <div class="col-sm-12 col-md-4 col-lg-4"></div>
        </div>
        </form>
    </div>
  </section>
<%@include file="footer.jsp" %>