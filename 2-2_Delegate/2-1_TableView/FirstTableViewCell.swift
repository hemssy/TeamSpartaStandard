import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    
    let dataLabel = UILabel()
    let dataButton = UIButton()
    
    weak var delegate: FirstTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        
        contentView.addSubview(dataLabel)
        contentView.addSubview(dataButton)
        
        dataButton.setTitle("데이터 추가", for: .normal)
        dataButton.backgroundColor = .red
        dataButton.addTarget(self, action: #selector(didTapDataButton), for: .touchUpInside)
    }
    
    func setConstraints() {
        dataLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        dataButton.snp.makeConstraints { make in
            make.top.equalTo(dataLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset( 16)
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func configure(data: String) {
        dataLabel.text = data
    }
    
    @objc
    func didTapDataButton() {
        let data = dataLabel.text ?? ""
        // 버튼 눌렸을 때 데이터-> 뷰컨트롤러로 전달되고, 여기서 델리게이트 메서드가 실행
        delegate?.didTapButton(data: data)
    }
    
}

