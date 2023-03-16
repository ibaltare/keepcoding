//
//  View+Extension.swift
//  Nutris
//
//  Created by Nicolas on 17/02/23.
//

import SwiftUI

extension View{
    @ViewBuilder
    func `if` <Content:View>(_ condicion: Bool, transform: (Self) -> Content) -> some View {
        if (condicion){
            transform(self)
        } else{
            self
        }
    }
    
    func hiddenConditionally(isHidden: Bool) -> some View {
        isHidden ? AnyView(self.hidden()) : AnyView(self)
    }
}
