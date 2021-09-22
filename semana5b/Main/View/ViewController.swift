//
//  ViewController.swift
//  semana5b
//
//  Created by Linder Hassinger on 15/09/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    // Ahora yo debo instanciar a mi clase ViewModel
    var viewModelHistoryPost = ViewModelHistoryPost()
    
    // vamos a crear un arreglo de prueba
    let names: [String] = ["Pepito", "Juanito", "Sultano", "Lucas"]
    let lastNames: [String] = ["Zapata", "Peres", "Macazana", "Chavez"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // para seguir buenas practicas voy a crear funciones que se llamen en el viwDidLoad
        configureView()
        // lamar a bin
        bind()
        // llamando al setUpTable
        setUpTable()
    }
    
    func configureView() {
        // se va a encargar de ejecutar a la funcion que hace la peticion
        viewModelHistoryPost.getDataFromHistoryPosts()
    }
    
    
    func printData() {
        for post in viewModelHistoryPost.dataArrayHistoryPosts {
            print("userId: \(post.userId)")
            print("id: \(post.id)")
            print("title: \(post.title)")
            print("body: \(post.body)")
        }
    }
    
    func setUpTable() {
        // aca voy a decir que el delegado mi table sea la propia vista
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func bind() {
        // Se encargue de refrescar data
        viewModelHistoryPost.refeshData = { [weak self] in
            DispatchQueue.main.async {
                // aca voy a invocar a la funcion que se encargue de imprimir la informacion
                self?.printData()
                // en esta parte vamos a invocar al metodo reloadData
                self?.tableView.reloadData()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // aca tiene que ir la cantidad de datos que tengo
        return viewModelHistoryPost.dataArrayHistoryPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let object = viewModelHistoryPost.dataArrayHistoryPosts
        
        cell.textLabel?.text = object[indexPath.row].title
        cell.detailTextLabel?.text = object[indexPath.row].body
        
        return cell
    }
    

}

