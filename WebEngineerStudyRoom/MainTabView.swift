//
//  MainTabView.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/13.
//

import SwiftUI

struct MainTabView: View {
    @State  var selectedTag = 1
    var body: some View {
        TabView(selection: $selectedTag) {
            ReplaceStringView().tabItem { Text("Replace") }.tag(1)
            ListArticleView().tabItem { Text("Article") }.tag(2)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
