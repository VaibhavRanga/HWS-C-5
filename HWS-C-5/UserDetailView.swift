//
//  UserDetailView.swift
//  HWS-C-5
//
//  Created by Vaibhav Ranga on 11/06/24.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle")
                .font(.system(size: 100))
                .frame(width: 100, height: 100)
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(.white)
                        .overlay(alignment:.center) {
                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundStyle(user.isActive ? .green : .red)
                        }
                }
            Text(user.name)
                .font(.title3.bold())
            Text("Age: \(user.age)")
            Text("Company: \(user.company)")
            Text("Registered on: \(user.registered)")
            
            List {
                Section("Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle("User detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    return UserDetailView()
//}
