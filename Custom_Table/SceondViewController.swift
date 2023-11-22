

import UIKit

//Segunda vista
class SceondViewController: UIViewController {

    @IBOutlet weak var shopDescription: UILabel!
    @IBOutlet weak var logoShop: UIImageView!
    @IBOutlet weak var table_Data: UITableView!
    var products: [Product] = []
    var cart: [Product] = []
    var selectedRow: Int = -1
    
    
    var shop = Shop(name: "", description: "", category: "", img: "", products: [Product(name: "", description: "", price: 0, stock: 0, img: "")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(shop.name)"
        
        shopDescription.text = "\(shop.description)"
        logoShop.image = UIImage(named: shop.img)
        products = shop.products
        logoShop.layer.cornerRadius = 30.0
    }
    
    @IBAction func AddProduct(_ sender: UIButton){
        var msg: String = ""
        if selectedRow == -1{
            msg = "No se ha seleccionado el producto"
        }else{
            msg = "Producto \(products[selectedRow].name) agregado"
            cart.append(products[selectedRow])
        }
        let alertController = UIAlertController(title: "\(shop.name)", message: msg, preferredStyle: .alert)
        present(alertController, animated: true, completion: nil)
        let time = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: time){
          alertController.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func SeeCart(_ sender: UIButton){
        if let vc = storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController{
            vc.shopName = shop.name
            vc.cart = cart
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension SceondViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
}
    
extension SceondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProducts", for: indexPath) as! CustomCellProducts
        cell.productName.text = products[indexPath.row].name
        cell.productImg.image = UIImage(named: products[indexPath.row].img)
        cell.productPrice.text = "$\(products[indexPath.row].price)"
        //cell.img_View.layer.cornerRadius = 40.0
        //cell.img_View.layer.borderColor = #colorLiteral(red: 0, green: 0.7607843137, blue: 0.6235294118, alpha: 1)
        //cell.img_View.layer.borderWidth = 1.0
        return cell
    }
    
}
