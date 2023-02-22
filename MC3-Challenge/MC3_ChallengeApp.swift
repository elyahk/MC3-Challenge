//
//  MC3_ChallengeApp.swift
//  MC3-Challenge
//
//  Created by Eldorbek Nusratov on 20/02/23.
//

import SwiftUI

@main
struct MC3_ChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ChatbotView(viewModel: .mock)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
