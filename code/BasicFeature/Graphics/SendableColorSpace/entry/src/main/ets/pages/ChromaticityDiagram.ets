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
import { ColorSpaceInfo, getAllColorSpaces } from '../common/ColorSpaceData';
import {
    Primaries,
    AreaComparison,
    primariesOf,
    relativeArea,
    containsPoint,
    whitePointDistance
} from '../common/ColorSpaceMath';

const TAG = '[ChromaticityDiagram]';
const CANVAS_W = 320;
const CANVAS_H = 300;
const MARGIN_PX = 34;
// CIE 1931 coordinates of the visible locus stay below these bounds.
const AXIS_X_MAX = 0.8;
const AXIS_Y_MAX = 0.9;
const SRGB_INDEX = 0;
const D65_PROBE_X = '0.3127';
const D65_PROBE_Y = '0.3290';
const BTN_W = '45%';
const BTN_H = 40;
const INVALID_POINT = 'Point invalid: enter numbers in 0..1';

@Entry
@Component
struct ChromaticityDiagram {
    @State selectedIndex: number = SRGB_INDEX;
    @State selectedLabel: string = 'SRGB';
    @State summaryText: string = '';
    @State areaInfo: string = '';
    @State whiteInfo: string = '';
    @State pointInfo: string = '';
    @State referenceInfo: string = 'Reference:OFF';
    @State probeXText: string = D65_PROBE_X;
    @State probeYText: string = D65_PROBE_Y;
    private probeX: number = 0.3127;
    private probeY: number = 0.3290;
    private probeValid: boolean = true;
    private showReference: boolean = false;
    private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));
    private allSpaces: ColorSpaceInfo[] = getAllColorSpaces();

    aboutToAppear(): void {
        Logger.info(TAG, `aboutToAppear with ${this.allSpaces.length} spaces`);
        this.refreshSelected();
        this.locateProbe();
    }

    goBack(): void {
        router.back();
    }

    toCanvasX(x: number): number {
        return MARGIN_PX + (x / AXIS_X_MAX) * (CANVAS_W - 2 * MARGIN_PX);
    }

    toCanvasY(y: number): number {
        return CANVAS_H - MARGIN_PX - (y / AXIS_Y_MAX) * (CANVAS_H - 2 * MARGIN_PX);
    }

    // The grid is drawn at 0.1 steps so a tapped coordinate can be read against the axes.
    drawGrid(c: CanvasRenderingContext2D): void {
        c.lineWidth = 1;
        c.strokeStyle = '#EEEEEE';
        for (let step = 0; step <= 8; step++) {
            let px: number = this.toCanvasX(step / 10.0);
            c.beginPath();
            c.moveTo(px, MARGIN_PX);
            c.lineTo(px, CANVAS_H - MARGIN_PX);
            c.stroke();
        }
        for (let step = 0; step <= 9; step++) {
            let py: number = this.toCanvasY(step / 10.0);
            c.beginPath();
            c.moveTo(MARGIN_PX, py);
            c.lineTo(CANVAS_W - MARGIN_PX, py);
            c.stroke();
        }
        c.strokeStyle = '#CCCCCC';
        c.strokeRect(MARGIN_PX, MARGIN_PX, CANVAS_W - 2 * MARGIN_PX, CANVAS_H - 2 * MARGIN_PX);
        c.fillStyle = '#999999';
        c.font = '10px sans-serif';
        c.fillText('x', CANVAS_W - MARGIN_PX - 10, CANVAS_H - MARGIN_PX + 14);
        c.fillText('y', MARGIN_PX - 14, MARGIN_PX + 8);
    }

    drawTriangle(c: CanvasRenderingContext2D, primaries: Primaries, fill: string, stroke: string,
        lineWidth: number): void {
        c.beginPath();
        c.fillStyle = fill;
        c.moveTo(this.toCanvasX(primaries.redX), this.toCanvasY(primaries.redY));
        c.lineTo(this.toCanvasX(primaries.greenX), this.toCanvasY(primaries.greenY));
        c.lineTo(this.toCanvasX(primaries.blueX), this.toCanvasY(primaries.blueY));
        c.closePath();
        c.fill();
        c.lineWidth = lineWidth;
        c.strokeStyle = stroke;
        c.stroke();
    }

    drawMarker(c: CanvasRenderingContext2D, x: number, y: number, color: string, text: string): void {
        if (x < 0 || x > AXIS_X_MAX || y < 0 || y > AXIS_Y_MAX) {
            return;
        }
        let px: number = this.toCanvasX(x);
        let py: number = this.toCanvasY(y);
        c.beginPath();
        c.fillStyle = color;
        c.arc(px, py, 5, 0, 2 * Math.PI);
        c.fill();
        c.fillStyle = '#333333';
        c.font = '11px sans-serif';
        c.fillText(text, px + 7, py + 4);
    }

    drawDiagram(): void {
        let c: CanvasRenderingContext2D = this.ctx;
        c.clearRect(0, 0, CANVAS_W, CANVAS_H);
        c.fillStyle = '#FAFAFA';
        c.fillRect(0, 0, CANVAS_W, CANVAS_H);
        this.drawGrid(c);
        let reference: Primaries = primariesOf(this.allSpaces[SRGB_INDEX]);
        if (this.showReference && this.selectedIndex !== SRGB_INDEX) {
            this.drawTriangle(c, reference, 'rgba(158, 158, 158, 0.10)', '#9E9E9E', 1);
        }
        let current: Primaries = primariesOf(this.allSpaces[this.selectedIndex]);
        this.drawTriangle(c, current, 'rgba(66, 133, 244, 0.16)', '#4285F4', 2);
        this.drawMarker(c, current.whiteX, current.whiteY, '#FBBC04', 'W');
        if (this.probeValid) {
            this.drawMarker(c, this.probeX, this.probeY, '#E91E63', 'P');
        }
        c.fillStyle = '#666666';
        c.font = '10px sans-serif';
        c.fillText(this.selectedLabel, MARGIN_PX, MARGIN_PX + 12);
    }

    refreshSelected(): void {
        let info: ColorSpaceInfo = this.allSpaces[this.selectedIndex];
        let primaries: Primaries = primariesOf(info);
        let reference: Primaries = primariesOf(this.allSpaces[SRGB_INDEX]);
        let comparison: AreaComparison = relativeArea(primaries, reference);
        this.selectedLabel = info.label;
        this.summaryText = `Spaces:${this.allSpaces.length} Selected:${info.label}`;
        this.areaInfo = `Area:${comparison.area.toFixed(4)} Ratio:${comparison.ratioToReference.toFixed(3)} ` +
            `Covers:${comparison.containsReference ? 'YES' : 'NO'}`;
        this.whiteInfo = `White x:${primaries.whiteX.toFixed(4)} y:${primaries.whiteY.toFixed(4)} ` +
            `DistD65:${whitePointDistance(primaries, reference).toFixed(4)}`;
        this.refreshPoint();
        this.drawDiagram();
    }

    // Rework the probe verdict for the current triangle without touching the typed coordinates.
    refreshPoint(): void {
        if (!this.probeValid) {
            return;
        }
        let primaries: Primaries = primariesOf(this.allSpaces[this.selectedIndex]);
        let inside: boolean = containsPoint(primaries, this.probeX, this.probeY);
        this.pointInfo = `Point x:${this.probeX.toFixed(4)} y:${this.probeY.toFixed(4)} ` +
            `Inside:${inside ? 'YES' : 'NO'}`;
    }

    selectSpace(index: number): void {
        if (index < 0 || index >= this.allSpaces.length) {
            Logger.error(TAG, `Ignored selection ${index}`);
            return;
        }
        this.selectedIndex = index;
        this.refreshSelected();
        Logger.info(TAG, `Selected ${this.allSpaces[index].label}`);
    }

    locateProbe(): void {
        let x: number = Number.parseFloat(this.probeXText);
        let y: number = Number.parseFloat(this.probeYText);
        if (Number.isNaN(x) || Number.isNaN(y) || x < 0 || x > 1 || y < 0 || y > 1) {
            this.probeValid = false;
            this.pointInfo = INVALID_POINT;
            this.drawDiagram();
            Logger.error(TAG, `Rejected probe ${this.probeXText}, ${this.probeYText}`);
            return;
        }
        this.probeValid = true;
        this.probeX = x;
        this.probeY = y;
        this.refreshPoint();
        this.drawDiagram();
        Logger.info(TAG, `Probe ${x}, ${y}: ${this.pointInfo}`);
    }

    toggleReference(): void {
        this.showReference = !this.showReference;
        this.referenceInfo = `Reference:${this.showReference ? 'ON' : 'OFF'}`;
        this.drawDiagram();
        Logger.info(TAG, `Reference overlay ${this.referenceInfo}`);
    }

    resetAll(): void {
        this.selectedIndex = SRGB_INDEX;
        this.probeXText = D65_PROBE_X;
        this.probeYText = D65_PROBE_Y;
        this.probeValid = true;
        this.probeX = 0.3127;
        this.probeY = 0.3290;
        this.showReference = false;
        this.referenceInfo = 'Reference:OFF';
        this.refreshSelected();
        Logger.info(TAG, 'Reset to the sRGB reference triangle');
    }

    build() {
        Scroll() {
            Column({ space: 8 }) {
                Row() {
                    Button('< Back')
                        .id('ChromBtnBack')
                        .fontSize(14)
                        .height(36)
                        .onClick(() => {
                            this.goBack();
                        })
                    Text('CIE Chromaticity Diagram')
                        .id('ChromPageTitle')
                        .fontSize(18)
                        .fontWeight(FontWeight.Bold)
                        .margin({ left: 12 })
                }
                .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

                Text(this.summaryText)
                    .id('ChromSummaryText')
                    .fontSize(12)
                    .fontColor('#666666')

                Text('Tap a color space to draw its triangle')
                    .fontSize(11)
                    .fontColor('#999999')

                Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                    ForEach(this.allSpaces, (info: ColorSpaceInfo, index: number) => {
                        Button(info.label)
                            .id(`ChromSpace_${info.label}`)
                            .fontSize(9)
                            .height(28)
                            .margin(2)
                            .backgroundColor(this.selectedIndex === index ? '#4285F4' : '#E8E8E8')
                            .fontColor(this.selectedIndex === index ? '#FFFFFF' : '#333333')
                            .onClick(() => {
                                this.selectSpace(index);
                            })
                    }, (info: ColorSpaceInfo, index: number) => info.label)
                }
                .id('ChromSpaceList')
                .width('95%')

                Canvas(this.ctx)
                    .id('ChromCanvas')
                    .width(CANVAS_W)
                    .height(CANVAS_H)
                    .backgroundColor('#FAFAFA')
                    .borderRadius(8)
                    .border({ width: 1, color: '#E0E0E0' })
                    .onReady(() => {
                        this.drawDiagram();
                    })

                Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Button('Draw')
                        .id('ChromBtnDraw')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.drawDiagram();
                        })
                    Button('Reference')
                        .id('ChromBtnCompare')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.toggleReference();
                        })
                    Button('Reset')
                        .id('ChromBtnReset')
                        .width('30%')
                        .height(BTN_H)
                        .fontSize(13)
                        .onClick(() => {
                            this.resetAll();
                        })
                }
                .width('95%')

                Text(this.referenceInfo)
                    .id('ChromCompareText')
                    .fontSize(11)
                    .fontColor('#666666')

                Text(this.areaInfo)
                    .id('ChromAreaText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(10)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)

                Text(this.whiteInfo)
                    .id('ChromWhiteText')
                    .width('90%')
                    .fontSize(12)
                    .fontColor('#333333')
                    .backgroundColor('#F5F5F5')
                    .padding(10)
                    .borderRadius(8)
                    .textAlign(TextAlign.Center)

                Text('Probe point (CIE x / y)')
                    .fontSize(12)
                    .fontWeight(FontWeight.Medium)
                    .margin({ top: 8 })

                Row({ space: 8 }) {
                    TextInput({ text: this.probeXText })
                        .id('ChromInputX')
                        .width('40%')
                        .height(36)
                        .fontSize(12)
                        .type(InputType.NUMBER_DECIMAL)
                        .onChange((value: string) => {
                            this.probeXText = value;
                        })
                    TextInput({ text: this.probeYText })
                        .id('ChromInputY')
                        .width('40%')
                        .height(36)
                        .fontSize(12)
                        .type(InputType.NUMBER_DECIMAL)
                        .onChange((value: string) => {
                            this.probeYText = value;
                        })
                }
                .width('95%')
                .justifyContent(FlexAlign.Center)

                Button('Locate Probe')
                    .id('ChromBtnLocate')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(13)
                    .onClick(() => {
                        this.locateProbe();
                    })

                Text(this.pointInfo)
                    .id('ChromPointText')
                    .width('90%')
                    .fontSize(12)
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
