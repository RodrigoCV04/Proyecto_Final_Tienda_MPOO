

import UIKit

class ViewController: UIViewController {
    
    var shops = [Shop]()
    
    @IBOutlet weak var table_Data: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tiendas FI"
        
        //Se agregan las tiendas que tenemos contempladas (Son solamente ejemplos)
        shops.append(Shop(name: "Cafesin", description: "Skates", category: "Comida", img: "skateshop", products: [Product(name: "Sándwich de embutidos", description: "", price: 80.00, stock: 25, img: "sandwichem"), Product(name: "Sándwich", description: "", price: 50, stock: 25, img: "sandwich"), Product(name: "Coca Cola", description: "", price: 25, stock: 25, img: "cocacola"), Product(name: "Coca Cola Zero", description: "", price: 25, stock: 52, img: "cocazero"), Product(name: "Hot-Dog", description: "", price: 40, stock: 25, img: "hotdog"), Product(name: "Café", description: "", price: 25, stock: 25, img: "cafe"), Product(name: "Chokis", description: "Galletas Chokis", price: 25, stock: 25, img: "chokis"), Product(name: "Oreo", description: "Galletas Oreo", price: 25, stock: 25, img: "oreo"), Product(name: "Triki-Trakes", description: "Galletas Triki-Trakes", price: 25, stock: 25, img: "trikitrakes"), Product(name: "Tacos de canasta", description: "", price: 7, stock: 25, img: "tacoscanasta"), Product(name: "Tacos de Pastor", description: "", price: 10, stock: 25, img: "tacospastor"), Product(name: "Fuzetea", description: "Bebida Fuzetea", price: 25, stock: 25, img: "fuzetea"), Product(name: "Hamburguesa", description: "", price: 80, stock: 25, img: "hamburguesa")]))
        shops.append(Shop(name: "HypeShop", description: "Comida de calidad", category: "Comida", img: "HypeShop", products: [Product(name: "Pizza", description: "Rica pizza", price: 90.00, stock: 15, img: "testimg"), Product(name: "Hamburguesa", description: "Rica hamburguesa", price: 85.00, stock: 20, img: "testimg")]))
        shops.append(Shop(name: "RodShop", description: "Comida de calidad", category: "Comida", img: "RodShop", products: [Product(name: "Hamburguesa", description: "Rica hamburguesa", price: 85.00, stock: 20, img: "testimg")]))
        //----------------//
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(shops[indexPath.row].name)
        if let vc = storyboard?.instantiateViewController(identifier: "SceondViewController") as? SceondViewController{
            vc.shop = shops[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.shopName.text = shops[indexPath.row].name
        cell.logoShop.image = UIImage(named: shops[indexPath.row].img)
        cell.category.text = shops[indexPath.row].category
        cell.logoShop.layer.cornerRadius = 40.0
        //cell.img_View.layer.borderColor = #colorLiteral(red: 0, green: 0.7607843137, blue: 0.6235294118, alpha: 1)
        //cell.img_View.layer.borderWidth = 1.0
        return cell
    }
    
}
