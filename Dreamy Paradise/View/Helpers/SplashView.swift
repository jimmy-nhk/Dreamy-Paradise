//
//  SplashView.swift
//  Dreamy Paradise
//
//  Created by Jimmy on 29/07/2022.
//

// Reference:
// https://www.youtube.com/watch?v=0ytO3wCRKZU

import SwiftUI

struct SplashView: View {
    
    @Binding var isActive : Bool
    @State private var opacity = 0.5
    
    var body: some View {
        ZStack{
            ZStack {
                Image("Splash Screen")
                    .resizable()
                .ignoresSafeArea()
            }.opacity( opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1)){
                        self.opacity = 1.0
                    }
                }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                withAnimation(.easeInOut(duration: 1)){
                    self.isActive = true
                }
            }
        }
    }
}

//struct SplashView_Previews: PreviewProvider {
//    static var previews: some View {
////        SplashView(isActive: )
//    }
//}
