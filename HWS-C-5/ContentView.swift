//
//  ContentView.swift
//  HWS-C-5
//
//  Created by Vaibhav Ranga on 11/06/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var users: [User]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(users) { user in
                    NavigationLink(value: user) {
                        HStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                                .foregroundStyle(.indigo)
                                .frame(width: 45, height: 45)
                                .overlay(alignment: .bottomTrailing) {
                                    Circle()
                                        .foregroundStyle(user.isActive ? .green : .red)
                                        .frame(width: 15, height: 15)
                                }
                        }
                        Text(user.name)
                    }
                }
            }
            .navigationTitle("Friends Face")
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .task {
                if users.isEmpty {
                    await loadUsers()
                }
            }
        }
    }
    
    func loadUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedData = try? decoder.decode([User].self, from: data) {
                
                for user in decodedData {
                    modelContext.insert(user)
                }
            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: User.self, inMemory: true)
}
