import UIKit
import SnapKit

class PasswordViewController: UIViewController {

    private var passwordLabel: UILabel!
    private var passwordTextField: UITextField!
    private var passwordButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        
        // 뷰 배경
        view.backgroundColor = .systemBackground

        // 컴포넌트 만들기
        passwordLabel = UILabel()
        passwordLabel.text = ""                  // 처음엔 비워둬서 안보임
        passwordLabel.textAlignment = .center
        passwordLabel.textColor = .blue          // 성공 텍스트는 파란색으로 함

        passwordTextField = UITextField()
        passwordTextField.borderStyle = .roundedRect

        passwordButton = UIButton(type: .system)
        passwordButton.setTitle("입력", for: .normal)
        passwordButton.setTitleColor(.white, for: .normal)
        passwordButton.backgroundColor = .red

        // 화면에 올림
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordButton)

        // 라벨 제약: 화면 정중앙
        passwordLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        // 텍스트필드 제약: 라벨 위 간격10, 좌우 30, 높이 50
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(50)
            make.bottom.equalTo(passwordLabel.snp.top).offset(-10)
        }

        // 버튼 제약: 라벨 아래 간격 10, centerX 같음, w100 h50
        passwordButton.snp.makeConstraints { make in
            make.centerX.equalTo(passwordLabel.snp.centerX)
            make.top.equalTo(passwordLabel.snp.bottom).offset(10)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        // 버튼에 액션 연결한거
        passwordButton.addTarget(self, action: #selector(tapPasswordButton), for: .touchUpInside)
    }

    // 버튼 액션
    @objc private func tapPasswordButton() {
        let input = (passwordTextField.text ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        if input == "password" {
            passwordLabel.text = "성공"
        }
    }
}

