<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">
<link rel="stylesheet" href="css/_button-group.css">
<link rel="stylesheet" href="css/_buttons.css">




<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]--> 

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">


<!-- JS
================================================== -->
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="js/bootstrap.js"></script>
<script src="js/button.js"></script>
<script src="js/jquery.custom.js"></script>


</head>
<body>
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    <!-- Header -->
       <jsp:include page="khbooks_header.jsp"></jsp:include>
     
    <!-- Blog Content
    ================================================== --> 
    <div class="row">

        <!-- Blog Posts
        ================================================== --> 
        <div class="span9 blog">
			<div class ="check">
				<ul id="filterOptions" class="gallery-cats clearfix"> 
                	<li><a href="bookMain.kh?sortkey=1&sortgenre=${pdto.sortgenre}">날짜순 정렬</a></li>
                	<li><a href="bookMain.kh?sortkey=2&sortgenre=${pdto.sortgenre}">점수순 정렬</a></li>
                	<li><a href="bookMain.kh?sortkey=3&sortgenre=${pdto.sortgenre}">조회순 정렬</a></li>
            	</ul>
			</div>
            <div class="row clearfix">
                <ul class="blog-post-grid">

					<c:forEach items="${bList}" var="list" >
                    <li class="span3 blog-post-item">
                        <div class="blog-post-hover hidden-phone hidden-tablet">
                            <p><a href="bookDetail.kh?bno=${list.bno}" class="clearfix">${list.bname}</a>
                            posted on 9/01/15<br /> 12 comments<br /> posted in photoshop</p>
                        </div>
                        <a href="blog-single.htm"><img src="img/gallery/gallery-img-1-4col.jpg" alt="Post Thumb"></a>
                    </li>
                    </c:forEach>

                </ul>
            </div>

            <!-- Pagination -->
            <div class="pagination">
                <ul>
                <c:choose>
                	<c:when test="${pdto.currentPage==1}">
                		<li class="active"><a href="bookMain.kh?currentPage=1">Prev</a></li>
                	</c:when>
					<c:when test="${pdto.currentPage>1&&pdto.currentPage<pdto.blockPage/2+2}">
                		<li><a href="bookMain.kh?currentPage=1">Prev</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookMain.kh?currentPage=${pdto.currentPage-1}">Prev</a></li>
                	</c:otherwise>
                </c:choose>
                <c:forEach var="i" begin="${-blockPage/2}" end="${pdto.blockPage/2}" step="1" >
                	<c:if test="${(pdto.currentPage+i-1)>0 && ((pdto.currentPage+i-2)<(pdto.endPage))}">
                		<c:choose>
                			<c:when test="${(i+pdto.currentPage-1) == pdto.currentPage}">
                				<li class="active">
                			</c:when>
                			<c:otherwise>
                				<li>
                			</c:otherwise>
                		</c:choose>
                		<a href="bookMain.kh?currentPage=${pdto.currentPage + (i - 1)}">${pdto.currentPage + (i-1)}</a></li>
                	</c:if>
                </c:forEach>
             
                <c:choose>
                	<c:when test="${pdto.currentPage==pdto.endPage}">
                		<li class="active"><a href="bookMain.kh?currentPage=${pdto.endPage}">Next</a></li>
                	</c:when>
                	<c:when test="${pdto.endPage-pdto.currentPage > 0 && pdto.endPage-pdto.currentPage<pdto.blockPage/2}">
                		<li><a href="bookMain.kh?currentPage=${pdto.endPage}">Next</a></li>
                	</c:when>
                	<c:otherwise>
                		<li><a href="bookMain.kh?currentPage=${pdto.currentPage+pdto.blockPage/2+1}">Next</a></li>
                	</c:otherwise>
                </c:choose>
                </ul>
            </div>
        </div>

        <!-- Blog Sidebar
        ================================================== --> 
        <div class="span3 sidebar">

            <!--Search-->
            <section>
                <div class="input-append">
                    <form action="bookSearch.kh">
                        <input id="appendedInputButton" size="16" type="text" name="searchWord" placeholder="Search"><button class="btn" type="submit"><i class="icon-search"></i></button>
                    </form>
                </div>
            </section>

            <!--Categories-->
            <h5 class="title-bg">장르별</h5>
            <%-- <ul class="post-category-list">
            	<c:forEach items="${gList}" var="genrelist">
            		<li><a href="#"><i class="icon-plus-sign"></i>${genrelist.gname}</a></li>
            	</c:forEach>
            </ul> --%>
            <div>
            	<c:forEach items="${gList}" var="glist">
            		<a href="bookMain.kh?sortkey=${pdto.sortkey}&sortgenre=${glist.gno}" style="display:inline-block; width:45%;"><i class="icon-plus-sign"></i>${glist.gname}</a>
            	</c:forEach>
			</div>
            <!--Tabbed Content-->
            <section class="visible-desktop">
            <h5 class="title-bg">More Info</h5>
            <ul class="nav nav-tabs">
                <li class="active"><a href="#comments" data-toggle="tab">Comments</a></li>
                <li><a href="#tweets" data-toggle="tab">Tweets</a></li>
                <li><a href="#about" data-toggle="tab">About</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="comments">
	
                </div>
                <div class="tab-pane" id="tweets">
                    <ul>
                    	<c:forEach items="${tweet}" var="tweet">
                    	<li><a href="#">@${tweet.user.screenName}</a> ${tweet.text}</li>
                    	</c:forEach>
                    </ul>
                </div>
                <div class="tab-pane" id="about">
                    <p>Enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo.</p>

                    Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                </div>
            </div>
            </section>

        </div>

    </div>
    
    </div> <!-- End Container -->
    <!-- Footer -->
    	<jsp:include page="khbooks_footer.jsp"></jsp:include>
    


    <!-- Scroll to Top -->  
    <div id="toTop" class="hidden-phone hidden-tablet">Back to Top</div>
    
</body>
</html>