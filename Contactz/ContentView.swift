//
//  ContentView.swift
//  Contactz
//
//  Created by YJ Soon on 1/8/21.
//

import SwiftUI

struct ContentView: View {
        
    @Binding var contacts: [Contact]
    @State var isSheetShown = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach($contacts) { $contact in
                    
                    NavigationLink(destination: ContactDetailView(contact: $contact)) {
                        VStack(alignment: .leading) {
                            Text(contact.name)
                                .font(.headline)
                            Text(contact.company)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    contacts.remove(atOffsets: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                    contacts.move(fromOffsets: indices, toOffset: newOffset)
                })
            }
            .navigationTitle("Contacts")
            .navigationBarItems(leading: EditButton(),
                                trailing: Button(action: {
                                    isSheetShown = true
                                }, label: {
                                    Image(systemName: "plus")
                                }))
        }
        .sheet(isPresented: $isSheetShown, content: {
            NewContactView(contacts: $contacts)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contacts: .constant([]))
    }
}
