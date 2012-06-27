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
 
#import "C4MRatingViewFiller.h"

@implementation C4MRatingViewFiller
@synthesize mNumImages;
@synthesize mSpaceBetweenImages;
@synthesize mAlignment;

- (id)initWithMaxRating:(NSInteger)_maxRating image:(UIImage*)_image imageHalf:(UIImage*)_imageHalf imageON:(UIImage*)_imageON
{
	self = [super init];
	
	if (self)
	{
		mMaxRating = _maxRating;
		
		mNumImages = 5;
		mSpaceBetweenImages = 1;
		
		mImage = [_image retain];
		mImageON = [_imageON retain];
		mImageHalf = [_imageHalf retain];
		
		mAlignment = C4MRatingViewAlignmentLeft;
	}
	
	return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)fillView:(UIView*)_containerView withRating:(NSInteger)_rating
{
	//NSInteger rate = ((double)_rating/(double)mMaxRating * mNumImages)+.5;
	double rate = ((double)_rating/(double)mMaxRating * mNumImages);
	//C4MLog(@"rate = %.2f, rating = %.0f", rate, (double)_rating);
	if ([[_containerView subviews] count] == mNumImages)
	{
		for (int i = 0; i < mNumImages; i++)
		{
			if (i <= (int)rate-1)
			{
				((UIImageView*)[[_containerView subviews] objectAtIndex:i]).image = mImageON;
			}
			else if (i == (int)rate && (rate - (int)rate <= .3))
			{
				((UIImageView*)[[_containerView subviews] objectAtIndex:i]).image = mImage;
			}
			else if (i == (int)rate && (rate - (int)rate < 1.) && (rate - (int)rate >= .7) )
			{
				((UIImageView*)[[_containerView subviews] objectAtIndex:i]).image = mImageON;
			}
			else if (i == (int)rate && rate - (int)rate < 1.)
			{
				((UIImageView*)[[_containerView subviews] objectAtIndex:i]).image = mImageHalf;
			}
			else
			{
				((UIImageView*)[[_containerView subviews] objectAtIndex:i]).image = mImage;
			}
		}
	}
	else
	{
		int multiplicator;
		int first;
		int last;
		CGFloat imageWidth = mImage.size.width + mSpaceBetweenImages;
		
		for (UIView* view in [_containerView subviews])
		{
			[view removeFromSuperview];
		}
		
		CGRect frame;
		if (mAlignment == C4MRatingViewAlignmentLeft)
		{
			frame = CGRectMake(0, 0, mImage.size.width, mImage.size.height);
			multiplicator = 1;
			first = 0;
			last = mNumImages;
		}
		else if (mAlignment == C4MRatingViewAlignmentRight)
		{
			frame = CGRectMake(_containerView.frame.size.width- imageWidth, 0, mImage.size.width, mImage.size.height);
			multiplicator = -1;
			first = mNumImages-1;
			last = 1;
		}
		else
		{
			NSLog(@"%s *** Incorrect alignment set for C4MRatingViewFiller", __PRETTY_FUNCTION__);
			return;
		}
		
		for (int i = first; i*multiplicator < last; i+=multiplicator)
		{
			UIImageView* imageView = nil;
			if (i <= (int)rate-1)
			{
				imageView = [[UIImageView alloc] initWithImage:mImageON];
			}
			else if (i == (int)rate && (rate - (int)rate <= .3))
			{
				imageView = [[UIImageView alloc] initWithImage:mImage];
			}
			else if (i == (int)rate && (rate - (int)rate < 1.) && (rate - (int)rate >= .7) )
			{
				imageView = [[UIImageView alloc] initWithImage:mImageON];
			}
			else if (i == (int)rate && rate - (int)rate < 1.)
			{
				imageView = [[UIImageView alloc] initWithImage:mImageHalf];
			}
			else
			{
				imageView = [[UIImageView alloc] initWithImage:mImage];
			}
			
			imageView.frame = frame;
			frame.origin.x += imageWidth * multiplicator;
			
			[_containerView addSubview:imageView];
			[imageView release];
		}
	}
}

- (void)dealloc
{
	[mImage release]; 
	[mImageON release];
	
	[super dealloc];
}


@end
