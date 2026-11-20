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
    Primaries,
    RgbUnit,
    LabColor,
    primariesOf,
    rgbToXyz,
    xyzToLab,
    deltaE76,
    deltaE94,
    deltaE2000,
    perceptibility,
    rgbText,
    labText,
    fromByte
} from '../common/ColorSpaceMath';

const TAG = '[ColorDifference]';
const BTN_H = 40;
const PRESET_INDEX_LIMIT = 6;

// One named pair of 8 bit colors, so the page can restore a documented comparison in a single tap.
interface ColorPair {
    label: string;
    aR: number;
    aG: number;
    aB: number;
    bR: number;
    bG: number;
    bB: number;
}

const PRESETS: ColorPair[] = [
    { label: 'White/Black', aR: 255, aG: 255, aB: 255, bR: 0, bG: 0, bB: 0 },
    { label: 'GrayStep', aR: 128, aG: 128, aB: 128, bR: 160, bG: 160, bB: 160 },
    { label: 'NearRed', aR: 200, aG: 30, aB: 40, bR: 205, bG: 40, bB: 45 },
    { label: 'BlueStep', aR: 0, aG: 0, aB: 255, bR: 0, bG: 0, bB: 250 },
    { label: 'Identical', aR: 64, aG: 64, aB: 64, bR: 64, bG: 64, bB: 64 },
    { label: 'YellowGreen', aR: 255, aG: 255, aB: 0, bR: 0, bG: 255, bB: 0 }
];

