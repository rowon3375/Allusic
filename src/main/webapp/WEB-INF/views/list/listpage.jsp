<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<link href="../resources/css/Allusic.css" rel="stylesheet" />

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>




<title>홈 화면</title>

<script type="text/javascript">
	//좋아요 누르기	
	function listLike(user_id) {

		if (user_id == '') {
			alert('로그인이 필요한 서비스 입니다');
			return false;
		}
		//beforeLike(좋아요가 색칠되기 전) 에 색칠된 아이콘을 넣을 것
		$(".beforeLike")
				.html(
						"<img src='../resources/img/like4.png' id='좋아요버튼' width='15px'> 좋아요");
		$(".afterLike")
				.html(
						"<img src='../resources/img/like1.png' id='좋아요버튼' width='15px'> 좋아요");
		//있는 클래스는 없애고 없는 클래스는 만듬(좋아요 색칠됐다가 안됐다가 가능)
		$(".like").toggleClass("beforeLike afterLike");

		var playlist_id = $("#playlist_id").val();
		var list_like = 0;

		if ($(".like").hasClass("afterLike")) {
			list_like = 1;

		} else if ($(".like").hasClass("beforeLike")) {
			list_like = -1;
		}
		
		//좋아요 수를 1 증가시키거나 감소
		$.ajax({
			type : "POST",
			url : "like",
			data : {
				"playlist_id" : playlist_id,
				"list_like" : list_like
			},
			success : function(data, textStatus, xhr) {
				//별점 갱신
				$(".likeCount").text(data);
			},

			error : function(request, status, error) {
				alert("error 발생!")
			}

		});

	}

	//댓글 로그인 확인
	function loginCheck(user_id) {
		//로그인 확인
		if (user_id == '') {
			alert('로그인이 필요한 서비스 입니다');
			return false;
		}

		//댓글 입력 길이
		var comment = document.getElementById('댓글입력').value;

		if (comment.length > 100) {
			alert('댓글은 100자 이내로 작성해주세요');
			return false;
		} else if (comment.length < 1) {
			alert('문자를 입력해주세요');
			return false;
		}


	return true;
}
	//댓글 삭제 확인 알람
	function deleteComment(user_id) {
		if(confirm('댓글을 삭제하시겠습니까?')){
			return true;
		}
			return false;
	}

	


</script>

<!-- 리스트 해당하는 로그인, 회원가입 모달 불러오기 -->
<c:import url="../menu/listmenu.jsp"></c:import>

<header
	class="p-2 mb-3 fixed-top align-items-center border-bottom border-info"
	id="AllusicH"
	style="font-family: 'Noto Sans KR', sans-serif; background-color: white;">
	<div class="container-fluid w-75">
		<div
			class="d-flex flex-wrap align-items-center justify-content-start ">
			<!--          justify-content-lg-start-->
			<a href="/"
				class="d-flex align-items-center mb-2 mb-lg-0 text-dark text-decoration-none">
				<svg class="bi me-2" width="40" height="32" role="img"
					aria-label="Bootstrap">
					<use xlink:href="#bootstrap"></use></svg>
			</a>

			<ul
				class="nav col-12 col-lg-auto me-lg-auto mlmb-2 justify-content-center mb-md-0">
				<li><div class="nav-link px-2 w-100">
						<a href="/mylife"> <img
							src="../resources/img/mainLogo.png" alt="img" width=""
							height="40" style="margin-right: 30px">
						</a>
					</div></li>


			</ul>

			<form action="/mylife/search/searchResult" method="get"
				onsubmit="return searchCheck();"
				class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
				<input type="search" id="searchText" name="searchText"
					class="form-control" placeholder="검색어를 입력하세요" aria-label="Search"
					control-id="ControlID-2" style="background: #F2F2F2">
			</form>



						        <!-- 로그인 안 되어있을때 -->
			       	  <c:if test="${user_id == null }">
			            <button id="로그인보탄" data-bs-toggle="modal" data-bs-target="#로그인모달">
			                        <div id="좋아요1" >
			                                로그인
			                        </div>
			                </button>
			            </c:if>
			            
			            <!-- 로긘 되어있을때 -->
			      <c:if test="${user_id != null }">      
			        <div class="dropdown text-end">
			
			          <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			            <img src="../resources/img/profile2.jpg" alt="mdo" width="32" height="32" class="rounded-circle">
			          </a>
			            
			          <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1">
			            <li><a class="dropdown-item" id="openModalBtn" href="/mylife/analysis/main">취향분석</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="logout?playlist_id=${playlist_id }">Sign out</a></li>
			           
			          </ul>
			        </div>
		         </c:if>
			
			
		</div>
	</div>



