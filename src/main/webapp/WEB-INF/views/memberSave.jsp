<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-02
  Time: 오후 4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <script src="../js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
</head>
<body>
<div class="container text-center mt-5">
  <h1><strong> 회원가입 </strong></h1> <br>
</div>
<div id="save_form" class="container">
  <form action="/save" name="loginForm" method="post">
    <label for="member-userName">아이디</label>
    <input type="text" id="member-userName" name="memberUserName" oninput="UserName_check()"
           class="form-control mb-3">
    <h6 id="User-result"></h6>
    <label for="member-password">비밀번호</label>
    <input type="password" id="member-password" name="memberPassword" oninput="password_check()"
           class="form-control mb-3">
    <i class="bi bi-key-fill" id="lock1"></i>
    <h6 id="password-result"></h6>
    <label for="member-PasswordConfirm">비밀번호 재확인</label>
    <input type="password" id="member-PasswordConfirm" name="passwordConfirm" oninput="password_confirm()"
           class="form-control mb-3">
    <h6 id="passwordConfirm-result"></h6>
    <label for="member-name">이름</label>
    <div class="row g-2 align-items-center">
      <div class="col-md-8 mb-3">
        <input type="text" id="member-name" name="memberName" oninput="name_check()" class="form-control">
      </div>
      <div class="col-md-4 d-flex align-items-center">
        <div class="form-label mb-3">성별</div>
        <div class="form-check form-check-inline mx-3 align-items-center" style="height: 100%;">
          <input class="form-check-input" type="radio" name="gender" id="gender-male" value="male" checked>
          <label class="form-check-label mb-2" for="gender-male">남자</label>
        </div>
        <div class="form-check form-check-inline mx-3 align-items-center" style="height: 100%;">
          <input class="form-check-input" type="radio" name="gender" id="gender-female" value="female">
          <label class="form-check-label mb-2" for="gender-female">여자</label>
        </div>
      </div>
    </div>
    <h6 id="name-result"></h6>
    <div>휴대전화</div>
    <select name="CountryCode" id="country_code" class="form-control mb-3" onchange="CountryCode_select()">
      <option value="">직접입력</option>

      <!-- 아시아 -->
      <optgroup label="Asia">
        <option value="+82" selected>대한민국 +82</option>
        <option value="+81">Japan +81</option>
        <option value="+63">Philippines +63</option>
        <option value="+66">Thailand +66</option>
        <option value="+84">Vietnam +84</option>
      </optgroup>

      <!-- 아프리카 -->
      <optgroup label="Africa">
        <option value="+212">Morocco +212</option>
      </optgroup>

      <!-- 유럽 -->
      <optgroup label="Europe">
        <option value="+33">France +33</option>
        <option value="+39">Italy +39</option>
        <option value="+49">Germany +49</option>
        <option value="+44">UK +44</option>
        <option value="+7">Russia +7</option>
        <option value="+39">Spain +39</option>
      </optgroup>

      <!-- 북미 -->
      <optgroup label="North America">
        <option value="+1">USA/Canada +1</option>
      </optgroup>
      <optgroup label="South America">
        <option value="+52">Mexico +52</option>
      </optgroup>

    </select>
    <div class="row g-2">
      <div class="col-2">
        <select name="memberTelecom" id="member-telecom" class="form-select mb-3">
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LG">LG U+</option>
          <option value="알뜰폰">알뜰폰</option>
        </select>
      </div>
      <div class="col-6">
        <input type="tel" id="member-mobile" name="memberMobile" oninput="mobile_check()"
               class="form-control mb-3" placeholder="전화번호 입력">
      </div>
      <div class="col-4 d-grid">
        <input type="button" class="btn btn-success btn-blook mb-3" value="인증번호 받기"
               onclick="numberMessage_chack()">
      </div>
    </div>
    <h6 id="mobile-result"></h6>
    <div class="row g-2">
      <div class="col-5">
        <input type="text" id="message-code" name="UsermessageCode" class="form-control mb-3">
        <small id="verification-code-help" class="form-text text-muted">핸드폰으로 전송된 인증코드를 입력하세요.</small>
      </div>
      <div class="col-md-3">
        <input type="button" id="member-message" name="memberMessage" class="btn btn-success mb-3"
               value="인증 확인" onclick="message_code()">
      </div>
      <h6 id="memberMassgeCode-result"></h6>
    </div>
    <label for="member-birthyear">생년월일</label>
    <div class="row">
      <div class="col">
        <input type="text" id="member-birthyear" name="memberbirthYear" class="form-control mb-3"
               placeholder="년(4자)" oninput="birth_check()">
      </div>
      <div class="col">
        <select name="birthyearSelect" id="birthyear-Select" class="form-select mb-3"
                oninput="birth_check()">
          <option value="1">월</option>
          <option value="2"> 1월 </option>
          <option value="3"> 2월 </option>
          <option value="4"> 3월 </option>
          <option value="5"> 4월 </option>
          <option value="6"> 5월 </option>
          <option value="7"> 6월 </option>
          <option value="8"> 7월 </option>
          <option value="9"> 8월 </option>
          <option value="10"> 9월 </option>
          <option value="11"> 10월 </option>
          <option value="12"> 11월 </option>
          <option value="13"> 12월 </option>
        </select>
      </div>
      <div class="col">
        <input type="text" id="birth-day" name="birthDay" class="form-control" placeholder="일"
               oninput="birth_check()">
      </div>
      <h6 id="birth-result"></h6>
      <div>주소 입력</div>
      <div class="row g-2">
        <div class="col-8">
          <input type="text" id="member-postcode" name="memberPostcode" placeholder="우편번호"
                 class="form-control mb-3" oninput="postcode_check()">
        </div>
        <div class="col-4 d-grid">
          <input type="button" value="우편번호 찾기" name="addressSerch" onclick="sample6_execDaumPostcode()"
                 class="btn btn-success btn-blook mb-3">
        </div>
        <div class="col-12">
          <input type="text" id="member_address" placeholder="주소" class="form-control mb-3">
          <input type="text" id="member_detailAddress" placeholder="상세주소" class="form-control mb-3"
                 oninput="detailAddress_check()">
          <input type="text" id="member-extraAddress" placeholder="참고항목" class="form-control mb-3">
        </div>
      </div>
      <h6 id="postcode-result"></h6>
      <label for="member-email">이메일 입력</label>
      <div class="row">
        <div class="col-md-5 pr-0">
          <input type="text" id="member-email" name="memberEmail" oninput="email_check()"
                 class="form-control mb-3">
        </div>
        <div class="col-auto pl-0 pr-0 at-symbol">
          <span>@</span>
        </div>
        <div class="col-md-3 pl-0">
          <input type="text" id="email-domain" name="emailDomain" class="form-control mb-3">
        </div>
        <div class="col-md-3">
          <select id="email-domain-select" onchange="domain_select()" class="form-select mb-3">
            <option value="">직접입력</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="hanmail.net">hanmail.net</option>
            <option value="nate.com">nate.com</option>
          </select>
        </div>
      </div>
      <div class="col-2">
        <input type="button" id="send-verification-code" class="btn btn-success mb-3" value="인증코드 전송"
               onclick="sendVerificationCode()">
      </div>
    </div>
    <h6 id="email-result"></h6>
    <label for="verification-code">인증코드</label>
    <div class="row g-2">
      <div class="col-5">
        <input type="text" id="verification-code" class="form-control mb-3">
        <small id="verification-code-help" class="form-text text-muted">이메일로 전송된 인증코드를 입력하세요.</small>
      </div>
      <div class="col-md-3">
        <input type="button" id="verify-code" class="btn btn-success mb-3" value="인증 확인"
               onclick="verifyCode()">
      </div>
      <h6 id="verification-code-result"></h6>
    </div>
    <div class="form-group">
      <div>SMS 마케팅 수신동의</div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="select" id="Yes" value="예" checked>
        <label class="form-check-label" for="Yes">예</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="select" id="No" value="아니요">
        <label class="form-check-label" for="No">아니요</label>
      </div>
    </div>

    <div class="form-group">
      <div>이메일 마케팅 수신동의</div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="GenderYes" value="예" checked>
        <label class="form-check-label" for="GenderYes">예</label>
      </div>
      <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="gender" id="GenderNo" value="아니요">
        <label class="form-check-label" for="GenderNo">아니요</label>
      </div>
    </div>

    <div class="row g-2">
      <div class="col d-grid">
        <input type="submit" class="btn btn-outline-success btn-block" value="가입하기" onclick="join_click()">
      </div>
    </div>
  </form>