@Entry
@Component
struct ColorDifference {
    @State spaceIndex: number = 0;
    @State spaceLabel: string = 'SRGB';
    @State aR: number = 255;
    @State aG: number = 255;
    @State aB: number = 255;
    @State bR: number = 0;
    @State bG: number = 0;
    @State bB: number = 0;
    @State colorAText: string = '';
    @State colorBText: string = '';
    @State labInfo: string = '';
    @State deltaInfo: string = '';
    @State verdictInfo: string = '';
    @State presetInfo: string = '';

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
        this.applyPreset(0);
    }

    goBack(): void {
        router.back();
    }

    currentSpace(): ColorSpaceInfo {
        return STANDARD_COLOR_SPACES[this.spaceIndex];
    }

    currentPrimaries(): Primaries {
        return primariesOf(this.currentSpace());
    }

    colorA(): RgbUnit {
        let color: RgbUnit = { r: fromByte(this.aR), g: fromByte(this.aG), b: fromByte(this.aB) };
        return color;
    }

    colorB(): RgbUnit {
        let color: RgbUnit = { r: fromByte(this.bR), g: fromByte(this.bG), b: fromByte(this.bB) };
        return color;
    }

    labOf(color: RgbUnit): LabColor {
        return xyzToLab(rgbToXyz(color, this.currentSpace().gamma, this.currentPrimaries()));
    }

    // Recompute every reported block from the current bytes and color space.
    compute(): void {
        let colorA: RgbUnit = this.colorA();
        let colorB: RgbUnit = this.colorB();
        let labA: LabColor = this.labOf(colorA);
        let labB: LabColor = this.labOf(colorB);
        let difference76: number = deltaE76(labA, labB);
        let difference94: number = deltaE94(labA, labB);
        let difference2000: number = deltaE2000(labA, labB);
        this.colorAText = `A:${rgbText(colorA)}`;
        this.colorBText = `B:${rgbText(colorB)}`;
        this.labInfo = `LabA:${labText(labA)} LabB:${labText(labB)}`;
        this.deltaInfo = `dE76:${difference76.toFixed(3)} dE94:${difference94.toFixed(3)} ` +
            `dE2000:${difference2000.toFixed(3)}`;
        this.verdictInfo = `Verdict:${perceptibility(difference2000)}`;
        Logger.info(TAG, `${this.deltaInfo} in ${this.spaceLabel}`);
    }

    selectSpace(index: number): void {
        if (index < 0 || index >= STANDARD_COLOR_SPACES.length) {
            Logger.error(TAG, `Ignored space index ${index}`);
            return;
        }
        this.spaceIndex = index;
        this.spaceLabel = STANDARD_COLOR_SPACES[index].label;
        this.compute();
    }

    applyPreset(index: number): void {
        if (index < 0 || index >= PRESET_INDEX_LIMIT) {
            Logger.error(TAG, `Ignored preset index ${index}`);
            return;
        }
        let pair: ColorPair = PRESETS[index];
        this.aR = pair.aR;
        this.aG = pair.aG;
        this.aB = pair.aB;
        this.bR = pair.bR;
        this.bG = pair.bG;
        this.bB = pair.bB;
        this.presetInfo = `Preset:${pair.label}`;
        this.compute();
        Logger.info(TAG, `Applied preset ${pair.label}`);
    }

    swapColors(): void {
        let red: number = this.aR;
        let green: number = this.aG;
        let blue: number = this.aB;
        this.aR = this.bR;
        this.aG = this.bG;
        this.aB = this.bB;
        this.bR = red;
        this.bG = green;
        this.bB = blue;
        this.compute();
        Logger.info(TAG, 'Swapped color A and color B');
    }

    resetAll(): void {
        this.spaceIndex = 0;
        this.spaceLabel = STANDARD_COLOR_SPACES[0].label;
        this.applyPreset(0);
        Logger.info(TAG, 'Reset to the default comparison');
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('DiffBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => {
                            this.goBack();
                        })
                    Text('Color Difference')
                        .id('DiffPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
                .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

                Text(`Space:${this.spaceLabel}`)
                    .id('DiffSpaceText')
                    .fontSize(12)
                    .fontColor('#666666')

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(STANDARD_COLOR_SPACES, (info: ColorSpaceInfo, index: number) => {
                        Button(info.label)
                            .id(`DiffSpace_${info.label}`)
                            .fontSize(10)
                            .height(28)
                            .margin(2)
                            .backgroundColor(this.spaceIndex === index ? '#4285F4' : '#E8E8E8')
                            .fontColor(this.spaceIndex === index ? '#FFFFFF' : '#333333')
                            .onClick(() => {
                                this.selectSpace(index);
                            })
                    }, (info: ColorSpaceInfo, index: number) => info.label)
                }
                .id('DiffSpaceList')
                .width('95%')

                Text('Preset pairs')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 8 })

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(PRESETS, (pair: ColorPair, index: number) => {
                        Button(pair.label)
                            .id(`DiffPreset${index}`)
                            .fontSize(10)
                            .height(28)
                            .margin(2)
                            .backgroundColor('#E8E8E8')
                            .fontColor('#333333')
                            .onClick(() => {
                                this.applyPreset(index);
                            })
                    }, (pair: ColorPair, index: number) => pair.label)
                }
                .width('95%')

                Text(this.presetInfo)
                    .id('DiffPresetText')
                    .fontSize(11)
                    .fontColor('#666666')

                Text('Color A red channel')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 8 })

                Row({ space: 12 }) {
                    Slider({
                        value: this.aR,
                        min: 0,
                        max: 255,
                        step: 1,
                        style: SliderStyle.OutSet
                    })
                        .id('DiffSliderR')
                        .width('70%')
                        .onChange((value: number) => {
                            this.aR = value;
                            this.compute();
                        })
                    Text(this.aR.toFixed(0))
                        .id('DiffRValue')
                        .fontSize(14)
                        .fontColor('#4285F4')
                        .width(50)
                }
                .width('90%')
                .justifyContent(FlexAlign.Center)

                Row({ space: 12 }) {
                    Slider({
                        value: this.aG,
                        min: 0,
                        max: 255,
                        step: 1,
                        style: SliderStyle.OutSet
                    })
                        .id('DiffSliderG')
                        .width('70%')
                        .onChange((value: number) => {
                            this.aG = value;
                            this.compute();
                        })
                    Text(this.aG.toFixed(0))
                        .id('DiffGValue')
                        .fontSize(14)
                        .fontColor('#4285F4')
                        .width(50)
                }
                .width('90%')
                .justifyContent(FlexAlign.Center)

                Row({ space: 12 }) {
                    Slider({
                        value: this.aB,
                        min: 0,
                        max: 255,
                        step: 1,
                        style: SliderStyle.OutSet
                    })
                        .id('DiffSliderB')
                        .width('70%')
                        .onChange((value: number) => {
                            this.aB = value;
                            this.compute();
                        })
                    Text(this.aB.toFixed(0))
                        .id('DiffBValue')
                        .fontSize(14)
                        .fontColor('#4285F4')
                        .width(50)
                }
                .width('90%')
                .justifyContent(FlexAlign.Center)

                Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Button('Compute')
                        .id('DiffBtnCompute')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.compute();
                        })
                    Button('Swap A/B')
                        .id('DiffBtnSwap')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.swapColors();
                        })
                    Button('Reset')
                        .id('DiffBtnReset')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.resetAll();
                        })
                }
                .width('95%')

                Text(this.colorAText)
                    .id('DiffColorAText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)

                Text(this.colorBText)
                    .id('DiffColorBText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(8)
                    .borderRadius(8)

                Text(this.labInfo)
                    .id('DiffLabText')
                    .width('90%')
                    .fontSize(11)
                    .fontColor('#333333')
                    .backgroundColor('#FAFAFA')
                    .padding(8)
                    .borderRadius(8)

                Text(this.deltaInfo)
                    .id('DiffDeltaText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F0F8FF')
                    .padding(10)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)

                Text(this.verdictInfo)
                    .id('DiffVerdictText')
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
