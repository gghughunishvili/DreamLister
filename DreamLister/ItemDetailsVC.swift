//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Giorgi Ghughunishvili on 2/22/17.
//  Copyright © 2017 Giorgi Ghughunishvili. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!

    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        storePicker.delegate = self
        storePicker.dataSource = self
        
        let store1 = Store(context: context)
        store1.name = "Jason Inc"
        
        let store2 = Store(context: context)
        store2.name = "Buy If you can"
        
        let store3 = Store(context: context)
        store3.name = "Best Buy"
        
        let store4 = Store(context: context)
        store4.name = "No Mercy"
        
        let store5 = Store(context: context)
        store5.name = "Why Not?!"
        
        let store6 = Store(context: context)
        store6.name = "True Value"
        
        ad.saveContext()
        
        getStores()
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let store = stores[row]
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update when selected
    }
    
    func getStores() {
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        } catch {
            // Handle the error
        }
    }
    
    
    
    
    
    
    
    
    
    
}