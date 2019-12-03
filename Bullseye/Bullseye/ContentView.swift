//
//  ContentView.swift
//  Bullseye
//
//  Created by Liem Peter Santoso on 2019/12/2.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var userAnswer = 50.0
    @State var target = Int.random(in: 1..<101)
    @State var userScore = 0
    @State var round = 1
    
    struct LabelStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.white)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ValueStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.yellow)
            .modifier(Shadow())
            .font(Font.custom("Arial Rounded MT Bold", size: 24))
        }
    }
    
    struct ButtonLargeTextStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 18))
        }
    }
    
    struct ButtonSmallTextStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
                .foregroundColor(Color.black)
            .font(Font.custom("Arial Rounded MT Bold", size: 12))
        }
    }
    
    struct Shadow: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .shadow(color: Color.black, radius: 5, x: 2, y: 2)
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            //Target row
            HStack {
                Text("Put the bullseye as close as you can to:").modifier(LabelStyle())
                Text("\(target)").modifier(ValueStyle())
            }
            Spacer()
            //Slider row
            HStack {
                Text("1").modifier(LabelStyle())
                Slider(value: $userAnswer, in: 1...100).accentColor(Color.green)
                Text("100").modifier(LabelStyle())
            }
            Spacer()
            //Button row
            Button(action: {
                self.alertIsVisible = true
                self.userScore += self.calculatePoints()
            }) {
                Text(/*@START_MENU_TOKEN@*/"Hit Me!"/*@END_MENU_TOKEN@*/)
            }
                
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("\(alertTitle())"), message: Text("The slider value is \(getRoundedAnswer()).\nYour score \(calculatePoints())"), dismissButton: .default(Text("Awesome!")){

                    self.target = Int.random(in: 1..<101)
                    self.round+=1
                    })
            }
            .background(Image("Button")).modifier(Shadow()).modifier(ButtonLargeTextStyle())
            Spacer()
            //Score row
            HStack {
                Button(action: {
                    self.resetGame()
                }) {
                    HStack {
                        Image("StartOverIcon")
                        Text("Start over!")
                    }
                }.background(Image("Button")).modifier(Shadow()).modifier(ButtonSmallTextStyle())
                Spacer()
                Text("Score:").modifier(LabelStyle())
                Text("\(userScore)").modifier(ValueStyle())
                Spacer()
                Text("Round:").modifier(LabelStyle())
                Text("\(round)").modifier(ValueStyle())
                Spacer()
                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image("InfoIcon")
                        Text("Info")
                    }
                }.background(Image("Button")).modifier(Shadow()).modifier(ButtonSmallTextStyle())
            }.padding(.bottom, 20)
        }.background(Image("Background"), alignment: .center)
        .navigationBarTitle("Bullseye")
    }
    
    func resetGame()->Void{
        self.round = 1
        self.userScore = 0
        self.target = Int.random(in: 1..<101)
        self.userAnswer = 50.0
    }
    
    func amountOff()->Int{
        abs(target-getRoundedAnswer())
    }
    
    func getRoundedAnswer ()->Int{
        Int(userAnswer.rounded())
    }
    
    func calculatePoints()->Int{
        var bonus: Int = 0
        let maxScore = 100
        if amountOff() == 0{
            bonus = 100
        }else if amountOff() < 10{
             bonus = 50
        }
        return maxScore-amountOff()+bonus
    }
    
    func alertTitle()->String{
        let difference = amountOff()
        let title:String
        if difference == 0 {
            title = "Perfect!"
        }else if difference < 10 {
            title = "You almost got it!"
        }else if difference < 10 {
            title = "Meh"
        }else{
            title = "Are you a human"
        }
        return title
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
