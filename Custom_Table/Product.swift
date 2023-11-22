

import Foundation

//Clase Producto
class Product {
    var name: String
    var description: String
    var price: Double
    var stock: Int
    var img: String

    init(name: String, description: String, price: Double, stock: Int, img: String) {
        self.name = name
        self.description = description
        self.price = price
        self.stock = stock
        self.img = img
    }
}
