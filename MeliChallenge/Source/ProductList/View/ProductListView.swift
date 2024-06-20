//
//  ProductListView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class ProductListView: MLView {
    // MARK: - Dependencies
    private let loadNextPage: () -> Void

    // MARK: - Properties
    var fetchMore: Bool = false
    var products: [Product] = [] {
        didSet {
            spinningCircleView.isHidden = true
            tableView.reloadData()
        }
    }

    var numberOfResults: Int = 0 {
        didSet {
            numberOfResultLabel.text = "\(numberOfResults) resultados"
        }
    }

    // MARK: - Init
    init(
        loadNextPage: @escaping () -> Void
    ) {
        self.loadNextPage = loadNextPage
        super.init()
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View
    private lazy var contentView = UIView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }

    private lazy var headerView = UIView() .. {
        $0.backgroundColor = .systemYellow
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    lazy var numberOfResultsView = UIView() .. {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var separatorView = UIView() .. {
        $0.backgroundColor = .lightGray.withAlphaComponent(0.3)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor(2)
    }

    private lazy var numberOfResultLabel = MLLabel(
        font: .systemFont(ofSize: 15),
        textColor: .darkText
    ) .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private(set) lazy var tableView = UITableView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = UITableView.automaticDimension
        $0.estimatedRowHeight = 500
        $0.register(ProductTableViewCell.self, forCellReuseIdentifier: ProductTableViewCell.identifier)
        //        $0.register(ErrorTableViewCell.self, forCellReuseIdentifier: ErrorTableViewCell.identifier)
        $0.separatorStyle = .singleLine
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .white
        // table.loadingIndicatorView()
    }

    private(set) lazy var spinningCircleView = MLSpinningCircleView()

}

// MARK: - Extension View Code Contract
extension ProductListView: ViewCodeContract {
    func setupHierarchy() {
        addSubview(headerView)
        headerView.addSubview(numberOfResultsView)
        headerView.addSubview(separatorView)
        headerView.addSubview(numberOfResultLabel)
        addSubview(tableView)
        addSubview(spinningCircleView)
    }

    func setupConstraints() {
        headerView
            .topAnchor(in: self, layoutOption: .useMargins)
            .leftAnchor(in: self, layoutOption: .none)
            .rightAnchor(in: self, layoutOption: .none)
            .heightAnchor(60)

        separatorView
            .leftAnchor(in: headerView, layoutOption: .none)
            .rightAnchor(in: headerView, layoutOption: .none)
            .bottomAnchor(in: headerView)

        numberOfResultsView
            .topAnchor(in: headerView, padding: 20, layoutOption: .useMargins)
            .leftAnchor(in: headerView, layoutOption: .none)
            .rightAnchor(in: headerView, layoutOption: .none)
            .bottomAnchor(in: headerView)

        numberOfResultLabel
            .centerY(in: numberOfResultsView)
            .leftAnchor(in: numberOfResultsView, padding: 15)
            .rightAnchor(in: numberOfResultsView)
            .heightAnchor(25)

        tableView
            .topAnchor(in: headerView, attribute: .bottom, layoutOption: .none)
            .leftAnchor(in: self, padding: 1, layoutOption: .useMargins)
            .rightAnchor(in: self, layoutOption: .useMargins)
            .bottomAnchor(in: self, padding: -1, layoutOption: .useMargins)

        spinningCircleView
            .center(in: self)
            .heightAnchor(100)
            .widthAnchor(100)
    }

    func setupConfiguration() {
        backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        spinningCircleView.animate()
    }
}

// MARK: - Extension UITableViewDelegate & UITableViewDataSource.
extension ProductListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if procedures.isEmpty { return 1 }
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if procedures.isEmpty{
//            let cellEmpty = tableview.dequeueReusableCell(withIdentifier: ErrorTableViewCell.identifier, for: indexPath) as? ErrorTableViewCell
//            cellEmpty?.isUserInteractionEnabled = false
//            return cellEmpty ?? UITableViewCell()
//        } else {
//            let cell = tableview.dequeueReusableCell(withIdentifier: ProcedureTableViewCell.identifier, for: indexPath) as? ProcedureTableViewCell
//            let procedure = procedures[indexPath.row]
//            let amounts = Current.shared.formatterAmounts(amounts: procedures)
//            let amount = amounts[indexPath.row]
//
//            cell?.setupCustomCell(
//                title: procedure.nameClient,
//                procedure: procedure.typeProcedure,
//                price: "\(amount)",
//                paymentMethod: "\(procedure.currentDate) • \(procedure.formPayment.rawValue)"
//            )
//            cell?.setPaymentIcon(method: procedure.formPayment)
//            return cell ?? UITableViewCell()
//        }
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ProductTableViewCell.identifier,
            for: indexPath
        ) as? ProductTableViewCell else {
            return .init()
        }
        let product = products[indexPath.row]
        cell.bind(model: product)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print(product)
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let tableHeight = tableView.contentSize.height
        let scrollViewHeight = scrollView.frame.size.height
        if position > tableHeight - 100 - scrollViewHeight {
            if fetchMore.not && products.isEmpty.not {
                tableView.tableFooterView = self.displaySpinerFooter()
                fetchMore = true
                loadNextPage()
                return
            }
        }
    }
}
