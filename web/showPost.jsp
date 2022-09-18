



<%@page import="java.util.ArrayList"%>
<%@page import="com.entities.Post"%>
<%@page import="com.helper.ConnectionProvider"%>
<%@page import="com.Dao.PostDao"%>
<%
    PostDao pd = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    ArrayList<Post> list = null;
    if (cid == 0) {
        list = pd.getAllPost();
    } else {
        list = pd.getIdByPost(cid);
    }
    if (list.size() == 0) {
        out.println("<h3><b>No Post In This Category.</b></h3>");
    }
%>
<div class=" row">
    <%
        for (Post p : list) {

    %>
    <div class="col-md-4">
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