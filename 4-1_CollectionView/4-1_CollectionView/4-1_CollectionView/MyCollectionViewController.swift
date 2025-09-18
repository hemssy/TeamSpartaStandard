import UIKit
import SnapKit

class MyCollectionViewController: UIViewController {

    private let items = Array(1...20)

    private let layout: MyFlowLayout
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        return cv
    }()

    init(layout: MyFlowLayout = MyFlowLayout()) {
        self.layout = layout
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
    }

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }

    private func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide).inset(8)
        }
    }
}

extension MyCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MyCollectionViewCell.identifier,
            for: indexPath
        ) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(number: items[indexPath.item])
        return cell
    }
}


extension MyCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let myLayout = collectionViewLayout as? MyFlowLayout else { return .zero }
        return myLayout.itemSize(for: collectionView)
    }
}

