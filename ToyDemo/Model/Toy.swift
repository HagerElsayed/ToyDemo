//
//  Toy.swift
//  ToyDemo
//
//  Created by Hager Elsayed on 27/02/2022.
//

import SwiftUI

struct Toy: Identifiable, Hashable {
    let id: Int
    let title: String
    let material: String
    let image: String
    let dimensions: String
    let price: Float
    let color: String
}


struct ToyItem: Hashable {
    private let toy: Toy?
    var backgroundColor: Color?
    
    init(
        toy: Toy? = .none,
        backgroundColor: Color? = .none
    ) {
        self.toy = toy
        self.backgroundColor = backgroundColor
    }
    
    var id: Int {
        toy?.id ?? 0
    }
    
    var title: String {
        toy?.title ?? ""
    }
    
    var material: String {
        toy?.material ?? ""
    }
    
    var image: String {
        toy?.image ?? ""
    }
    
    var dimensions: String {
        toy?.dimensions ?? ""
    }
    
    var price: String {
        "$ \(toy?.price ?? 0.0)"
    }
    var color: String {
        toy?.color ?? ""
    }
    
    static var list = [
        ToyItem(
            toy:
                Toy(
                    id: 1,
                    title: "crocodile Toy",
                    material: "Polyester",
                    image: "toy1",
                    dimensions: "14 x 8 x 14 cm",
                    price: 30.0,
                    color: "Light Cyan"
                ),
            backgroundColor: Color.lightCyan
        ),
        ToyItem(
            toy:
                Toy(
                    id: 2,
                    title: "Bear Toy",
                    material: "Polyester",
                    image: "toy2",
                    dimensions: "14 x 8 x 14 cm",
                    price: 40.0,
                    color: "Gold"
                ),
            backgroundColor: Color.gold
        ),
        ToyItem(
            toy:
                Toy(
                    id: 3,
                    title: "duck Toy",
                    material: "plastic",
                    image: "toy3",
                    dimensions: "6 x 4 x 6 cm",
                    price: 5.0,
                    color: "Light Yellow"
                ),
            backgroundColor: Color.lightYellow
        ),
        ToyItem(
            toy:
                Toy(
                    id: 4,
                    title: "Owl Toy",
                    material: "Polyester",
                    image: "toy4",
                    dimensions: "14 x 8 x 14 cm",
                    price: 20.0,
                    color: "Light Green"
                ),
            backgroundColor: Color.lightGreen
        ),
        ToyItem(
            toy:
                Toy(
                    id: 5,
                    title: "Cube Toy",
                    material: "plastic",
                    image: "toy5",
                    dimensions: "14 x 8 x 14 cm",
                    price: 5.0,
                    color: "Salmon"
                ),
            backgroundColor: Color.salmon
        ),
        ToyItem(
            toy:
                Toy(
                    id: 6,
                    title: "Bear Toy",
                    material: "Polyester",
                    image: "toy6",
                    dimensions: "14 x 8 x 14 cm",
                    price: 30.0,
                    color: "Oliver Drab"
                ),
            backgroundColor: Color.oliveDrab
        )
    ]
}
