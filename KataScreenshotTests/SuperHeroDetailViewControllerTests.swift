//
//  SuperHeroDetailViewControllerTests.swift
//  KataScreenshotTests
//
//  Created by Fernando García Fernández on 21/11/17.
//  Copyright © 2017 Karumi. All rights reserved.
//

import Foundation
import UIKit
@testable import KataScreenshot

class SuperHeroDetailViewControllerTests: ScreenshotTest{
    
    fileprivate let repository = MockSuperHeroesRepository()
    let superHeroName = "Mr. Clean"
    
    func testSuperHeroDetailAppearWithoutBadge(){
        givenASuperHero(isAvenger: false)
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    func testSuperHeroDetailAppearWithBadge(){
        givenASuperHero(isAvenger: true)
        
        let viewController = getSuperHeroDetailViewController()
        
        verify(viewController: viewController)
    }
    
    
    func givenASuperHero(isAvenger: Bool){
        var superHeroes = [SuperHero]()
        superHeroes.append(SuperHeroMother.givenASuperHero(isAvenger: isAvenger))
        repository.superHeroes = superHeroes
    }
    
    fileprivate func getSuperHeroDetailViewController() -> UIViewController {
        let superHeroDetailViewController = ServiceLocator()
            .provideSuperHeroDetailViewController(superHeroName) as! SuperHeroDetailViewController
        superHeroDetailViewController.presenter = SuperHeroDetailPresenter(ui: superHeroDetailViewController, superHeroName: superHeroName, getSuperHeroByName: GetSuperHeroByName(repository: repository))
        return superHeroDetailViewController
    }
        
}
