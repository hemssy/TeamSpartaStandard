import UIKit

class MyFlowLayout: UICollectionViewFlowLayout {

    private let columns: CGFloat
    private let sectionInsetValue: CGFloat
    private let itemSpacing: CGFloat
    private let rowSpacing: CGFloat
    private let itemHeight: CGFloat


    init(columns: CGFloat = 3,
         sectionInsetValue: CGFloat = 16,
         itemSpacing: CGFloat = 7,
         rowSpacing: CGFloat = 7,
         itemHeight: CGFloat = 80) {

        self.columns = columns
        self.sectionInsetValue = sectionInsetValue
        self.itemSpacing = itemSpacing
        self.rowSpacing = rowSpacing
        self.itemHeight = itemHeight
        super.init()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func itemSize(for collectionView: UICollectionView) -> CGSize {
        let width = collectionView.bounds.width

        let totalHorizontalInset = sectionInset.left + sectionInset.right
        let totalItemSpacing = minimumInteritemSpacing * (columns - 1)

        let availableWidth = width - totalHorizontalInset - totalItemSpacing
        let itemWidth = floor(availableWidth / columns)
        return CGSize(width: itemWidth, height: itemHeight)
    }


}
