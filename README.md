C4MiOS_RatingViewFiller
=======================

This component adds UIImageViews to a view.  
It is very useful when needing to fill many views with rating stars (for example), as it automatize the process.

Usage:
------

You only have to add the two files to your project, create an instance of the class and init it with :

	- (id)initWithMaxRating:(NSInteger)_maxRating image:(UIImage*)_image imageHalf:(UIImage*)_imageHalf imageON:(UIImage*)_imageON;


And then use the method :

	- (void)fillView:(UIView*)_containerView withRating:(NSInteger)_rating;

Change Logs
-----------

### v1.0

First release.