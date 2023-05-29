# ticket_project
작성일: 2023.05.25
작성자: 홍승빈


프로젝트 명: 항공권 예약과 게시판(가제)


기획 의도
1. 자신이 가고 싶은 여행지를 시뮬레이션 한 후, 최종적으로 선택한 여행지에 대한 팁과 리뷰를 검색 및 질문. 혹은 자신의 여행 경험과 정보를 리뷰.
2. 코시국 이후로 여행의 수요가 급증하고 있음. 타 여행 커뮤니티 사이트들은 존재하고 있지만, 일관적으로 통일되어있지 않고, 여행 정보들도 흩어져 있어 일일이 찾아서 검색하기에 어려움을 겪고 있음.
3. 실제 항공권과 호텔을 실제로 예약을 구현한 후, 가상의 스케줄을 작성해, 자신이 작성한 스케줄 관련 게시판으로 이동해, 필요한 정보를 찾거나, 리뷰를 참고. 아니면 자신의 여행 경험을 바탕으로 팁과 정보를 리뷰하여 공유. 


벤치마킹

네이버 항공권 

특징: 우리가 일상생활에서 많이 사용하는 네이버인 만큼, 네이버 항공권의 이용자 수도 상상히 많다. 우리가 일상 이용하는 항공권 사이트여서 특별한 특징은 없음.
장점: 예약 구조가 단순하고 홈페이지 접근성이 좋아, 처음 이용하는 사용자들도 쉽게 예약할 수 있음. 또한 많은 사용자가 이용하다 보니, 심심찮게 프로모션도 진행함
단점:  수많은 항공권 예약 처리를 하지만, 네이버 항공권 내에서 결제하는 시스템이 아닌, 중계 사이트여서 해당 항공권을 판매하는 홈페이지에서 또 로그인하여, 예약하기에 로그인에 있어서 번거로움이 있음.

네이버 카페: 네일동 → 일본 여행에 대한 정보를 중점적으로 운영하는 카페.

특징: 가까운 이웃 나라 일본을 중심으로 여행 정보를 공유하는 카페이다 보니, 카페를 이용하는 사용자들이 무척 많아, 일본 여행 관련 커뮤니티에서 만큼은 제일 규모가 큰 카페.
보통 일본 여행하면 제일 인기 있는 관광 도시들인 도쿄와 삿포로, 오사카, 후쿠오카, 가고시마 등등에 대한 여행 정보가 상당수이고, 타 지역에 대한 여행 정보는 간간히 보이는 정도.
장점: 국내 최대 규모의 일본 여행 커뮤니티 카페인 만큼, 일본 여행에 대한 정보가 방대하고, 게시판도 세분화되어 있어, 사용자 입장에서는 여행 정보를 얻기 위해, 일일이 검색할 필요 없이, 자신이 찾고자 하는 정보가 들어 있는 게시판 항목에 들어가 필요한 정보를 쉽게 찾을 수 있음. 또한 항공사와 숙박 사이트(야놀자, 아고다, 호텔스닷컴 등)들과의 프로모션을 연계하여 항공권과 숙박 예약 비용을 좀 더 저렴한 가격으로 제공하기에 여행 계획을 좀 더 여유롭게 계획할 수 있음.
단점: 커뮤니티 내 가이드라인이 따로 명시되어 있지 않아, 처음 커뮤티니를 이용하는 사용자들에게는 다소 불편함이 있을 수 있음. 그리고 더불어 커뮤니티 내 암묵적인 룰이 있어, 익숙하지 않은 사용자들에게 불쾌감을 주어, 금방 커뮤니티를 떠나는 일이 종종 있음.
당연한 말이겠지만, 일본 여행을 주로 다루는 커뮤니티 카페이다 보니, 일본 이외의 관광지에 대한 여행 정보는 극히 드물음.  
장점에서 설명했듯이 게시판 항목이 세분화 되어있어, 정보를 찾기에는 용이하지만, 너무 게시판 항목을 세분화시켜 종종 게시글 내용이 중복되는 경우가 있음. 그리고 그만큼 사용하지 않는 게시판들도 있어, 항목을 검색할 때, 늘어지는 경우가 있음. 


구현 계획

사용자들이 항공권 예약을 한 후 예약한 여행지에 대한 정보를 찾고, 관련 게시판에 질문글과 자신의 여행 경험을 공유할 수 있게 계획중. 원할한 게시글 소통을 위해 사용자들 눈에 잘 보일수 있게, 배너를 만들고 게시판으로 링크를 연결.    


주요기능

DTO 구성
//회원관련DTO

@Data
public class MemberDTO {

