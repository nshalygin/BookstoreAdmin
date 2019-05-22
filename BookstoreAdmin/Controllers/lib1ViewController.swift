//
//  ViewController.swift
//  TableBinding
//
//  Created by Nikita on 17/11/18.
//  Copyright © 2018 Nikita. All rights reserved.
//

import Cocoa

class lib1ViewController: NSViewController {
    
    @IBOutlet var resultAC: NSArrayController!
    @IBOutlet weak var searchResultTF: NSTextField!
    @IBOutlet weak var criterionCB: NSComboBox!
    @IBOutlet weak var tableView: NSScrollView!
    var crirerion = ""
    
    /// the data for the table
    @objc dynamic var dataArray = [searchResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func searchClicked(_ sender: NSButton) {
        
        dataArray.removeAll()
        
        switch criterionCB.stringValue {
        case "Книга":
            crirerion = "bookTitle"
            break
        case "Жанр":
            crirerion = "genre"
            break
        case "Автор":
            crirerion = "authName"
            break
        default:
            return
        }
        
        dbRequstManager.getSearchResults(query: searchResultTF.stringValue, criterion: crirerion) { (funcArray, error) in
            self.dataArray = funcArray
        }
        
        if searchResultTF.stringValue == "" {
            
            dbRequstManager.getSearchResults(query: searchResultTF.stringValue, criterion: crirerion) { (funcArray, error) in
                self.dataArray = funcArray
            }
            
        }
        
    }
    
    @IBAction func removeButton(_ sender: NSButton) {
        if let selectedRow = resultAC.selectedObjects.first as? searchResult {
            resultAC.removeObject(selectedRow)
        }
    }
    
}

// make search responses to return key
extension lib1ViewController: NSTextFieldDelegate {
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector == #selector(insertNewline(_:)){
            searchClicked(NSButton.init())
        }
        return false
    }
}
