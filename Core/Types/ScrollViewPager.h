//
//  Created by Rene Dohan on 1/11/13.
//


#import <Foundation/Foundation.h>


@interface ScrollViewPager : NSObject <UIScrollViewDelegate> {

}

- (ScrollViewPager *)with:(UIPageControl *)control :(UIScrollView *)scrollView;

- (ScrollViewPager *)withScrollViewDelegate:(UIPageControl *)control :(UIScrollView *)scrollView;

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView;

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;

- (void)showPage:(NSInteger)index;
@end