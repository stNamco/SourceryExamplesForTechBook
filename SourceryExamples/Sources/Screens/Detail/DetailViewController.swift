//
//  DetailViewController.swift
//  SourceryExamples
//
//  Created by stnamco on 2018/10/16.
//  Copyright © 2018年 namco. All rights reserved.
//

import UIKit

final class DetailViewController: UIViewController, VCInjectable {
    struct Dependency: VCDependency {
        var repository: Repository
    }
    
    @IBOutlet weak var textView: UITextView!
    
    private var presenter: DetailPresenter!
    
    func setterInjection(with dependency: Dependency) {
        presenter = DetailPresenter(view: self, dependency: .init(repository: dependency.repository))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func configure() {
        navigationItem.title = presenter.title
        textView.text = presenter.description
    }
}

// MARK: - View

extension DetailViewController: DetailView {
}
