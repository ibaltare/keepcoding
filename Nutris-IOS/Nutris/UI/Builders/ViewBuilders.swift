//
//  ViewBuilders.swift
//  Nutris
//
//  Created by Nicolas on 17/02/23.
//

import SwiftUI

struct PrimaryButton <Content: View> : View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .frame(width: 225, height: 55)
            .background(Color("Primary"))
            .foregroundColor(.white)
            .font(.system(size: 25))
            .fontWeight(.bold)
            .cornerRadius(24)
    }
}

struct TextInput <Content: View> : View {
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }.overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: 290, height: 55)
        )
        
    }
}

struct ProgressBar: View {
    var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .foregroundColor(Color("BarBackground"))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(Color("Primary"))
            }
        }
    }
}

struct DropDownModel: Identifiable {
    let id: Int
    let name: String
}

struct DropDown: View {
    @Binding var value: Int
    var placeholder: String
    var dropDownList: [DropDownModel]
    var image: Image
    
    @State var selectedItem = ""
    
    var body: some View {
        Menu {
            ForEach(dropDownList) { item in
                Button(item.name) {
                    self.selectedItem = item.name
                    self.value = item.id
                }
            }
        } label: {
            VStack(spacing: 5){
                HStack{
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                        .foregroundColor(.black)
                        .padding(.leading,20)
                    
                    
                    Text(selectedItem == "" ? placeholder : selectedItem)
                        .foregroundColor("\(value)".isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down.circle.fill")
                        .foregroundColor(.black)
                        .font(Font.system(size: 20, weight: .bold))
                }
                .frame(width: 270)
                .padding(.horizontal)
            }.overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 290, height: 55)
            )
        }
    }
}

struct DropDownGender: View {
    @Binding var value: String
    var placeholder: String
    var dropDownList: [String]
    var image: Image
    
    @State var selectedItem = ""
    
    var body: some View {
        Menu {
            ForEach(dropDownList, id: \.self) { item in
                Button(item) {
                    self.selectedItem = item
                    self.value = item
                }
            }
        } label: {
            VStack(spacing: 5){
                HStack{
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                        .foregroundColor(.black)
                        .padding(.leading,20)
                    
                    
                    Text(selectedItem == "" ? placeholder : selectedItem)
                        .foregroundColor("\(value)".isEmpty ? .gray : .black)
                    Spacer()
                    Image(systemName: "chevron.down.circle.fill")
                        .foregroundColor(.black)
                        .font(Font.system(size: 20, weight: .bold))
                }
                .frame(width: 270)
                .padding(.horizontal)
            }.overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(width: 290, height: 55)
            )
        }
    }
}


struct NRadioButton: View {
    let id: Int
    let label: String
    let image: String
    let isMarked:Bool
    let callback: (Int)->()
    
    init(
        id: Int,
        label:String,
        image: String,
        isMarked: Bool = false,
        callback: @escaping (Int)->()
    ) {
        self.id = id
        self.label = label
        self.image = image
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(spacing: 0) {
                Image(image)
                    .if(self.isMarked, transform: { view in
                        view.foregroundColor(.white)
                    })
                        Text(label)
                        .fontWeight(.bold)
                        .foregroundColor(self.isMarked ? .white : .black)
                        .frame(width: 190)
                        Spacer()
                        .frame(width: 30,height: 30)
            }
        }
        .frame(width: 290, height: 55)
        .if(self.isMarked, transform: { view in
            view.background(Color("Primary"))
        })
            .if(self.isMarked, transform: { view in
                view.cornerRadius(24)
            })
                .if(!self.isMarked, transform: { view in
                    view.overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 290, height: 55)
                            .cornerRadius(24)
                    )
                })
    }
}

struct ArrayNRadioButton: View {
    @State private var isMarked: Bool = false
    
    let id: Int
    let label: String
    let image: String
    let callback: (Allergy.Server, Bool)->()
    
    init(
        id: Int,
        label:String,
        image: String,
        callback: @escaping (Allergy.Server, Bool)->()
    ) {
        self.id = id
        self.label = label
        self.image = image
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.isMarked.toggle()
            self.callback(Allergy.Server(id: self.id), self.isMarked)
        }) {
            HStack(spacing: 0) {
                Image(image)
                    .if(self.isMarked, transform: { view in
                        view.foregroundColor(.white)
                    })
                        Text(label)
                        .fontWeight(.bold)
                        .foregroundColor(self.isMarked ? .white : .black)
                        .frame(width: 190)
                        Spacer()
                        .frame(width: 30,height: 30)
            }
        }
        .frame(width: 290, height: 55)
        .if(self.isMarked, transform: { view in
            view
                .background(Color("Primary"))
                .cornerRadius(24)
        })
            .if(!self.isMarked, transform: { view in
                view.overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 290, height: 55)
                        .cornerRadius(24)
                )
            })
    }
}

struct ButtonBack: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .font(.system(size: 25))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("Primary"))
            }
        }
    }
}


struct TabBarButtonBack: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("Arrow_btn")
            //TODO: No se puede cambiar el colo de la imagen
                .foregroundColor(Color("primary"))
                .rotationEffect(Angle(degrees: 180))
                .padding(20)
                .background(content: {
                    Circle()
                        .fill(.white)
                        .frame(width: 40, height: 40)
                })
            //                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}


struct CustomLikeButton: View {
    
    var body : some View {
        Button(action: {
        }) {
            Button {
                //
            } label: {
                Image("empty_heart")
            }
            .padding(20)
            .background(content: {
                Circle()
                    .fill(.white)
                    .frame(width: 40, height: 40)
            })
            //            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        }
    }
}

struct GroupNRadioButton: View {
    let id: String
    let label: String
    let image: String
    let isMarked:Bool
    let callback: (String)->()
    
    init(
        id: String,
        label:String,
        image: String,
        isMarked: Bool = false,
        callback: @escaping (String)->()
    ) {
        self.id = id
        self.label = label
        self.image = image
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        VStack {
            Button {
                self.callback(self.id)
            } label: {
                HStack(spacing: 0) {
                    Image(image)
                        .if(self.isMarked, transform: { view in
                            view.foregroundColor(Color("PrimayLight"))
                        })
                            Text(label)
                            .fontWeight(.bold)
                            .foregroundColor(self.isMarked ? .white : Color("Primary"))
                            .frame(width: 190)
                            
                            Spacer()
                            .frame(width: 30,height: 30)
                }
            }
        }
        .frame(width: 290, height: 55)
        .if(self.isMarked, transform: { view in
            view
                .background {
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color("Primary"))
                        .shadow(color: .gray, radius: 4, x: 0, y: 4)
                }
        })
            .if(!self.isMarked, transform: { view in
                view
                    .background {
                        RoundedRectangle(cornerRadius: 24)
                            .fill(Color.white)
                            .shadow(color: .gray, radius: 1, x: 0, y: 4)
                    }
            })
    }
}
