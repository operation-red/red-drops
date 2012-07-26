// DOCUMENT DATE: 07-20-2012

/* 
 * Name: IS_DEVICE_PHONE
 * Purpose: Simplify checking if device is of type phone
 * Availability: iOS 3.2 and later
 * Why: Some differences in implementation force coding splits
 *      as shown in the example below, the decimal pad does
 *      not render on the iPad as of this writing.
 * 
 * Example: 
 *   if (IS_DEVICE_PHONE) {
 *       text1.keyboardType = UIKeyboardTypeDecimalPad;
 *   } else {
 *       text1.keyboardType = UIKeyboardTypeNumberPad;
 *   }
 */
#define IS_DEVICE_PHONE [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone

/* 
 * Name: SET_STATE_IMAGES
 * Purpose: Simplify setting state images for normal and highlighted(pressed)
 * Availability: iOS 2.0 and later
 * Why: Reduces two lines of code into one macro call.
 *      Intended for use in a for loop.
 *
 * Example: 
 *   UIView *views = [self.view viewWithTag:1000];
 *   for(UIView *view in views.subviews) {
 *     // skip any tags set to -1 denoting non image buttons
 *     if([view isKindOfClass:[UIButton class]] && view.tag > 0) {
 *       SET_STATE_IMAGES((UIButton *) view, view.tag);
 *     }
 *   } 
 */
#define SET_STATE_IMAGES(dButton, dFileName)\
  [dButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i.png", dFileName]] forState:UIControlStateNormal];\
  [dButton setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%i-hl.png", dFileName]] forState:UIControlStateHighlighted]