//
//  LoadingView.swift
//  Nutris
//
//  Created by Nicolas on 13/03/23.
//

import SwiftUI

struct LoadingView: View {
    var tintColor: Color = Color("Primary")
        var scaleSize: CGFloat = 2.0
    var body: some View {
        VStack{
            Text("Loading")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
            ProgressView()
                .scaleEffect(scaleSize, anchor: .center)
                .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
