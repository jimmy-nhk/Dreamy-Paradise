/*
 RMIT University Vietnam
 Course: COSC2659 iOS Development
 Semester: 2022B
 Assessment: Assignment 2
 Author: Nguyen Hoang Khang
 ID: s3802040
 Created  date:  18/07/2022
 Acknowledgement: Acknowledge the resources that you use here.
 - Apple Developer
 - Tutorial from IOS Development course.
 - https://www.youtube.com/watch?v=0ytO3wCRKZU
 */

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
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                withAnimation(.easeInOut(duration: 1)){
                    self.isActive = true
                }
            }
        }
    }
}
