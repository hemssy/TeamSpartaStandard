import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    static let identifier = "MyCollectionViewCell"

    private let numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {
        contentView.backgroundColor = .systemGray5
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        contentView.addSubview(numberLabel)
    }

    private func setConstraints() {
        numberLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }

    // Int 받아서 라벨 텍스트 변경
    func configure(number: Int) {
        numberLabel.text = "\(number)"
    }
}

