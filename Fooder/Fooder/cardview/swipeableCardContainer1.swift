////
////  cardView.swift
////  Fooder
////
////  Created by Josh Bergstrom on 7/31/18.
////  Copyright © 2018 Josh Bergstrom. All rights reserved.
////
//
//import Foundation
//
//protocol SwipeableCardViewDataSource: class {
//    
//    func numberOfCards() -> Int
//    
//    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard
//    
//    func viewForEmptyCards() -> UIView?
//    
//    /// Reloads the data used to layout card views in the
//    /// card stack. Removes all existing card views and
//    /// calls the dataSource to layout new card views.
//    func reloadData() {
//    removeAllCardViews()
//    guard let dataSource = dataSource else {
//    return
//    }
//    
//    let numberOfCards = dataSource.numberOfCards()
//    remainingCards = numberOfCards
//    
//    for index in 0..<min(numberOfCards, SwipeableCardViewContainer.numberOfVisibleCards) {
//    addCardView(cardView: dataSource.card(forItemAtIndex: index), atIndex: index)
//    }
//    
//    if let emptyView = dataSource.viewForEmptyCards() {
//    addEdgeConstrainedSubView(view: emptyView)
//    }
//    
//    setNeedsLayout()
//    }
//    
//    /// Sets the frame of a card view provided for a given index. Applies a specific
//    /// horizontal and vertical offset relative to the index in order to create an
//    /// overlay stack effect on a series of cards.
//    ///
//    /// - Parameters:
//    ///   - cardView: card view to update frame on
//    ///   - index: index used to apply horizontal and vertical insets
//    private func setFrame(forCardView cardView: SwipeableCardViewCard, atIndex index: Int) {
//    var cardViewFrame = bounds
//    let horizontalInset = (CGFloat(index) * SwipeableCardViewContainer.horizontalInset)
//    let verticalInset = CGFloat(index) * SwipeableCardViewContainer.verticalInset
//    
//    cardViewFrame.size.width -= 2 * horizontalInset
//    cardViewFrame.origin.x += horizontalInset
//    cardViewFrame.origin.y += verticalInset
//    
//    cardView.frame = cardViewFrame
//    }
//    
//    
//
//    func didEndSwipe(onView view: SwipeableView) {
//    guard let dataSource = dataSource else {
//    return
//    }
//    
//    // Remove swiped card
//    view.removeFromSuperview()
//    
//    // Only add a new card if there are cards remaining
//    if remainingCards > 0 {
//    
//    // Calculate new card's index
//    let newIndex = dataSource.numberOfCards() - remainingCards
//    
//    // Add new card as Subview
//    addCardView(cardView: dataSource.card(forItemAtIndex: newIndex), atIndex: 2)
//    
//    // Update all existing card's frames based on new indexes, animate frame change
//    // to reveal new card from underneath the stack of existing cards.
//    for (cardIndex, cardView) in visibleCardViews.reversed().enumerated() {
//    UIView.animate(withDuration: 0.2, animations: {
//    cardView.center = self.center
//    self.setFrame(forCardView: cardView, atIndex: cardIndex)
//    self.layoutIfNeeded()
//    })
//        }
//    }
//}
//
//
//}
