//
//  ExercisesView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct ExercisesView: View {
    @StateObject var viewModel: ExerciseViewModel
    
    var body: some View {
        NavigationStack {
            Text("Exercises")
                .font(.system(size: 25, weight: .semibold, design: .none))
            Spacer()
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    NavigationLink {
                        ExerciseDetailView(exercise: viewModel.getExcerciseDetailData1())
                    } label: {
                        ExercisesRowView(exercise: viewModel.getExcerciseTempData1())
                    }
                    NavigationLink {
                        ExerciseDetailView(exercise: viewModel.getExcerciseDetailData2())
                    } label: {
                        ExercisesRowView(exercise: viewModel.getExcerciseTempData2())
                    }
                    NavigationLink {
                        ExerciseDetailView(exercise: viewModel.getExcerciseDetailData3())
                    } label: {
                        ExercisesRowView(exercise: viewModel.getExcerciseTempData3())
                    }
                }
            }
        }
    }
}

struct ExercisesView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesView(viewModel: ExerciseViewModel())
    }
}
