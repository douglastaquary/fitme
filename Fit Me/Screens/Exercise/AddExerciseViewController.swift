//
//  AddExerciseViewController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 04/11/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import CoreData

public enum ExerciseStatus {
    case editing
    case succeessfully
}

protocol AddExerciseViewControllerDelegate: class {
    func addExerciseViewController(_ controller: AddExerciseViewController, exercise: Exercise)
}

final class AddExerciseViewController: UIViewController {
    
    weak var delegate: AddExerciseViewControllerDelegate?
    
    let moc = CoreDataStack()
//
    var addExerciseView = AddExerciseView(frame: .zero)
    var exercise: Exercise!
    var status: ExerciseStatus = .editing
    
//    init(exercise: Exercise, exerciseStatus: ExerciseStatus) {
//        self.exercise = exercise
//        self.status = exerciseStatus
//
//        super.init(nibName: nil, bundle: nil)
//    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
         buildUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private func buildUI() {
        view.addSubview(addExerciseView)
        addExerciseView.translatesAutoresizingMaskIntoConstraints = false

        view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        addExerciseView.heightAnchor.constraint(equalToConstant: 306).isActive = true
        addExerciseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.grid*2).isActive = true
        addExerciseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.grid*2).isActive = true
        addExerciseView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Metrics.grid*3).isActive = true
        addExerciseView.layer.cornerRadius = 10
        
       // displayExerciseEditMode()
    }
    
    @objc private func editExercise() {
        delegate?.addExerciseViewController(self, exercise: self.exercise)
    }
    
//    public func displayExerciseEditMode() {
//        if let contentView = self.navigationController?.view {
//            
//            contentView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
//
//            //contentView.addSubview(addExerciseView)
//
//            let y = contentView.frame.height - 306
//            
//            contentView.frame = CGRect(x: 0, y: contentView.frame.height, width: contentView.frame.width, height: 306)
//            
//            var frame = contentView.frame
//            frame.origin.y = 0
//            contentView.frame = frame
//            contentView.backgroundColor = UIColor.black.withAlphaComponent(0)
//            
//            UIView.animate(withDuration: 0.3,
//                           delay: 0,
//                           options: [.curveEaseOut],
//                           animations: {
//                            contentView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
//                            self.addExerciseView.frame = CGRect(x: 0, y: y, width: contentView.frame.width, height: 306)
//            }, completion: nil)
//        }
//    }
//    
//    private func handleDismiss() {
//        if let contentView = self.navigationController?.view  {
//            UIView.animate(withDuration: 0.3,
//                           delay: 0,
//                           options: [.curveEaseIn],
//                           animations:
//                {
//                    contentView.backgroundColor = UIColor.black.withAlphaComponent(0)
//                    self.addExerciseView.frame = CGRect(x: 0, y: contentView.frame.height, width: contentView.frame.width, height: contentView.frame.height)
//                    
//            }, completion: nil)
//        }
//    }
//


}
