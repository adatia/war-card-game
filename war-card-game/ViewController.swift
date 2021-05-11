//
//  ViewController.swift
//  Adatia_Shayn_War
//
//  Created by Period Two on 2019-04-05.
//  Copyright © 2019 Period Two. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //runs the shuffle function to create a shuffled deck on startup
        shuffle()
    }
    
    //declares all of the outlets of elements that require manipulation throughout the program
    @IBOutlet weak var player1Card: UIImageView!
    @IBOutlet weak var player2Card: UIImageView!
    @IBOutlet weak var player1CV: UILabel!
    @IBOutlet weak var player2CV: UILabel!
    @IBOutlet weak var player1CardB: UIImageView!
    @IBOutlet weak var player1CardC: UIImageView!
    @IBOutlet weak var player2CardB: UIImageView!
    @IBOutlet weak var player2CardC: UIImageView!
    @IBOutlet weak var cardDeck: UIImageView!
    @IBOutlet weak var startGameButton: UIButton!
    @IBOutlet weak var newGameButton: UIButton!
    
    
    //creates variables for the player scores
    var player1Score = 0
    var player2Score = 0
    
    //creates a dictionary that uses card images as keys and the cards' respective values as values
    var cards: [UIImage:Int] = [#imageLiteral(resourceName: "2C.png"):2,#imageLiteral(resourceName: "2D.png"):2,#imageLiteral(resourceName: "2H.png"):2,#imageLiteral(resourceName: "2S.png"):2,#imageLiteral(resourceName: "3C.png"):3,#imageLiteral(resourceName: "3D.png"):3,#imageLiteral(resourceName: "3H.png"):3,#imageLiteral(resourceName: "3S.png"):3,#imageLiteral(resourceName: "4C.png"):4,#imageLiteral(resourceName: "4D.png"):4,#imageLiteral(resourceName: "4H.png"):4,#imageLiteral(resourceName: "4S.png"):4,#imageLiteral(resourceName: "5C.png"):5,#imageLiteral(resourceName: "5D.png"):5,#imageLiteral(resourceName: "5H.png"):5,#imageLiteral(resourceName: "5S.png"):5,#imageLiteral(resourceName: "6C.png"):6,#imageLiteral(resourceName: "6D.png"):6,#imageLiteral(resourceName: "6H.png"):6,#imageLiteral(resourceName: "6S.png"):6,#imageLiteral(resourceName: "7C.png"):7,#imageLiteral(resourceName: "7D.png"):7,#imageLiteral(resourceName: "7H.png"):7,#imageLiteral(resourceName: "7S.png"):7,#imageLiteral(resourceName: "8C.png"):8,#imageLiteral(resourceName: "8D.png"):8,#imageLiteral(resourceName: "8H.png"):8,#imageLiteral(resourceName: "8S.png"):8,#imageLiteral(resourceName: "9C.png"):9,#imageLiteral(resourceName: "9D.png"):9,#imageLiteral(resourceName: "9H.png"):9,#imageLiteral(resourceName: "9S.png"):9,#imageLiteral(resourceName: "10C.png"):10,#imageLiteral(resourceName: "10D.png"):10,#imageLiteral(resourceName: "10H.png"):10,#imageLiteral(resourceName: "10S.png"):10,#imageLiteral(resourceName: "AC.png"):14,#imageLiteral(resourceName: "AD.png"):14,#imageLiteral(resourceName: "AH.png"):14,#imageLiteral(resourceName: "AS.png"):14,#imageLiteral(resourceName: "JC.png"):11,#imageLiteral(resourceName: "JD.png"):11,#imageLiteral(resourceName: "JH.png"):11,#imageLiteral(resourceName: "JS.png"):11,#imageLiteral(resourceName: "KC.png"):13,#imageLiteral(resourceName: "KD.png"):13,#imageLiteral(resourceName: "KH.png"):13,#imageLiteral(resourceName: "KS.png"):13,#imageLiteral(resourceName: "QC.png"):12,#imageLiteral(resourceName: "QD.png"):12,#imageLiteral(resourceName: "QH.png"):12,#imageLiteral(resourceName: "QS.png"):12]

    //creates a variable to be used with the war functions
    var warNumber = 0
    
    //creates an empty array to be used as a shuffled deck
    var shuffledDeck: [UIImage] = []
    
    //declares a function that shuffles the card keys from the dictionary "cards" and places them in the empty array "shuffledDeck"
    func shuffle() {
        for _ in 0...51 {
            var randomCard = cards.randomElement()!.key
            shuffledDeck.append(randomCard)
            cards.removeValue(forKey: randomCard)
            
        }
    }
    
    //declares a function that will trigger a war
        func war() {
            
        //the switch statement checks the current count of the deck and displays the appropriate amount of cards based on the count
            switch shuffledDeck.count {
            case 6...52:
            
            //sets the war number variable to 6 for later reference with the war part 2 function
            warNumber = 6
                
            //changes the start game button to say "war" with an animation
            UIButton.transition(with: self.startGameButton, duration: 0.7, options: .transitionCrossDissolve, animations: {self.startGameButton.setImage(#imageLiteral(resourceName: "z3.1"), for: .normal)}, completion: nil)
            
            //changes first cards of player 1 and 2 to random cards with an animation after 0.7 seconds, and also removes those cards from the deck
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            UIView.transition(with: self.player1Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player1Card.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
            UIView.transition(with: self.player2Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player2Card.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
            }
            
            //changes second cards of player 1 and 2 to random cards with an animation after 1.4 seconds, and also removes those cards from the deck
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
            UIView.transition(with: self.player1CardB, duration: 0.7, options: .transitionCurlDown, animations: {self.player1CardB.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
            UIView.transition(with: self.player2CardB, duration: 0.7, options: .transitionCurlDown, animations: {self.player2CardB.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
                }
            
            //changes third cards of player 1 and 2 to random cards with an animation after 2.1 seconds, and also removes those cards from the deck
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.1) {
                UIView.transition(with: self.player1CardC, duration: 0.7, options: .transitionCurlDown, animations: {self.player1CardC.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
            UIView.transition(with: self.player2CardC, duration: 0.7, options: .transitionCurlDown, animations: {self.player2CardC.image = self.shuffledDeck.last}, completion: nil)
                self.shuffledDeck.removeLast()
                }
            case 4:
                
                //sets the war number variable to 6 for later reference with the war part 2 function
                warNumber = 4
                
                //changes the start game button to say "war" with an animation
                UIButton.transition(with: self.startGameButton, duration: 0.7, options: .transitionCrossDissolve, animations: {self.startGameButton.setImage(#imageLiteral(resourceName: "z3.1"), for: .normal)}, completion: nil)
                
                //changes first cards of player 1 and 2 to random cards with an animation after 0.7 seconds, and also removes those cards from the deck
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    UIView.transition(with: self.player1Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player1Card.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                    UIView.transition(with: self.player2Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player2Card.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                }
                
                //changes second cards of player 1 and 2 to random cards with an animation after 0.7 seconds, and also removes those cards from the deck
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.4) {
                    UIView.transition(with: self.player1CardB, duration: 0.7, options: .transitionCurlDown, animations: {self.player1CardB.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                    UIView.transition(with: self.player2CardB, duration: 0.7, options: .transitionCurlDown, animations: {self.player2CardB.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                }
            case 2:
                
                //sets the war number variable to 6 for later reference with the war part 2 function
                warNumber = 2
                
                //changes the start game button to say "war" with an animation
                UIButton.transition(with: self.startGameButton, duration: 0.7, options: .transitionCrossDissolve, animations: {self.startGameButton.setImage(#imageLiteral(resourceName: "z3.1"), for: .normal)}, completion: nil)
                
                //changes first cards of player 1 and 2 to random cards with an animation after 0.7 seconds, and also removes those cards from the deck
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    UIView.transition(with: self.player1Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player1Card.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                    UIView.transition(with: self.player2Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player2Card.image = self.shuffledDeck.last}, completion: nil)
                    self.shuffledDeck.removeLast()
                }
            default:
                    break
            }
    }
    
    //declares a function that will remove the extra cards present during war with animations
    func warCleanup() {
        UIView.transition(with: self.player1CardB, duration: 0.7, options: .transitionFlipFromLeft, animations: {self.player1CardB.image = nil}, completion: nil)
        UIView.transition(with: self.player2CardB, duration: 0.7, options: .transitionFlipFromLeft, animations: {self.player2CardB.image = nil}, completion: nil)
        UIView.transition(with: self.player1CardC, duration: 0.7, options: .transitionFlipFromRight, animations: {self.player1CardC.image = nil}, completion: nil)
        UIView.transition(with: self.player2CardC, duration: 0.7, options: .transitionFlipFromRight, animations: {self.player2CardC.image = nil}, completion: nil)
    }
    
    //creates a duplicate dictionary of the dictionary "cards" since the original dictionary was destroyed in the creation of the shuffled deck
    var cards2: [UIImage:Int] = [#imageLiteral(resourceName: "2C.png"):2,#imageLiteral(resourceName: "2D.png"):2,#imageLiteral(resourceName: "2H.png"):2,#imageLiteral(resourceName: "2S.png"):2,#imageLiteral(resourceName: "3C.png"):3,#imageLiteral(resourceName: "3D.png"):3,#imageLiteral(resourceName: "3H.png"):3,#imageLiteral(resourceName: "3S.png"):3,#imageLiteral(resourceName: "4C.png"):4,#imageLiteral(resourceName: "4D.png"):4,#imageLiteral(resourceName: "4H.png"):4,#imageLiteral(resourceName: "4S.png"):4,#imageLiteral(resourceName: "5C.png"):5,#imageLiteral(resourceName: "5D.png"):5,#imageLiteral(resourceName: "5H.png"):5,#imageLiteral(resourceName: "5S.png"):5,#imageLiteral(resourceName: "6C.png"):6,#imageLiteral(resourceName: "6D.png"):6,#imageLiteral(resourceName: "6H.png"):6,#imageLiteral(resourceName: "6S.png"):6,#imageLiteral(resourceName: "7C.png"):7,#imageLiteral(resourceName: "7D.png"):7,#imageLiteral(resourceName: "7H.png"):7,#imageLiteral(resourceName: "7S.png"):7,#imageLiteral(resourceName: "8C.png"):8,#imageLiteral(resourceName: "8D.png"):8,#imageLiteral(resourceName: "8H.png"):8,#imageLiteral(resourceName: "8S.png"):8,#imageLiteral(resourceName: "9C.png"):9,#imageLiteral(resourceName: "9D.png"):9,#imageLiteral(resourceName: "9H.png"):9,#imageLiteral(resourceName: "9S.png"):9,#imageLiteral(resourceName: "10C.png"):10,#imageLiteral(resourceName: "10D.png"):10,#imageLiteral(resourceName: "10H.png"):10,#imageLiteral(resourceName: "10S.png"):10,#imageLiteral(resourceName: "AC.png"):14,#imageLiteral(resourceName: "AD.png"):14,#imageLiteral(resourceName: "AH.png"):14,#imageLiteral(resourceName: "AS.png"):14,#imageLiteral(resourceName: "JC.png"):11,#imageLiteral(resourceName: "JD.png"):11,#imageLiteral(resourceName: "JH.png"):11,#imageLiteral(resourceName: "JS.png"):11,#imageLiteral(resourceName: "KC.png"):13,#imageLiteral(resourceName: "KD.png"):13,#imageLiteral(resourceName: "KH.png"):13,#imageLiteral(resourceName: "KS.png"):13,#imageLiteral(resourceName: "QC.png"):12,#imageLiteral(resourceName: "QD.png"):12,#imageLiteral(resourceName: "QH.png"):12,#imageLiteral(resourceName: "QS.png"):12]
    
    //declares the action for the start game button (which also transforms into the next card button)
    @IBAction func startGame(_ sender: UIButton) {
        
        //disables user interaction to prevent overlapping of cards
        startGameButton.isUserInteractionEnabled = false
        
        //checks to see if the second card UIImageView for player 1 currently has an image, and if it does, runs the warCleanup function
        if player1CardB.image != nil {
            warCleanup()
        }
        
        //declares a function that determines which player has a higher total score and returns the number of that player
        func currentWinner() -> Int {
            var winnerNumber = 0
            if player1Score > player2Score {
                winnerNumber = 1
            } else if player2Score > player1Score {
                winnerNumber = 2
        }
            return winnerNumber
        }
        
        //declares a function that displays an alert box with the specified player number
        func winSequence(player: Int) {
            let alertController = UIAlertController(title: "Game Over", message:
                "Player \(player) wins! Player 1's score was \(player1Score) and Player 2's score was \(player2Score)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
        
        //checks to see if the shuffled deck is empty, if it is, ends the game
        if shuffledDeck.isEmpty {
            
            //changes the text of the start game button to "Game Over"
            UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromTop, animations: {sender.setImage(#imageLiteral(resourceName: "z4"), for: .normal)}, completion: nil)
            
            //disables user interaction of the start game button
            sender.isUserInteractionEnabled = false
            
            //reveals a new game button
            newGameButton.isHidden = false
            
            //checks to see which player has a higher score and displays an alert box saying which player won and scores of both players
            var winner = currentWinner()
            if player1Score == player2Score {
                let alertController = UIAlertController(title: "Game Over", message:
                    "Tie game! Better luck next time!", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Continue", style: .default))
                self.present(alertController, animated: true, completion: nil)
            } else {
                winSequence(player: winner)
            }
            
        //runs the default code if the deck still contains cards
        } else {
        
        //changes the image of the card deck to the same image with an animation (to simulate drawing cards)
        UIView.transition(with: self.cardDeck, duration: 0.7, options: .transitionCurlUp, animations: {self.cardDeck.image = UIImage.init(named: "Deck of Cards")}, completion: nil)
            
        //changes cards of player 1 and 2 to random cards with an animation after 0.7 seconds, and also removes those cards from the deck
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
        UIView.transition(with: self.player1Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player1Card.image = self.shuffledDeck.last}, completion: nil)
            self.shuffledDeck.removeLast()
        UIView.transition(with: self.player2Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player2Card.image = self.shuffledDeck.last}, completion: nil)
            self.shuffledDeck.removeLast()
            
        //changes the image of the start game button to "another one" with an animated flip
        UIButton.transition(with: sender, duration: 0.7, options: .transitionFlipFromTop, animations: {sender.setImage(#imageLiteral(resourceName: "z2"), for: .normal)}, completion: nil)
            
            //creates variables that store the value of the currently displayed cards for each player
            var player1CurrentValue = self.cards2[self.player1Card.image!]!
        
            var player2CurrentValue = self.cards2[self.player2Card.image!]!
    
            //reenables user interaction of the start game button
            self.startGameButton.isUserInteractionEnabled = true
            
            //declares a function that will display an alert box saying which player won the war and the values of each player's war cards
            func winWarSequence(player: Int) {
                let alertController = UIAlertController(title: "War", message:
                    "Player \(player) won the war! The value of Player 1's war cards was \(player1CurrentValue) and the value of Player 2's war cards was \(player2CurrentValue)", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Continue", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            
            //declares a function that will display an alert box saying that the war was a tie
            func tieWarSequence() {
            let alertController = UIAlertController(title: "War", message:
                "Tie! The value of the war cards was equal, so both players have been assigned 1 point", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Continue", style: .default))
            self.present(alertController, animated: true, completion: nil)
            }
                
            //declares the second part of the war function
            func warPart2() {
                
                //switch statement checks the current value of war number, which is connected to the appropriate war setting (number of cards in the deck)
                switch self.warNumber {
                case 6:
                    
                //assigns the value of the sum of the cards present to the player1CurrentValue variable
                player1CurrentValue = self.cards2[self.player1Card.image!]! + self.cards2[self.player1CardB.image!]! + self.cards2[self.player1CardC.image!]!
                
                //assigns the value of the sum of the cards present to the player2CurrentValue variable
                player2CurrentValue = self.cards2[self.player2Card.image!]! + self.cards2[self.player2CardB.image!]! + self.cards2[self.player2CardC.image!]!
                
                //checks to see which player has a higher card value and assigns 2 points to that player, if there is a tie, both players each get 1 point, displays an alert box informing the players
                if player1CurrentValue > player2CurrentValue {
                    self.player1Score += 2
                    self.player1CV.text = String(self.player1Score)
                    winWarSequence(player: 1)
                } else if player1CurrentValue < player2CurrentValue {
                    self.player2Score += 2
                    self.player2CV.text = String(self.player2Score)
                    winWarSequence(player: 2)
                } else if player1CurrentValue == player2CurrentValue {
                    self.player1Score += 1
                    self.player1CV.text = String(self.player1Score)
                    self.player2Score += 1
                    self.player2CV.text = String(self.player1Score)
                    tieWarSequence()
                }
                    
                
                case 4:
                    
                //assigns the value of the sum of the cards present to the player1CurrentValue variable
                player1CurrentValue = self.cards2[self.player1Card.image!]! + self.cards2[self.player1CardB.image!]!
                
                //assigns the value of the sum of the cards present to the player2CurrentValue variable
                player2CurrentValue = self.cards2[self.player2Card.image!]! + self.cards2[self.player2CardB.image!]!
                
                //checks to see which player has a higher card value and assigns 2 points to that player, if there is a tie, both players each get 1 point, displays an alert box informing the players
                if player1CurrentValue > player2CurrentValue {
                    self.player1Score += 2
                    self.player1CV.text = String(self.player1Score)
                    winWarSequence(player: 1)
                } else if player1CurrentValue < player2CurrentValue {
                    self.player2Score += 2
                    self.player2CV.text = String(self.player2Score)
                    winWarSequence(player: 2)
                } else if player1CurrentValue == player2CurrentValue {
                    self.player1Score += 1
                    self.player1CV.text = String(self.player1Score)
                    self.player2Score += 1
                    self.player2CV.text = String(self.player1Score)
                    tieWarSequence()
                }
                case 2:
                    
                    //assigns the value of the card present to the player1CurrentValue variable
                    player1CurrentValue = self.cards2[self.player1Card.image!]!
                    
                    //assigns the value of the card present to the player2CurrentValue variable
                    player2CurrentValue = self.cards2[self.player2Card.image!]!
                    
                    //checks to see which player has a higher card value and assigns 2 points to that player, if there is a tie, both players each get 1 point, displays an alert box informing the players
                    if player1CurrentValue > player2CurrentValue {
                        self.player1Score += 2
                        self.player1CV.text = String(self.player1Score)
                        winWarSequence(player: 1)
                    } else if player1CurrentValue < player2CurrentValue {
                        self.player2Score += 2
                        self.player2CV.text = String(self.player2Score)
                        winWarSequence(player: 2)
                    } else if player1CurrentValue == player2CurrentValue {
                        self.player1Score += 1
                        self.player1CV.text = String(self.player1Score)
                        self.player2Score += 1
                        self.player2CV.text = String(self.player1Score)
                        tieWarSequence()
                    }
                default:
                    break
            }
           
            }
            
        //checks to see which player has a higher card value and assigns 2 points to that player, if the card values are equal, runs the war function and subsequently the war part 2 function
        if player1CurrentValue > player2CurrentValue {
            self.player1Score += 2
            self.player1CV.text = String(self.player1Score)
        } else if player1CurrentValue < player2CurrentValue {
            self.player2Score += 2
            self.player2CV.text = String(self.player2Score)
        } else if player1CurrentValue == player2CurrentValue {
            self.startGameButton.isUserInteractionEnabled = false
            self.war()
           DispatchQueue.main.asyncAfter(deadline: .now() + 2.8) {
            warPart2()
            self.startGameButton.isUserInteractionEnabled = true
            }
        }
    }
        
}

}
    
    //declares the action for the new game button
    @IBAction func newGame(_ sender: UIButton) {
        
        //hides the new game button
        newGameButton.isHidden = true
        
        //changes the title of the start game button back to start game and changes the main cards of player 1 and 2 to the default gray back cards with an animation
        UIButton.transition(with: startGameButton, duration: 0.7, options: .transitionFlipFromTop, animations: {self.startGameButton.setImage(#imageLiteral(resourceName: "z"), for: .normal)}, completion: nil)
        UIView.transition(with: self.player1Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player1Card.image = UIImage.init(named: "gray_back")}, completion: nil)
        UIView.transition(with: self.player2Card, duration: 0.7, options: .transitionCurlDown, animations: {self.player2Card.image = UIImage.init(named: "gray_back")}, completion: nil)
        
        //reenables user interaction of the start game button
        startGameButton.isUserInteractionEnabled = true
        
        //rebuilds the cards dictionary
        cards = [#imageLiteral(resourceName: "2C.png"):2,#imageLiteral(resourceName: "2D.png"):2,#imageLiteral(resourceName: "2H.png"):2,#imageLiteral(resourceName: "2S.png"):2,#imageLiteral(resourceName: "3C.png"):3,#imageLiteral(resourceName: "3D.png"):3,#imageLiteral(resourceName: "3H.png"):3,#imageLiteral(resourceName: "3S.png"):3,#imageLiteral(resourceName: "4C.png"):4,#imageLiteral(resourceName: "4D.png"):4,#imageLiteral(resourceName: "4H.png"):4,#imageLiteral(resourceName: "4S.png"):4,#imageLiteral(resourceName: "5C.png"):5,#imageLiteral(resourceName: "5D.png"):5,#imageLiteral(resourceName: "5H.png"):5,#imageLiteral(resourceName: "5S.png"):5,#imageLiteral(resourceName: "6C.png"):6,#imageLiteral(resourceName: "6D.png"):6,#imageLiteral(resourceName: "6H.png"):6,#imageLiteral(resourceName: "6S.png"):6,#imageLiteral(resourceName: "7C.png"):7,#imageLiteral(resourceName: "7D.png"):7,#imageLiteral(resourceName: "7H.png"):7,#imageLiteral(resourceName: "7S.png"):7,#imageLiteral(resourceName: "8C.png"):8,#imageLiteral(resourceName: "8D.png"):8,#imageLiteral(resourceName: "8H.png"):8,#imageLiteral(resourceName: "8S.png"):8,#imageLiteral(resourceName: "9C.png"):9,#imageLiteral(resourceName: "9D.png"):9,#imageLiteral(resourceName: "9H.png"):9,#imageLiteral(resourceName: "9S.png"):9,#imageLiteral(resourceName: "10C.png"):10,#imageLiteral(resourceName: "10D.png"):10,#imageLiteral(resourceName: "10H.png"):10,#imageLiteral(resourceName: "10S.png"):10,#imageLiteral(resourceName: "AC.png"):14,#imageLiteral(resourceName: "AD.png"):14,#imageLiteral(resourceName: "AH.png"):14,#imageLiteral(resourceName: "AS.png"):14,#imageLiteral(resourceName: "JC.png"):11,#imageLiteral(resourceName: "JD.png"):11,#imageLiteral(resourceName: "JH.png"):11,#imageLiteral(resourceName: "JS.png"):11,#imageLiteral(resourceName: "KC.png"):13,#imageLiteral(resourceName: "KD.png"):13,#imageLiteral(resourceName: "KH.png"):13,#imageLiteral(resourceName: "KS.png"):13,#imageLiteral(resourceName: "QC.png"):12,#imageLiteral(resourceName: "QD.png"):12,#imageLiteral(resourceName: "QH.png"):12,#imageLiteral(resourceName: "QS.png"):12]
        
        //reruns the shuffle function to build a new shuffled deck
        shuffle()
        
        //resets the player score values and labels
        player1Score = 0
        player2Score = 0
        player1CV.text = String(player1Score)
        player2CV.text = String(player2Score)
    }
    
}
