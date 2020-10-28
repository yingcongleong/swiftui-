//
//  secondview.swift
//  hw3
//
//  Created by User02 on 2020/10/28.
//

import Foundation
import SwiftUI

struct secondview: View{
    @Binding var showSecondPage: Bool
    @Binding var bdate:Date
    @Binding var red: Double
    @Binding var green: Double
    @Binding var blue: Double
    @Binding var name: String
    @State private var showAlert = false
    var number = Int.random(in:0...3)
    var body: some View{
        VStack{
            Text(self.bdate,style: .date)
            let num = number
            Text("\(name)")
            if(num == 0){
                Text("  長長的距離，長長的線，長長的時間抹不斷，今天是你的生日，遠方的我一直在惦念著你，祝你生日快樂!").foregroundColor(Color(red: red, green: green, blue: blue))
            }
            else if(num == 1){
                Text("今天有了你世界更精彩，今天有了你星空更燦爛，今天因為你人間更溫暖，今天因為你我覺得更幸福!").foregroundColor(Color(red: red, green: green, blue: blue))
            }
            else{
                Text(" 今夜，驚悉你的生日。窗外的風帶上我的祝福，祝愿你在新的一年裡心想事成花容月貌而且又乖又可愛").foregroundColor(Color(red: red, green: green, blue: blue))
            }
            Button("按讚嗎？", action:{
                showAlert = true
                showSecondPage = false
            }).alert(isPresented: $showAlert) { () -> Alert in
                let answer = ["讚", "不讚"].randomElement()!
                return Alert(title: Text(answer))
            }
        }
    }
    
}
