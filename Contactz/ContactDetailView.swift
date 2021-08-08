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
        VStack {
            Image(contact.name)
                .resizable()
                .frame(width: 200.0, height: 200.0)
                .scaledToFit()
                .mask(Circle())
                .overlay(Circle()
                            .stroke(lineWidth: 8)
                            .foregroundColor(.white))
                .shadow(radius: 10)
                .padding(.top, 30.0)
            Text(contact.name)
                .font(.largeTitle)
            Text(contact.company)
                .font(.headline)
                .foregroundColor(.gray)
                .padding(5.0)
            Spacer()
        }
            
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Alice", company: "YouTube"))
    }
}
