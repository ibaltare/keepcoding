//
//  PartFourView.swift
//  Nutris
//
//  Created by Nicolas on 19/02/23.
//

import SwiftUI

struct PartFourView: View {
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var body: some View {
        VStack(spacing: 0){
            Text("Nutris")
                .foregroundColor(Color("Primary"))
                .fontWeight(.heavy)
                .font(.custom("Nunito-ExtraBold", size: 48))
                .padding(.top, 50)
            
            Text("What is your goal?")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .padding(.top, 40)
            
            VStack(spacing: 0){
                RadioButtonGroups(viewModel: mainViewModel) { selected in
                    mainViewModel.goalId = selected
                }
            }
            .padding(.top, 50)
            
            NavigationLink{
                PartFiveView()
                    .environmentObject(mainViewModel)
            } label: {
                PrimaryButton{
                    Text("Next")
                }
            }
            .padding(.top,140)
            .padding(.bottom, 60)
            .disabled(!(mainViewModel.goalId != 0))
            
            VStack(spacing: 0) {
                ProgressBar(value: 0.625).frame(height: 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
    }
}

struct RadioButtonGroups: View {
    @ObservedObject var viewModel: MainViewModel
    
    let callback: (Int) -> ()
    
    @State var selectedId: Int = 0
    
    var body: some View {
        VStack {
            ForEach(viewModel.goals) { goal in
                NRadioButton(
                    id: goal.id,
                    label: goal.goal,
                    image: goal.goal,
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

struct PartFourView_Previews: PreviewProvider {
    static var previews: some View {
        PartFourView().environmentObject(MainViewModel(testing: true))
    }
}
