//
//  ActivityViewController.swift
//  CannaShareGroupActivity
//
//  Created by Wylan L Neely on 1/1/22.
//

import UIKit
import GroupActivities


class GanjaActivityVC: UIViewController  {
    
    
    var ganjaController = GanjaShareActivityController()

    override func viewDidLoad() {
        super.viewDidLoad()
        cDelegate = ganjaController
    }
    
    var cDelegate: CannabisTypeDelegate?
    
    @IBOutlet weak var indicaButton: UIButton!
    @IBOutlet weak var hybridButton: UIButton!
    @IBOutlet weak var sativaButton: UIButton!
    @IBAction func SharePlayButtonTapped(_ sender: Any) async {
        for await _ in GangaShare.sessions() {
            
        }
    }
    
    @IBAction func indicaButtonTapped(_ sender: Any) {
        cDelegate?.cannabisTypeChanged(type: .Indica)
    }
    
     @IBAction func hybridButtonTapped(_ sender: Any) {
         cDelegate?.cannabisTypeChanged(type: .Hybrid)
     }
    
     @IBAction func sativaButtonTapped(_ sender: Any) {
         cDelegate?.cannabisTypeChanged(type: .Sativa)
     }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
