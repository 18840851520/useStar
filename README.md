FinalStarRatingBar
==================
StarRating Bar,星星打分控件

How to use?
-----------

#### Create star rating bar.(5 Stars)
		FinalStarRatingBar *bar = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 40, 320, 40)];
    [self.view addSubView:bar];
#### Want more stars?
    FinalStarRatingBar *bar = [[FinalStarRatingBar alloc] initWithFrame:CGRectMake(0, 40, 320, 40) starCount:10];
    [self.view addSubview:bar];
#### Use in storyboard or nib
> 1.Drag a view to the nib.
>
> 2.Set its class to FinalRatingBar.
>
> 3.Use **tag** property to control the number of the stars.

#### Others
> Set Rating	
>
>`bar.rating = 3;`
>
>Disable Touch
>
>`bar.enabled = NO;`

Demo
----
![Demo](https://raw.githubusercontent.com/loveforgeter/DemoGifs/master/FinalStarRating.gif)
