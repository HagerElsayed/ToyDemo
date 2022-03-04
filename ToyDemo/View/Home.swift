//
//  Home.swift
//  ToyDemo
//
//  Created by Hager Elsayed on 01/03/2022.
//

import SwiftUI
struct ToyEntryPoint: View {
    @State var details = false
    @State var detailsData: ToyItem = ToyItem.list[0]

    var body: some View {
        ZStack {
            if details {  ToyDetails(detailData: self.$detailsData, details: self.$details) }
            Home(detailsData: self.$detailsData, details: self.$details)
                .opacity(self.details ? 0 : 1)
        }
        .animation(.easeInOut, value: 1)
        .edgesIgnoringSafeArea(.all)
    }
}

struct Home: View {
    @Binding var detailsData: ToyItem
    @Binding var details: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 30) {
                HStack {
                    Image("menu")
                    Spacer()
                }
                .padding()
                .padding(.vertical, 30)
                
                HStack {
                    Image("banner")
                        .resizable()
                        .frame(width: geometry.size.width - 40, height: geometry.size.height * 0.33 )
                }
                                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(
                        columns: [
                            GridItem(.adaptive(minimum: 150), spacing: 20)
                   
                        ],
                        spacing: 20
                    ) {
                        ForEach(ToyItem.list, id: \.self) { toy in
                            ToyItemView(toy: toy)
                                .onTapGesture {
                                    self.detailsData = toy
                                    self.details.toggle()
                                }
                        }
                    }
                    .padding()

                }
            }
        }
        .padding()
    }
}

struct ToyItemView: View {
    var toy: ToyItem
    var body: some View {
        HStack(alignment: .center) {
            Image(toy.image)
        }
        .padding()
        .frame(width: 158, height: 149)
        .background(toy.backgroundColor ?? Color.lightCyan)
        .cornerRadius(25)
    }
}
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ToyEntryPoint()
    }
}
