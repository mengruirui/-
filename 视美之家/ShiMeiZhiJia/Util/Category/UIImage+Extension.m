//
//  UIImage+Extension.m
//  Demo04_裁切
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
//根据传入的图片及边框参数,生成圆形的带边框的图片
+(instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
{
    //加载旧的图片
    UIImage *oldImage = [UIImage imageNamed:name];
    
    //新的画布的尺寸
    CGFloat imageWidth = oldImage.size.width + 2 * border;
    CGFloat imageHeight = oldImage.size.height + 2 * border;
    //设置与大圆相切的正方形的宽
    CGFloat circleW = MIN(imageWidth, imageHeight);
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    
    //画大的实心圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    
    //设置颜色
    [color setFill];
    
    //绘制
    [path fill];
    
    CGRect smallCircle = CGRectMake(border, border, circleW - 2 * border, circleW - 2 * border);
    
    //绘制小圆的路径
    UIBezierPath *smallPath = [UIBezierPath bezierPathWithOvalInRect:smallCircle];
    
    [smallPath addClip];
    
    //画原有的旧图
    
    [oldImage drawInRect:smallCircle];
    
    //获取新的图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭图片上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}
//将传入的视图内容生成一张图片
+(instancetype)imageWithCaptureView:(UIView *)view
{
    //截屏 --- 生成一张新的图片
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    
    //渲染控制器的view到上下文中
    //图层只能用渲染不能用draw
    //因为此时是在图片上下文区域内
    //所以获取到的当前上下文就是图片上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:context];
    
    //保存画板上的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
@end
