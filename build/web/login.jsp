<%-- 
    Document   : login
    Created on : Jul 28, 2022, 2:20:38 PM
    Author     : Parth
--%>



<%@page import="com.entities.Msg"%>
<%@page import="com.entities.Categories"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.Dao.CatDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="ISO-8859-1">
        <title>Login</title>

        <!-- css -->

        <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- End css -->

    </head>
    <body>

        <!-- Start Navbar -->

        <nav class="navbar navbar-expand-lg navbar-light primary-background"style="box-shadow: 2px 2px 10px gray inset;">
            <a class="navbar-brand logo" href="index.jsp">MyBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active"><a class="nav-link font-size"
                                                   href="index.jsp"><span class="fa fa-home mr-1"></span>Home <span
                                class="sr-only">(current)</span> </a></li>

                    <li class="nav-item "><a class="nav-link font-size" href="#"><span class="fa fa-phone mr-1"></span>Contact
                            Us</a></li>
                    <li class="nav-item "><a class="nav-link font-size" href="#"><span class="fa fa-question-circle-o mr-1"></span>About
                            Us</a></li>
                </ul>

                <!--sing up button-->
                <button class="btn btn-outline-info m-1" type="button" data-toggle="modal" data-target="#form-modal1"><span class="fa fa-user-plus mr-1"></span>SingUp</button>

                <!-- 	Start Sing Up Modal -->
                <!-- Modal -->
                <div class="modal fade" id="form-modal1" tabindex="-1" role="dialog"
                     aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header primary-background">
                                <h5 class="modal-title ml-1" id="exampleModalLabel">MyBlog</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="modal-header">
                                    <div class="container text-center">
                                        <span class="fa fa-user-plus fa-2x mr-1"></span>
                                        <h5 class="modal-title ml-1" id="exampleModalLabel">Profile Details</h5>
                                    </div>                                   
                                </div>
                                <br>
                                <form id="singup-modal"action="SingupServlet" method="post" enctype="multipart/form-data">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="inputName">Name : </label> 
                                            <input type="text"class="form-control" required id="inputName" placeholder="Name" name="user_name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPhone">Phone Number : </label>
                                            <input type="tel"  class="form-control" required id="inputPhone" placeholder="Phone Number" name="user_number">                                                    
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputEmail4">Email : </label>
                                            <input type="email" class="form-control" required id="inputEmail4" placeholder="Email" name="user_email">

                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="inputPassword4">Password : </label>
                                            <input type="password" class="form-control" required id="inputPassword4" placeholder="Password" name="user_password">                                 
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputAddress">About : </label> <br>
                                        <textarea class="form-control" rows="2" cols="58" name="user_about"></textarea>
                                    </div>
                                    <div class="form-group ">
                                        <label for="inputPhone">Gender : </label>
                                        <br>
                                        <input type="radio" name="user_gender" value="Male"> Male
                                        <input class="ml-2" type="radio" name="user_gender" value="Female"> Female
                                        <input class="ml-2" type="radio" name="user_gender" value="Other"> Other
                                    </div>
                                    <div class="form-group ">
                                        <label for="inputFile">Profile : </label>
                                        <br>
                                        <input type="file" id="inputFile" name="user_profile" required="">
                                    </div>
                                    <div class="form-group">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="gridCheck" name="box">
                                            <label class="form-check-label" for="gridCheck">i agree term and condition</label>
                                        </div>
                                    </div>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <p>Please wait...</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-outline-info" id="submit-btn">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 	End Sing Up Modal -->
        </nav>

        <!-- End Navbar -->


        <!-- 	Start Main Body -->

        <main class="d-flex align-items-center" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-center">
                                <span class="fa fa-user-circle fa-3x"></span>
                                <p class="mb-0 mt-1">Login</p>
                            </div>
                            <%
                                Msg m = (Msg) session.getAttribute("msg");

                                if (m != null) {
                            %>
                            <div class="alert <%=m.getCss()%>" role="alert">
                                <%=m.getContent()%>
                            </div>
                            <%
                                    session.removeAttribute("msg");
                                }
                            %>


                            <div class="card-body">
                                <form id="login-form" action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1"aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label> 
                                        <input name="user_password" required type="password" class="form-control"id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <br>
                                    <div class="container text-center" id="loader" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-4x"></span>
                                        <p>Please wait...</p>
                                    </div>
                                    <div class="conteiner text-center">
                                        <button id="login" type="submit" class="btn btn-primary">Login</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- 	End Main Body -->



        <!-- 	JavaScript Link -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!-- 	my Script -->
        <script type="text/javascript" src="js/script.js"></script>
        <!-- 	End JavaScript Link -->

        <!--sing up modal script-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script>
            $(document).ready(function (e) {
                $("#singup-modal").on("submit", function (event) {

                    event.preventDefault();

                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "SingupServlet",
                        type: "post",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "Sing Up Successfully") {
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal(data, "You clicked the button!", "success")
                                        .then((value) => {
                                            window.location = "login.jsp";
                                        });
                            } else {
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal(data, "You clicked the button!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show();
                            $("#loader").hide();
                            swal(data, "You clicked the button!", "error");
                        },
                        processData: false,
                        contentType: false

                    });
                });
            });

        </script>
        <script>
            $(document).ready(function (e) {
                $("#login-form").on("submit", function (event) {

                    $("#login").hide();
                    $("#loader").show();

                });
            });
        </script>


    </body>
</html>
