//
//  AddExerciseFlowController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit

protocol AddExerciseFlowControllerDelegate: class {
    func addExerciseFlowControllerDidPresentSuccessScreen(_ controller: AddExerciseFlowController)
}

final class AddExerciseFlowController: NSObject {
    
    weak var delegate: AddExerciseFlowControllerDelegate?
    
    //private var addExerciseViewModel: PurchaseViewModel?
    
    enum AddExerciseError: Error {
        case exerciseRecordError
        
        var localizedDescription: String {
            switch self {
            case .exerciseRecordError:
                return NSLocalizedString("Erro ao gravar exercicio", comment: "Error presented when a record exercise")
            }
        }
    }
    
    weak var presenter: UIViewController?
    
    var exercise: Exercise!
    
    init(from presenter: UIViewController) {
        self.presenter = presenter
        
        super.init()
    }
    
    func start() {
        
        let addExerciseController = AddExerciseViewController()

        addExerciseController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        presenter?.present(addExerciseController, animated: true, completion: nil)
    }
    
    func presentSuccessScreen() {
        // only one product is supported for now
//        guard let product = products.first else { return }
//
//        let purchaseViewModel = PurchaseViewModel(product: product)
//        let success = PurchaseSuccessViewController(viewModel: purchaseViewModel)
//        success.delegate = self
//
//        self.purchaseViewModel = purchaseViewModel
//
//        presenter?.present(success, animated: true) { [unowned self] in
//            self.delegate?.purchaseFlowControllerDidPresentSuccessScreen(self)
//            self.donateInteraction(with: purchaseViewModel)
//        }
        
    }
    

    
    func presentError(_ error: Error) {
        
    }
    
}

// MARK: - PurchaseSuccessViewControllerDelegate

extension AddExerciseFlowController: AddExerciseFlowControllerDelegate {
    func addExerciseFlowControllerDidPresentSuccessScreen(_ controller: AddExerciseFlowController) {
        //let controller =
    }

}