    private Long id;
    private String memberAccount;  //사용자 계정
    private String memberPassword; //사용자 비밀번호
    private String memberName;     //사용자 이름
		private String memberGender;   //사용자 성별
		private String memberMobile;   //사용자 핸드폰번호
		private int memberBirthYear;   //사용자 생일(년)
		private int memberBirthMonth;  //시용자 생일(월)
		private int memberBirthDay;    //사용자 생일(일)
		private String memberAdress;   //사용자 집주소
		private String memberEmailFront; //사용자 이메일(앞부분)
		private String memberDomain;   //사용자 이메일(도메인)
		private String memberHint;     //사용자 힌트 -> 추후 잃어버린 계정을 찾기 위한 값
		private String memberPassportNum //사용자 여권번호
		private List<PassengerDTO> passengers; //추가 탑승객 정보
		private int mileage;           //사용자 마일리지
		private LocalDate memberJoinDate; //사용자 가입일
		private int fileAttached;      //파일업로드 갯수
    private List<MultipartFile> memberProfile; // 사용자 프로필사진
    

		public LocalDate getBirthDate() {
				return LocalDate.of(birthYear, birthMonth, birthDay); }

		public String getEmail() {
				return emailFront + @ + emailDomain; } 
			
}

//회원프로필관련 DTO

@Data
public class MemberFileDTO {
		
		private Long id;  
		private String originalFileName; //파일 업로드될 때의 원래 이름.
		private String storedFileName;   //파일이 서버에 저장될 때의 이름. 파일 중복 방지
		private Long memberId;
}		

//추가탑승객 DTO

@Data
public class PassengerDTO {

     private Long id;  
     private String passengerName;         // 추가 탑승객 이름
     private String passengerGender;       // 추가 탑승객 성별
     private String passengerPassportNum;  // 추가 탑승객 여권번호
		 private Long memberId;

}


//항공권예약관련DTO
@Data
public class FlightBookingDTO {

		private Long id;
		private String departureLocation;       //출발지
	  private String arrivalLocation;         //도착지
		private String departureDay;            //출발일
		private String arrivalDay;              //도착일
		private String departureTime;           //출발시간
    private String arrivalTime;             //도착시간
		private String seatClass;               //좌석 클래스 선택
		private String seatPosition;            //좌석 위치  
		private double seatClassSurcharge;      //좌석 클래스에 따른 추가 요금
		private boolean airlineMealRequested;   //기내식 추가 여부
		private String airlineMealSelect;       //기내식 선택
		private double mealServiceSurcharge;    //기내식 서비스 요금
		private boolean extraBaggageRequested;  //추가 수화물 요청 여부
		private int baggageCount;               //수화물의 수
    private double baggageWeight;           //수화물의 무게
		private double baggageSurcharge;        //수화물 추가 요금
		private LocalDate bookingJoinDate;      //예약일시
		private Long memberId;
}

//결제관련DTO
@Data
public class PaymentDTO {
		
    private Long id;
    private PaymentMethod paymentMethod;  // 결제 방식
    private double amount;  // 결제 금액
    private Long flightBookingId;


// 결제 방법 
public enum PaymentMethod {
    CASH,
    CREDIT_CARD,
    MILEAGE
   }
}

//항공사관련 DTO
@Data 
public class AirlineDTO {


    private Long id;                    
    private String airlineName;             //항공사 이름
    private String airplaneNumber;          //항공기 번호
    private double baseFare;                //항공사 기본 요금
    private boolean operatesDomestic;       //국내 노선 운영 여부
    private boolean operatesInternational;  //국제 노선 운영 여부
		private Long flightBookingId;
		
}

//게시판관련 DTO
@Data
public class BoardDTO {
   
     private Long id;
		 private String boardTitle;              //게시글 제목
		 private String boardPass;               //게시글 비밀번호
     private String boardWriter;             //게시글 작성자
     private String boardContents;           //게시글 제목
     private DateLocaltime boardCreateDate;  //게시글 작성시간
     private int boardHits;                  //게시글 조회수
     private int fileAttached;               //게시글 파일 업로드 갯수
     private List<MultipartFile> boardFile;  //게시글 파일
     private int commentShow;                //게시글 댓글수
}

//게시판파일관련 DTO 
@Data
public class BoardFileDTO {

     private Long id;
		 private String originalFileName;        //원본 파일 이름
     private String storedFileName;          //저장된 파일 이름
     private Long boardId;                 
}

//댓글관련 DTO
@Data 
public class CommentDTO {

	   private Long id;
     private String commentWriter;             //댓글 작성자 이름
     private String commentContents;           //댓글 작성자 제목
     private String Long boardId;    
     private DateLocaltime commentCreatedDate; //댓글 작성 시간
}

//게시글 좋아요DTO
public class GoodDTO {

     private Long id;
		 private Long comment_id;
     private Long member_id;
}


회원 기능(member)

1. Save(회원 가입)
아이디: 아이디 입력(input type=”text”) → unique →아이디 중복 체크(button) → 필수 입력 → DB(O)

비밀번호: 비밀번호 입력(input type=”password”), 비밀번호 재 확인(input id=”password”) → 정규식 활용 → 필수 입력(script→ajax) 

이름: 이름 입력(input type=”text”) → 필수 입력 → DB(O)

성별: 성별 체크(input type=”radio”)  → 남/여 체크 

