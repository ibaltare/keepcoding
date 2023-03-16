//
//  PartThreeView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI
import PhotosUI

struct PartThreeView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State private var showPicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
            .padding(.top, 50)
            
            Image("Photographer")
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,25)
            
            Button {
                self.showPicker = true
            } label: {
                Text("Upload photo")
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("Primary"))
            }
            .padding(.top, 65)
            .photosPicker(isPresented: $showPicker, selection: $mainViewModel.selectedPhoto, matching: .images)
            
            NavigationLink{
                PartFourView()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.top,140)
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.5).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()

        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct PartThreeView_Previews: PreviewProvider {
    static var previews: some View {
        PartThreeView().environmentObject(MainViewModel(testing: true))
    }
}
