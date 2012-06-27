/*******************************************************************************
 * This file is part of the C4MiOS_RatingViewFiller project.
 * 
 * Copyright (c) 2012 C4M PROD.
 * 
 * C4MiOS_RatingViewFiller is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * C4MiOS_RatingViewFiller is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with C4MiOS_RatingViewFiller. If not, see <http://www.gnu.org/licenses/lgpl.html>.
 * 
 * Contributors:
 * C4M PROD - initial API and implementation
 ******************************************************************************/

#import <UIKit/UIKit.h>

typedef enum
{
	C4MRatingViewAlignmentLeft,
	C4MRatingViewAlignmentRight,
} C4MRatingViewAlignment;

@interface C4MRatingViewFiller : NSObject
{
	NSInteger				mRating;
	NSInteger				mMaxRating;
	NSInteger				mNumImages;
	
	NSInteger				mSpaceBetweenImages;
	
	UIImage*				mImage;
	UIImage*				mImageON;
	UIImage*				mImageHalf;
	
	RatingViewAlignment		mAlignment;
}

// Space between each image - Default is 1
@property (nonatomic, setter=setSpaceBetweenImages:) NSInteger mSpaceBetweenImages;
// Number of images to add to a view - Default is 5
@property (nonatomic, setter=setNumOfImages:) NSInteger mNumImages;
// Alignment of the images in the view - Default is C4MRatingViewAlignmentLeft
@property (nonatomic, setter=setAlignment:) C4MRatingViewAlignment mAlignment;

- (id)initWithMaxRating:(NSInteger)_maxRating image:(UIImage*)_image imageHalf:(UIImage*)_imageHalf imageON:(UIImage*)_imageON;

// Add UIImageViews to _containerView (depending on the _rating)
- (void)fillView:(UIView*)_containerView withRating:(NSInteger)_rating;

@end
