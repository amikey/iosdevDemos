//
//  BlueToothRootViewController.m
//  BlueTooth
//
//  Created by 侯 坤明 on 13-12-13.
//  Copyright (c) 2013年 SAGO. All rights reserved.
//

#import "BlueToothRootViewController.h"

@interface BlueToothRootViewController ()<GKSessionDelegate, GKPeerPickerControllerDelegate>{
    GKSession *_session;
    GKPeerPickerController *_peerPicker;
}

@end

@implementation BlueToothRootViewController

//发起链接
- (void)connect
{
    _peerPicker = [[GKPeerPickerController alloc] init];
    _peerPicker.delegate = self;
    _peerPicker.connectionTypesMask = GKPeerPickerConnectionTypeNearby;
    [_peerPicker show];
}

//连接上 子类重写
- (void)connected
{
    
}

//发送数据
- (void)sendDataToAllPeer: (NSData *)data
{
    if(_session){
        [_session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
    }
}



#pragma mark peerPicker delegate
- (GKSession *)peerPickerController:(GKPeerPickerController *)picker sessionForConnectionType:(GKPeerPickerConnectionType)type
{
    GKSession *theSession = [[GKSession alloc] initWithSessionID:@"session id" displayName:nil sessionMode:GKSessionModePeer];
    return theSession;
}

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    _session = session;
    _session.delegate = self;
    [_session setDataReceiveHandler:self withContext:nil];

    picker.delegate = nil;
    [picker dismiss];
    
    [self connected];
}


#pragma mark session delegate
- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
    if(state == GKPeerStateDisconnected){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"disconnect" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
        session.available = NO;
        [session disconnectFromAllPeers];
        session.delegate = nil;
        [session setDataReceiveHandler:nil withContext:nil];
        _session = nil;
    }
}

//收到消息，子类重写
- (void) receiveData:(NSData *)data
            fromPeer:(NSString *)peer
           inSession:(GKSession *)session
             context:(void *)context
{
    
}
@end
