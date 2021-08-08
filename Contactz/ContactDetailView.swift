//
//  ContactDetailView.swift
//  Contactz
//
//  Created by Yin Jie Soon on 8/8/21.
//

import SwiftUI

struct ContactDetailView: View {
    
    var contact: Contact
    
    var body: some View {
        Text(contact.name)
            .font(.largeTitle)
            
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Rick", company: "YouTube"))
    }
}
