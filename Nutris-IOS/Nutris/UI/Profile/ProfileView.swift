//
//  ProfileView.swift
//  Nutris
//
//  Created by Rodrigo Latorre on 24/02/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        switch(viewModel.status) {
        case .none:
            LoadingView()
            let _ = viewModel.getUserProfile()
        case .done:
            NavigationStack {
                VStack {
                    AsyncImage(url: URL(string: server + viewModel.userPhoto)) { photoDownload in
                        photoDownload
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .clipped()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .frame(maxWidth: .infinity)
                            .clipped()
                    }
                    Text(viewModel.userName)
                        .font(.system(size: 20, weight: .semibold, design: .none))
                        .padding([.top, .bottom], 5)
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            NavigationLink {
                                //TODO:
                            } label: {
                                HStack {
                                    Image("Pencil")
                                    Text("Edit Profile")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("statistics")
                                    Text("Statistics")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("Nutritionists")
                                    Text("Nutritionists")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("Subscriptions")
                                    Text("Subscriptions")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("Help")
                                    Text("Help")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("Share")
                                    Text("Share")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                            
                            NavigationLink {
                                //
                            } label: {
                                HStack {
                                    Image("Logout")
                                    Text("Log Out")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .regular, design: .none))
                                    Spacer()
                                    Image("Arrow_btn")
                                }
                                .padding([.leading, .trailing], 5)
                                
                            }
                            .frame(width: 350, height: 40)
                            .background(Color("PrimaryLight"))
                            .cornerRadius(8)
                        }
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel())
    }
}
