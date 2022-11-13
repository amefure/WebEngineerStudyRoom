//
//  AdMobViewModels.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import SwiftUI
import Foundation
import UIKit
import GoogleMobileAds


struct AdMobBannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner) // インスタンスを生成
        // 諸々の設定をしていく
        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716" // 自身の広告IDに置き換える
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        banner.rootViewController = windowScene?.windows.first!.rootViewController
        let request = GADRequest()
        request.scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        banner.load(request)
        return banner // 最終的にインスタンスを返す
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
      // 特にないのでメソッドだけ用意
    }
}



