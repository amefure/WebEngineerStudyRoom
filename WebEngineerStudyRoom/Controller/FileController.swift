//
//  FileController.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/12/05.
//

import UIKit


// 請求金額を蓄積するためのFileController
class FileController {
    
    func setOnlineFlag(num:Int){
        // 1 online
        // 0 offline
        UserDefaults.standard.set(num, forKey: "online")
    }
    
    func getOnlineFlag() -> Int{
        UserDefaults.standard.integer(forKey: "online")
    }
    
    // Documents内で操作するJSONファイル名
    private let FileName:String = "article.json"
    
    // 保存ファイルへのURLを作成 file::Documents/fileName
    func docURL(_ fileName:String) -> URL? {
        let fileManager = FileManager.default
        do {
            // Docmentsフォルダ
            let docsUrl = try fileManager.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false)
            // URLを構築
            let url = docsUrl.appendingPathComponent(fileName)
            
            return url
        } catch {
            return nil
        }
    }
    // 操作するJsonファイルがあるかどうか
    func hasFile (_ fileName:String) -> Bool{
        let str =  NSHomeDirectory() + "/Documents/" + fileName
        if FileManager.default.fileExists(atPath: str) {
            return true
        }else{
            return false
        }
    }
    
    // MARK: - Article
    // オンライン時はデータをキャッシュ
    func saveJson(_ data:[Article]) {
        guard let url = docURL(FileName) else {
            return
        }
        
            let encoder = JSONEncoder()
            let data = try! encoder.encode(data)
            let jsonData = String(data:data, encoding: .utf8)!
        
            do {
                // ファイルパスへの保存
                let path = url.path
                try jsonData.write(toFile: path, atomically: true, encoding: .utf8)
                setOnlineFlag(num: 1)
            } catch let error as NSError {
                print(error)
            }
        }
    
    // オフライン時はJSONデータを読み込んで[構造体]にする
    func loadJson() -> [Article] {
        guard let url = docURL(FileName) else {
            return []
        }
        if hasFile(FileName) {

        // JSONファイルが存在する場合
            let jsonData = try! String(contentsOf: url).data(using: .utf8)!
            let dataArray = try! JSONDecoder().decode([Article].self, from: jsonData)
            setOnlineFlag(num: 0)
            return dataArray
        }else{
            // JSONファイルが存在しない場合
            return []
        }
    }
    // MARK: - Article
    
}

