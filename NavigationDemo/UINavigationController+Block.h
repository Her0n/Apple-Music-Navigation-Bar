//
//  UINavigationController+Block.h
//  iOS Blocks
//
//  Created by Ignacio Romero Zurbuchen on 3/33/13.
//  Copyright (c) 2011 DZN Labs.
//  Licence: MIT-Licence
//

#import <UIKit/UIKit.h>
#import "iOSBlocksProtocol.h"

/*
 * UINavigationController Delegate block methods.
 */
@interface UINavigationController (Block) <UINavigationControllerDelegate, iOSBlocksProtocol>

/*
 * Pushes a view controller onto the receiver’s stack and updates the display.
 *
 * @param viewController The view controller that is pushed onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 * @param animated Specify YES to animate the transition or NO if you do not want the transition to be animated.
 * @param completion A block object to be executed just after the navigation controller displayed the view controller’s view and navigation item properties.
 */
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
              onCompletion:(VoidBlock)completion;

/*
 * Pops view controllers until the specified view controller is at the top of the navigation stack.
 *
 * @param viewController The view controller that is popped onto the stack. This object cannot be an instance of tab bar controller and it must not already be on the navigation stack.
 * @param animated Specify YES to animate the transition or NO if you do not want the transition to be animated.
 * @param completion A block object to be executed just after the navigation controller displayed the view controller’s view and navigation item properties.
 */
- (void)popToViewController:(UIViewController *)viewController
                   animated:(BOOL)animated
               onCompletion:(VoidBlock)completion;

/*
 * Pops the top view controller from the navigation stack and updates the display.
 *
 * @param animated Specify YES to animate the transition or NO if you do not want the transition to be animated.
 * @param completion A block object to be executed just after the navigation controller displayed the view controller’s view and navigation item properties.
 */
- (void)popViewControllerAnimated:(BOOL)animated
                     onCompletion:(VoidBlock)completion;

/*
 * Pops all the view controllers on the stack except the root view controller and updates the display.
 *
 * @param animated Specify YES to animate the transition or NO if you do not want the transition to be animated.
 * @param completion A block object to be executed just after the navigation controller displayed the view controller’s view and navigation item properties.
 */
- (void)popToRootViewControllerAnimated:(BOOL)animated
                           onCompletion:(VoidBlock)completion;

@end
