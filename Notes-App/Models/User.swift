//
//  Users.swift
//  Notes-App
//
//  Created by Subhronil Saha on 15/11/20.
//

import RealmSwift

class User: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var mobile : String = ""
    @objc dynamic var password : String = ""
}
