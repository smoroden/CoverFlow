//
//  CoverFlow.m
//  CoverFlow
//
//  Created by Zach Smoroden on 2016-05-19.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "CoverFlowLayout.h"

@implementation CoverFlowLayout


-(void)prepareLayout {
    self.itemSize = (CGSize){200,200};
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
