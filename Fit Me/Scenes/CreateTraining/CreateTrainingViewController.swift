//
//  AddTableViewController.swift
//  Fit Me
//
//  Created by Douglas Taquary on 07/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import UIKit
import FitmeKit


enum TrainingViewModelItemType {
    case trainingName 
    case tag
    case day
    case categories
    case more
}

protocol CreateTrainingViewControllerDelegate: class {
    func createTrainingViewController(_ controler: CreateTrainingViewController)
    func didTapRecordButton(to user: User, viewModel: TrainingViewModel)
}

final class CreateTrainingViewController: UIViewController {

    fileprivate var viewModel = CategoryViewModel()
    
    weak var delegate: CreateTrainingViewControllerDelegate?
    
    private struct Constants {
        static let trainingNameCellIdentifier = "trainingNameCell"
        static let tagColorCellIdentifier = "tagColorCell"
        static let dayCellIdentifier = "dayCell"
        static let categoriesCellIdentifier = "categoriesCell"
        static let exerciseCellIdentifier = " exerciseCell"
        static let headerIdentifier = " exerciseCell"
    }
    
    var training: TrainingViewModel? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    // MARK: - Table View
    private lazy var tableView: UITableView = {
        let v = UITableView(frame: .zero, style: .grouped)
        v.separatorColor = .clear
        v.separatorInset = UIEdgeInsets()
        v.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        return v
    }()
    
    private lazy var continueButton: FitmeButton = {
        let b = FitmeButton()
        
        b.heightAnchor.constraint(equalToConstant: Metrics.buttonHeight).isActive = true
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        return b
    }()
    
    private lazy var footerView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: Metrics.grid*12))
        
        v.translatesAutoresizingMaskIntoConstraints = true
        v.backgroundColor = .background
        
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupEditModeUI()
        
        title = NSLocalizedString("Criar Treino", comment: "Record training title")
        
        viewModel.reloadSections = { [weak self] (section: Int) in
            guard let `self` = self else { return }
            self.tableView.beginUpdates()
            self.tableView.reloadSections([section], with: .fade)
            self.tableView.endUpdates()
        }

        footerView.addSubview(continueButton)
        
        continueButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: Metrics.padding*3).isActive = true
        continueButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -Metrics.padding*3).isActive = true
        continueButton.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        continueButton.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        installTableView()
        updateUI()
    }
    
    private func installTableView() {
        registerCells()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .background
        
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.frame = view.bounds
        tableView.tableFooterView = footerView
        view.addSubview(tableView)
    }
    
    private func updateUI() {
        continueButton.setAttributedTitle(viewModel.attributedButtonTitle, for: .normal)
    }
    
//    private func setupEditModeUI() {
//        let moc = CoreDataStack()
//        let context = moc.persistentContainer.viewContext
//        training = Training(context: context)
//        
//    }
    
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
}


// MARK: - Table view data source and delegate
extension CreateTrainingViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section >= 4 {
            if viewModel.categories[section].isCollapsed {
                return 0
            } else {
                return viewModel.categories[section].rowCount
            }
        } else if section == 3 {
            return 0
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let item = viewModel.categories[section]
        if item.type == .more {
            return Metrics.categoryCellHeight
        }
        
        return Metrics.sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.categories[indexPath.section]
        
        switch item.type {
        case .trainingName:
           let nameCell = tableView.dequeueReusableCell(withIdentifier: Constants.trainingNameCellIdentifier, for: indexPath) as! TrainingNameTableViewCell
            return nameCell
        case .tag:
            let tagCell = tableView.dequeueReusableCell(withIdentifier: Constants.tagColorCellIdentifier, for: indexPath) as! TagColorTableViewCell
            return tagCell
        case .day:
            guard let dayCell = tableView.dequeueReusableCell(withIdentifier: Constants.dayCellIdentifier, for: indexPath) as? DayTableViewCell else { return UITableViewCell() }
            return dayCell
        case .more:
            guard let exerciseCell = tableView.dequeueReusableCell(withIdentifier: Constants.exerciseCellIdentifier, for: indexPath) as? ExerciseTableViewCell else { return UITableViewCell() }
            
            let exerciseView = exerciseCell.exerciseView
            
            exerciseView.exerciseLabel.text = item.items[indexPath.row]
            
            exerciseCell.didTapCategory = { [unowned self] in
//                guard let viewModel = self.training else {
//                    return
//                }
                
                self.delegate?.createTrainingViewController(self)
            }
            
            return exerciseCell
            
        default:
            return UITableViewCell()
        }

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionView = CreateTrainingHeaderSectionView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: Metrics.cellHeight))
            let item = viewModel.categories[section]
            switch item.type {
            case .trainingName:
                sectionView.sectionLabel.text = item.sectionTitle
            case .tag:
                sectionView.sectionLabel.text = item.sectionTitle
            case .day:
                sectionView.sectionLabel.text = item.sectionTitle
            case .categories:
                sectionView.sectionLabel.text = item.sectionTitle
            case .more:
                let categoryView = CategoryView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: Metrics.cellHeight))
                categoryView.setupView(categoria: item.sectionTitle)
                categoryView.delegate = self
                categoryView.section = section
                
                return categoryView
            }
 
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let safeAreaReference = -(scrollView.adjustedContentInset.top - Metrics.padding)
        
        isScrollableContentIntersectingSafeArea = safeAreaReference < scrollView.contentOffset.y
    }
    
    
}

extension CreateTrainingViewController {
    
    private func registerCells() {
        tableView.register(TrainingNameTableViewCell.self, forCellReuseIdentifier: Constants.trainingNameCellIdentifier)
        tableView.register(TagColorTableViewCell.self, forCellReuseIdentifier: Constants.tagColorCellIdentifier)
        tableView.register(DayTableViewCell.self, forCellReuseIdentifier: Constants.dayCellIdentifier)
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: Constants.categoriesCellIdentifier)
        tableView.register(ExerciseTableViewCell.self, forCellReuseIdentifier: Constants.exerciseCellIdentifier)
    }
    
    @objc private func didTapButton() {

        guard let newTraining = training else { return }
        //delegate?.didTapRecordButton(to: <#T##User#>, viewModel: <#T##TrainingViewModel#>)
    }
}


extension CreateTrainingViewController: CategorySectionViewDelegate {
    func toggleSection(header: CategoryView, section: Int) {
        var item = viewModel.categories[section]
        if item.isCollapsible {
            
            // Toggle collapse
            let collapsed = !item.isCollapsed
            item.isCollapsed = collapsed
            header.setCollapsed(collapsed: collapsed)
            
            // Adjust the number of the rows inside the section
            viewModel.reloadSections?(section)
        }
    }
    
}
