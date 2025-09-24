import UIKit
import SnapKit

class BannerCell: UICollectionViewCell {

    static let identifier = "BannerCell"

    let bgView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemPurple
        v.layer.cornerRadius = 16
        v.clipsToBounds = true
        return v
    }()

    let titleLabel: UILabel = {
        let l = UILabel()
        l.font = .systemFont(ofSize: 22, weight: .bold)
        l.textColor = .white
        l.textAlignment = .center
        l.numberOfLines = 1
        return l
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bgView.addSubview(titleLabel)

        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(text: String) {
        titleLabel.text = text
    }
}