</header>


<!--      메인 -->
<main class="배경" id="리스트배경">

	<div class="container" id="container">


		<div>
			<div id="프로필베너">
				<c:forEach var="playlist" items="${banner }" begin="0" end="4"
					varStatus="status">
					<span> 
							<img src="${playlist.album_img }"	id="커버${status.count }">
					</span>
				</c:forEach>
			</div>

			<div>
				<span id="배너프로필"> <img id="배너프로필1"
					src="../resources/img/profile2.jpg">
				</span> 
				<a href="/mylife/analysis/main">
					<span id="배너닉네임"> ${listInfo.user_id } </span>
				</a>
			</div>


		</div>
		<div id="리스트소개란">
			<div class="p-0" id="리스트타이틀">
				<p>${listInfo.list_name }</p>
			</div>
			<div id="리스트설명">
				<p>${listInfo.list_explain }</p>
			</div>
			<div class="p-0" id="리스트정보 ">
				<span id="좋아요수"> 좋아요 <em class="likeCount">${listInfo.list_like }</em>
					<span> ㅣ </span>
				</span> <span id="좋아요수"> 댓글 <em>${countComment }</em> <span>
						ㅣ </span>
				</span> <span id="좋아요수"> <em></em>${listInfo.list_date } <span>
				</span>
				</span>

			</div>
		</div>
		<section class="버튼박스" id="버튼박스">
			<div id="버튼박스내용">
				<!--                    공유 드롭다운-->

				<div class="dropdown">
					<button type="button" id="좋아요박스" onclick="listLike('${user_id}')">
						<div id="좋아요" class="beforeLike like">
							<img src="../resources/img/like1.png" id="좋아요버튼" width="15px">
							좋아요
						</div>
					</button>

					<span style="font-size: 20px"> I </span>
					<button type="button" id="댓글박스">
						<div id="좋아요">
							<img src="../resources/img/comment2.png" id="좋아요버튼" width="23px">
							댓글
						</div>
					</button>

					<script>
						$(document).ready(function() {

							$('#댓글박스').click(function() {

								var offset = $('#댓글타이틀').offset();

								$('html').animate({
									scrollTop : offset.top
								}, 200);

							});

						});
					</script>

					<span style="font-size: 20px"> I </span>

					<button class="btn" type="button" data-bs-toggle="dropdown"
						aria-expanded="false" id="좋아요박스">
						<div id="좋아요">
							<img src="../resources/img/share2.png" id="좋아요버튼" width="18px">
							공유
						</div>

					</button>






					<!--
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
    Dropdown button
  </button>
