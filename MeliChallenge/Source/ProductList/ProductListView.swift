//
//  ProductListView.swift
//  MeliChallenge
//
//  Created by Leonardo Portes on 17/06/24.
//

import UIKit

final class ProductListView: MLView {
    private var onSearch: ((String) -> Void)

    // MARK: - Init
    init(onSearch: @escaping (String) -> Void) {
        self.onSearch = onSearch
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

    private lazy var numberOfResultView = UIView() .. {
        $0.backgroundColor = .systemYellow
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var numberOfResultLabel = UILabel() .. {
        $0.text = "345 resultados."
        $0.backgroundColor = .systemYellow
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var tableview = UITableView() .. {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "teste")
        //        $0.register(ProcedureTableViewCell.self, forCellReuseIdentifier: ProcedureTableViewCell.identifier)
        //        $0.register(ErrorTableViewCell.self, forCellReuseIdentifier: ErrorTableViewCell.identifier)
        $0.refreshControl = UIRefreshControl()
        $0.separatorStyle = .singleLine
        $0.showsVerticalScrollIndicator = false
        $0.backgroundColor = .white
        // table.loadingIndicatorView()
    }
}

// MARK: - Extension View Code Contract
extension ProductListView: ViewCodeContract {
    func setupHierarchy() {
//        addSubview(contentView)
//        contentView.addSubview(numberOfResultView)
//        numberOfResultView.addSubview(numberOfResultLabel)
        addSubview(tableview)
    }

    func setupConstraints() {
        tableview
            .topAnchor(in: self)
            .leftAnchor(in: self)
            .rightAnchor(in: self)
            .bottomAnchor(in: self, padding: -1, layoutOption: .useMargins)
    }

    func setupConfiguration() {
        backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
    }

    func setErrorViewVisibility(_ show: Bool) {

    }
}

// MARK: - UITextFieldDelegate
extension ProductListView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let text = textField.text, !text.isEmpty {
            onSearch(text)
        }
        return true
    }
}

extension ProductListView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if procedures.isEmpty { return 1 }
//        return procedures.count
        10
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
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "teste", for: indexPath) as? UITableViewCell else { return .init() }
        cell.textLabel?.text = "TESTE"
        cell.tintColor = .darkGray
        cell.backgroundColor = .white
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let procedure = procedures[indexPath.row]
//        self.openProcedureDetails(procedure)
    }

}
