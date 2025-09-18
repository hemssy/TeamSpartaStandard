# TeamSpartaStandard

내일배움캠프 iOS 8기 스탠다드반 실습과제 저장소입니다.

---
## 4-1 실습 과제 

**뷰컨트롤러**
  - 이름 : MyCollectionViewController
  
  - 프로퍼티
    - items 라는 이름의 1~20 Int 배열
    - collectionView 라는 이름의 컬렉션뷰
    - 오토레이아웃은 뷰 전체에 inset 8


**컬렉션뷰 셀**
  - 이름 : MyCollectionViewCell

  - cornerRadius : 12, backgroundColor : systemGray5

  - 프로퍼티
    - numberLabel 라는 이름의 UILabel
    - textAlignment : center
    - 오토레이아웃은 전체에 inset 16
  - 메서드
    - configure 라는 이름으로 Int 값 받아서 numberLabel 의 텍스트 변경 

**레이아웃**
  - 프로퍼티 : 이니셜라이저에서 설정 가능하게 구현
    - columns: CGFloat
    - sectionInsetValue: CGFloat
    - itemSpacing: CGFloat
    - rowSpacing: CGFloat
    - itemHeight: CGFloat
  
  - itemSize 라는 이름의 셀 아이템 사이즈 계산 메서드 구현
  - 먼저 3열 구현하기
  - N개의 Column에 대해서 대응 가능하도록 작성

## 실행화면

<img width="200" height="500" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-18 at 09 47 39" src="https://github.com/user-attachments/assets/d50905ab-a1ee-445e-b22d-c7d9a4d0f535" />
