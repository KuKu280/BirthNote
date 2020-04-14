//
//  BirthNote.swift
//  BirthNote
//
//  Created by Admin on 01/04/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import RealmSwift



class BirthNote:Object{
    
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name:String = ""
    @objc dynamic var birthdate:String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["name","birthdate"]
    }
    

}
