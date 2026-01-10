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
                    .tabItem {
                        Label(AppTab.home.title, image: AppTab.home.imageName)
                    }
                    .tag(AppTab.home)

                Text("Приёмы")
                    .tabItem {
                        Label(AppTab.calendar.title, image: AppTab.calendar.imageName)
                    }
                    .tag(AppTab.calendar)

                Text("Чат")
                    .tabItem {
                        Label(AppTab.chat.title, image: AppTab.chat.imageName)
                    }
                    .tag(AppTab.chat)

                Text("Профиль")
                    .tabItem {
                        Label(AppTab.profile.title, image: AppTab.profile.imageName)
                    }
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
