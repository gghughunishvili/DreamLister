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
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ItemDetailsVC.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        ad.saveContext()
        
        //emptyStores()
        
        getStores()
        
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        let item = Item(context: context)
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = priceField.text {
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
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
            if self.stores.count == 0 {
                generateMockStoreData()
                getStores()
            }
            self.storePicker.reloadAllComponents()
        } catch {
            // Handle the error
        }
    }
    
    func generateMockStoreData() {
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
    }
    
    func emptyStores() {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Store")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            _ = try context.execute(request)
        } catch {
            // Catch the error
        }
        
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    
    
    
    
    
    
    
}
