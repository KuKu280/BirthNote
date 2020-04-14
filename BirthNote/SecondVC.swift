//
//  SecondVC.swift
//  BirthNote
//
//  Created by Admin on 19/03/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

//class BirthCountDown{
//    var countdown:String
//    
//    init(countdown:String) {
//        self.countdown = countdown
//    }
//}


class SecondVC: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBOutlet weak var tapButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        tapButton.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        tapButton.layer.borderWidth = 3.0
        
      let notesave =  UserDefaults.standard.object(forKey: "countdown")
        
        if let countdownnote = notesave as? String{
            textLabel.text = notesave as! String
        }

    }
    
    @IBAction func countDown(_ sender: UIButton) {
       countdown()
        

    }
    
     func countdown(){
        let birthdate = datePicker.date
        let diffDateComponents = Calendar.current.dateComponents([.day,.hour,.minute], from: Date(), to: birthdate)
        textLabel.text = "\(diffDateComponents.day!) days:\(diffDateComponents.hour!) hours:\(diffDateComponents.minute!) minutes"
        UserDefaults.standard.set(textLabel.text!, forKey: "countdown")
    }
    

    
    
    

}

