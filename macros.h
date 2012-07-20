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