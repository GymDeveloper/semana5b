//
//  ViewController.swift
//  semana5b
//
//  Created by Linder Hassinger on 15/09/21.
//

import UIKit

class ViewController: UIViewController {

    // Ahora yo debo instanciar a mi clase ViewModel
    var viewModelHistoryPost = ViewModelHistoryPost()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // para seguir buenas practicas voy a crear funciones que se llamen en el viwDidLoad
        configureView()
        // lamar a bin
        bind()
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
    
    func bind() {
        // Se encargue de refrescar data
        viewModelHistoryPost.refeshData = { [weak self] in
            DispatchQueue.main.async {
                // aca voy a invoar a la funcion que se encargue de imprimir la informacion
                self?.printData()
            }
        }
    }

}

