//
//  HWS_C_5App.swift
//  HWS-C-5
//
//  Created by Vaibhav Ranga on 11/06/24.
//

import SwiftData
import SwiftUI

@main
struct HWS_C_5App: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
