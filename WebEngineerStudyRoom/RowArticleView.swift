//
//  RowArticleView.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/11.
//

import SwiftUI

struct RowArticleView: View {
    
    let article:Article
    
    let deviceWidth = UIScreen.main.bounds.width
    
    var body: some View {
        Link(destination:URL(string: "https://tech.amefure.com/\(article.file)")!, label: {
            
            if deviceWidth < 450 {
                ZStack(alignment: .center){
                    AsyncImage(url: URL(string: "https://tech.amefure.com/\(article.imgPath)")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: deviceWidth - 70, height: 160)
                    
                    Text(article.title)
                        .frame(width: deviceWidth - 70, height: 60)
                        .lineLimit(2)
                        .background(Color( red: 0, green: 0, blue: 0, opacity: 0.8))
                        .foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
                    
                }
            }else{
                HStack(alignment: .center){
                    AsyncImage(url: URL(string: "https://tech.amefure.com/\(article.imgPath)")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }.frame(width: 160, height: 100)
                    
                    VStack{
                        Text(article.title)
                            .lineLimit(2)
                            .font(.system(size: 25))
                            .foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
                        
                        Text(article.descri)
                            .lineLimit(2)
                            .foregroundColor(.gray)
                    }
                }
            }
            
        })
        
    }
}