휴대전화: 지역 번호 선택(select), 통신사 선택(select), 휴대 전화 입력(input  type=”tel”)
                 → 필수입력 → unique → 휴대전화 인증(input type=”button”) → 
휴대폰 번호 인증 방식: 
데이터 베이스: 데이터베이스에 저장되어있는 인증 코드를 불러옴.  
레디스: 휘발성 데이터를 빠르게 저장하고 조회할 수 있음. 데이터 베이스에 비해 유연하고 빠르지만, 영구적이지 않아, 서버가 날라갈 시 소실 위험이 있음. 
세션: 세션을 사용하여 인증 코드를 저장. 서버를 재시작하면 날라간다는 단점이 있음. 
외부 인증 서비스: 전체 인증 과정을 외부 서비스로 위임. 개발 비용과 복잡성을 줄이지만, 외부 서비스의 의존해야 하고, 이에 따라 비용 발생.
→ 데이터베이스, 세션 둘 중 하나를 사용. → 받은 인증 번호 입력(input type=”text”)후 인증 번호 인증 클릭(button) → DB나 세션에 저장되어있는 인증 번호를 비교하여, 참이면 true, 아니면 false return → DB여부는 인증 방법에 따라 정함.

생년월일: 년 입력(4자 input type=”text”), 월 입력(select), 일 입력(input type=”text”) → 필수 입력 → 년,월,일 3개의 변수를 주고, 변수에 값을 담아 합해, 하나의 변수로 만듬 

우편번호: 카카오 주소 API 사용 

이메일 입력: 이메일 앞 부분 입력(input type=”text”) + @ + 도메인 선택(select) → 생년월일과 동일한 방식으로 이메일 앞 부분과 도메인에 각각 변수를 주어, 합쳐 합친 변수 값을 사용 → 이메일 인증(button) → unique → 핸드폰 인증과 유사한 방식으로 

힌트: 힌트 항목 입력(input text=”text”) 

가입하기: 가입하기 버튼(button) → DB(O)

2. Detail(회원 상세 조회) 
관리자 페이지에서 사용할 계획.
회원 ID, 회원 아이디, 회원 비밀번호, 회원 이메일, 회원 핸드폰 번호, 회원 생년월일, 회원 주소 model에 담아, 뿌려주기 → DB(O)

3. Delete(회원 삭제)
관리자(Admin), 일반 사용자 삭제 기능 사용.
관리자(Admin)는 회원 상세 조회 페이지에서 일반 사용자 삭제 가능. 
일반 사용자는 myPage에서 회원탈퇴(삭제) 가능.
Controller에서 삭제 메서드 두 개로 분리(자신의 계정 삭제, 관리자 페이지에서 관리자에 의한 삭제)  → DB(O)

4. Login(회원 가입 후 로그인)
MemberDTO를 통해, DB에서 아이디와 비밀번호를 담아와, 비교 하여 로그인 진행. → DB(O)
 
5. MyPage(회원 마이 페이지 관리)
Session에 담긴 현재 로그인한 아이디 값을 가져와 mypage 화면으로 접속. 
MemberDTO에 담긴 정보를 model에 담아 뿌려줌.
마이페이지에서 프로필 사진을 설정 가능(MemberFileDTO를 통해 기존 설정된 이미지를 삭제 후, 새 이미지로 교체하는 방식으로) → DB(O)


항공권 예약 기능 

index 
Tiketing(항공권 예약)에서 출발지 ,도착지 , 출발일, 도착일, 인원수, 좌석 클래스를 선택(select) 한 후 예약 상세 페이지로 이동 

1. FlightSelect(항공편 선택)
출발시간 대 유효한 항공편 선택 후, 좌석 class 선택

2. PassengerInfo(탑승객 정보)
memberDTO를 통해 받아온, 탑승자 이름, 탑승자 전화번호, 탑승자 이메일, 추가로 여권번호를 입력.
추가 탑승객이 있을시, 추가 탑승객 정보를 입력.
탑승객 정보를 승객1(로그인 되어있는 사용자 정보), 승객2, 승객3으로 표기

3.  Addition (부가 서비스)
좌석 선택, 기내식 선택여부 및 기내식 선택, 수화물 추가여부및 수화물 추가선택 

4. Payment (결제)
최종 예약 내역 확인 후 결제 할 수단 선택 후 결제

5. Reservation Eticket(예약 Eticket)
최종 결제 후 E Ticket확인(인보이스 영수증)


주요기능

게시판 기능

기존 게시판 기능에서 
여행정보팁(각 국가별), Q&A(각 국가별) 항목으로 세분화, 게시글 좋아요 기능 추가  (게시글 작성자는 로그인 된 계정 아이디로 표기)

댓글 기능
댓글 작성, 수정, 삭제 기능(댓글 작성자는 로그인 된 계정 아이디로 표기)

관리자 기능
관리자는 admin으로 지정 후, 예약 관리 , 게시글 관리(삭제 가능), 회원 관리(삭제 가능), 항공기/ 항공기 스케줄 관리, 좌석 class, 기내식, 수화물 무게 가격을 임의대로 수정후 업데이트 가능.   
