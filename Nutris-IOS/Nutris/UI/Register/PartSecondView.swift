//
//  PartSecondView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct PartSecondView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    @State private var age: String = ""
    @State private var gender: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    let genders = ["Man","Women"]
    var body: some View {
      
        VStack(spacing: 0){
            VStack(spacing: 0){
                Text("Nutris")
                    .foregroundColor(Color("Primary"))
                    .fontWeight(.heavy)
                    .font(.custom("Nunito-ExtraBold", size: 48))
                    .padding(.top, 50)
                
                Text("Age")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 35)
                    .frame(width: 240, alignment: .leading)
                
                TextInput {
                    Image(systemName: "person")
                    TextField("Your Age", text: $mainViewModel.age)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(width: 200)
                }.padding(.top, 20)
                
                Text("Gender")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 35)
                    .frame(width: 240, alignment: .leading)
                
                DropDownGender(value: $mainViewModel.gender, placeholder: "Your Gender", dropDownList: genders, image: Image("Gender"))
                    .padding(.top,22)
                
                Text("Weight")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 35)
                    .frame(width: 240, alignment: .leading)
                
                TextInput {
                    Image("Weight")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    TextField("Your Weight", text: $mainViewModel.weight)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(width: 200)
                }.padding(.top, 20)
                
                Text("Height")
                    .font(.system(size: 17))
                    .foregroundColor(.gray)
                    .padding(.top, 35)
                    .frame(width: 240, alignment: .leading)
                
                TextInput {
                    Image("Length")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    TextField("Your Height", text: $mainViewModel.height)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .frame(width: 200)
                }.padding(.top, 20)
                
            }
            
            NavigationLink{
                PartThreeView()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.top,65)
            .disabled(!(!mainViewModel.age.isEmpty && !mainViewModel.gender.isEmpty && !mainViewModel.weight.isEmpty && !mainViewModel.height.isEmpty))
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.375).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct PartSecondView_Previews: PreviewProvider {
    static var previews: some View {
        PartSecondView().environmentObject(MainViewModel(testing: true))
    }
}
