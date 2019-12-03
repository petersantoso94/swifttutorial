//
//  AboutView.swift
//  Bullseye
//
//  Created by Liem Peter Santoso on 2019/12/2.
//  Copyright © 2019 Liem Peter Santoso. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    let beige = Color(red: 255.0/255.0, green: 214.0/255.0, blue: 179.0/255.0)
    struct HeadingStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
                .padding(.bottom,20).padding(.top,20)
            .font(Font.custom("Arial Rounded MT Bold", size: 30))
        }
    }
    struct BodyStyle: ViewModifier{
        func body(content: Content) -> some View {
            return content
            .foregroundColor(Color.black)
                .padding(.leading,60).padding(.trailing,60).padding(.bottom,20)
            .font(Font.custom("Arial Rounded MT Bold", size: 16))
        }
    }
    
    var body: some View {
        Group{
        VStack{
            Text("🎯 Bullseye 🎯").modifier(HeadingStyle())
            Text("🎯 This is about us 🎯").modifier(BodyStyle())
        }.navigationBarTitle("About us").background(beige)
        }.background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
