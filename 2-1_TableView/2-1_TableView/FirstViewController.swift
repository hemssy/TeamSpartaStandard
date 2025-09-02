import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let tableView = UITableView()
    let datas = ["서연", "지혜", "혜연"]
    
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
        cell.configure(data: data)
        
        return cell
    }
}
