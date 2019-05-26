//
//  ExerciseListViewController.swift
//  Fit Me
//
//  Created by Santander on 20/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit


public protocol ExerciseListViewControllerDelegate: class {
    func exerciseListViewControllerDelegate(_ controller: ExerciseListViewController)
}

public protocol ExerciseListViewControllerProtocol: class {
    
    var interactor: ExerciseListInteractorProtocol? { get set }
    
    func loadExercises()
    func displayExercisesList(viewModel: TrainingViewModel)
}


public class ExerciseListViewController: UIViewController {
    
    public var interactor: ExerciseListInteractorProtocol?
    public weak var delegate: ExerciseListViewControllerDelegate?
    
    let fitmeButton = FitmeButton()
    let buttonTopShadow = GradientView()
    
    public struct Constants {
        static let exerciseCellIdentifier = "exerciseListCell"
    }
    
    var viewModel: TrainingViewModel
    
    public lazy var contentStack: UIStackView = {
        let v = UIStackView(arrangedSubviews: [
            ])
        
        v.axis = .vertical
        v.alignment = .center
        v.spacing = Metrics.padding
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    init(viewModel: TrainingViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        title = NSLocalizedString(viewModel.training.title, comment: "Product list welcome title")
        fitmeButton.title = NSLocalizedString("Novo Treino", comment: "Exercise list button title")

        
        installTableView()
        installCustomBackButton()
        installFitmeButton()
        
        setup()
        
        loadExercises()
        
        tableView.reloadData()
    }
    
    public func setup() {
        let presenter = ExerciseListPresenter(controller: self)
        interactor = ExerciseListInteractor(presenter: presenter, repository: viewModel)
    }
    
    
    // MARK: - Private
    
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
    

    
    //    @objc private func addNewTraining() {
    //        delegate?.welcomeViewController(self)
    //    }
    //
    
    
    public func installTableView() {
        tableView.register(ExerciseListViewCell.self, forCellReuseIdentifier: Constants.exerciseCellIdentifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    private var finishController: FinishViewController?

    
    @objc private func showFinishController() {
        let finish = FinishViewController()
        finish.finishView.state = .finish
        finish.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        finish.view.frame = view.bounds
        view.addSubview(finish.view)
        addChild(finish)
        finish.didMove(toParent: self)
        
        finish.show()
        
        title = nil
        
        finishController = finish
    }
    
}

extension ExerciseListViewController {
    // MARK: - Public
    
    public func installFitmeButton() {
        view.addSubview(fitmeButton)
        
        let grid: CGFloat = Metrics.grid * 2
        
        fitmeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fitmeButton.heightAnchor.constraint(equalToConstant: 48),
            fitmeButton.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            fitmeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: grid),
            fitmeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -grid),
            fitmeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -grid * 5)
        ])
        
        fitmeButton.addTarget(self,
                              action: #selector(showFinishController),
                              for: .touchUpInside)
        
        view.addSubview(buttonTopShadow)
        buttonTopShadow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonTopShadow.heightAnchor.constraint(equalToConstant: grid * 4),
            buttonTopShadow.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            buttonTopShadow.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            buttonTopShadow.bottomAnchor.constraint(equalTo: fitmeButton.topAnchor)
            ])
        buttonTopShadow.colors = [UIColor.background, UIColor.background.withAlphaComponent(0)]
        buttonTopShadow.startPoint = CGPoint(x: 0.5, y: 1)
        buttonTopShadow.endPoint = CGPoint(x: 0.5, y: 0)
    }
}

// MARK: - Scrolling support

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
extension ExerciseListViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allExercices.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.exerciseCellIdentifier, for: indexPath) as? ExerciseListViewCell else { return UITableViewCell() }
        
        let viewModel = self.viewModel.exercisesViewModel[indexPath.row]
        
        cell.viewModel = viewModel
        
        cell.didChecked = { [unowned self] in
            print("Exercise finish!")
            //self.delegate?.productListViewController(self, didSelectViewModel: viewModel)
        }
        
        cell.didUncheck = { [unowned self] in
            print("Needs finish")
            //self.delegate?.productListViewController(self, didSelectViewModel: viewModel)
        }
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


extension ExerciseListViewController: ExerciseListViewControllerProtocol {
    
    public func loadExercises() {
        interactor?.fetchExercises()
    }
    
    public func displayExercisesList(viewModel: TrainingViewModel) {
        self.viewModel = viewModel
    }
    
}

