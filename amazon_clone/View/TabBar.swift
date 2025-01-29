//
//  TabBar.swift
//  amazon_clone
//
//  Created by pavan naik on 25/01/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            AccountView()
                .tabItem{
                    Label("You", systemImage: "person.circle")
                }
            
            CartView()
                .tabItem{
                    Label("Cart", systemImage: "cart")
                }
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    TabBar()
}
