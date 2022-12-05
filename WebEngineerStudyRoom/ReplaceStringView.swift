//
//  ReplaceStringView.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/13.
//

import SwiftUI

struct ReplaceStringView: View {
    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    @State var isCategory:Int = 0
    
    @State var beforeCharacter:String = ""
    @State var AfterCharacter:String = ""
    
    @State var text:String = ""
    
    @ObservedObject var messageAlert = MessageBalloon()
    func replaceStiring(){
        text = text.replacingOccurrences(of: beforeCharacter, with: AfterCharacter)
    }
    
    var body: some View {
        VStack{
            
            HeaderView(isCategory: $isCategory)
            
            Text("文字列置換").padding(5)
            
            HStack{
                VStack(spacing:3){
                    Text("before")
                    TextField("before",text: $beforeCharacter).frame(width:80).background(.white).foregroundColor(.black)
                }
                Image(systemName: "arrow.right")
                VStack(spacing:3){
                    
                    Text("after")
                    TextField("after",text: $AfterCharacter).frame(width:80).background(.white).foregroundColor(.black)
                }
            }.padding()
            
            TextEditor(text: $text).background(.white).foregroundColor(.black)
            
            HStack{
                
                Button(action: {
                    beforeCharacter = ""
                    AfterCharacter = ""
                    text = ""
                }, label: {
                    Image(systemName: "clear.fill").foregroundColor(.red)
                })
                                
                Button(action: {
                    replaceStiring()
                }, label: {
                    Text("replace")
                        .padding()
                        .background(Color(red: 35/255, green: 82/255, blue: 124/255))
                        .foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
                        .cornerRadius(5)
                }).padding(8)
                
            
                ZStack {
                    if (messageAlert.isPreview){
                        Text("コピーしました")
                            .font(.system(size: 10))
                            .padding(5)
                            .background(Color(red: 0.3, green: 0.3 ,blue: 0.3))
                            .foregroundColor(.white)
                            .opacity(messageAlert.castOpacity())
                            .cornerRadius(5)
                            .offset(x: 70, y: 0)
                    }
                    
                    Button(action: {
                        UIPasteboard.general.string = text
                        messageAlert.isPreview = true
                        messageAlert.vanishMessage()
                    }, label: {
                        Image(systemName: "doc.on.doc.fill")
                            .padding()
                            .background(Color(red: 35/255, green: 82/255, blue: 124/255))
                            .foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
                            .cornerRadius(5)
                    })
                }.frame(width: 100)
 
            }
            
            AdMobBannerView().frame(height: 60)
        }
    }
}


// コピーしました用のメッセージバルーン
class MessageBalloon:ObservableObject{
    
    // opacityモディファイアの引数に使用
    @Published  var opacity:Double = 10.0
    // 表示/非表示を切り替える用
    @Published  var isPreview:Bool = false
    
    private var timer = Timer()
    
    // Double型にキャスト＆opacityモディファイア用の数値に割り算
    func castOpacity() -> Double{
        Double(self.opacity / 10)
    }
    
    // opacityを徐々に減らすことでアニメーションを実装
    func vanishMessage(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ _ in
            self.opacity = self.opacity - 1.0 // デクリメント
            
            if(self.opacity == 0.0){
                self.isPreview = false  // 非表示
                self.opacity = 10.0     // 初期値リセット
                self.timer.invalidate() // タイマーストップ
            }
        }
    }
    
}
