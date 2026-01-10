//
//  MainScreen.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct MainScreen: View {
    
    @State private var appTab: AppTab = .home

    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $appTab) {
                DoctorListView()
                    .tag(AppTab.home)
                Text("Приёмы")
                    .tag(AppTab.calendar)
                Text("Чат")
                    .tag(AppTab.chat)
                Text("Профиль")
                    .tag(AppTab.profile)
            }
            .toolbar(.hidden, for: .tabBar)

            TabBarView(selected: $appTab, chatBadge: 1)
        }
    }
}

#Preview {
    MainScreen()
}
