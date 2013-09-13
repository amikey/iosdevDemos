//
//  FilterDataList.m
//  CIFilterDemo
//
//  Created by 侯 坤明 on 13-9-12.
//  Copyright (c) 2013年 侯 坤明. All rights reserved.
//

#import "FilterDataList.h"

@implementation FilterDataList
- (id) init
{
    self.filterList = [NSDictionary dictionaryWithObjectsAndKeys:
                       @[
                        @"CIBoxBlur",
                        @"CIDiscBlur",
                        @"CIGaussianBlur",
                        @"CIMedianFilter",
                        @"CIMotionBlur",
                        @"CINoiseReduction",
                        @"CIZoomBlur"
                        ],
                                                          @"CICategoryBlur",
                       
                       @[
                        @"CIColorControls",
                        @"CIColorMatrix",
                        @"CIExposureAdjust",
                        @"CIGammaAdjust",
                        @"CIHueAdjust",
                        @"CITemperatureAndTint",
                        @"CIToneCurve",
                        @"CIVibrance",
                        @"CIWhitePointAdjust",
                        ],
                                                          @"CICategoryColorAdjustment",
                       
                       @[
                        @"CIColorCube",
                        @"CIColorInvert",
                        @"CIColorMap",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaskToAlpha",
                        @"CIMaximumComponent",
                        @"CIMinimumComponent",
                        @"CISepiaTone",
                        @"CIVignette",
                        ],
                                                          @"CICategoryColorEffect",
                       
                       @[
                        @"CIAdditionCompositing",
                        @"CIColorBlendMode",
                        @"CIColorBurnBlendMode",
                        @"CIColorDodgeBlendMode",
                        @"CIDarkenBlendMode",
                        @"CIDifferenceBlendMode",
                        @"CIExclusionBlendMode",
                        @"CIHardLightBlendMode",
                        @"CIHueBlendMode",
                        @"CILightenBlendMode",
                        @"CILuminosityBlendMode",
                        @"CIMaximumCompositing",
                        @"CIMinimumCompositing",
                        @"CIMultiplyBlendMode",
                        @"CIMultiplyCompositing",
                        @"CIOverlayBlendMode",
                        @"CISaturationBlendMode",
                        @"CIScreenBlendMode",
                        @"CISoftLightBlendMode",
                        @"CISourceAtopCompositing",
                        @"CISourceInCompositing",
                        @"CISourceOutCompositing",
                        @"CISourceOverCompositing",
                        ],
                                                          @"CICategoryCompositeOperation",
                       
                       @[
                        @"CIBumpDistortion",
                        @"CIBumpDistortionLinear",
                        @"CICircleSplashDistortion",
                        @"CICircularWrap",
                        @"CIDroste",
                        @"CIDisplacementDistortion",
                        @"CIGlassDistortion",
                        @"CIGlassLozenge",
                        @"CIHoleDistortion",
                        @"CILightTunnel",
                        @"CIPinchDistortion",
                        @"CIStretchCrop",
                        @"CITorusLensDistortion",
                        @"CITwirlDistortion",
                        @"CIVortexDistortion",
                        ],
                                                          @"CICategoryDistortionEffect",
                       
                       @[
                        @"CICheckerboardGenerator",
                        @"CIConstantColorGenerator",
                        @"CILenticularHaloGenerator",
                        @"CIRandomGenerator",
                        @"CIStarShineGenerator",
                        @"CIStripesGenerator",
                        @"CISunbeamsGenerator",
                        ],
                                                          @"CICategoryGenerator",
                       
                       @[
                        @"CIAffineTransform",
                        @"CICrop",
                        @"CILanczosScaleTransform",
                        @"CIPerspectiveTransform",
                        @"CIPerspectiveTransformWithExtent",
                        @"CIStraightenFilter",
                        ],
                                                          @"CICategoryGeometryAdjustment",
                       
                       @[
                        @"CIGaussianGradient",
                        @"CILinearGradient",
                        @"CIRadialGradient",
                        ],
                                                          @"CICategoryGradient",
                       
                       @[
                        @"CICircularScreen",
                        @"CICMYKHalftone",
                        @"CIDotScreen",
                        @"CIHatchedScreen",
                        @"CILineScreen",
                        ],
                                                          @"CICategoryHalftoneEffect",
                       
                       @[
                        @"CIAreaAverage",
                        @"CIAreaHistogram",
                        @"CIRowAverage",
                        @"CIColumnAverage",
                        @"CIAreaMaximum",
                        @"CIAreaMinimum",
                        @"CIAreaMaximumAlpha",
                        @"CIAreaMinimumAlpha",
                        ],
                                                          @"CICategoryReduction",
                       
                       @[
                        @"CISharpenLuminance",
                        @"CIUnsharpMask",
                        ],
                                                          @"CICategorySharpen",
                       
                       @[
                        @"CIBlendWithMask",
                        @"CIBloom",
                        @"CIComicEffect",
                        @"CICrystallize",
                        @"CIDepthOfField",
                        @"CIEdges",
                        @"CIEdgeWork",
                        @"CIGloom",
                        @"CIHeightFieldFromMask",
                        @"CIHexagonalPixellate",
                        @"CIHighlightShadowAdjust",
                        @"CILineOverlay",
                        @"CIPixellate",
                        @"CIPointillize",
                        @"CIShadedMaterial",
                        @"CISpotColor",
                        @"CISpotLight",
                        ],
                                                          @"CICategoryStylize",
                       
                       @[
                        @"CIAffineClamp",
                        @"CIAffineTile",
                        @"CIEightfoldReflectedTile",
                        @"CIFourfoldReflectedTile",
                        @"CIFourfoldRotatedTile",
                        @"CIFourfoldTranslatedTile",
                        @"CIGlideReflectedTile",
                        @"CIKaleidoscope",
                        @"CIOpTile",
                        @"CIParallelogramTile",
                        @"CIPerspectiveTile",
                        @"CISixfoldReflectedTile",
                        @"CISixfoldRotatedTile",
                        @"CITriangleKaleidoscope",
                        @"CITriangleTile",
                        @"CITwelvefoldReflectedTile",
                        ],
                                                          @"CICategoryTileEffect",
                       
                       @[
                        @"CIBarsSwipeTransition",
                        @"CICopyMachineTransition",
                        @"CIDisintegrateWithMaskTransition",
                        @"CIDissolveTransition",
                        @"CIFlashTransition",
                        @"CIModTransition",
                        @"CIPageCurlTransition",
                        @"CIRippleTransition",
                        @"CISwipeTransition",
                        ],
                                                          @"CICategoryTransition",

                        nil];
    return self;
}
@end
