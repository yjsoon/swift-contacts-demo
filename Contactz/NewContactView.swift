//
//  NewContactView.swift
//  Contactz
//
//  Created by Yin Jie Soon on 22/8/21.
//

import SwiftUI

struct NewContactView: View {

    @Binding var contacts: [Contact]
    @State var newContact = Contact(name: "", company: "")
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal information")) {
                    TextField("Name", text: $newContact.name)
                        .disableAutocorrection(true)
                    TextField("Company", text: $newContact.company)
                    TextField("Background image", text:$newContact.background)
                }
                
                Section(header: Text("Rating")) {
                    Slider(value: $newContact.rating, in: 0...5, step: 1)
                }
                
                Section {
                    Button("Save") {
                        contacts.append(newContact)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }.foregroundColor(.red)
                }
            }
            .navigationTitle("New Contact")
        }
    }
}

struct NewContactView_Previews: PreviewProvider {
    static var previews: some View {
        NewContactView(contacts: .constant([]))
    }
}
