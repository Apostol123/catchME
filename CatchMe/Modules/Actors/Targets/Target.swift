import Foundation
import UIKit

class WaterController {
    
    // MARK: - Properties
    
    // MARK: Views
    var view: UIView!
    private var drops: [UIView] = []
    private var dropColor = UIColor(red:0.56, green:0.76, blue:0.85, alpha:1.0)
    
    // MARK: Drop positions
    private var startX: CGFloat!
    private var startY: CGFloat!
    private var distanceBetweenEachDrop: CGFloat!
    private var distanceBetweenSameRow: CGFloat!
    
    // MARK: Drop behaviors
    private var animator: UIDynamicAnimator!
    private var gravityBehavior = UIGravityBehavior()
    private var timer1 = Timer()
    private var timer2 = Timer()
    var player: UIView?
    
    // MARK: State
    var isAnimating = false
    
    // MARK: - Methods
    init(view: UIView) {
        // Get main view
        self.view = view
        let width = self.view.frame.width
        
        // Initialize Values for position of raindrops and space between them
        startX = 20
        startY = -60
        distanceBetweenEachDrop = width * 0.048
        distanceBetweenSameRow = distanceBetweenEachDrop * 2
        
        // Initialize animator
        animator = UIDynamicAnimator(referenceView: self.view)
        gravityBehavior.gravityDirection.dy = 2
        gravityBehavior.magnitude = 0.1
        animator.addBehavior(gravityBehavior)
      
    }
    
    func setPlayer(player: UIView) {
        self.player = player
    }
    
    /** Starts the rain animation */
    func start() {
        isAnimating = true
        // Timer that calls spawnFirst method every 0.2 second. Produces rain drops every .2 second in 1st and 2rd row
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkisCatched), userInfo: nil, repeats: true)
        // Timer that calls startSecond method after .1 seconds. Creates a slight delay for 2nd and 4th rows
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(spawnFirst), userInfo: nil, repeats: false)
    }
    
    // MARK: - Helper Methods
    
    /** Manages all drops in rain */
    private func addGravity(array: [UIView]) {
        // Adds gravity to every drop in array
       
        for drop in array {
            gravityBehavior.addItem(drop)
        }
        // Checks if each drop is below the bottom of screen. Then removes its gravity, hides it, and removes from array
        for i in 0..<drops.count {
            if i < drops.count, drops[i].frame.origin.y > self.view.frame.height {
                gravityBehavior.removeItem(drops[i])
                drops[i].removeFromSuperview()
                drops.remove(at: i)
                stop()
            }
        }
    }
    
    @objc
     func checkisCatched() {
        guard let player = player else {return}
        // Adds gravity to every drop in array
        
        // Checks if each drop is below the bottom of screen. Then removes its gravity, hides it, and removes from array
        for i in 0..<drops.count {
            let isTouched = i < drops.count && drops[i].frame.origin.x >  player.frame.minX &&  drops[i].frame.origin.x < player.frame.maxX && drops[i].frame.maxY + player.frame.height >= player.frame.origin.y
            if i < drops.count {
                print("dropY \(drops[i].frame.maxY) playerY \(player.frame.origin.y)")
            }
          
            print("touched  \(isTouched)")
            if isTouched {
                gravityBehavior.removeItem(drops[i])
                drops[i].removeFromSuperview()
                drops.remove(at: i)
            }
        }
    }
    
    /** Spawns water drops */
    @objc private func spawnFirst() {
        //creates array of UIViews (drops)
        var thisArray: [UIView] = []
        //number of col of drops
        let numberOfDrops = 1

        //for each drop in a row
        for _ in 0 ..< numberOfDrops {
            // Create a UIView (a drop). Then set the size, color, and remove border of drop
            let newY = CGFloat(-200 + Int(arc4random_uniform(UInt32(150))))
            let newX = CGFloat(10 + Int(arc4random_uniform(UInt32(350))))
            let drop = UIView()
            drop.frame = CGRectMake(newX, newY, 20.0, 50.0)
            drop.backgroundColor = dropColor
            drop.layer.borderWidth = 0.0
            // Add the drop to main view
            self.view.addSubview(drop)
            // Add the drop to the drops array
            self.drops.append(drop)
            // Add the drop to thisArray
            thisArray.append(drop)
        }
        // Adds gravity to the drops that were just created
        addGravity(array: thisArray)
    }
    
    /** Stops the water animation */
    func stop() {
        isAnimating = false
        // Remove all objects from drops array
        drops.removeAll()
        // Stop all timers
        timer1.invalidate()
        timer2.invalidate()
    }
}