-->
					<ul class="dropdown-menu" id="공유드롭다운"
						aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="#">페이스북<img
								src="../resources/img/facebook1.png" height="23px"
								style="float: right"></a></li>
						<li><a class="dropdown-item" href="#">카카오톡<img
								src="../resources/img/kakao1.png" height="23px"
								style="float: right"></a></li>
						<li><a class="dropdown-item" href="#">트위터<img
								src="../resources/img/twitter1.png" height="23px"
								style="float: right"></a></li>
						<li><a class="dropdown-item" href="#">링크복사<img
								src="../resources/img/share3.png" height="23px"
								style="float: right"></a></li>

					</ul>
				</div>
			</div>

		</section>
		<section id="작품들란">
			<div id="작품들란2">
				<div id="작품들란3">
					<span class="" id="작품들명">곡</span> <span id="작품수">${countSong }</span>
				</div>
			</div>


			<button class="carousel-control-prev" type="button"
				data-bs-target="#아무거나1" data-bs-slide="prev" id="좌버튼리스트">
				<img src="../resources/img/left.png" width="30px"
					style="opacity: 0.5;"> <span class="visually-hidden">Previous</span>
			</button>


			<div id="아무거나1" class="carousel slide" data-bs-ride="carousel"
				data-bs-interval="false">

				<c:forEach var="nomean" items="${listSong}" step="6" varStatus="sta">
					<!--                   1페이지 -->
					<c:choose>
						<c:when test="${sta.index == 0 }">
							<div class="carousel-item active">
						</c:when>

						<c:when test="${sta.index != 0 }">
							<div class="carousel-item">
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
					
					
						<div id="작품란">

							<!--리스트에 추가된 곡들 -->
							<div class="row row-cols-3" id="작품란2">
								
								<c:forEach var="playlist" items="${listSong}" begin="${sta.index }" end="${sta.index + 5}">
									<div class="col" id="작품카드">
										<a
											href="/mylife/song/songPage?song_id=${playlist.song_id }&singer_id=${playlist.singer_id}">
											<img src="${playlist.album_img }" id="리스트앨범커버">
										</a>
										<div id="작품명">
											<a
												href="/mylife/song/songPage?song_id=${playlist.song_id }&singer_id=${playlist.singer_id}"
												style="text-decoration: none; color: black;"> <!-- <a href="/mylife/song/songPage?song_id=1&singer_id=1"> -->
												${playlist.song_name }
											</a>
										</div>
										<div id="리스트평균">${playlist.singer_name }</div>
	
										<div id="리스트정보">${playlist.genre }· ${playlist.country }
										</div>
	
									</div>
								<!-- forEach -->
								</c:forEach>
								
							</div>

							<!-- 카로셀 active 바로 밑에 태그 닫기 -->
						</div>
						
						
						<!-- 카로셀 액티브 닫는 태그 -->
					</div>

				</c:forEach>


				<!-- 카로셀 슬라이드 닫는 태그 -->
			</div>
			<button class="carousel-control-next" type="button"
				data-bs-target="#아무거나1" data-bs-slide="next" id="우버튼리스트">

				<img src="../resources/img/right.png" width="30px"
					style="opacity: 0.5;"> <span class="visually-hidden">Next</span>
			</button>
		</section>



		<section id="댓글란1">
			<div id="댓글란2">
				<div id="댓글타이틀">
					<span>댓글</span> <span id="댓글수"> ${countComment } </span>
				</div>

				<c:forEach var="listcomment" items="${ allList}">
					<div id="ㄹㅇ댓글">
						<div id="댓글프로필">
							<img src="../resources/img/profile2.jpg" id="댓글프로필사진">
						</div>
						<div id="댓글우측">
							<div id="닉네임란">
								<span id="닉네임"> ${listcomment.user_id } </span>
								<div id="댓글며칠전">${listcomment.comment_date }</div>

							</div>
							<div id="댓글내용">${listcomment.user_comment }</div>

							<div id="댓글버튼">


								<c:if test="${user_id ==  listcomment.user_id}">
									<form action="delComment" method="post" id="delComment"
										onsubmit="return deleteComment('${user_id}')">
										<input type="hidden" id="user_id" name="user_id"
											value="${user_id }"> <input type="hidden"
											id="playlist_id" name="playlist_id" value="${playlist_id }">
										<input type="hidden" id="list_comment_id"
											name="list_comment_id"
											value="${listcomment.list_comment_id }"> <input
											type="submit" id="댓글삭제" value="삭제">
									</form>
								</c:if>
							</div>

						</div>
					</div>
				</c:forEach>
				<!-- 댓글 입력창 -->
				<div id="댓글입력창">
					<form action="comment" method="post" id="comment"
						onsubmit="return loginCheck('${user_id}')">
						<input type="hidden" id="playlist_id" name="playlist_id"
							value="${playlist_id }"> 
						<input type="hidden"
							id="user_id" name="user_id" value="${user_id }">
						<input
							type="text" name="user_comment" id="댓글입력"
							placeholder="컬렉션에 댓글을 남겨보세요.">
						<input type="submit" id="댓글입력버튼" value="등록">
					</form>
				</div>
			</div>

		</section>

	</div>

</main>
</body>
</html>
