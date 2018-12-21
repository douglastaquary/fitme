//
//  AppFlowController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 14/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import CoreData

final class AppFlowController: UIViewController {
    
    let store: TrainingStore
    let moc = CoreDataStack()
    
    init(store: TrainingStore) {
        self.store = store
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var welcomeViewController = TrainingListViewController()
    
    private lazy var rootNavigationController: UINavigationController = {
        let controller = UINavigationController(rootViewController: welcomeViewController)
        
        controller.navigationBar.prefersLargeTitles = true
        
        return controller
    }()
    
    func goList() {
        rootNavigationController.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .background
        
        installRootNavigationController()
        installTrainigListSupport()
    }
    
    private func installRootNavigationController() {
        addChild(rootNavigationController)
        rootNavigationController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        rootNavigationController.view.frame = view.bounds
        view.addSubview(rootNavigationController.view)
        rootNavigationController.didMove(toParent: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //loadTrainings()
    }
    
    private func loadTrainings() {
        store.fetchAll { result in
            switch result {
            case .error(let error):
                fatalError("Demo mode should never return an error, but returned error: \(error.localizedDescription)")
            case .success(let trainings):
                //self.welcomeViewController.viewModel =
                print("Chamar a lista \(trainings)")
            }
        }
    }
    
    // MARK: - Training listing
    
    private func installTrainigListSupport() {
        welcomeViewController.delegate = self
        
        hideNavigationBarBackground(animated: false)
        
//        welcomeViewController.scrollableContentDidStartIntersectingSafeArea = { [weak self] in
//            self?.showNavigationBarBackground()
//        }
//        welcomeViewController.scrollableContentDidStopIntersectingSafeArea = { [weak self] in
//            self?.hideNavigationBarBackground()
//        }
    }
    
    private let animationDuration: Double = 0.3
    
    private func hideNavigationBarBackground(animated: Bool = true) {
        let duration = animated ? animationDuration : 0
        
        UIView.animate(withDuration: duration) {
            self.rootNavigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.rootNavigationController.navigationBar.barTintColor = .clear
        }
    }
    
    private func showNavigationBarBackground(animated: Bool = true) {
        let duration = animated ? animationDuration : 0
        
        UIView.animate(withDuration: duration) {
            self.rootNavigationController.navigationBar.setBackgroundImage(nil, for: .default)
            self.rootNavigationController.navigationBar.barTintColor = .white
        }
    }
    
    func addNewTraining() {
        let addController = CreateTrainingViewController()
        addController.delegate = self
        rootNavigationController.pushViewController(addController, animated: true)
    }
    

    // MARK: - Add Exercise flow
    private var addExerciseFlow: AddExerciseFlowController?
    
    func exerciseEdit() {
        let flow = AddExerciseFlowController(from: self)
        
        flow.delegate = self
        
        flow.start()
        
        addExerciseFlow = flow
    }

}

extension AppFlowController: WelcomeViewControllerDelegate {
    func welcomeViewController(_ controller: TrainingListViewController) {
        addNewTraining()
    }
}

extension AppFlowController: CreateTrainingViewControllerDelegate {
    func createTrainingViewController(_ controler: CreateTrainingViewController, training: Training) {
        exerciseEdit()
    }
    
    func didTapRecordButton(to user: User, training: Training) {
        user.addToUserTrainings(training)
    }
    
}

extension AppFlowController: AddExerciseViewControllerDelegate {
    func addExerciseViewController(_ controller: AddExerciseViewController, exercise: Exercise) {
        print("Add new exercise")
    }
    
}

extension AppFlowController: AddExerciseFlowControllerDelegate {
    func addExerciseFlowControllerDidPresentSuccessScreen(_ controller: AddExerciseFlowController) {
        
    }
    
    
}
