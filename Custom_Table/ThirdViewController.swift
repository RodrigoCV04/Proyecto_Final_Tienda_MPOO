

import UIKit
//Tercera vista
class ThirdViewController: UIViewController {
    
    @IBOutlet weak var table_Data: UITableView!
    @IBOutlet weak var totalToPay: UILabel!
    
    var shopName: String = ""
    var total: Double = 0
    var cart: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Carrito de \(shopName)"
        total = calcTotal(cart: cart, n: 0)
        totalToPay.text = "Total: $\(total)"
    }
    
    func calcTotal(cart: [Product], n: Int)->Double{
        var sum: Double = 0
        if n < cart.count{
            sum = cart[n].price + calcTotal(cart: cart, n: n+1)
            return sum
        }
        return 0
    }
    
    @IBAction func GoToMain(_ sender: UIButton){
        if let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController{
            let alertController = UIAlertController(title: "\(shopName)", message: "Pedido realizado por $\(total)", preferredStyle: .alert)
            present(alertController, animated: true, completion: nil)
            let time = DispatchTime.now() + 3
            DispatchQueue.main.asyncAfter(deadline: time){
                alertController.dismiss(animated: true, completion: nil)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

extension ThirdViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
    
extension ThirdViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellProducts", for: indexPath) as! CustomCellProducts
        cell.productName.text = cart[indexPath.row].name
        cell.productImg.image = UIImage(named: cart[indexPath.row].img)
        cell.productPrice.text = "$\(cart[indexPath.row].price)"
        return cell
    }
    
}
