//
//  ExercisesRowView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct ExercisesRowView: View {
    var exercise: ExerciseModel
    
    var body: some View {
        VStack(spacing: 0) {
            Image(exercise.img)
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .scaledToFill()
                .clipped()
            Text(exercise.name)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .font(.system(size: 24, weight: .semibold, design: .none))
                .foregroundColor(.white)
                .background(Color("Primary"))
            HStack {
                Text(exercise.level)
                    .font(.system(size: 18, weight: .semibold, design: .none))
                    .foregroundColor(.gray)
                Spacer()
                Button {
                    //
                } label: {
                    Text("Start")
                }
                .foregroundColor(Color("Primary"))
            }
            .padding(20)
        }
        .frame(width: 350, height: 250)
        .background(.white)
        .cornerRadius(8)
        .shadow(
            color: Color.gray.opacity(0.4),
            radius: 4,
            x: 0,
            y: 4
        )
    }
}

struct ExercisesRowView_Previews: PreviewProvider {
    static var previews: some View {
        ExercisesRowView(exercise: ExerciseModel(id: 1, img: "Exercises", name: "Legs", level: "Beginner"))
    }
}
