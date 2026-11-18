/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import { ColorSpaceInfo, STANDARD_COLOR_SPACES } from '../common/ColorSpaceData';
import {
    RgbUnit,
    ConversionResult,
    primariesOf,
    convertRgb,
    fromByte,
    rgbText,
    rgbSignedText,
    xyzText,
    labText,
    byteToHex
} from '../common/ColorSpaceMath';

const TAG = '[ColorConversion]';
const BTN_H = 40;
const SOURCE_INDEX_DEFAULT = 0;
const DESTINATION_INDEX_DEFAULT = 1;

interface ColorOption {
    label: string;
    r: number;
    g: number;
    b: number;
}

const COLOR_OPTIONS: ColorOption[] = [
    { label: 'Red', r: 255, g: 0, b: 0 },
    { label: 'Green', r: 0, g: 255, b: 0 },
    { label: 'Blue', r: 0, g: 0, b: 255 },
    { label: 'White', r: 255, g: 255, b: 255 },
    { label: 'Gray', r: 128, g: 128, b: 128 },
    { label: 'Orange', r: 255, g: 128, b: 0 }
];

@Entry
@Component
struct ColorConversion {
    @State srcIndex: number = SOURCE_INDEX_DEFAULT;
    @State dstIndex: number = DESTINATION_INDEX_DEFAULT;
    @State colorIndex: number = 0;
    @State r: number = 255;
    @State g: number = 0;
    @State b: number = 0;
    @State sourceText: string = '';
    @State destinationText: string = '';
    @State inputInfo: string = '';
    @State xyzInfo: string = '';
    @State labInfo: string = '';
    @State encodedInfo: string = '';
    @State clippedInfo: string = '';
    @State statusInfo: string = '';

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
        this.convert();
    }

    goBack(): void {
        router.back();
    }

    sourceInfo(): ColorSpaceInfo {
        return STANDARD_COLOR_SPACES[this.srcIndex];
    }

    destinationInfo(): ColorSpaceInfo {
        return STANDARD_COLOR_SPACES[this.dstIndex];
    }

    currentColor(): RgbUnit {
        let color: RgbUnit = { r: fromByte(this.r), g: fromByte(this.g), b: fromByte(this.b) };
        return color;
    }

    // Convert the current bytes from the source space into the destination space and refresh every block.
    convert(): void {
        let source: ColorSpaceInfo = this.sourceInfo();
        let destination: ColorSpaceInfo = this.destinationInfo();
        let color: RgbUnit = this.currentColor();
        let result: ConversionResult = convertRgb(primariesOf(source), source.gamma,
            primariesOf(destination), destination.gamma, color);
        this.sourceText = `Source:${source.label}`;
        this.destinationText = `Destination:${destination.label}`;
        this.inputInfo = `Input:${byteToHex(color)}`;
        this.xyzInfo = `XYZ:${xyzText(result.xyz)}`;
        this.labInfo = `Lab:${labText(result.lab)}`;
        this.encodedInfo = `Encoded:${rgbSignedText(result.encoded)}`;
        this.clippedInfo = `Clipped:${rgbText(result.clipped)}`;
        this.statusInfo = `Status:${result.outOfGamut ? 'OutOfGamut' : 'InGamut'}`;
        Logger.info(TAG, `${this.inputInfo} ${this.statusInfo} ${this.encodedInfo}`);
    }

    selectSource(index: number): void {
        if (index < 0 || index >= STANDARD_COLOR_SPACES.length) {
            Logger.error(TAG, `Ignored source index ${index}`);
            return;
        }
        this.srcIndex = index;
        this.convert();
    }

    selectDestination(index: number): void {
        if (index < 0 || index >= STANDARD_COLOR_SPACES.length) {
            Logger.error(TAG, `Ignored destination index ${index}`);
            return;
        }
        this.dstIndex = index;
        this.convert();
    }

    selectColor(index: number): void {
        if (index < 0 || index >= COLOR_OPTIONS.length) {
            Logger.error(TAG, `Ignored color index ${index}`);
            return;
        }
        let option: ColorOption = COLOR_OPTIONS[index];
        this.colorIndex = index;
        this.r = option.r;
        this.g = option.g;
        this.b = option.b;
        this.convert();
        Logger.info(TAG, `Selected color ${option.label}`);
    }

    swapSpaces(): void {
        let previousSource: number = this.srcIndex;
        this.srcIndex = this.dstIndex;
        this.dstIndex = previousSource;
        this.convert();
        Logger.info(TAG, 'Swapped source and destination spaces');
    }

    resetAll(): void {
        this.srcIndex = SOURCE_INDEX_DEFAULT;
        this.dstIndex = DESTINATION_INDEX_DEFAULT;
        this.colorIndex = 0;
        this.r = 255;
        this.g = 0;
        this.b = 0;
        this.convert();
        Logger.info(TAG, 'Reset to sRGB red into Display P3');
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('ConvBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => {
                            this.goBack();
                        })
                    Text('Color Space Conversion')
                        .id('ConvPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
                .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

                Text(this.sourceText)
                    .id('ConvSrcText')
                    .fontSize(12)
                    .fontColor('#666666')

                Text('Source space')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 4 })

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(STANDARD_COLOR_SPACES, (info: ColorSpaceInfo, index: number) => {
                        Button(info.label)
                            .id(`ConvSrc_${info.label}`)
                            .fontSize(10)
                            .height(28)
                            .margin(2)
                            .backgroundColor(this.srcIndex === index ? '#4285F4' : '#E8E8E8')
                            .fontColor(this.srcIndex === index ? '#FFFFFF' : '#333333')
                            .onClick(() => {
                                this.selectSource(index);
                            })
                    }, (info: ColorSpaceInfo, index: number) => info.label)
                }
                .id('ConvSrcList')
                .width('95%')

                Text(this.destinationText)
                    .id('ConvDstText')
                    .fontSize(12)
                    .fontColor('#666666')

                Text('Destination space')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 4 })

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(STANDARD_COLOR_SPACES, (info: ColorSpaceInfo, index: number) => {
                        Button(info.label)
                            .id(`ConvDst_${info.label}`)
                            .fontSize(10)
                            .height(28)
                            .margin(2)
                            .backgroundColor(this.dstIndex === index ? '#4285F4' : '#E8E8E8')
                            .fontColor(this.dstIndex === index ? '#FFFFFF' : '#333333')
                            .onClick(() => {
                                this.selectDestination(index);
                            })
                    }, (info: ColorSpaceInfo, index: number) => info.label)
                }
                .id('ConvDstList')
                .width('95%')

                Text('Test colors')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 8 })

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(COLOR_OPTIONS, (option: ColorOption, index: number) => {
                        Button(option.label)
                            .id(`ConvColor${index}`)
                            .fontSize(10)
                            .height(28)
                            .margin(2)
                            .backgroundColor(this.colorIndex === index ? '#34A853' : '#E8E8E8')
                            .fontColor(this.colorIndex === index ? '#FFFFFF' : '#333333')
                            .onClick(() => {
                                this.selectColor(index);
                            })
                    }, (option: ColorOption, index: number) => option.label)
                }
                .id('ConvColorList')
                .width('95%')

                Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Button('Convert')
                        .id('ConvBtnConvert')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.convert();
                        })
                    Button('Swap')
                        .id('ConvBtnSwapSpaces')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.swapSpaces();
                        })
                    Button('Reset')
                        .id('ConvBtnReset')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.resetAll();
                        })
                }
                .width('95%')

                Text(this.inputInfo)
                    .id('ConvInputText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)

                Text(this.xyzInfo)
                    .id('ConvXyzText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#FAFAFA')
                    .padding(8)
                    .borderRadius(8)

                Text(this.labInfo)
                    .id('ConvLabText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#FAFAFA')
                    .padding(8)
                    .borderRadius(8)

                Text(this.encodedInfo)
                    .id('ConvOutText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(8)
                    .borderRadius(8)

                Text(this.clippedInfo)
                    .id('ConvClipText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(8)
                    .borderRadius(8)

                Text(this.statusInfo)
                    .id('ConvStatusText')
                    .width('90%')
                    .fontSize(13)
                    .fontWeight(FontWeight.Medium)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(10)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)
                    .margin({ bottom: 24 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Auto)
    }
}
