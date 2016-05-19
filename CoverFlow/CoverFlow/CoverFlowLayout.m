//
//  CoverFlow.m
//  CoverFlow
//
//  Created by Zach Smoroden on 2016-05-19.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "CoverFlowLayout.h"

@interface CoverFlowLayout ()

@property (nonatomic) NSArray *savedAttributes;
@end

@implementation CoverFlowLayout

-(void)awakeFromNib {
    
    self.itemSize = (CGSize){200,200};
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

-(void)prepareLayout {
    [super prepareLayout];
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *result = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    NSLog(@"---------------");
    // Modify the layout attributes as needed here
    for (UICollectionViewLayoutAttributes *attr in result) {
        CGFloat distanceFromCentre = fabs(attr.center.x - self.collectionView.contentOffset.x - self.collectionView.bounds.size.width / 2);
        
        // We want a scale percentage to use
        CGFloat scale = 1 - ((distanceFromCentre * 0.5f) / (self.collectionView.frame.size.width / 3));

        attr.alpha = 1 * scale;
        
        NSLog(@"scale: %f", scale);
        attr.transform = CGAffineTransformMakeScale(scale, scale);

        attr.transform3D = CATransform3DMakeRotation(distanceFromCentre / 5 * M_PI/180, 0.0, 1.0, 0.0);
        
    }
    
    return result;
}


-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
