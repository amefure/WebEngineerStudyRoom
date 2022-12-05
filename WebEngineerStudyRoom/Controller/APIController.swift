//
//  APIController.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import UIKit

class APIController: NSObject {
    

    func validationUrl (urlString: String) -> Bool {
        if let nsurl = NSURL(string: urlString) {
            return UIApplication.shared.canOpenURL(nsurl as URL)
        }
        return false
    }
    
    func getArticleAPI(completion: @escaping (Array<Any>) -> Void) {
              

          let urlString = "https://tech.amefure.com/api/article"
          // 有効なURLかをチェック
          if validationUrl(urlString: urlString) == false {
              return
          }
          guard let url = URL(string: urlString) else {
              return
          }
          // リクエストを構築
          let request = URLRequest(url: url)
          
          // URLにアクセスしてレスポンスを取得する
          URLSession.shared.dataTask(with: request) { data, response, error in
          
              if let data = data {
                  do {
                      let ary = try JSONSerialization.jsonObject(with: data, options: []) as? Array<Any>
                      completion(ary ?? [])
                  } catch {
                      completion([])
                    print(error.localizedDescription)
                  }
              } else {
                  // データが取得できなかった場合の処理
                  completion([])
                  print(error?.localizedDescription ?? "不明なエラー")
              }
          }.resume()
      }
}
