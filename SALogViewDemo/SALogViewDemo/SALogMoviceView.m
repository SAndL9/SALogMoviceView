//
//  SALogMoviceView.m
//  SALogViewDemo
//
//  Created by 李磊 on 24/7/17.
//  Copyright © 2017年 李磊. All rights reserved.
//

#import "SALogMoviceView.h"
#import <MediaPlayer/MediaPlayer.h>


@interface SALogMoviceView()

@property (nonatomic, strong) MPMoviePlayerController *player;

@end

@implementation SALogMoviceView

- (void)setMovieURL:(NSURL *)movieURL{
    _movieURL = movieURL;
    [self setupVideoPlayer];
}

- (void)setupVideoPlayer
{
    
    self.player = [[MPMoviePlayerController alloc] initWithContentURL:self.movieURL];
    [self addSubview:self.player.view];
    //加载一定数据后,直接播放
    self.player.shouldAutoplay = YES;
    //控制面板风格
    [self.player setControlStyle:MPMovieControlStyleNone];
    //重复播放模式
    self.player.repeatMode = MPMovieRepeatModeOne;
    //缩放填充模式->固定缩放比例并且尽量全部展示视频，不会裁切视频
    self.player.scalingMode = MPMovieScalingModeAspectFit;
    
    [self.player.view setFrame:self.frame];
    self.player.view.alpha = 0;
    [UIView animateWithDuration:2.0 animations:^{
        self.player.view.alpha = 1;
        [self.player prepareToPlay];
    }];
    //监听播放完成状态,
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

#pragma mark - NSNotificationCenter
- (void)playbackStateChanged
{
    //停止,暂停-重新播放.
    MPMoviePlaybackState playbackState = [self.player playbackState];
    if (playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused) {
        [self.player play];
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
