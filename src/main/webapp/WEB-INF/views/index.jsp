<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-04-27
  Time: 오후 4:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Happy</title>
  <link rel="stylesheet" href="../css/bootstrap.css">
  <script src="../js/bootstrap.bundle.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="/resources/css/main.css">
</head>

<body>
<%@include file="./component/header.jsp"%>
<%@include file="./component/nav.jsp"%>
<div id="section">
  <form>
    <div class="container">
      <form>
        <div class="form-row">
          <label for="departure">출발지:</label>
          <select id="departure" name="departure">
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
            <option value="jeju">제주</option>
            <!-- 추가할 도시를 이곳에 넣으세요 -->
          </select>
          <button type="button" onclick="swapCities()">↔</button>
          <label for="destination">도착지:</label>
          <select id="destination" name="destination">
            <option value="seoul">서울</option>
            <option value="busan">부산</option>
            <option value="jeju">제주</option>
            <!-- 추가할 도시를 이곳에 넣으세요 -->
          </select>
        </div>
        <div class="form-row">
          <label for="departure-date">출발일:</label>
          <input type="date" id="departure-date" name="departure-date">

          <label for="arrival-date">도착일:</label>
          <input type="date" id="arrival-date" name="arrival-date">
        </div>

        <div class="class-and-passenger-container">
          <div class="passenger-container">
            <div class="passenger-box">
              <div class="class-and-passenger-container">
                <details open>
                  <summary>
                    <p id="passenger-count-display">성인 1명</p>
                  </summary>
                  <div class="panel">
                    <div class="passenger-container">
                      <div class="passenger-box">
                        <button type="button"
                                onclick="changePassengerCount('adults', -1)">-</button>
                        <input type="number" id="adults" name="adults" value="1" min="0"
                               readonly>
                        <button type="button"
                                onclick="changePassengerCount('adults', 1)">+</button><br>

                        <button type="button"
                                onclick="changePassengerCount('children', -1)">-</button>
                        <input type="number" id="children" name="children" value="0" min="0"
                               readonly>
                        <button type="button"
                                onclick="changePassengerCount('children', 1)">+</button><br>

                        <button type="button"
                                onclick="changePassengerCount('infants', -1)">-</button>
                        <input type="number" id="infants" name="infants" value="0" min="0"
                               readonly>
                        <button type="button"
                                onclick="changePassengerCount('infants', 1)">+</button>
                      </div>
                    </div>
                    <div class="class-select">
                      <label for="class-select">클래스 선택:</label>
                      <select id="class-select" name="class-select"
                              onchange="updateClassDisplay()">
                        <option value="economy">이코노미</option>
                        <option value="business">비즈니스</option>
                        <option value="first">퍼스트 클래스</option>
                      </select>
                    </div>
                  </div>
                </details>
              </div>
            </div>
          </div>

        </div>

        <button type="submit">검색</button>
      </form>
    </div>
  </form>

</div>
<%@include file="./component/footer.jsp"%>
</body>
<script>
  const goLogin = () => {
    location.href = "member_login.html";
  }
  const goSave = () => {
    location.href = "member_join.html";
  }
  const swapDates = () => {
    const departureDate = document.getElementById("departure-date");
    const arrivalDate = document.getElementById("arrival-date");
    const tempDate = departureDate.value;
    departureDate.value = arrivalDate.value;
    arrivalDate.value = tempDate;
  }

  const swapCities = () => {
    const departureCity = document.getElementById("departure");
    const destinationCity = document.getElementById("destination");
    const tempCity = departureCity.value;
    departureCity.value = destinationCity.value;
    destinationCity.value = tempCity;
  }
  function updateClassDisplay() {
    const classSelect = document.getElementById("class-select");
    const selectedClass = classSelect.options[classSelect.selectedIndex].value;
    const displayElement = document.getElementById("class-display");
    displayElement.textContent = `${selectedClass.charAt(0).toUpperCase()}${selectedClass.slice(1)} 클래스 선택됨`;
  }

  const passengerCounts = {
    'adults': 0,
    'children': 0,
    'infants': 0
  };

  function changePassengerCount(passengerType, value) {
    const inputElement = document.getElementById(passengerType);
    const currentValue = passengerCounts[passengerType];
    const newValue = currentValue + value;

    if (newValue >= 0) {
      passengerCounts[passengerType] = newValue;
      inputElement.value = newValue;
      updatePassengerCountDisplay();
    }
  }

  function updatePassengerCountDisplay() {
    const adultCount = passengerCounts['adults'];
    const childCount = passengerCounts['children'];
    const infantCount = passengerCounts['infants'];
    const totalCount = adultCount + childCount + infantCount;

    let passengerText = '';
    if (adultCount > 0) {
      passengerText += `성인${adultCount}명`;
    }
    if (childCount > 0) {
      if (passengerText !== '') {
        passengerText += ' ';
      }
      passengerText += `소아${childCount}명`;
    }
    if (infantCount > 0) {
      if (passengerText !== '') {
        passengerText += ' ';
      }
      passengerText += `유아${infantCount}명`;
    }

    const displayElement = document.getElementById('passenger-count-display');
    if (adultCount > 0 && totalCount === adultCount) {
      displayElement.textContent = `성인 ${adultCount}명`;
    } else if (childCount > 0 && totalCount === childCount) {
      displayElement.textContent = `소아 ${childCount}명`;
    } else if (infantCount > 0 && totalCount === infantCount) {
      displayElement.textContent = `유아 ${infantCount}명`;
    } else {
      displayElement.textContent = `승객 ${totalCount}명`;
    }
    if (passengerText !== '') {
      displayElement.textContent += ` (${passengerText})`;
    }
  }
</script>

</html>