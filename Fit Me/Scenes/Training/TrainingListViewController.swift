//
//  WelcomeViewController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 06/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit



public protocol TrainingListViewControllerDelegate: class {
    func trainingListViewControllerDelegate(_ controller: TrainingListViewController, training: Training)
}

public protocol TrainingListViewControllerProtocol: class {
    
    var interactor: TrainingListInteractorProtocol? { get set }
    
    func displayLoading()
    func hideLoading()
    func loadTrainings()
    func displayTrainingList(trainings: [TrainingViewModel])
}


public class TrainingListViewController: UIViewController {
    
    private var configuration: FitmeConfiguration?
    
    public var interactor: TrainingListInteractorProtocol?
    public weak var delegate: TrainingListViewControllerDelegate?
    
    public struct Constants {
        static let trainingCellIdentifier = "trainingCell"
    }
    
    public var viewModels: [TrainingViewModel] = [] {
        didSet {
            hideLoadingIndicatorIfNeeded()
            tableView.reloadData()
        }
    }
    

    public lazy var contentStack: UIStackView = {
       let v = UIStackView(arrangedSubviews: [
        ])
        
        v.axis = .vertical
        v.alignment = .center
        v.spacing = Metrics.padding
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    convenience init(configuration: FitmeConfiguration? = nil) {
        self.init()
        self.configuration = configuration
    }
    
    // MARK: - Loading state
    
    private var loadingController: LoadingViewController?
    
    func showLoadingIndicatorIfNeeded() {
        showLoadingIndicator()
    }
    
    func showLoadingIndicator() {
        let loading = LoadingViewController()
        loading.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loading.view.frame = view.bounds
        view.addSubview(loading.view)
        addChild(loading)
        loading.didMove(toParent: self)
        
        loading.show()
        
        loadingController = loading
    }
    
    func hideLoadingIndicatorIfNeeded() {
        loadingController?.hide(animated: true, completion: { [weak self] in
            self?.loadingController = nil
        })
    }
    
    // MARK: - Table View
    public lazy var tableView: UITableView = {
        let v = UITableView()
        
        v.separatorColor = .clear
        v.separatorInset = UIEdgeInsets()
        v.contentInset = UIEdgeInsets(top: Metrics.padding, left: 0, bottom: 0, right: 0)
        
        return v
    }()
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("Treinos", comment: "Product list welcome title")
        
        installTableView()
        installCustomBackButton()
        
        setup()
        
        loadTrainings()
    }
    
    public func setup(configuration: FitmeConfiguration = FitmeConfiguration.defaultConfiguration) {
        let presenter = TrainingListPresenter(controller: self)
        interactor = TrainingListInteractor(presenter: presenter, repository: configuration.repository())
    }
    
    // MARK: - Private
    
    private func setupList() {
        if let config = configuration {
            self.setup(configuration: config)
        }
    }


    public func installCustomBackButton() {
        let backItem = UIBarButtonItem(
            title: "",
            style: .plain,
            target: nil,
            action: nil
        )
        
        backItem.tintColor = .primaryText
        navigationItem.backBarButtonItem = backItem
    }
    
    override public var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Private
    
    fileprivate func displayBackgroundViewIfNeeded() {
        tableView.reloadData()
        if self.viewModels.isEmpty {
            hideLoadingIndicatorIfNeeded()
            let backgroundView = WelcomeView()
            tableView.backgroundView = backgroundView
        }
    }

    
//    @objc private func addNewTraining() {
//        delegate?.welcomeViewController(self)
//    }
//
    

    public func installTableView() {
        tableView.register(TrainingViewCell.self, forCellReuseIdentifier: Constants.trainingCellIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }

}

// MARK: - Scrolling support
public var scrollableContentDidStartIntersectingSafeArea: (() -> Void)?
public var scrollableContentDidStopIntersectingSafeArea: (() -> Void)?

private var isScrollableContentIntersectingSafeArea = false {
    didSet {
        guard isScrollableContentIntersectingSafeArea != oldValue else { return }
        
        if isScrollableContentIntersectingSafeArea {
            scrollableContentDidStartIntersectingSafeArea?()
        } else {
            scrollableContentDidStopIntersectingSafeArea?()
        }
    }
}




// MARK: - Table view data source and delegate
extension TrainingListViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.trainingCellIdentifier, for: indexPath) as? TrainingViewCell else { return UITableViewCell() }
        
        let viewModel = viewModels[indexPath.row]
        
        cell.viewModel = viewModel
        
        cell.didReceiveTap = { [unowned self] in
            print("Tap to show training detail")
            //self.delegate?.productListViewController(self, didSelectViewModel: viewModel)
        }
//
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88 //
    }
    
    public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaReference = -(scrollView.adjustedContentInset.top - Metrics.padding)
        
        isScrollableContentIntersectingSafeArea = safeAreaReference < scrollView.contentOffset.y
    }
    
}


extension TrainingListViewController: TrainingListViewControllerProtocol {
    
    public func displayLoading() {
        showLoadingIndicatorIfNeeded()
    }
    
    public func hideLoading() {
        displayBackgroundViewIfNeeded()
        
    }
    
    public func loadTrainings() {
        interactor?.fetchTrainigs()
    }
    
    public func displayTrainingList(trainings: [TrainingViewModel]) {
        self.viewModels = trainings
        //interactor
        //setupAccessibility(viewModel: bannerViewModel)
    }

}
