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
        VStack(spacing: 0) {
            switch appTab {
            case .home:
                DoctorListView()
            default:
                Spacer()
            }
            
            TabBarView(selected: $appTab, chatBadge: 1)
        }
    }
}

#Preview {
    MainScreen()
}
