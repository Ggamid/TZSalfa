//
//  MainScreen.swift
//  TZ
//
//  Created by Gamıd Khalıdov on 07.01.2026.
//

import SwiftUI

struct MainScreen: View {
    
    @State var appTab: AppTab = .home
    
    var body: some View {
        ZStack {
            VStack {
                switch appTab {
                case .home:
                    DoctorListView()
                        .padding(.bottom, 50)
                case .calendar:
                    EmptyView()
                case .chat:
                    EmptyView()
                case .profile:
                    EmptyView()
                }
            }
            
            TabBarView(selected: $appTab)
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    MainScreen()
}
