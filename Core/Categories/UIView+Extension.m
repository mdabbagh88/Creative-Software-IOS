//
//  Created by Rene Dohan on 4/29/12.
//


#import "Response.h"
#import "MBProgressHUD.h"

@implementation UIView (Extension)

+ (UIView *)findFirstResponder:(UIView *)view {
		for (UIView *childView in view.subviews) {
				if ([childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder]) return childView;
				UIView *result = [self findFirstResponder:childView];
				if (result) return result;
		}
		return nil;
}

- (UIView *)firstResponder {
		return [UIView findFirstResponder:self];
}

+ (id)create:(NSObject *)owner :(NSString *)IBName {
		return [[[NSBundle mainBundle] loadNibNamed:IBName owner:owner options:nil] objectAtIndex:0];
}

+ (id)create:(NSString *)IBName {
		return [self create:nil :IBName];
}

+ (id)create {
		NSString *className = NSStringFromClass([self class]);
		NSString *viewName = [className stringByReplacingOccurrencesOfString:@"View" withString:@""];
		return [self create:viewName];
}

- (void)fadeIn {
		if (self.hidden) [self fadeIn:0.5];
}

- (void)fadeOut {
		if (!self.hidden) [self fadeOut:0.5];
}

+ (void)animationFromCurrentState:(NSTimeInterval)time :(UIViewAnimationCurve)curve {
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationDuration:time];
		[UIView setAnimationCurve:curve];
		[UIView setAnimationBeginsFromCurrentState:YES];
}

- (void)fadeToggle {
		if (self.hidden) [self fadeIn];
		else [self fadeOut];
}

- (BOOL)visible {
		return !self.hidden;
}

- (void)setVisible:(BOOL)visible {
		self.hidden = !visible;
}

- (UIViewController *)controller {
		return (UIViewController *) [self traverseResponderChainForUIViewController];
}

- (id)traverseResponderChainForUIViewController {
		id nextResponder = [self nextResponder];
		if ([nextResponder isKindOfClass:[UIViewController class]]) {
				return nextResponder;
		} else if ([nextResponder isKindOfClass:[UIView class]]) {
				return [nextResponder traverseResponderChainForUIViewController];
		} else {
				return nil;
		}
}

- (void)fadeIn:(NSTimeInterval)time {
		[self setHidden:NO];
		[self setAlpha:0.0];
		[UIView animateWithDuration:time animations:^{
				[self setAlpha:1.0];
		}];
}

- (id)getView:(int)tag {
		return [self viewWithTag:tag];
}

- (void)fadeOut:(NSTimeInterval)time {
		[self fadeOut:time :nil];
}


- (void)fadeOut:(NSTimeInterval)time :(void (^)())method {
		CGFloat alpha = self.alpha;
		[UIView animateWithDuration:time animations:^{
				[self setAlpha:0.0];
		}                completion:^(BOOL finished) {
				[self setHidden:YES];
				[self setAlpha:alpha];
				run(method);
		}];
}

- (void)setHeight:(float)height {
		CGRect frame = self.frame;
		frame.size.height = height;
		self.frame = frame;
}

- (void)setBottom:(float)bottom {
		self.height = bottom - self.top;
}

- (void)setWidth:(float)width {
		CGRect frame = self.frame;
		frame.size.width = width;
		self.frame = frame;
}

- (void)setTop:(float)value {
		CGRect frame = self.frame;
		frame.origin.y = value;
		self.frame = frame;
}

- (void)setLeft:(float)value {
		CGRect frame = self.frame;
		frame.origin.x = value;
		self.frame = frame;
}

- (void)setRight:(float)value {
		CGRect frame = self.frame;
		frame.origin.x = value - self.width;
		self.frame = frame;
}

- (float)height {
		return self.bounds.size.height;
}

- (float)top {
		return self.frame.origin.y;
}

- (float)abstop {
		return [self convertPoint:CGPointMake(0, self.top) toView:nil].y;
}

- (void)setAbstop:(float)value {
		self.top = [self convertPoint:CGPointMake(0, value) fromView:nil].y;
}

- (float)left {
		return self.frame.origin.x;
}

- (float)right {
		return self.left + self.width;
}

- (float)bottom {
		return self.top + self.height;
}

- (float)absbottom {
		return [self convertPoint:CGPointMake(0, self.bottom) toView:nil].y;
}

- (float)width {
		return self.frame.size.width;
}


- (void)clearSubViews {
		for (UIView *view in self.subviews) [view removeFromSuperview];
}

- (UIView *)addSubviewUnder:(UIView *)view {
		if (self.subviews.lastObject) view.top = ((UIView *) self.subviews.lastObject).bottom;
		[self addSubview:view];
		return self;
}

- (UIView *)addSubviewRight:(UIView *)view {
		if (self.subviews.lastObject) view.left = ((UIView *) self.subviews.lastObject).right;
		[self addSubview:view];
		return self;
}

- (MBProgressHUD *)showProgress {
		MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
		hud.margin = 17;
		return hud;
}

- (void)hideProgress {
		[MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showMessage :(NSString *)string {
		MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
				initWithTarget:self action:@selector(onShowMessageTap:)];
		[hud addGestureRecognizer:tap];
		hud.mode = MBProgressHUDModeText;
		hud.detailsLabelText = string;
		[hud hide:YES afterDelay:4];
}

- (void)onShowMessageTap:(UITapGestureRecognizer *)tapped {
		[((MBProgressHUD *) tapped.view) hide:YES];
}

- (Response *)showResponse:(Response *)request {
		MBProgressHUD *hud = [self showProgress];
		request.onFailed = ^(NSString *message) {
				if (message)[self showMessage:message];
		};
		request.onDone = ^{
				[hud hide:YES];
		};
		return request;
}

- (Response *)showFailed:(Response *)response {
		response.onFailed = ^(NSString *message) {
				if (message)[self showMessage:message];
				runWith(response.onFailed, message);
		};
		return response;
}


- (Response *)showProgress:(Response *)response {
		[self showProgress];
		response.onDone = ^{
				[self hideProgress];
				run(response.onDone);
		};
		return response;
}

@end