protocol TableViewCell {

    static var identifier: String { get }

    func configureCell(with tableViewItem: TableViewItem)

}
