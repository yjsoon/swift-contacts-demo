//
//  ContactDetailView.swift
//  Contactz
//
//  Created by Yin Jie Soon on 8/8/21.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State var contact: Contact
    
    var body: some View {
        ZStack {
            Image(contact.background)
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.5)
                .scaleEffect(1.2)
                .blur(radius: 10)
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
                    .padding(5.0)
                    .frame(width: .infinity)
                VStack(alignment: .leading) {
                    Text("Rating")
                        .bold()
                    Slider(value: $contact.rating, in: 0...5, step: 1)
                        .accentColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                }
                .padding()
                Spacer()
            }
        }
            
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: Contact(name: "Alice", company: "YouTube"))
    }
}
