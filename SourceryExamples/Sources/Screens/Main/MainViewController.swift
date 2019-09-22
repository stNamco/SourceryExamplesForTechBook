//
//  MainViewController.swift
//  SourceryExamples
//
//  Created by stnamco on 2018/10/16.
//  Copyright © 2018年 namco. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController, VCInjectable {
    @IBOutlet weak var tableView: UITableView!
    
    struct Dependency: VCDependency {}
    
    private var presenter: MainPresenter!
    
    func setterInjection(with dependency: Dependency) {
        presenter = MainPresenter(view: self, dependency: .init(repository: ItemRepositoryImpl()))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.reload()
    }
    
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: String(describing: UITableViewCell.self))
    }
}

// MARK: - View

extension MainViewController: MainView {
    func presentAlert(error: Error) {
    }
    
    func updateItems() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UITableViewCell.self), for: indexPath)
        let item = presenter.items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detail: DetailViewController = UIStoryboard(name: String(describing: DetailViewController.self), bundle: Bundle(for: DetailViewController.self)).instantiateInitialViewController() as? DetailViewController else {
            return
        }
        let item = presenter.items[indexPath.row]
        detail.setterInjection(with: .init(repository: item))
        navigationController?.pushViewController(detail, animated: true)
    }
}
