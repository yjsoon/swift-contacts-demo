//
//  ContentView.swift
//  Contactz
//
//  Created by YJ Soon on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var contacts = [
        Contact(name: "Alice", company: "Apple", rating: 5, background: "Alice"),
        Contact(name: "Bob", company: "Box"),
        Contact(name: "Charles", company: "Coconuts")
    ]
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                let index = contacts.firstIndex {
                    $0.name == contact.name
                }!
                
                NavigationLink(destination: ContactDetailView(contact: $contacts[index])) {
                    VStack(alignment: .leading) {
                        Text(contact.name)
                            .font(.headline)
                        Text(contact.company)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Contacts")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
