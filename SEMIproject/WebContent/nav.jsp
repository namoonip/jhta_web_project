<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<title>Boutique SARA C</title>

<div class="jumbotron text-center">
	<h2><a href="/main.jsp"><img src="/itemImage/sara.jpg" alt="brand" style="width: 20%"/></a></h2>
</div>
	<br />
	<br />
	<br />
<nav class="navbar w3-white">
	<div class="container">
		<%
			HttpSession session = request.getSession(false);
		%>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">INTRO<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/about.jsp">ABOUT</a></li>
						<li class="divider"></li>
						<li><a href="/campaign17.jsp">CAMPAING</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">OUTER <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=1&pno=1">COAT</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=2&pno=1">PADDING</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=3&pno=1">JAKET</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=4&pno=1">CARDIGAN</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=5&pno=1">BLAZER</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">TOP
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=6&pno=1">M TO M</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=7&pno=1">T-SHIRTS</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=8&pno=1">KNIT</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=9&pno=1">HOODIE</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=10&pno=1">SHIRTS</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">BOTTOM
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=11&pno=1">JEAN</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=12&pno=1">SHORTS</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=13&pno=1">TRAINER PANTS</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=14&pno=1">SLACKS</a></li>
					</ul>
				</li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">ACC
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=15&pno=1">BELT</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=16&pno=1">HAT</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=17&pno=1">WATCH</a></li>
						<li class="divider"></li>
						<li><a href="/thumbnail/thumbnailkind.jsp?cartNo=18&pno=1">SUNGLASS</a></li>
					</ul>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<%
				boolean isLogined = false;
				boolean isAdmin = false;
				UserVO _user = null;
				
				if (session != null) {
					
					_user = (UserVO) session.getAttribute("LOGINED_USER");
					if (_user != null) {
						isLogined = true;
						if (_user.getId().equals("admin")) {
							isAdmin = true;
						}
					}
				}
			%>
			<%
			if (!isLogined) {
			%>
			
	            <!-- 비 로그인 유저가 보는 메뉴 -->
	            <li><a href="/member/view/loginForm.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Sign in</a></li>
	            <% 
			}else {
	      
	       		 if (isAdmin) {
	         %>
		            <li class=""><a href="/admin/adminIndex.jsp"><span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>Admin</a></li>
			<%
				} else {
			%>
					
		            <li><a href="/mypage/view/mypageForm.jsp"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>My Account</a></li>
		            <li><a href="/member/pro/logout.jsp"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>Logout</a></li>
					<li><a href="/cart.jsp"><span class="glyphicon glyphicon-pawn" aria-hidden="true"></span>cart</a></li>
            <% 
				}
			}
            %>
				<li class="dropdown">
					<a id="searchA" href="#" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-expanded="false">
						<span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span>
						search
					</a>
					<ul id="dropUl" class="dropdown-menu" role="menu">
						<li>
							<form method="post" action="/search/search.jsp" class="inline-form" role="search">
							    <div class="input-group">
							      <input type="text" class="form-control" placeholder="Search for..." id="searchItem" name="searchItem" onkeyup="checkHangul();">
							      <span class="input-group-btn">
							        <button type="submit" class="btn btn-default" type="button" disabled="disabled" id="searchBtn">
							         <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
							        </button>
							      </span>
							    </div>
							</form>
						</li>
					</ul>
				</li>
				
				
				<li>
					<a id="searchA" href="board.jsp" class="dropdown-toggle"data-toggle="dropdown" role="button" aria-expanded="false">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
						board
					</a>
					<ul id="dropUl"class="dropdown-menu"  role="menu">
						<li><a href="/board/product/productBoard.jsp?tno=5&pno=1">NOTICE</a></li>
						<li class="divider"></li>
						<li><a href="/board/product/productBoard.jsp?tno=10&pno=1">FAQ</a></li>
						<li class="divider"></li>
						<li><a href="/board/qna.jsp">Q&amp;A</a></li>
						<li class="divider"></li>
						<li><a href="/board/product/productBoard.jsp?tno=6&pno=1">REVIEW</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

<script type="text/javascript">
function checkHangul() {
    
    var searchBtn = document.getElementById("searchBtn");
    searchBtn.removeAttribute("disabled")
    
    
    var searchField = document.getElementById("searchItem");
    var searchValue = searchField.value;
	var searcharr = searchValue.split('');
	
	var searchArr = searcharr.filter(function(item) {
        var pattern = /[a-zA-Z]/;
        return pattern.test(item);
    });
    
	searchField.value = searchArr.join("");
}
</script>
