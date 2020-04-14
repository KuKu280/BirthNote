//
//  FirstVC.swift
//  BirthNote
//
//  Created by Admin on 25/03/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import RealmSwift

class FirstVC: UITableViewController {

    
   
    
    var note:BirthNote?
    
    var noteArray:Results<BirthNote>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
       let realm = try! Realm()
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        
//        let notesresult = realm.objects(BirthNote.self)
//
//        for r in notesresult{
//            note.append(r)
//        }
//
//        tableView.reloadData()
        self.noteArray = realm.objects(BirthNote.self)
    
    }
    
    @IBAction func addNote(_ sender: UIBarButtonItem) {
        
        var nameTextFiled:UITextField!
        var birthTextField:UITextField!
        
        let alert = UIAlertController(title: "BirthNoteTaker", message: "", preferredStyle: .alert)
        
        alert.addTextField { (nameTF) in
            nameTextFiled = nameTF
            nameTF.placeholder = "Name"
        }
        
        alert.addTextField { (birthdateTF) in
            birthTextField = birthdateTF
            birthdateTF.placeholder = "mm/dd/yyyy"
        }
        
        let action = UIAlertAction(title: "Add", style: .default) { (add) in
            let e = BirthNote()
            e.name = nameTextFiled!.text!
            e.birthdate = birthTextField!.text!
            
            let realm = try! Realm()
            try! realm.write {
                realm.add(e)
//                self.note.append(e)
            }
            self.tableView.reloadData()
            
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noteArray!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        
        cell.textLabel?.text = self.noteArray![indexPath.row].name
        cell.detailTextLabel?.text = self.noteArray![indexPath.row].birthdate
        cell.imageView?.image = UIImage(named: "birthday1")
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailVC", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            if let notes = noteArray?[indexPath.row]{
                let realm = try! Realm()
                try! realm.write {
                    realm.delete(notes)
                }
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    


}

