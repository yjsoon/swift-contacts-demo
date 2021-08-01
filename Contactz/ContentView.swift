//
//  ContentView.swift
//  Contactz
//
//  Created by YJ Soon on 1/8/21.
//

import SwiftUI

struct ContentView: View {
    
    var contacts = [
        Contact(name: "Alice", company: "ABC"),
        Contact(name: "Bob", company: "ABC"),
        Contact(name: "Charles", company: "ABC")
    ]
    
    var body: some View {
        NavigationView {
            List(contacts) {
                Text($0.name)
            }
            .navigationTitle("Contacts")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