</div>
</body>
<script>
  const loginForm = document.forms.loginForm;
  loginForm.addEventListener('submit', function (event) {
    if (!login_check()) {
      event.preventDefault();
    }
  });
  const login_check = () => {
    const userName = document.getElementById("member-userName");
    const password = document.getElementById("member-password");
    const passwordConfirm = document.getElementById("member-PasswordConfirm");
    const name = document.getElementById("member-name");
    const birthYear = document.getElementById("member-birthyear");
    const birthMonth = document.getElementById("birthyear-Select");
    const birthDay = document.getElementById("birth-day");
    const postCode = document.getElementById("member-postcode");
    const detailAddress = document.getElementById("member_detailAddress");
    const mobile = document.getElementById("member-moblie");
    const email = document.getElementById("member-email");
    if (!UserName_check()) {
      userName.focus();
      return false;
    } else if (!password_check()) {
      password.focus();
      return false;
    } else if (!password_confirm()) {
      passwordConfirm.focus();
      return false;
    } else if (!name_check()) {
      name.focus();
      return false;
    } else if (!birth_check()) {
      birthYear.focus();
      birthMonth.focus();
      birthDay.focus();
      return false;
    } else if (!postcode_check()) {
      postCode.focus();
      return false;
    } else if (!detailAddress_check()) {
      detailAddress.focus();
      return false;
    } else if (!mobile_check()) {
      mobile.focus();
      return false;
    } else if (!email_check()) {
      email.focus();
      return false;
    } else {
      return true;
    }
  }
  const UserName_check = () => {
    const userName = document.getElementById("member-userName").value;
    const userResult = document.getElementById("User-result");
    const RegExp = /^[a-zA-Z0-9]{6,14}$/;

    if (userName.length == 0) {
      userResult.innerHTML = "*필수입력사항 입니다.";
      userResult.style.color = "red";
      return false;
    } else if (!userName.match(RegExp)) {
      userResult.innerHTML = "영 대,소문자와 숫자를 6~14자 이내로 입력해주세요";
      userResult.style.color = "red";
      return false;
    } else {
      userResult.innerHTML = "올바른 아이디 형식 입니다.";
      userResult.style.color = "green";
      return true;

    }
  }
  const password_check = () => {
    const password = document.getElementById("member-password").value;
    const passwordResult = document.getElementById("password-result");
    const lock1 = document.getElementById("lock1");
    const RegExp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$&^])[A-Za-z\d!@#$&^]{6,12}$/;

    if (password.length == 0) {
      passwordResult.innerHTML = "*필수입력사항 입니다.";
      passwordResult.style.color = "red";
      lock1.style.color = "red";
      return false;
    } else if (!password.match(RegExp)) {
      passwordResult.innerHTML = "특수기호 !@#$&^를 추가하고, 최소 대문자 1가지를 섞어 숫자를 조합하여 6~12자 이내로 입력하세요.";
      passwordResult.style.color = "red";
      lock1.style.color = "red";
      return false;
    } else {
      passwordResult.innerHTML = "올바른 비밀번호 형식 입니다.";
      passwordResult.style.color = "green";
      lock1.style.color = "green";
      return true;
    }
  }

  const password_confirm = () => {
    const password = document.getElementById("member-password").value;
    const passwordConfirm = document.getElementById("member-PasswordConfirm").value;
    const passwordConfirmResult = document.getElementById("passwordConfirm-result");

    if (password.length === 0) {
      passwordConfirmResult.innerHTML = "비밀번호를 먼저 입력해주세요.";
      passwordConfirmResult.style.color = "red";
      return false;
    } else if (password != passwordConfirm) {
      passwordConfirmResult.innerHTML = "비밀번호가 같지 않습니다.";
      passwordConfirmResult.style.color = "red";
      return false;
    } else {
      passwordConfirmResult.innerHTML = "비밀번호가 일치합니다.";
      passwordConfirmResult.style.color = "green";
      return true;
    }
  }

  const name_check = () => {
    const name = document.getElementById("member-name").value;
    const nameResult = document.getElementById("name-result");
    const RegExp = /^[a-zA-Z가-힣]{2,14}$/;

    if (name.length == 0) {
      nameResult.innerHTML = "*필수입력사항 입니다.";
      nameResult.style.color = "red";
      return false;
    } else if (!name.match(RegExp)) {
      nameResult.innerHTML = "한글과 영 대,소문자로 2~14자 이내로 입력하세요.";
      nameResult.style.color = "red";
      return false;
    } else {
      nameResult.innerHTML = "";
      return true;

    }
  }

  const CountryCode_select = () => {
    const countryCode = document.getElementById('country_code').value;
    const mobile = document.getElementById('member-mobile');
    mobile.value = countryCode + ' ';
  }

  const mobile_check = () => {
    const mobile = document.getElementById("member-mobile").value;
    const mobileResult = document.getElementById("mobile-result");
    const RegExp = /^\+\d+\s\d{2}-\d{4}-\d{4}$/;

    if (mobile.length == 0) {
      mobileResult.innerHTML = "*필수입력사항 입니다.";
      mobileResult.style.color = "red";
      return false;
    } else if (!mobile.match(RegExp)) {
      mobileResult.innerHTML = "올바른 형식이 아닙니다..";
      mobileResult.style.color = "red";
      return false;
    } else {
      mobileResult.innerHTML = "핸드폰 번호 입력이 완료되었습니다..";
      mobileResult.style.color = "green";
      return true;

    }

  }

  const numberMessage_chack = () => {
    const mobileNumber = document.getElementById('member-mobile').value;
    const mobileResult = document.getElementById("mobile-result");
    const RegExp = /^\+\d+\s\d{2}-\d{4}-\d{4}$/

    if (mobileNumber.length == 0 || !mobileNumber.match(RegExp)) {
      alert('올바르지 않는 형식의 핸드폰 번호입니다. 다시 입력하세요.');
      return;
    } else {
      alert('핸드폰에 인증번호가 전송되었습니다.');
      history.back();
    }
  }

  const message_code = () => {
    const inputCode = document.getElementById("message-code").value;
    const codeResult = document.getElementById("memberMassgeCode-result");
    const serverCode = "1234";

    if (inputCode === serverCode) {
      codeResult.innerHTML = "인증이 완료되었습니다.";
      codeResult.style.color = "green";
      alert("인증완료!");
    } else {
      codeResult.innerHTML = "올바른 형식의 인증번호가 아닙니다. 인증번호를 다시 입력하세요.";
      codeResult.style.color = "red";
      alert("인증번호 오류!");
    }
  }

  const birth_check = () => {
    const birthYear = document.getElementById("member-birthyear").value;
    const birthMonth = document.getElementById("birthyear-Select").value;
    const birthDay = document.getElementById("birth-day").value;
    const birthResult = document.getElementById("birth-result");

    const yearRegExp = /^\d{4}$/;
    const monthRegExp = /^(0?[1-9]|1[0-2])$/;
    const dayRegExp = /^(0?[1-9]|[1-2][0-9]|3[0-1])$/;

    if (birthYear.length === 0 || birthMonth.length === 0 || birthDay.length === 0) {
      birthResult.innerHTML = "*필수입력사항 입니다..";
      birthResult.style.color = "red";
      return false;
    } else if (!birthYear.match(yearRegExp) || !birthMonth.match(monthRegExp) || !birthDay.match(dayRegExp)) {
      birthResult.innerHTML = "*잘못된 형식입니다.";
      birthResult.style.color = "red";
      return false;
    } else {
      birthResult.innerHTML = "*올바른 생년월일 입니다.";
      birthResult.style.color = "green";
      return true;
    }
  }

  const sample6_execDaumPostcode = () => {
    new daum.Postcode({
      oncomplete: function (data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var addr = ''; // 주소 변수
        var extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          if (extraAddr !== '') {
            extraAddr = ' (' + extraAddr + ')';
          }
          // 조합된 참고항목을 해당 필드에 넣는다.
          document.getElementById("member-extraAddress").value = extraAddr;

        } else {
          document.getElementById("member-extraAddress").value = '';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('member-postcode').value = data.zonecode;
        document.getElementById("member_address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("member_detailAddress").focus();

        postcode_check();
      }
    }).open();
  }

  const postcode_check = () => {
    const postcode = document.getElementById("member-postcode").value;
    const postCodeResult = document.getElementById("postcode-result");
    const RegExp = /^\d{5}$/; // 5자리 우편번호 정규식

    if (postcode.length === 0) {
      postCodeResult.innerHTML = "*필수입력사항 입니다.";
      postCodeResult.style.color = "red";
      return false;
    } else if (!postcode.match(RegExp)) {
      postCodeResult.innerHTML = "*올바르지 않는 우편번호 형식 입니다.";
      postCodeResult.style.color = "red";
      return false;
    }
            // API, 데이터베이스 연동 후 사용할 조건문
            // sample6_execDaumPostcode() 함수의 우편번호 정보에 없는 값을 넣을 경우의 조건식
            // else if (새로운 우편번호와 일치하는 주소 정보가 없는 경우) {
            //     postCodeResult.innerHTML = "*주소정보가 없는 우편번호입니다.";
            //     postCodeResult.style.color = "red";
            //     return false;
    // }
    else {
      postCodeResult.innerHTML = "*우편번호 입력이 완료되었습니다.";
      postCodeResult.style.color = "green";
      return true;
    }
  }

  const detailAddress_check = () => {
    const detailAddress = document.getElementById("member_detailAddress").value;
    const postCodeResult = document.getElementById("postcode-result");
    const RegExp = /^[A-Za-z0-9가-힣\s]{8,25}$/;

    if (detailAddress.length === 0) {
      postCodeResult.innerHTML = "*필수입력사항 입니다.";
      postCodeResult.style.color = "red";
      return false;
    } else if (!detailAddress.match(RegExp)) {
      postCodeResult.innerHTML = "*올바르지 않는 주소 형식 입니다.";
      postCodeResult.style.color = "red";
      return false;
    }
    else {
      postCodeResult.innerHTML = "*상세주소 입력이 완료되었습니다.";
      postCodeResult.style.color = "green";
      return true;
    }

  }

  const email_check = () => {
    const email = document.getElementById("member-email").value;
    const domain = document.getElementById("email-domain").value;
    const emailResult = document.getElementById("email-result");
    const emailRegExp = /^[A-Za-z0-9]{6,12}$/;
    const domainRegExp = /^[A-Za-z0-9]+\.[A-Za-z]{2,3}$/;

    if (email.length == 0) {
      emailResult.innerHTML = "*필수입력사항 입니다.";
      emailResult.style.color = "red";
      return false;
    } else if (!email.match(emailRegExp)) {
      emailResult.innerHTML = "영 대,소문자와 숫자를 5~20자 이내로 입력해주세요";
      emailResult.style.color = "red";
      return false;
    } else if (domain.length == 0) {
      emailResult.innerHTML = "도메인을 작성해주세요.";
      emailResult.style.color = "red";
      return false;
    } else if (!domain.match(domainRegExp)) {
      emailResult.innerHTML = "없는 도메인 형식입니다. 다시 입력하세요.";
      emailResult.style.color = "red";
      return false;
    } else {
      emailResult.innerHTML = "올바른 이메일입니다.";
      emailResult.style.color = "green";
      return true;
    }
  }
  const domain_select = () => {
    const domain = document.getElementById("email-domain-select");
    console.log(domain.value);
    const domainInput = document.getElementById("email-domain");
    domainInput.value = domain.value;
  }
  const sendVerificationCode = () => {
    const email = document.getElementById('member-email').value;
    const domain = document.getElementById('email-domain').value;
    const domainSelect = document.getElementById('email-domain-select');
    const RegExpEmail = /^[A-Za-z0-9]{6,12}$/;
    const RegExpDomain = /^[A-Za-z0-9]+\.[A-Za-z]{2,3}$/;

    if (email.length == 0 || !email.match(RegExpEmail)) {
      alert('올바르지 않는 형식의 이메일 입니다. 다시 입력하세요.');
      return;
    } else if (domainSelect.selectedIndex == 0 && domain.length == 0) {
      alert('도메인을 선택하거나 직접 입력해주세요.');
      return;
    } else if (domain.length > 0 && !domain.match(RegExpDomain)) {
      alert('도메인의 형식이 올바르지 않습니다. ex) gmail.com');
      return;
    } else {
      alert('입력한 이메일로 인증번호가 전송되었습니다.');
      history.back();
    }
  }
  // 이메일 인증코드 전송 API 호출 (서버 측에서 구현)
  // API: 서로 다른 프로그램을 상호작용하기 위한 인터페이스


  const verifyCode = () => {
    const inputCode = document.getElementById("verification-code").value;
    const codeResult = document.getElementById("verification-code-result");
    // 아래부터 서버로부터 받은 인증코드를 구현해야하는 부분
    const serverCode = "1234";
    if (inputCode === serverCode) {
      codeResult.innerHTML = "인증이 완료되었습니다.";
      codeResult.style.color = "green";
      alert("인증완료!");
    } else {
      codeResult.innerHTML = "올바른 형식의 인증번호가 아닙니다. 인증번호를 다시 입력하세요.";
      codeResult.style.color = "red";
      alert("인증번호 오류!");
    }
  }
  const join_click = () => {
    const result = login_check();
    if (result) {
      const result1 = confirm("회원가입을 완료하시겠습니까?");
      if (result1) {
        alert("행복투어의 일원이 되신걸 환영합니다.");
      } else {
        history.back();
      }
    } else {
      alert("필수사항을 입력하지 않았습니다!!");
    }
  }

</script>

</html>
