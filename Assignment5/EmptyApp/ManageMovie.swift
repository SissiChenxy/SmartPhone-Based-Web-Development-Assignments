//
//  ManageMovie.swift
//  EmptyApp
//
//  Created by 陈昕昀 on 2/22/19.
//  Copyright © 2019 rab. All rights reserved.
//

import Foundation
import UIKit

class ManageMovie{
    var movieManageView: UIView?
    var addMovieView: UIView?
    var deleteMovieView: UIView?
    var displayMovieView: UIView?
    
    let uiCreation = UICreation()
    let app = AppDelegate()
    
    //buttons on movie manage page
    func initManageMovie(homePage: UIView,viewReact:CGRect){
        movieManageView = UIView(frame: viewReact)
        movieManageView?.isHidden = true
        homePage.addSubview(movieManageView!)
        
        let addMovieBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 300, width: 150, height: 30, title: "Add Movie", color: UIColor.brown, action:#selector(showAddMovieView))
        movieManageView?.addSubview(addMovieBtn)
        
        let deleteMovieBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 380, width: 150, height: 30, title: "Delete Movie", color: UIColor.brown, action:#selector(showDeleteMovieView))
        movieManageView?.addSubview(deleteMovieBtn)
        
        let displayMovieBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 460, width: 200, height: 30, title: "Display Movie", color: UIColor.brown,action:#selector(showDisplayMovieView))
        movieManageView?.addSubview(displayMovieBtn)
        
        let backBtn:UIButton = uiCreation.createButton(xValue: 40, yValue: 816, width: 250, height: 30, title: "Back to Home Page", color: UIColor.brown,action:#selector(showHomeView))
        movieManageView?.addSubview(backBtn)
    }
    
    //show add movie view
    @objc func showAddMovieView() {
        addMovieView?.isHidden = false
    }
    //show delete movie view
    @objc func showDeleteMovieView() {
        deleteMovieView?.isHidden = false
    }
    
    @objc func showDisplayMovieView() {
        displayMovieView?.isHidden = false
    }
    
    @objc func showHomeView() {
        app.homeView.isHidden = false
    }
}
