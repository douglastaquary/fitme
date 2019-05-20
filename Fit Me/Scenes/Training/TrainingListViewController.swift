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
    func trainingListViewControllerDelegate(_ controller: TrainingListViewController, list: [Training])
}

public protocol TrainingListViewControllerProtocol: class {
    
    var interactor: TrainingListInteractorProtocol? { get set }
    
    func displayLoading()
    func hideLoading()
    func loadTrainings()
    func displayTrainingList(trainings: [Training])
    //func trainingListViewController(_ controller: TrainingListViewController)
}


public class TrainingListViewController: UIViewController {
    
    public var interactor: TrainingListInteractorProtocol?
    public weak var delegate: TrainingListViewControllerDelegate?
    
    public struct Constants {
        static let trainingCellIdentifier = "trainingCell"
    }
    
    public var viewModels: [Training] = [] {
        didSet {
            //hideLoadingIndicatorIfNeeded()
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
        
        title = NSLocalizedString("Workouts", comment: "Product list welcome title")
        
        installTableView()
        installCustomBackButton()
    }
    
    public func setup(configuration: FitmeConfiguration = FitmeConfiguration.defaultConfiguration) {
        let presenter = TrainingListPresenter(controller: self)
        interactor = TrainingListInteractor(presenter: presenter, repository: configuration.repository())
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
    
    fileprivate func loading(show: Bool) {
        tableView.reloadData()
        if !show {
            let backgroundView = WelcomeView()
            tableView.backgroundView = backgroundView
        }
    }

    
//    @objc private func addNewTraining() {
//        delegate?.welcomeViewController(self)
//    }
//
    

    public func installTableView() {
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: Constants.trainingCellIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
}

// MARK: - Scrolling support
var scrollableContentDidStartIntersectingSafeArea: (() -> Void)?
var scrollableContentDidStopIntersectingSafeArea: (() -> Void)?

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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.trainingCellIdentifier, for: indexPath) as? ExerciseTableViewCell else { return UITableViewCell() }
        
        let viewModel = viewModels[indexPath.row]
        
        //cell.viewModel = viewModel
        
//        cell.didReceiveTap = { [unowned self] in
//            self.delegate?.productListViewController(self, didSelectViewModel: viewModel)
//        }
//
        return cell
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
        
    }
    
    public func hideLoading() {
        
    }
    
    public func loadTrainings() {
        
    }
    
    public func displayTrainingList(trainings: [Training]) {
        interactor.debugDescription
        //interactor
        //setupAccessibility(viewModel: bannerViewModel)
    }
    
    
//    public func displayLoading() {
//        loading(show: true)
//    }
//
//    public func hideLoading() {
//        loading(show: false)
//    }
//
//    public func loadBanner() {
//        interactor?.fetchInteractBanner()
//    }
//
//    public func displayBanner(bannerViewModel: InteractBannerViewModel) {
//        setupAccessibility(viewModel: bannerViewModel)
//        delegate?.bannerView(view: self, willShowBanner: bannerViewModel)
//        currentBanner = bannerViewModel
//        imageBanner.image = bannerViewModel.icon
//    }
}
