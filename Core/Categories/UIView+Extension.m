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

- (UIViewController *)viewDelegate {
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

- (void)fadeOut:(NSTimeInterval)time {
		CGFloat alpha = self.alpha;
		[UIView animateWithDuration:time animations:^{
				[self setAlpha:0.0];
		}                completion:^(BOOL finished) {
				[self setHidden:YES];
				[self setAlpha:alpha];
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

- (float)height {
		return self.bounds.size.height;
}

- (float)top {
		return self.frame.origin.y;
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

- (float)width {
		return self.frame.size.width;
}

+ (BOOL)iphone {
		return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;
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
		hud.labelText = string;
		[hud hide:YES afterDelay:4];
}

- (void)onShowMessageTap:(UITapGestureRecognizer *)tapped {
		[((MBProgressHUD *) tapped.view) hide:YES];
}

- (Response *)showRequest:(Response *)request {
		MBProgressHUD *hud = [self showProgress];
		Response *response = [Response wrap:request];
		request.onFailed = ^(NSString *message) {
				if (message)[self showMessage:message];
				runWith(response.onFailed, message);
		};
		request.onDone = ^{
				[hud hide:YES];
				run(response.onDone);
		};
		return response;
}

- (Response *)showFailed:(Response *)request {
		Response *response = [Response wrap:request];
		request.onFailed = ^(NSString *message) {
				if (message)[self showMessage:message];
				runWith(response.onFailed, message);
		};
		return response;
}


- (Response *)showProgress:(Response *)request {
		[self showProgress];
		Response *response = [Response wrap:request];
		request.onDone = ^{
				[self hideProgress];
				run(response.onDone);
		};
		return response;
}

@end