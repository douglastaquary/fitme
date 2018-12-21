//
//  CategoryViewModel.swift
//  Fit Me
//
//  Created by Douglas Taquary on 21/10/18.
//  Copyright © 2018 Douglas Taquary. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewModel: NSObject {
    
    var categories = [CategoryViewModelItem]()
    
    var reloadSections: ((_ section: Int) -> Void)?
    
    public var buttonTitle: String {
        return NSLocalizedString("Concluir", comment: "Title of button add ")
    }
    
    public var attributedButtonTitle: NSAttributedString {
        return NSAttributedString(string: buttonTitle, attributes: CategoryViewModel.buttonTitleAttributes)
    }
    
    private static let buttonTitleAttributes: [NSAttributedString.Key: Any] = {
        return [
            .foregroundColor: UIColor.background,
            .font: UIFont.systemFont(ofSize: Metrics.buttonTitleFontSize, weight: Metrics.buttonTitleFontWeight)
        ]
    }()
    
    override init() {
        super.init()
        
        let items = ["Bíceps máquina", "Rosca Scoott", "Rosca inversa", "Rosca direita"]
        
        let name = CategoryViewModelNameItem()
        categories.append(name)
        
        let tag = CategoryViewModelTagItem()
        categories.append(tag)
        
        let day = CategoryViewModelDayItem()
        categories.append(day)
        
        let category = CategoryViewModelCustableItem()
        categories.append(category)
        
        let biceps = CategoryViewModelBicepsItem(items: items)
        categories.append(biceps)
        
        let triceps = CategoryViewModelTricepsItem(items: items)
        categories.append(triceps)
        
        let dorsal = CategoryViewModelDorsalItem(items: items)
        categories.append(dorsal)
        
        let peitoral = CategoryViewModelDorsalItem(items: items)
        categories.append(peitoral)
        
    }
}

class CategoryViewModelNameItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .trainingName
    }
    
    var items: [String] {
        return []
    }
    
    var sectionTitle: String {
        return ""
    }
    
    var isCollapsed = false
    
    var rowCount: Int {
        return items.count
    }
    
    init() {}
}

class CategoryViewModelTagItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .tag
    }
    
    var items: [String] {
        return []
    }
    
    var sectionTitle: String {
        return "Cor da tag"
    }
    
    var isCollapsed = false
    
    var rowCount: Int {
        return items.count
    }
    
    init() {}
}


class CategoryViewModelDayItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .day
    }
    
    var items: [String] {
        return []
    }
    
    var sectionTitle: String {
        return "Selecione o dia do treino"
    }
    
    var isCollapsed = false
    
    var rowCount: Int {
        return items.count
    }
    
    init() {}
}

class CategoryViewModelCustableItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .categories
    }
    
    var items: [String] {
        return []
    }
    
    var sectionTitle: String {
        return "Personalize os exercícios"
    }
    
    var isCollapsed = false
    
    var rowCount: Int {
        return items.count
    }
    
    init() {}
}


class CategoryViewModelBicepsItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .more
    }
    
    var items: [String]
    
    var sectionTitle: String {
        return "Bíceps"
    }
    
    var isCollapsed = true
    
    var rowCount: Int {
        return items.count
    }
    
    init(items: [String]) {
        self.items = items
    }
}

class CategoryViewModelTricepsItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .more
    }
    
    var items: [String]
    
    var sectionTitle: String {
        return "Tríceps"
    }
    
    var isCollapsed = true
    
    var rowCount: Int {
        return items.count
    }
    
    init(items: [String]) {
        self.items = items
    }
}

class CategoryViewModelDorsalItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .more
    }
    
    var items: [String] 
    
    var sectionTitle: String {
        return "Dorsal"
    }
    
    var isCollapsed = true
    
    var rowCount: Int {
        return items.count
    }
    
    init(items: [String]) {
        self.items = items
    }
}

class CategoryViewModelPeitoralItem: CategoryViewModelItem {
    var type: TrainingViewModelItemType {
        return .more
    }
    
    var items: [String]
    
    var sectionTitle: String {
        return "Peitoral"
    }
    
    var isCollapsed = true
    
    var rowCount: Int {
        return items.count
    }
    
    init(items: [String]) {
        self.items = items
    }
}
