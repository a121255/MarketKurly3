<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- c:~ 사용 -->
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mypage_info.css">
<c:import url="../template/boot.jsp"></c:import>

	 <!-- jusoPopup 스크립트 (도로명주소)-->   
	    <script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	
	function jusoCallBack(roadFullAddr,addrDetail,jibunAddr){
		
		console.log(roadFullAddr);
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.addrDetail.value = addrDetail;
			document.form.jibunAddr.value = jibunAddr; /* document의 form태그의 name이 'form'인 input의 name이 'jibunAddr'인 value의 값 */
	}
	</script>



</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<section class="mypage">
	
<!-- top -->

	<div class="mypage_top">
		<div class="user"><span class=glad>일반</span> &ensp; <span class=name>김소연</span> 님~ 방문을 환영합니다!</div>
	</div> 
	
	
<!-- contents -->	
	<div class="mypage_contents2">
			<span style="font-size:30px; font-weight:500;" >회원 정보</span>
			<br><br>
			
				<span style="font-size:20px; font-weight:500;" >&ensp;기본 정보</span>
				<br><br>
				<div class="line1">
				<!-- controller login파트에서 session.setAttribute("member", memberVO);으로 설정하였으므로 member=memberVO가 되고, -->
				<!-- ${sessionScope.member.id}는 session의 memberVO에서 id라는 정보를 찾는다는 의미이다. -->
					
					<form id="form" name="form" method="post" action="./memberMyPage_Info">
					
					<table>
						<tr>
							<td class="msubject">아이디*</td>
							<td class="mcontent">
								<input type="text" name="id" label="아이디"
										placeholder="${sessionScope.member.id}" id="mmId" readonly="readonly"> <span style="color:gray;">&ensp;※ID는 변경불가</span>
							</td>
						</tr>
						
						<tr>
							<td class="msubject">현재 비밀번호</td>
							<td class="mcontent">
								<input type="text" name="pw" label="현재 비밀번호" id="mmPw">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">새 비밀번호</td>
							<td class="mcontent">
								<input type="text" name="pw2" label="현재 비밀번호" id="mmPw2">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">비밀번호 확인</td>
							<td class="mcontent">
								<input type="text" name="pw2" label="현재 비밀번호" id="mmPw2">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">이름*</td>
							<td class="mcontent">
								<input type="text" name="name" label="이름"
										value="${sessionScope.member.id}" id="mmName"> 
							</td>
						</tr>
												
						<tr>
							<td class="msubject">이메일*</td>
							<td class="mcontent">
								<input type="text" name="email" label="이메일"
										value="${sessionScope.member.email}" id="mmEmail"> 
							</td>
						</tr>
												
						<tr>
							<td class="msubject">휴대폰*</td>
							<td class="mcontent">
								<input type="text" name="phone" label="휴대폰"
										value="${sessionScope.member.phone}" id="mmPhone"> 
							</td>
						</tr>

						<tr>
							<td class="msubject">배송주소</td>
							<td class="mcontent2">
	 							<a href="javascipt:void(0);" onclick="goPopup(); return false;">
											<span class="bns_button br2" style="margin-top: 15px;">
												<span class="ico"></span>
												<span class="txt">주소 검색</span>
											</span>
										</a>
<!-- 도로명 주소 검색 / jusoPopup설정:form의 id, name이 form인 경우 -->

		<div id="callBackDiv">
			<table>
				<tr><!-- DB로 넘어가는 정보 -->
					<td><input type="hidden" style="width: 400px;" id="roadFullAddr"
						name="roadFullAddr" /></td>
				</tr>
				
				<tr><!-- 보이는 정보 -->
					<td><input type="text" style="width: 400px;" id="jibunAddr" class="ch"
						name="jibunAddr" readonly="readonly"/></td>
				</tr>
				
				<tr>
					<td><input type="text" style="width: 400px;" id="addrDetail" 
						name="addrDetail" /></td>
				</tr>

			</table>
		</div>
							</td>
						</tr>						
					
					</table>
				</form>

					 
					
				</div>
				
				<br><br>
				
				<span style="font-size:20px; font-weight:500;" >&ensp;추가 정보</span>
				<br><br>
				<div class="line2">
					<table>
						<tr>
							<td class="msubject">성별</td>
							<td class="mcontent">
								ㅇㅇ
							</td>
						</tr>
						
						<tr>
							<td class="msubject">생년월일</td>
							<td class="mcontent">
								ㅇㅇ
							</td>
						</tr>
						
					</table>
				</div>
				
				<br><br>
				
				<span style="font-size:20px; font-weight:500;" >&ensp;이용약관 동의</span>
				<br><br>
				<div class="line3">
					내용
				</div>
				
		<!-- 수정, 삭제 버튼 -->
	</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
</body>
</html>