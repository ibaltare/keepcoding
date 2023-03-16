//
//  PartFiveView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct PartFiveView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Text("What is your level of physical activity?")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.top, 40)
                .padding([.leading, .trailing], 20)
                .fixedSize(horizontal: false, vertical: true)
            
            VStack(spacing: 0){
                ActivityRadioButtonGroups(viewModel: mainViewModel){ selected in
                    mainViewModel.activityId = selected
                }
            }
            .padding(.top, 50)
            
            NavigationLink{
                PartSixView()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.top,140)
            .disabled(!(mainViewModel.activityId != 0))
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.75).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct ActivityRadioButtonGroups: View {
    @ObservedObject var viewModel: MainViewModel
    
    let callback: (Int) -> ()

    @State var selectedId: Int = 0

    var body: some View {
        VStack {
            ForEach(viewModel.activities) { goal in
                NRadioButton(
                    id: goal.id,
                    label: goal.activity,
                    image: goal.activity,
                    isMarked: selectedId == goal.id ? true : false,
                    callback: radioGroupCallback)
            }
        }
    }

    func radioGroupCallback(id: Int) {
        selectedId = id
        callback(id)
    }
}

struct PartFiveView_Previews: PreviewProvider {
    static var previews: some View {
        PartFiveView().environmentObject(MainViewModel(testing: true))
    }
}
