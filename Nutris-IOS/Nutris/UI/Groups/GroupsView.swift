//
//  GroupsView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        NavigationStack {
            Text("Groups")
                .font(.system(size: 25, weight: .semibold, design: .none))
            Button {
                
            } label: {
                Text("Create a group")
                    .frame(width: 250, height: 60)
                    .background(Color("Primary"))
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .semibold, design: .none))
                    .cornerRadius(24)
                    
            }
            Text("Join a group")
                .frame(width: 350, height: 45)
                .background(Color("PrimaryLight"))
                .foregroundColor(.black.opacity(0.6))
                .cornerRadius(6)
                .padding([.top, .bottom])
            ScrollView {
                    GroupButtonsGroup { _ in
                    }
            }
        }


    }
    
    
}

struct GroupButtonsGroup: View {
    struct Group: Identifiable {
        let id: String
        let name: String
        let iconName: String
    }
    let callback: (String) -> ()
    
    @State var selectedId: String = ""
    
    var groups: [Group] = [
        Group(id: "1", name: "Vegetarians", iconName: "vegetables"),
        Group(id: "12", name: "Body Volume", iconName: "Heavy"),
        Group(id: "123", name: "Recipes", iconName: "Recipes")
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(groups) { group in
                GroupNRadioButton(
                    id: group.id,
                    label: group.name,
                    image: group.iconName,
                    isMarked: selectedId == group.id ? true : false,
                    callback: radioGroupCallback)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callback(id)
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
