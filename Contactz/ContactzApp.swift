//
//  ContactzApp.swift
//  Contactz
//
//  Created by YJ Soon on 1/8/21.
//

import SwiftUI

@main
struct ContactzApp: App {
    
    @ObservedObject var contactManager = ContactManager()
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView(contacts: $contactManager.contacts)
                .onAppear() {
                    contactManager.load()
                }
                .onChange(of: scenePhase, perform: { value in
                    if value == .inactive {
                        contactManager.save()
                    }
                })
        }
    }
}
