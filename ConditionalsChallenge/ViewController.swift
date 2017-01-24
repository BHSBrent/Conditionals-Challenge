//
//  ViewController.swift
//  ConditionalsChallenge
//
//  Created by Robert Oppenheimer on 5/18/16.
//  Copyright (c) 2015 MobileMakers. All rights reserved.


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myTextView: UITextView!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    
    var firstChoiceCost = 0
    var secondChoiceCost = 0
    var thirdChoiceCost = 0
    var fourthChoiceCost = 0

    var totalMoney = Int()
    var stringToReturn = ""

    var clothingItemArray = [ClothingItems]()

    override func viewDidLoad() {
        super.viewDidLoad()
        clothingItemArray.append(ClothingItems(Description: "Jacket", Price: 80))
        clothingItemArray.append(ClothingItems(Description: "Jeans", Price: 60))
        clothingItemArray.append(ClothingItems(Description: "Shirt", Price: 40))
        clothingItemArray.append(ClothingItems(Description: "Hat", Price: 20))

        myTableView.isEditing = true
    }

    func determineOutputMVP() -> String
    {
        setInfo()
        /***************************************************
        * Start Your Code Here For MVP
        ***************************************************/
        if (firstChoiceCost <= totalMoney)  {
            stringToReturn = "You can purchase your first choice"
        }   else    {
            stringToReturn = "You cannot purchase your first choice"
        }
        
        /***************************************************
        * End Your Code Here For MVP
        ***************************************************/
        return stringToReturn
    }
    
    func determineOutput1() -> String
    {
        setInfo()
        /***************************************************
         * Start Your Code Here For Stretch #1
         ***************************************************/
        if (firstChoiceCost <= totalMoney)  {
            if (firstChoiceCost + 10 <= totalMoney) {
                stringToReturn = "You have plenty of money for your first choice"
            }   else    {
                stringToReturn = "You have just enough money for your first choice"
            }
        }   else    {
            stringToReturn = "You cannot purchase your first choice"
        }
        /***************************************************
         * End Your Code Here For Stretch #1
         ***************************************************/
        return stringToReturn
    }
    
    func determineOutput2() -> String
    {
        setInfo()
        /***************************************************
         * Start Your Code Here For Stretch #2
         ***************************************************/
        
        if (firstChoiceCost <= totalMoney)  {
            stringToReturn += "You can purchase your first choice\n"
            if (firstChoiceCost + secondChoiceCost <= totalMoney)   {
                stringToReturn += "You can purchase your second choice\n"
                if (firstChoiceCost + secondChoiceCost + thirdChoiceCost <= totalMoney)   {
                    stringToReturn += "You can purchase your third choice\n"
                    if (firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost <= totalMoney)  {
                        stringToReturn += "You can purchase your fourth choice"
                    }   else    {
                    }
                }   else    {
                }
            }   else    {
            }
        }   else    {
            stringToReturn = "You cannot purchase your first choice"
        }
        
        /***************************************************
         * End Your Code Here For Stretch #2
         ***************************************************/
        
        return stringToReturn
    }

    func determineOutput3() -> String
    {
        setInfo()
        /***************************************************
        * Start Your Code Here For Stretch #3
        ***************************************************/
        
        if (firstChoiceCost <= totalMoney)  {
            stringToReturn += "You can purchase your first choice\n"
            if (firstChoiceCost + secondChoiceCost <= totalMoney)   {
                stringToReturn += "You can purchase your second choice\n"
                if (firstChoiceCost + secondChoiceCost + thirdChoiceCost <= totalMoney)   {
                    stringToReturn += "You can purchase your third choice\n"
                    if (firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost <= totalMoney)  {
                        stringToReturn += "You can purchase your fourth choice"
                    }   else    {
                        stringToReturn += "You cannot purchase your fourth choice"
                    }
                }   else    {
                    stringToReturn += "You cannot purchase your third choice"
                }
            }   else    {
                stringToReturn += "You cannot purchase your second choice"
            }
        }   else    {
            stringToReturn = "You cannot purchase your first choice"
        }

        /***************************************************
        * End Your Code Here For Stretch #3
        ***************************************************/

        return stringToReturn
    }

    func determineOutput4() -> String
    {
        setInfo()
        /***************************************************
        * Start Your Code Here For Stretch #4
        ***************************************************/
        
        if (firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost <= totalMoney)   {
            stringToReturn = "You can purchase all your choices"
        }   else if (firstChoiceCost + secondChoiceCost + thirdChoiceCost <= totalMoney)    {
            stringToReturn = "You can purchase your top three items"
        }   else if (firstChoiceCost + secondChoiceCost <= totalMoney)  {
            stringToReturn = "You can purchase your top two items"
        }   else if (firstChoiceCost <= totalMoney) {
            stringToReturn = "You can purchase your top item"
        }   else    {
            stringToReturn = "You cannot purchase the items in this order"
        }
        
        /***************************************************
        * End Your Code Here For Stretch #4
        ***************************************************/

        return stringToReturn
    }

    func determineOutput5() -> String
    {
        setInfo()
        /***************************************************
        * Start Your Code Here For Stretch #5
        ***************************************************/
        
        if (firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost <= totalMoney)   {
            stringToReturn = "You can purchase all your choices\n"
            stringToReturn += "You have $\(totalMoney - firstChoiceCost - secondChoiceCost - thirdChoiceCost - fourthChoiceCost) left\n"
            stringToReturn += "You have spent $\(firstChoiceCost + secondChoiceCost + thirdChoiceCost + fourthChoiceCost)"
        }   else if (firstChoiceCost + secondChoiceCost + thirdChoiceCost <= totalMoney)    {
            stringToReturn = "You can purchase your top three items\n"
            stringToReturn += "You have $\(totalMoney - firstChoiceCost - secondChoiceCost - thirdChoiceCost) left\n"
            stringToReturn += "You have spent $\(firstChoiceCost + secondChoiceCost + thirdChoiceCost)"
        }   else if (firstChoiceCost + secondChoiceCost <= totalMoney)  {
            stringToReturn = "You can purchase your top two items\n"
            stringToReturn += "You have $\(totalMoney - firstChoiceCost - secondChoiceCost) left\n"
            stringToReturn += "You have spent $\(firstChoiceCost + secondChoiceCost)"
        }   else if (firstChoiceCost <= totalMoney) {
            stringToReturn = "You can purchase your top item\n"
            stringToReturn += "You have $\(totalMoney - firstChoiceCost) left\n"
            stringToReturn += "You have spent $\(firstChoiceCost)"
        }   else    {
            stringToReturn = "You cannot purchase the items in this order"
        }
        
        /***************************************************
        * End Your Code Here For Stretch #5
        ***************************************************/

        return stringToReturn
    }


    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let selectedItem = clothingItemArray[(sourceIndexPath as NSIndexPath).row]
        clothingItemArray.remove(at: (sourceIndexPath as NSIndexPath).row)
        clothingItemArray.insert(selectedItem, at: (destinationIndexPath as NSIndexPath).row)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        let selectedClothingItem = clothingItemArray[(indexPath as NSIndexPath).row]
        cell.textLabel!.text = selectedClothingItem.description + " $\(selectedClothingItem.price)"
        return cell
    }

    @IBAction func whenRefreshPressed(_ sender: UIBarButtonItem) {
        setInfo()
        onSegmentChosenPressed()
    }
    
    func setInfo() {
        totalMoney = (Int)(arc4random_uniform(10)*20 + 20)
        stringToReturn = ""
        navigationItem.title = "You have $\(totalMoney)"
        firstChoiceCost = clothingItemArray[0].price
        secondChoiceCost = clothingItemArray[1].price
        thirdChoiceCost = clothingItemArray[2].price
        fourthChoiceCost = clothingItemArray[3].price
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clothingItemArray.count
    }

    func onSegmentChosenPressed()
    {
        switch mySegmentedControl.selectedSegmentIndex
        {
            case 0:
                myTextView.text = determineOutputMVP()
            case 1:
                myTextView.text = determineOutput1()
            case 2:
                myTextView.text = determineOutput2()
            case 3:
                myTextView.text = determineOutput3()
            case 4:
                myTextView.text = determineOutput4()
            case 5:
                myTextView.text = determineOutput5()
            default:
                print("Error")
        }
    }
}

