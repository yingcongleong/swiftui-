//
//  ContentView.swift
//  hw3
//
//  Created by User02 on 2020/10/28.
//

import SwiftUI

struct ContentView: View {
    @State private var showSecondPage = false
    @State public var bdate = Date()
    @State private var red = Double()
    @State private var green = Double()
    @State private var blue = Double()
    @State private var bgColor = Color.white
    @State private var gender = 0
    @State private var name: String = ""
    var sex = ["男","女"]
    var body: some View {
        
        VStack {
            Text("生日卡").labelStyle(DefaultLabelStyle()).multilineTextAlignment(.leading).font(.title).foregroundColor(Color(red: red, green: green, blue: blue))
            Image("bdatecard").resizable().scaledToFit()
            DisclosureGroup(
                content:{
                    DatePicker("你的生日日期:",selection: $bdate, displayedComponents: .date).datePickerStyle(WheelDatePickerStyle()).foregroundColor(Color(red: red, green: green, blue: blue))
                },
                label:{
                    Label("你的生日日期:", systemImage: "").foregroundColor(Color(red: red, green: green, blue: blue))
                    Text(bdate,style: .date).foregroundColor(Color(red: red, green: green, blue: blue))
                }
                )
            VStack{
                Picker(selection: $gender, label: Text("性別")) {
                    Text(sex[0]).tag(0)
                    Text(sex[1]).tag(1)
                }.pickerStyle(SegmentedPickerStyle())
                TextField("請輸入名字",text: $name)
            }
            
            Form{
                Text("選擇你的字體的顏色").foregroundColor(Color(red: red, green: green, blue: blue))
                HStack{
                    Text("Red  ").foregroundColor(.red)
                    Slider(value: $red, in: 0...1).accentColor(.red)
                }
                HStack{
                    Text("Green").foregroundColor(.green)
                    Slider(value: $green, in: 0...1).accentColor(.green)
                }
                HStack{
                    Text("Blue ").foregroundColor(.blue)
                    Slider(value: $blue, in: 0...1).accentColor(.blue)
                }
            }
            ColorPicker("Set the background color",selection: $bgColor)
            Spacer()
            Button("OK!") {showSecondPage = true}.sheet(isPresented: $showSecondPage) {secondview(showSecondPage: self.$showSecondPage,bdate:self.$bdate, red: self.$red,green: self.$green, blue: self.$blue, name: self.$name)
            }
        
        }.background(bgColor)
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

