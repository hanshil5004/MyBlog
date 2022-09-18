
<%@page import="com.entities.Categories"%>
<%@page import="com.Dao.CatDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.Dao.PostDao"%>
<%@page import="com.entities.User"%>
<%@page errorPage = "error.jsp"%>
<%
    User user = (User) session.getAttribute("liveuser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyPost</title>

        <!-- css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- End css -->

    </head>
    <body>

        <!-- Start Navbar -->

        <nav class="navbar navbar-expand-lg navbar-light primary-background"style="box-shadow: 2px 2px 10px gray inset;">
            <a class="navbar-brand logo" href="currentUser.jsp">MyBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link font-size" href="currentUser.jsp"><span class="fa fa-home mr-1"></span>Home
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle font-size" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-book mr-1"></span>Categories
                        </a>                         
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#" onclick="getAllpost(0)">All</a>
                            <div class="dropdown-divider"></div>
                            <%
                                CatDao cd = new CatDao(ConnectionProvider.getConnection());
                                ArrayList<Categories> list = cd.getCategories();
                                for (Categories c : list) {
                            %>
                            <a class="dropdown-item" href="#" onclick="getAllpost(<%=c.getCid()%>)" ><%=c.getCname()%></a>
                            <div class="dropdown-divider"></div>
                            <%
                                }
                            %>
                        </div>
                    </li>

                    <li class="nav-item ">
                        <a class="nav-link font-size" href="#">
                            <span class="fa fa-phone mr-1"></span>Contact Us
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link font-size" href="#">
                            <span class="fa fa-question-circle-o mr-1"></span>About Us
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link font-size active" href="myPost.jsp">
                            <span class="fa fa-question-circle-o mr-1"></span>My Post
                        </a>
                    </li>
                </ul>

                <!--navbar right buttons-->
                <ul class="navbar-nav mr-right">

                    <span data-toggle="modal" data-target="#profile-modal" style=" cursor: pointer;  border-radius: 50%; height: 40px; width: 40px; background-image: url(profile_pic/<%=user.getProfile()%>); background-size: cover;"></span>
                    <li class="nav-item ">                       
                        <a class="nav-link mr-2" data-toggle="modal" data-target="#profile-modal" style="font: 20px monospace;" href="#!"><%=user.getName()%></a>
                    </li>

                    <!-- Start Profile Modal -->
                    <!-- Modal -->
                    <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header primary-background">
                                    <h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <!--User Details--> 

                                    <div id="profile-div">
                                        <div class="container text-center">
                                            <img class="img-fluid" style="height: 100px; width: 100px; border-radius: 50%;" src="profile_pic/<%=user.getProfile()%>" alt="alt"/>
                                            <h5 style="font: 25px monospace;" class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>  
                                            <br>
                                            <table class="table text-left">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">Phone :</th>
                                                        <td><%=user.getPhone()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Email :</th>
                                                        <td><%=user.getEmail()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Password :</th>
                                                        <td><%=user.getPassword()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Gender :</th>
                                                        <td><%=user.getGender()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">About :</th>
                                                        <td><%=user.getAbout()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Registration Date :</th>
                                                        <td><%=user.getRdate().toString()%></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <!--Edit Profile Details-->
                                    <div id="profile-edit-div"style="display: none">
                                        <!--User Details-->
                                        <div class="container text-center">
                                            <img class="img-fluid" style="height: 100px; width: 100px; border-radius: 50%;" src="profile_pic/<%=user.getProfile()%>" alt="alt"/>                                         
                                            <h4 class="m-2">Edit your Profile Details</h4>
                                        </div>
                                        <form id="submit-form" action="EditeProfile" method="post" enctype="multipart/form-data">
                                            <table class="table text-left">
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">Name :</th>
                                                        <td><input class="form-control" type="text" name="user_name" value="<%=user.getName()%>"></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Phone :</th>
                                                        <td><input class="form-control" type="tel" name="user_phone" value="<%=user.getPhone()%>"></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Email :</th>
                                                        <td><input class="form-control" type="email" name="user_email" value="<%=user.getEmail()%>"></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Password :</th>
                                                        <td><input class="form-control" type="password" name="user_password" value="<%=user.getPassword()%>"></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Gender :</th>
                                                        <td><%=user.getGender()%></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">About :</th>
                                                        <td><textarea name="user_about"class="form-control"><%=user.getAbout()%></textarea></td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">Profile :</th>
                                                        <td><input class="form-control" type="file" name="user_profile" value="<%=user.getProfile()%>"></td>
                                                    </tr>
                                                </tbody>
                                            </table>

                                            <div id="save-btn" class="container text-center">
                                                <button class="btn btn-outline-info" type="submit">Save</button>
                                            </div>
                                            <!--Loader-->
                                            <div class="container text-center" id="loader" style="display: none;">
                                                <span class="fa fa-refresh fa-spin fa-4x"></span>
                                                <p>Please wait...</p>
                                            </div>
                                        </form>
                                    </div>
                                    <!--End Edit Profile Details-->
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button id="edit-btn"type="button" class="btn btn-outline-info">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Profile Modal -->

                    <!--Log Out Button-->
                    <li class="nav-item ">
                        <a class="nav-link btn btn-outline-info btn-sm" href="LogoutServlet">
                            <span class="fa fa-power-off mr-1"></span>Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- End Navbar -->



        <%
            PostDao dao = new PostDao(ConnectionProvider.getConnection());
            List<Post> list1 = dao.getUserPost(user.getId());

        %>

        <!--Start Banner-->

        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background p-3">

                <div class="container">
                    <h4 class="display-3">Welcome, <%=user.getName()%></h4>
                    <p>My Blog  that an inscription uncovered at the Pyramid of Khentkaus I (pictured), identifies Khentkaus I as the mother of two kings, or perhaps the mother of one and a king herself?</p>
                    <p>My Blog  that an inscription uncovered at the Pyramid of Khentkaus I (pictured), identifies Khentkaus I as the mother of two kings, or perhaps the mother of one and a king herself?</p>
                    <br>
                    <!--Add Post Button-->
                    <button class="btn btn-outline-info" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-edit mr-1"></span>Add Post</button>

                    <!--Add Post Modal Start-->
                    <!-- Modal -->
                    <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header primary-background">
                                    <h5 class="modal-title" id="exampleModalLabel">Add Your Post</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <!--post form-->
                                    <form id="post-form" action="PostServlet" method="post"enctype="multipart/form-data">
                                        <div class="form-group">
                                            <select name="post_cid" class="form-control">
                                                <option selected disabled >--- Select Categories ---</option>
                                                <%
                                                    for (Categories cc : list) {
                                                %>
                                                <option value="<%=cc.getCid()%>"><%=cc.getCname()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <input name="post_title" type="text" placeholder="Post Title" class="form-control"/>
                                        </div>
                                        <div class="form-group">
                                            <textarea name="post_content" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                                        </div> 
                                        <div class="form-group">
                                            <label>Select Image :</label>
                                            <input class="form-control" type="file" name="post_pic"/>
                                        </div> 
                                        <div class="text-center form-group" id="post-btn">
                                            <input class="form-control btn-outline-info" type="submit"/>
                                        </div> 
                                        <div class="container text-center" id="loader" style="display: none;">
                                            <span class="fa fa-refresh fa-spin fa-4x"></span>
                                            <p>Please wait...</p>
                                        </div>
                                    </form>
                                    <!--form end-->
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Add Post Modal-->
                </div>
            </div>
        </div>

        <!--End Banner-->



        <div class=" row container-fluid ml-1">
            <%                for (Post p : list1) {

            %>
            <div class="col-md-3">
                <div class="card mt-4" style="border-radius: 15px; box-shadow: 3px 3px 8px gray;">
                    <img class="card-img-top" src="post_pic/<%=p.getPic()%>" alt="alt"/>
                    <div class="card-body">
                        <h5 class="card-title"><%=p.getTitle()%></h5>
                        <p class="card-text"><%=p.getContent()%></p>
                        <a href="login.jsp" class="btn btn-outline-info btn-sm">Read More</a>
                        <p>Post Date: <%=p.getDate()%>
                    </div>
                </div>
            </div>
            <%}%>
        </div>




        <!-- 	JavaScript Link -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <!-- 	my Script -->
        <script type="text/javascript" src="js/script.js"></script>
        <!-- 	End JavaScript Link -->

        <!--Profile modal Script-->
        <script>
                                $(document).ready(function () {
                                    let status = false;
                                    $("#edit-btn").click(function () {
                                        if (status == false) {
                                            $("#profile-div").hide();
                                            $("#profile-edit-div").show();
                                            status = true;
                                            $(this).text("Back");
                                        } else {
                                            $("#profile-edit-div").hide();
                                            $("#profile-div").show();
                                            status = false;
                                            $(this).text("Edit");
                                        }
                                    });
                                });
        </script>

        <!--Profile edit form submit script-->

        <script>
            $(document).ready(function (e) {
                $("#submit-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#save-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "EditProfile",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "Profile Updated Successfully.") {
                                $("#loader").hide();
                                $("#save-btn").show();
                                swal(data, "You clicked the button!", "success")
                                        .then((value) => {
                                            window.location = "currentUser.jsp";
                                        });
                            } else {
                                $("#loader").hide();
                                $("#save-btn").show();
                                swal(data, "You clicked the button!", "error");

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#loader").hide();
                            $("#save-btn").show();
                            swal(data, "You clicked the button!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <!--post Script-->
        <script>
            $(document).ready(function (e) {
                $("#post-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#post-btn").hide();
                    $("#loader").show();
                    $.ajax({
                        url: "PostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            if (data.trim() === "Post Add Successfully.") {
                                $("#loader").hide();
                                $("#post-btn").show();
                                swal(data, "You clicked the button!", "success")
                                        .then((value) => {
                                            window.location = "myPost.jsp";
                                        });
                            } else {
                                $("#loader").hide();
                                $("#post-btn").show();
                                swal(data, "You clicked the button!", "error");

                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#loader").hide();
                            $("#post-btn").show();
                            swal(data, "You clicked the button!", "error");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

        <!--Show Post Script-->
        <script>
            function getAllpost(pcid) {
                $("#loader1").show();
                $("#show-post").hide();
                $.ajax({
                    url: "showPost.jsp",
                    data: {cid: pcid},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader1").hide();
                        $("#show-post").show();
                        $("#show-post").html(data);
                    }
                });
            }
            $(document).ready(function (e) {
                getAllpost(0);
            });
        </script>
    </body>
</html>
