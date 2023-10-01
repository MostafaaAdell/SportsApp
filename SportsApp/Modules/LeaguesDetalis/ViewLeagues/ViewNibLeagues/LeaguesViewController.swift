//
//  LeaguesViewController.swift
//  SportsApp
//
//  Created by Mustafa on 27/09/2023.
//

import UIKit

class LeaguesViewController: UIViewController {

    @IBOutlet weak var leaguesTableView: UITableView!
    
    //var viewFootballLeague:TabViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
         configureLeagueTableView()
       // viewFootballLeague?.getLeaguesFromApi()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - Function Needed using In League TableView TableView
extension LeaguesViewController{
    
    func configureLeagueTableView(){
        leaguesTableView.dataSource = self
        leaguesTableView.delegate = self
        leaguesTableView.register(UINib(nibName: K.customNibNameLeagues, bundle: nil), forCellReuseIdentifier: K.customNibNameIdentfier)
    }
    
}


//MARK: - Adding Data Source To League Table View
extension LeaguesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.customNibNameIdentfier, for: indexPath) as! CustomNibCell
        
        
        
        return cell
        
    }
    
    
    
    
}

//MARK: - Adding Delegate to League Table View
extension LeaguesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return K.customNibNameLeaguesHeight
    }
    
    //Test Detalis Second View
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let vc = TeamDetalisViewController(nibName: K.customNibTeamDetalis, bundle: nil)
         vc.view.backgroundColor = .white
         vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         vc.modalPresentationStyle = .fullScreen
         self.present(vc, animated: true, completion: nil)
     //   self.navigationController?.pushViewController(vc, animated: true)



        
    }
    
}
