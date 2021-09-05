//
//  ContactManager.swift
//  Contactz
//
//  Created by Yin Jie Soon on 5/9/21.
//

import Foundation
import SwiftUI

class ContactManager: ObservableObject {
    
    @Published var contacts: [Contact] = []
    
    func getArchiveURL() -> URL {
        let plistName = "contacts.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedContacts = try? propertyListEncoder.encode(contacts)
        try? encodedContacts?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        var finalContacts: [Contact]!
        
        if let retrievedContactsData = try? Data(contentsOf: archiveURL),
           let decodedContacts = try? propertyListDecoder.decode(Array<Contact>.self, from: retrievedContactsData) {
            finalContacts = decodedContacts
        } else {
            finalContacts = [
                Contact(name: "Alice", company: "Apple", rating: 5, background: "Alice"),
                Contact(name: "Bob", company: "Box"),
                Contact(name: "Charles", company: "Coconuts"),
                Contact(name: "Blah blah", company: "Donkeys")
            ]
        }
        
        contacts = finalContacts
    }
    
    
}
