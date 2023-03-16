//
//  PartSixView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

enum Allergies: String {
    case gluten = "Gluten"
    case diary = "Diary"
    case egg = "Egg"
    case seafood = "Seafood"
    case fish = "Fish"
    case nuts = "Nuts"
    case soy = "Soy"
}

struct PartSixView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Text("Do you have any allergies?")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top)
            
            AllergiesRadioButtonGroups(viewModel: mainViewModel) { selected in
                mainViewModel.allergiesIds = selected
            }
            .padding([.top, .bottom], 30)
            
            NavigationLink{
                PartSevenView()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.bottom, 92)
            .disabled(!(mainViewModel.allergiesIds.count != 0))

            VStack(spacing: 0) {
                ProgressBar(value: 0.875).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct AllergiesRadioButtonGroups: View {
    @ObservedObject var viewModel: MainViewModel
    let callback: ([Allergy.Server]) -> ()
    
    @State private var selectedAllergies: [Allergy.Server] = []
    
    var body: some View {
        VStack {
            ForEach(viewModel.allergies) { allergie in
                ArrayNRadioButton(
                    id: allergie.id,
                    label: allergie.allergy,
                    image: allergie.allergy,
                    callback: radioGroupCallback)
            }
        }
    }
    
    func radioGroupCallback(id: Allergy.Server, isMarked: Bool?) {
         
        if(isMarked!) {
            self.selectedAllergies.append(id)
        } else {
            self.selectedAllergies.removeAll {$0 == id}
        }
        callback(selectedAllergies)
    }
}

struct PartSixView_Previews: PreviewProvider {
    static var previews: some View {
        PartSixView().environmentObject(MainViewModel(testing: true))
    }
}
