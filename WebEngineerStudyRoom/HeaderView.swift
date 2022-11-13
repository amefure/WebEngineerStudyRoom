//
//  HeaderView.swift
//  WebEngineerStudyRoom
//
//  Created by t&a on 2022/11/12.
//

import SwiftUI

struct HeaderView: View {
    
    let deviceWidth = UIScreen.main.bounds.width
    
    @Binding var isCategory:Int
    
    var body: some View {
        VStack(spacing:0){
            Text("Webエンジニア\(Image(systemName: "gearshape.fill"))学習部屋")
                .padding()
                .frame(width: deviceWidth)
                .background(Color(red: 35/255, green: 82/255, blue: 124/255))
                .font(.custom("PingFangHK-Regular", size: 20))
            
            
            Group{
                
                HStack(spacing:20){
                    Button(action: {
                        isCategory = 3
                    }, label: {
                        VStack(spacing:5){
                            Text("Web制作")
                            Rectangle()
                                .frame(width: (deviceWidth > 375 ? 75 : 60), height: 2)
                                .foregroundColor(Color(red: 44/255, green: 105/255, blue: 159/255))
                        }
                    })
                  
                    Button(action: {
                        isCategory = 1
                    }, label: {
                        VStack(spacing:5){
                            Text("PHP")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 149/255, green: 133/255, blue: 225/255))
                        }
                    })
                    Button(action: {
                        isCategory = 2
                    }, label: {
                        VStack(spacing:5){
                            Text("JavaScript")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 189/255, green: 153/255, blue: 7/255))
                        }
                    })
                    Button(action: {
                        isCategory = 4
                    }, label: {
                        VStack(spacing:5){
                            Text("WordPress")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 71/255, green: 150/255, blue: 179/255))
                        }
                    })
                    
                }
                HStack(spacing:25){
                    Button(action: {
                        isCategory = 5
                    }, label: {
                        VStack(spacing:5){
                            Text("Swift")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 221/255, green: 107/255, blue: 36/255))
                        }
                    })
                    Button(action: {
                        isCategory = 6
                    }, label: {
                        VStack(spacing:5){
                            Text("AWS")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 255/255, green: 165/255, blue: 0/255))
                        }
                    })
                    Link(destination:URL(string: "https://www.qa-mikata.com/")!, label: {
                        VStack(spacing:5){
                            Text("WebApp")
                            Rectangle()
                                .frame(width: 75, height: 2)
                                .foregroundColor(Color(red: 33/255, green: 145/255, blue: 27/255))
                        }
                    })
                }
            }.padding()
                .frame(width: deviceWidth).background(Color(red: 33/255, green: 37/255, blue: 41/255))
        }.foregroundColor(Color(red: 231/255, green: 231/255, blue: 231/255))
            .font(.system(size: (deviceWidth > 375 ? 15 : 13)))
    }
}
