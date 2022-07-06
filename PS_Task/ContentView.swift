//
//  ContentView.swift
//  PS_Task
//
//  Created by Esraa Lotfy  on 21/06/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var homeViewModel : HomeViewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            HomeScreen()
        }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
}


