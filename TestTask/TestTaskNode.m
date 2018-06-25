//
// Created by Radaev Mikhail on 23.06.2018.
// Copyright (c) 2018 msfrms. All rights reserved.
//

#import "TestTaskNode.h"

@interface TestTaskNode ()

@property (nonatomic, strong) ASDisplayNode * avatarNode;
@property (nonatomic, strong) ASTextNode * titleTextNode;
@property (nonatomic, strong) ASTextNode * detailTextNode;
@property (nonatomic, strong) ASTextNode * dateTextNode;
@property (nonatomic, strong) ASDisplayNode * actionsNode;
@property (nonatomic, strong) ASDisplayNode * favoriteNode;

@end

@implementation TestTaskNode

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        self.backgroundColor = UIColor.orangeColor;
        self.avatarNode = ASDisplayNode.new;
        self.avatarNode.backgroundColor = UIColor.grayColor;
        self.avatarNode.style.preferredSize = CGSizeMake(30, 30);
        self.avatarNode.cornerRadius = 15.f;

        self.titleTextNode = ASTextNode.new;
        self.titleTextNode.attributedText = [NSAttributedString.alloc initWithString:@"Darth Vader"];
        self.titleTextNode.style.flexShrink = 1.0f;

        self.detailTextNode = ASTextNode.new;
        self.detailTextNode.attributedText = [NSAttributedString.alloc initWithString:@"Lord of Sith"];
        self.detailTextNode.style.flexShrink = 1.0f;

        self.dateTextNode = ASTextNode.new;
        self.dateTextNode.attributedText = [NSAttributedString.alloc initWithString:@"23.05.2018"];

        self.actionsNode = ASDisplayNode.new;
        self.actionsNode.backgroundColor = UIColor.blueColor;
        self.actionsNode.style.preferredSize = CGSizeMake(15, 15);

        self.favoriteNode = ASDisplayNode.new;
        self.favoriteNode.backgroundColor = UIColor.greenColor;
        self.favoriteNode.style.preferredSize = CGSizeMake(15, 15);

        self.automaticallyManagesSubnodes = YES;
    }

    return self;
}


- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
	ASStackLayoutSpec *verticalLeftSideStackSpec = [[ASStackLayoutSpec alloc] init];
    verticalLeftSideStackSpec.direction = ASStackLayoutDirectionVertical;
    verticalLeftSideStackSpec.spacing = 10.0;
    verticalLeftSideStackSpec.children = @[_titleTextNode, _detailTextNode];
    
    ASStackLayoutSpec *horizontalLeftSideStackSpec = [[ASStackLayoutSpec alloc] init];
    horizontalLeftSideStackSpec.direction = ASStackLayoutDirectionHorizontal;
    horizontalLeftSideStackSpec.spacing = 10.0;
    horizontalLeftSideStackSpec.children = @[_avatarNode, verticalLeftSideStackSpec];
    
    ASStackLayoutSpec *horizontalRightSideStackSpec = [[ASStackLayoutSpec alloc] init];
    horizontalRightSideStackSpec.direction = ASStackLayoutDirectionHorizontal;
    horizontalRightSideStackSpec.spacing = 10.0;
    horizontalRightSideStackSpec.children = @[_actionsNode, _favoriteNode];
    
    ASRelativeLayoutSpec *relativeRightSideStackSpec = [ASRelativeLayoutSpec
                                                   relativePositionLayoutSpecWithHorizontalPosition:ASRelativeLayoutSpecPositionEnd
                                                   verticalPosition:ASRelativeLayoutSpecPositionEnd
                                                   sizingOption:ASRelativeLayoutSpecSizingOptionDefault
                                                   child:horizontalRightSideStackSpec];
    
    ASStackLayoutSpec *verticalRightSideStackSpec = [[ASStackLayoutSpec alloc] init];
    verticalRightSideStackSpec.direction = ASStackLayoutDirectionVertical;
    verticalRightSideStackSpec.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
    verticalRightSideStackSpec.children = @[_dateTextNode, relativeRightSideStackSpec];
    
    ASStackLayoutSpec *horizontalStackSpec = [[ASStackLayoutSpec alloc] init];
    horizontalStackSpec.direction = ASStackLayoutDirectionHorizontal;
    horizontalStackSpec.justifyContent = ASStackLayoutJustifyContentSpaceBetween;
    horizontalStackSpec.children = @[horizontalLeftSideStackSpec, verticalRightSideStackSpec];
    
    ASInsetLayoutSpec *insetSpec = [ASInsetLayoutSpec
                                             insetLayoutSpecWithInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0) child:horizontalStackSpec];
    
    return insetSpec;
}

@end
