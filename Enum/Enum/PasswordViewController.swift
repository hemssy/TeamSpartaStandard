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
        passwordLabel.textColor = .blue

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

        // 버튼 제약: 라벨 아래 간격 10, centerX 같음, 와100 하50
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
        let validator = PasswordValidator() //객체만들어서 PasswordValidator 부르기
        
        do {
            let ok = try validator.validate(with: input)
            if ok {
                passwordLabel.text = "성공"
            }
        } catch let error as PasswordError {
            showAlert(message: error.message)
        } catch {
            showAlert(message: "오류가 발생했습니다.")
        }
    }
    
    // 알림창
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true) //이거 false면 애니메이션 없이 바로 나타남
    }
    
}


