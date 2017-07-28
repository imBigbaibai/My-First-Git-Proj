//
//  HHP4DownList.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/26.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4DownList.h"

@implementation HHP4DownList

-(id)initWithFrame:(CGRect)frame
{
    if (frame.size.height<130) {
        frameHeight = 130;
    }else{
        frameHeight = frame.size.height;
    }
    tabheight = frameHeight-20;
    
    frame.size.height = 30.0f;
    
    self=[super initWithFrame:frame];
    
    if(self){
        showList = NO; //默认不显示下拉框
        
        _tv = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, frame.size.width, 0)];
        _tv.delegate = self;
        _tv.dataSource = self;
        _tv.backgroundColor = KGrayColor;
        _tv.separatorColor = [UIColor whiteColor];
        _tv.hidden = YES;
        [self addSubview:_tv];
        
        self.clickedBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        showList = NO;
        _tv.alpha = 1.0;
        _clickedBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        _clickedBtn.titleLabel.font = [UIFont fontWithName:KFont size:16.0f];
        [_clickedBtn setTitle:@"请选择" forState:UIControlStateNormal];
        [_clickedBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_clickedBtn addTarget:self action:@selector(dropdown) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_clickedBtn];
        
    }
    return self;
}

-(void)dropdown{
    
    if (showList == YES) {//如果下拉框已显示，什么都不做
        
        showList = NO;
        [UIView animateWithDuration:0.3 animations:^{
            _tv.alpha = 0.0;
        } completion:^(BOOL finished){
            _tv.hidden = YES;
        }];
        
    }else {//如果下拉框尚未显示，则进行显示
        
        CGRect sf = self.frame;
        sf.size.height = frameHeight;
        
        //把dropdownList放到前面，防止下拉框被别的控件遮住
        [self.superview bringSubviewToFront:self];
        _tv.hidden = NO;
        _tv.alpha = 1.0;

        showList = YES;//显示下拉框
        
        CGRect frame = _tv.frame;
        frame.size.height = 0;
        _tv.frame = frame;
        frame.size.height = tabheight;
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.frame = sf;
        _tv.frame = frame;
        [UIView commitAnimations];
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [_tableArray objectAtIndex:[indexPath row]];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    cell.textLabel.font = [UIFont systemFontOfSize:16.0f];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = KGrayColor;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_clickedBtn setTitle:[_tableArray objectAtIndex:[indexPath row]] forState:UIControlStateNormal];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row] forKey:@"select"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"saveFaultId" object:nil];
    showList = NO;
    _tv.hidden = YES;
    
    CGRect sf = self.frame;
    sf.size.height = 30;
    self.frame = sf;
    CGRect frame = _tv.frame;
    frame.size.height = 0;
    _tv.frame = frame;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
