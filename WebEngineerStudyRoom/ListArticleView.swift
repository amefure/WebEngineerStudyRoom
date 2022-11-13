//
//  ContentView.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import SwiftUI

struct ListArticleView: View {
    
    let api = APIController()
    
    @State var articles:[Article] = []
    @State var text:String = ""
    @State var isfilter:Bool = false
    
    @State var isCategory:Int = 0
    var body: some View {
        VStack{
            
            HeaderView(isCategory: $isCategory)
            
            ZStack(alignment: .trailing){
                TextField("word...", text: $text)
                    .environment(\.colorScheme, .light)
                    .frame(width: 270)
                    .padding()
                    .padding(.trailing,30)
                    .background(Color(red: 231/255, green: 231/255, blue: 231/255))
                    .cornerRadius(5)
                
                
                Button(action: {
                    if text.isEmpty{
                        isfilter = false
                    }else{
                        isfilter = true
                    }
                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(isfilter ? .orange :.black)
                        .font(.system(size: 20).weight(.bold))
                }).padding(.trailing,20)
                
                
                
            }.padding([.trailing,.leading,.top])
            
            if articles.count != 0 {
                
                
                List(articles.filter (isfilter ? { $0.title.lowercased().contains(text.lowercased()) || $0.descri.lowercased().contains(text.lowercased()) } : (isCategory != 0 ? {$0.category == isCategory} : { $0.title != "" }))) { article in
                    RowArticleView(article: article)
                }
                .listStyle(GroupedListStyle())
                .padding([.trailing,.leading])
                
            }else{
                ProgressView()
                Text("記事情報の取得に失敗しました....\nオフラインの場合はオンラインにしてください").padding()
                Spacer()
                
            }
//            AdMobBannerView().frame(height: 60)
            
        }
        .preferredColorScheme(.dark)
        .onAppear{
            api.getArticleAPI { array in
                for article in array {
                    let dic = article as? [String:Any]
                    let obj = Article(id: Int(String(describing: dic!["id"]!))!,
                                      title: dic!["title"] as! String,
                                      descri: dic!["descri"] as! String,
                                      file:  dic!["file"] as! String,
                                      category:  Int(String(describing: dic!["category"]!))!,
                                      imgPath:  dic!["imgPath"] as! String,
                                      entryDate:Date())
                    //dic!["entryDate"] as! String
                    articles.append(obj)
                }
            }
        }
        
        
    }
}

struct ListArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ListArticleView()
    }
}
