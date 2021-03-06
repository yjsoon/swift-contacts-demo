//
//  Contact.swift
//  Contactz
//
//  Created by YJ Soon on 1/8/21.
//

import Foundation

struct Contact: Identifiable, Codable {
    
    var name: String
    var company: String
    var rating: Double = 0.0
    var background: String = "bg"
    var id = UUID()
    
}
