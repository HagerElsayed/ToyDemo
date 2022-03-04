//
//  ToyDetails.swift
//  ToyDemo
//
//  Created by Hager Elsayed on 01/03/2022.
//

import SwiftUI

struct ToyDetails: View {
    @Binding var toyItem: ToyItem
    @Binding var details: Bool
    @State var appear = false
    init(
        detailData:Binding<ToyItem> = .constant(ToyItem.list[0]),
        details: Binding<Bool> = .constant(true)
    ) {
        self._toyItem = detailData
        self._details = details
    }
    
    var body: some View {
        GeometryReader { reader in
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.top, 50)
                            .onTapGesture {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    
                                    self.details.toggle()
                                }
                            }
                            .animation(.spring(), value: 30)
                        Spacer()
                    }
                    Spacer().frame(maxHeight: .infinity)
                    Image(toyItem.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: reader.size.width - 60, height: 300)
                        .offset(y: 90)
                        .zIndex(1)
                        .animation(.easeIn, value: 30)

                    
                    ToyInfoView(toyItem: toyItem)
                }
                .frame(minHeight: reader.size.height)
            }
            
        }
        .background(toyItem.backgroundColor?.opacity(appear ? 1 : 0))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                appear = true
            }
        }
        .onDisappear {
            appear = false
        }
    }
}

struct ToyInfoView: View {
    var toyItem: ToyItem
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 50) {
                Text(toyItem.title)
                    .foregroundColor(.appBlack)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal, 30)
                    .padding(.top, 30)
                
                HStack {
                    ToyAmountView()
                    Spacer()
                    Text(toyItem.price)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                .padding(.horizontal, 30)
                
                HStack(spacing: 30) {
                    DetailView(title: "Material", value: toyItem.material)
                    Spacer()
                    DetailView(title: "Dimensions", value: toyItem.dimensions)
                    Spacer()
                    DetailView(title: "Color", value: toyItem.color)
                }
                .padding(.horizontal, 30)
                
                Button(action: {}) {
                    Text("Add to cart")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 20)
                Spacer()
            }
            .padding(.top, 50)
            .background(Color.white)
            
            Circle()
                .trim(from: 0, to: 0.5)
                .rotation(.degrees(180))
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .padding(.top, -90)
                .padding(.horizontal, -90)
                .zIndex(-1)
                .foregroundColor(.white)
        }
    }
}

struct DetailView: View {
    var title: String
    var value: String
    var body: some View {
        VStack(spacing: 10) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.appBlack)
            Text(value)
                .font(.callout)
                .foregroundColor(.gray)
        }
    }
}
struct ToyAmountView: View {
    var body: some View {
        HStack(spacing: 10) {
            Button(action: {}) {
                Text("-")
                    .font(.title)
                    .foregroundColor(.trout)
                    .frame(width: 34, height: 34)
                    .padding(5)
                    .background(Color.lightGrey)
                    .cornerRadius(10)
            }
            
            Text("1")
                .font(.title2)
                .fontWeight(.bold)
            
            Button(action: {}) {
                Text("+")
                    .font(.title)
                    .foregroundColor(.trout)
                    .frame(width: 34, height: 34)
                    .padding(5)
                    .background(Color.lightGrey)
                    .cornerRadius(10)
            }
        }
    }
}
struct ToyDetails_Previews: PreviewProvider {
    static var previews: some View {
        ToyDetails()
    }
}
