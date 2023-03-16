//
//  PartOneView.swift
//  Nutris
//
//  Created by Nicolas on 18/02/23.
//

import SwiftUI

struct PartOneView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    @State private var name: String = ""
    @State private var country: String = ""
    
    var placeholder = "Your Country"
    let countries = ["España", "Honduras", "Mexico", "Peru", "Uruguay"]
    
    var body: some View {
        
        VStack(spacing: 0){
            Spacer()
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Image("register_one")
                .resizable()
                .scaledToFit()
                .frame(width: 295, height: 235)
                .padding(.top,25)
            
            Text("Full Name")
                .font(.system(size: 17))
                .foregroundColor(.gray)
                .padding(.top, 35)
                .frame(width: 240, alignment: .leading)
            
            TextInput {
                Image(systemName: "person")
                TextField("Your Full Name", text: $mainViewModel.fullname)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .frame(width: 200)
            }.padding(.top, 20)
          
            Text("Country")
                .font(.system(size: 17))
                .foregroundColor(.gray)
                .padding(.top, 30)
                .frame(width: 240, alignment: .leading)
            
            DropDown(value: $mainViewModel.countryId, placeholder: "Your Country", dropDownList: mainViewModel.countries, image: Image("Address"))
                .padding(.top,22)
            
            NavigationLink{
                PartSecondView()
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.top,65)
            .disabled(!(!mainViewModel.fullname.isEmpty && mainViewModel.countryId != 0))
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.25).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
        .ignoresSafeArea()
    }
}

struct PartOneView_Previews: PreviewProvider {
    static var previews: some View {
        PartOneView().environmentObject(MainViewModel(testing: true))
    }
}
