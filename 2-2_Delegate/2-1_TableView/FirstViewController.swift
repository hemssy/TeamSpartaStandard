import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let tableView = UITableView()
    var datas = ["서연", "지혜", "혜연"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            FirstTableViewCell.self,
            forCellReuseIdentifier: FirstTableViewCell.identifier
        )
        
        tableView.rowHeight = 130
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: FirstTableViewCell.identifier,
                for: indexPath) as? FirstTableViewCell
        else { return .init() }
        
        let data = datas[indexPath.row]
        cell.delegate = self
        cell.configure(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        datas.append("셀 선택")
        tableView.reloadData()
    }
}

extension FirstViewController: FirstTableViewCellDelegate {
    func didTapButton(data: String) {
        datas.append(data)
        tableView.reloadData()
    }
}
