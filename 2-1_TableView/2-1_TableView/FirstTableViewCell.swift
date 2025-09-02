import UIKit

class FirstTableViewCell: UITableViewCell {
    static let identifier = "FirstTableViewCell"
    
    let dataLabel = UILabel()
    
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
    }
    
    func setConstraints() {
        dataLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    func configure(data: String) {
        dataLabel.text = data
    }
    
    
}

