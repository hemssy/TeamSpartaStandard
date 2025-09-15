# TeamSpartaStandard

내일배움캠프 iOS 8기 스탠다드반 실습과제 저장소입니다.

---
## 3-2 실습 과제 

**PasswordError 만들기**

- emptyInput: 패스워드를 입력해주세요.
- tooLongInput: 패스워드는 8자 이하 입니다.
- wrongInput: 패스워드가 틀렸습니다.


**PasswordValidator 만들기**

- 프로퍼티 let password: String

- 메서드 passwordCheck(with input: String) throws -> Bool

  - 파라미터명 input, String
  
  - Bool값 리턴
  
  - 실제 비밀번호(password)와 입력값을 비교한다.
  
  - 동일하면 true 반환
  
  - 다르면 PasswordError.wrongInput throw

- 메서드 validate(with input: String) throws -> Bool

  - 파라미터명 input, String

  - Bool값 리턴
  
  - 검증 규칙:
  
  - 빈 문자열이면 PasswordError.emptyInput throw
  
  - 8자 초과 입력이면 PasswordError.tooLongInput throw
  
  - 그 외에는 내부 passwordCheck(with:) 실행
  
  - 비밀번호가 올바르면 true, 틀리면 에러 throw


**버튼 동작**

- PasswordValidator로 에러를 받으면

- UIAlertController를 사용해 에러 메세지를 띄우기

- 받지 않으면 passwordLabel의 text를 성공으로 변경

## 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-15 at 10 05 33" src="https://github.com/user-attachments/assets/d416978a-6d5a-4095-9890-6a6e97e7c6d3" />

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-15 at 10 05 45" src="https://github.com/user-attachments/assets/695733f3-10e4-45c1-9a2f-15571af2a63a" />

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-15 at 10 05 59" src="https://github.com/user-attachments/assets/78c83efe-0e0a-4934-b02d-67e6245da3dd" />

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-15 at 10 06 16" src="https://github.com/user-attachments/assets/220c2841-d067-4527-8509-0727a83e2b14" />
