//
//  HeaderViewCell.m
//  Gase
//
//  Created by Prashant Aggarwal on 4/14/16.
//  Copyright © 2016 Prashant Aggarwal. All rights reserved.
//

#import "HeaderViewCell.h"


@implementation HeaderViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setCellData : (NSString *)sUrl
{
    if([sUrl isEqualToString:@""] || sUrl == nil)
    {
        [self.activityIndicator setHidden:YES];
        [self.activityIndicator stopAnimating];
    }
    else
    {
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];
    [NSThread detachNewThreadSelector:@selector(downloadImageFromUrl:) toTarget:self withObject:sUrl];
    }
}

- (void)downloadImageFromUrl:(NSString *)sUrl
{
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:sUrl]];
    
    if(data)
    {
        UIImage *image = [UIImage imageWithData:data];
        //        [[ImageCache sharedImageCache] storeImage:image forUrl:self.imageURL];
        //[[ImageCache sharedImageCache] AddImage:sUrl :image];
        [self performSelectorOnMainThread:@selector(imageDownloadingPerformed:) withObject:image waitUntilDone:YES];
    }
}
- (void)imageDownloadingPerformed:(UIImage *)image
{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator setHidden:YES];
    [self.m_profileImage setImage:image];
}
@end
