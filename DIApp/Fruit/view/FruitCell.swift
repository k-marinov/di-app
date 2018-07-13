import UIKit

class FruitCell: UITableViewCell, TableViewCell {

    static var identifier: String = "\(FruitCell.self)"
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func configureCell(with tableViewItem: TableViewItem) {
        let fruit = tableViewItem as! FruitResource
        resetContent()

        nameLabel.text = fruit.name()
    }

    private func resetContent() {
        nameLabel.text = nil
    }

}
