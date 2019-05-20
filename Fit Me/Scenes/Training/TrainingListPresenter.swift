//
//  TrainingListPresenter.swift
//  Fit Me
//
//  Created by Santander on 19/05/19.
//  Copyright © 2019 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

public protocol TrainingListPresenterProtocol {
    
    var controller: TrainingListViewControllerProtocol? { get set }
    
    func closeLoadingView()
    func presentLoadingView()
    func presentTrainingList(trainingList: [Training])
    func presentError(error: String)
    
}

public class TrainingListPresenter: TrainingListPresenterProtocol {

    public weak var controller: TrainingListViewControllerProtocol?
    
    // MARK: - Constructor
    
    init(controller: TrainingListViewControllerProtocol?) {
        self.controller = controller
    }
    
    public func closeLoadingView() {
        controller?.hideLoading()
    }
    
    public func presentLoadingView() {
        controller?.displayLoading()
    }
    
    public func presentError(error: String) {
        assertionFailure("Error = \(error)")
    }
    
    public func presentTrainingList(trainingList: [Training]) {
        controller?.displayTrainingList(trainings: trainingList)
    }
    
    // MARK: - Public
    
//    public func presentInteractBanner(response: Offer, icon: UIImage) {
//        view?.displayBanner(bannerViewModel: InteractBannerViewModel(response: response, icon: icon))
//    }
//
//    public func closeLoadingView() {
//        view?.hideLoading()
//    }
//
//    public func presentLoadingView() {
//        view?.displayLoading()
//    }
//
//    public func presentError(error: String) {
//        debugPrint(error)
//        view?.displayBanner(bannerViewModel: InteractBannerViewModel.santanderOnBanner())
//    }
    
}

