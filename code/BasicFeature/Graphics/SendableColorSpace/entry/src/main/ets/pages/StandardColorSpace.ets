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

import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections, taskpool } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import {
    STANDARD_COLOR_SPACES,
    EXTENDED_COLOR_SPACES,
    LIMIT_COLOR_SPACES,
    getAllColorSpaces,
    ColorSpaceInfo,
    getColorSpaceNameStr
} from '../common/ColorSpaceData';
import { ColorSpaceResult } from '../sendable/ColorSpaceResult';

const TAG = '[StandardColorSpace]';
const BTN_W = '45%';
const BTN_H = 40;
const CANVAS_W = 300;
const CANVAS_H = 260;
const MARGIN_PX = 30;

@Concurrent
function readColorSpaceInTask(colorSpace: sendableColorSpaceManager.ColorSpaceManager): ColorSpaceResult {
    let csName: colorSpaceManager.ColorSpace = colorSpace.getColorSpaceName();
    let whitePoint: collections.Array<number> = colorSpace.getWhitePoint();
    let gamma: number = colorSpace.getGamma();
    let wpX: number = 0;
    let wpY: number = 0;
    if (whitePoint.length >= 2) {
        wpX = whitePoint[0];
        wpY = whitePoint[1];
    }
    let nameStr: string = getColorSpaceNameStr(csName);
    let result: ColorSpaceResult = new ColorSpaceResult(nameStr, wpX, wpY, gamma);
    return result;
}

@Entry
@Component
struct StandardColorSpace {
    @State colorSpaceInfo: string = '';
    @State taskResult: string = '';
    @State canvasReady: boolean = false;
    @State currentInfo: ColorSpaceInfo | null = null;
    @State compareIndices: number[] = [];
    @State compareResult: string = '';
    @State comparisonRows: string[] = [];
  private currentColorSpace: sendableColorSpaceManager.ColorSpaceManager | null = null;
  private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));
  private compareCtx: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));
  private readonly COMPARE_COLORS: string[] = [
    '#4285F4', '#EA4335', '#34A853', '#FBBC04', '#FF6D01', '#46BDC6', '#7B1FA2', '#C2185B'];

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
    }

    toCanvasX(x: number): number {
        return MARGIN_PX + x * (CANVAS_W - 2 * MARGIN_PX);
    }

    toCanvasY(y: number): number {
        return CANVAS_H - MARGIN_PX - y * (CANVAS_H - 2 * MARGIN_PX);
    }

    drawGamut(info: ColorSpaceInfo): void {
        let c: CanvasRenderingContext2D = this.ctx;
        c.clearRect(0, 0, CANVAS_W, CANVAS_H);
        c.fillStyle = '#FAFAFA';
        c.fillRect(0, 0, CANVAS_W, CANVAS_H);
        c.strokeStyle = '#CCCCCC';
        c.lineWidth = 1;
        c.strokeRect(MARGIN_PX, MARGIN_PX, CANVAS_W - 2 * MARGIN_PX, CANVAS_H - 2 * MARGIN_PX);
        for(let gx = 0; gx <= 8; gx++) {
        let px: number = this.toCanvasX(gx / 8.0);
        c.beginPath();
        c.strokeStyle = '#EEEEEE';
        c.moveTo(px, MARGIN_PX);
        c.lineTo(px, CANVAS_H - MARGIN_PX);
        c.stroke();
    }
    for (let gy = 0; gy <= 8; gy++) {
        let py: number = this.toCanvasY(gy / 8.0);
        c.beginPath();
        c.strokeStyle = '#EEEEEE';
        c.moveTo(MARGIN_PX, py);
        c.lineTo(CANVAS_W - MARGIN_PX, py);
        c.stroke();
    }
    let rx: number = this.toCanvasX(info.redX);
    let ry: number = this.toCanvasY(info.redY);
    let gxP: number = this.toCanvasX(info.greenX);
    let gyP: number = this.toCanvasY(info.greenY);
    let bx: number = this.toCanvasX(info.blueX);
    let by: number = this.toCanvasY(info.blueY);
    c.beginPath();
    c.fillStyle = 'rgba(66, 133, 244, 0.15)';
    c.moveTo(rx, ry);
    c.lineTo(gxP, gyP);
    c.lineTo(bx, by);
    c.closePath();
    c.fill();
    c.beginPath();
    c.strokeStyle = '#4285F4';
    c.lineWidth = 2;
    c.moveTo(rx, ry);
    c.lineTo(gxP, gyP);
    c.lineTo(bx, by);
    c.closePath();
    c.stroke();
    c.fillStyle = '#EA4335';
    c.beginPath();
    c.arc(rx, ry, 5, 0, 2 * Math.PI);
    c.fill();
    c.fillStyle = '#333333';
    c.font = '11px sans-serif';
    c.fillText('R', rx + 7, ry + 4);
    c.fillStyle = '#34A853';
    c.beginPath();
    c.arc(gxP, gyP, 5, 0, 2 * Math.PI);
    c.fill();
    c.fillStyle = '#333333';
    c.fillText('G', gxP + 7, gyP + 4);
    c.fillStyle = '#4285F4';
    c.beginPath();
    c.arc(bx, by, 5, 0, 2 * Math.PI);
    c.fill();
    c.fillStyle = '#333333';
    c.fillText('B', bx + 7, by + 4);
    let wx: number = this.toCanvasX(info.whiteX);
    let wy: number = this.toCanvasY(info.whiteY);
    c.fillStyle = '#FBBC04';
    c.beginPath();
    c.arc(wx, wy, 4, 0, 2 * Math.PI);
    c.fill();
    c.strokeStyle = '#333333';
    c.lineWidth = 1;
    c.stroke();
    c.fillStyle = '#333333';
    c.fillText('W', wx + 6, wy + 4);
    c.fillStyle = '#999999';
    c.font = '10px sans-serif';
    c.fillText('CIE 1931 Chromaticity (schematic)', MARGIN_PX, CANVAS_H - 8);
}

createAndDisplay(info: ColorSpaceInfo): void {
    try {
        let cs: sendableColorSpaceManager.ColorSpaceManager =
            sendableColorSpaceManager.create(info.enumValue);
        this.currentColorSpace = cs;
        this.currentInfo = info;
        let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
        let whitePoint: collections.Array<number> = cs.getWhitePoint();
        let wpX: number = 0;
        let wpY: number = 0;
        if(whitePoint.length >= 2) {
    wpX = whitePoint[0];
    wpY = whitePoint[1];
}
let gamma: number = cs.getGamma();
this.colorSpaceInfo =
    `Type: ${info.label}\nColorSpaceName: ${name}\n` +
    `WhitePoint: [${wpX.toFixed(4)}, ${wpY.toFixed(4)}]\nGamma: ${gamma}`;
this.drawGamut(info);
Logger.info(TAG, `Created: ${info.label}`);
    } catch (err) {
    let errStr: string = JSON.stringify(err) ?? '';
    this.colorSpaceInfo = `Error: ${errStr}`;
    Logger.error(TAG, `Error creating ${info.label}: ${errStr}`);
}
  }

toggleCompareSelection(index: number): void {
    let newIndices: number[] = [];
    for(let i = 0; i <this.compareIndices.length; i++) {
    newIndices.push(this.compareIndices[i]);
}
let found: boolean = false;
for (let i = 0; i < newIndices.length; i++) {
    if (newIndices[i] === index) {
        found = true;
        break;
    }
}
if (found) {
    let filtered: number[] = [];
    for (let i = 0; i < newIndices.length; i++) {
        if (newIndices[i] !== index) {
            filtered.push(newIndices[i]);
        }
    }
    this.compareIndices = filtered;
} else {
    newIndices.push(index);
    this.compareIndices = newIndices;
}
  }

isSelected(index: number): boolean {
    for (let i = 0; i < this.compareIndices.length; i++) {
        if (this.compareIndices[i] === index) {
            return true;
        }
    }
    return false;
}

calculateArea(rx: number, ry: number, gx: number, gy: number, bx: number, by: number): number {
    let area: number = 0.5 * Math.abs(rx * (gy - by) + gx * (by - ry) + bx * (ry - gy));
    return area;
}

drawComparison(): void {
    let c: CanvasRenderingContext2D = this.compareCtx;
    c.clearRect(0, 0, CANVAS_W, CANVAS_H);
    c.fillStyle = '#FAFAFA';
    c.fillRect(0, 0, CANVAS_W, CANVAS_H);
    c.strokeStyle = '#CCCCCC';
    c.lineWidth = 1;
    c.strokeRect(MARGIN_PX, MARGIN_PX, CANVAS_W - 2 * MARGIN_PX, CANVAS_H - 2 * MARGIN_PX);
    for(let gx = 0; gx <= 8; gx++) {
    let px: number = this.toCanvasX(gx / 8.0);
    c.beginPath();
    c.strokeStyle = '#EEEEEE';
    c.moveTo(px, MARGIN_PX);
    c.lineTo(px, CANVAS_H - MARGIN_PX);
    c.stroke();
}
for (let gy = 0; gy <= 8; gy++) {
    let py: number = this.toCanvasY(gy / 8.0);
    c.beginPath();
    c.strokeStyle = '#EEEEEE';
    c.moveTo(MARGIN_PX, py);
    c.lineTo(CANVAS_W - MARGIN_PX, py);
    c.stroke();
}
let legendParts: string[] = [];
let tableRows: string[] = [];
let allCs: ColorSpaceInfo[] = getAllColorSpaces();
for (let idx = 0; idx < this.compareIndices.length; idx++) {
    let info: ColorSpaceInfo = allCs[this.compareIndices[idx]];
    let color: string = this.COMPARE_COLORS[idx % this.COMPARE_COLORS.length];
    let rx: number = this.toCanvasX(info.redX);
    let ry: number = this.toCanvasY(info.redY);
    let gxP: number = this.toCanvasX(info.greenX);
    let gyP: number = this.toCanvasY(info.greenY);
    let bx: number = this.toCanvasX(info.blueX);
    let by: number = this.toCanvasY(info.blueY);
    c.beginPath();
    c.strokeStyle = color;
    c.lineWidth = 2;
    c.moveTo(rx, ry);
    c.lineTo(gxP, gyP);
    c.lineTo(bx, by);
    c.closePath();
    c.stroke();
    c.fillStyle = '#333333';
    c.font = '10px sans-serif';
    c.fillText(info.label, rx + 8, ry - 4);
    legendParts.push(info.label);
    let area: number = this.calculateArea(info.redX, info.redY, info.greenX, info.greenY, info.blueX, info.blueY);
    let row: string = `${info.label} | R(${info.redX},${info.redY}) G(${info.greenX},${info.greenY}) ` +
      `B(${info.blueX},${info.blueY}) | W(${info.whiteX},${info.whiteY}) | γ${info.gamma} | Area:${area.toFixed(4)}`;
    tableRows.push(row);
}
c.fillStyle = '#999999';
c.font = '10px sans-serif';
c.fillText('CIE 1931 Comparison', MARGIN_PX, CANVAS_H - 8);
if (this.compareIndices.length > 0) {
    this.compareResult = `Comparing: ${legendParts.join(' vs ')}`;
} else {
    this.compareResult = '';
}
this.comparisonRows = tableRows;
  }

createExtended(info: ColorSpaceInfo): void {
    this.createAndDisplay(info);
}

createLimit(info: ColorSpaceInfo): void {
    this.createAndDisplay(info);
}

executeTaskPoolRead(): void {
    if(this.currentColorSpace === null) {
    this.taskResult = 'Please create a color space first';
    return;
}
let cs: sendableColorSpaceManager.ColorSpaceManager = this.currentColorSpace;
let task: taskpool.Task = new taskpool.Task(readColorSpaceInTask, cs);
taskpool.execute(task).then((result: Object) => {
    let csResult: ColorSpaceResult = result as ColorSpaceResult;
    this.taskResult =
        `[TaskPool] name=${csResult.name}, wp=[${csResult.whitePointX.toFixed(4)}, ` +
          `${csResult.whitePointY.toFixed(4)}], gamma=${csResult.gamma}`;
    Logger.info(TAG, `TaskPool result: ${csResult.name}`);
}).catch((err: Error) => {
    this.taskResult = `TaskPool error: ${err.message}`;
});
  }

goBack(): void {
    router.back();
}

build() {
    Scroll() {
        Column({ space: 8 }) {
            Row() {
                Button('< Back')
                    .id('StdBtnBack')
                    .fontSize(14)
                    .height(36)
                    .onClick(() => { this.goBack(); })
                Text('Standard Color Spaces')
                    .id('StdPageTitle')
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .margin({ left: 12 })
            }
        .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
                ForEach(STANDARD_COLOR_SPACES, (info: ColorSpaceInfo) => {
                    Button(info.label)
                        .id(`Btn_${info.label}`)
                        .width('48%')
                        .height(BTN_H)
                        .fontSize(12)
                        .margin({ bottom: 4 })
                        .onClick(() => { this.createAndDisplay(info); })
                }, (info: ColorSpaceInfo) => info.label)
            }
        .width('100%')
                .padding({ left: 12, right: 12 })

            Text(this.colorSpaceInfo)
                .id('StdColorSpaceInfo')
                .width('90%')
                .fontSize(12)
                .fontColor('#333333')
                .backgroundColor('#F5F5F5')
                .padding(10)
                .borderRadius(8)

            Text('Gamut Visualization')
                .id('StdGamutTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 8 })

            Canvas(this.ctx)
                .id('StdGamutCanvas')
                .width(CANVAS_W)
                .height(CANVAS_H)
                .backgroundColor('#FAFAFA')
                .borderRadius(8)
                .border({ width: 1, color: '#E0E0E0' })

            Text('Concurrency - TaskPool')
                .id('TaskPoolTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 8 })

            Button('Read via TaskPool')
                .id('StdBtnTaskPoolRead')
                .width(BTN_W)
                .height(BTN_H)
                .fontSize(13)
                .onClick(() => { this.executeTaskPoolRead(); })

            Text(this.taskResult)
                .id('StdTaskPoolResult')
                .width('90%')
                .fontSize(11)
                .fontColor('#333333')
                .backgroundColor('#F0F8FF')
                .padding(8)
                .borderRadius(8)
                .margin({ bottom: 12 })

            Text('Gamut Comparison')
                .id('StdCompareTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 12 })

            Text('Select color spaces to compare (tap to toggle)')
                .fontSize(11)
                .fontColor('#999999')

            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                ForEach(getAllColorSpaces(), (info: ColorSpaceInfo, index: number) => {
                    Button(info.label)
                        .id(`CmpBtn_${info.label}`)
                        .fontSize(10)
                        .height(28)
                        .margin(3)
                        .backgroundColor(this.isSelected(index) ? '#4285F4' : '#E8E8E8')
                        .fontColor(this.isSelected(index) ? '#FFFFFF' : '#333333')
                        .onClick(() => { this.toggleCompareSelection(index); })
                }, (info: ColorSpaceInfo, index: number) => info.label)
            }
        .width('95%')

            Button('Clear Selection')
                .id('BtnClearCompare')
                .width('40%')
                .height(30)
                .fontSize(11)
                .backgroundColor('#F5F5F5')
                .fontColor('#666666')
                .onClick(() => { this.compareIndices = []; this.compareResult = ''; this.comparisonRows = []; })

            Button('Draw Comparison')
                .id('BtnDrawCompare')
                .width(BTN_W)
                .height(BTN_H)
                .fontSize(13)
                .onClick(() => { this.drawComparison(); })

            Text(this.compareResult)
                .id('StdCompareResult')
                .fontSize(11)
                .fontColor('#666666')

            Canvas(this.compareCtx)
                .id('StdCompareCanvas')
                .width(CANVAS_W)
                .height(CANVAS_H)
                .backgroundColor('#FAFAFA')
                .borderRadius(8)
                .border({ width: 1, color: '#E0E0E0' })

            Text('Comparison Data')
                .id('StdCompareDataTable')
                .fontSize(12)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 8 })
                .alignSelf(ItemAlign.Start)
                .padding({ left: 16 })

            List({ space: 2 }) {
                ForEach(this.comparisonRows, (row: string, index: number) => {
                    ListItem() {
                        Text(row)
                            .fontSize(9)
                            .fontColor('#333333')
                            .width('100%')
                    }
                }, (row: string, index: number) => index.toString())
            }
                .id('StdCompareTable')
                .width('95%')
                .height(this.comparisonRows.length > 0 ? 120 : 0)
                .backgroundColor('#F8F8F8')
                .borderRadius(8)
                .padding(8)
                .margin({ bottom: 12 })

            Text('Extended Color Spaces (API 11+)')
                .id('ExtSectionTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 12 })

            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                ForEach(EXTENDED_COLOR_SPACES, (info: ColorSpaceInfo) => {
                    Button(info.label)
                        .id(`ExtBtn_${info.label}`)
                        .fontSize(9)
                        .height(30)
                        .margin(2)
                        .onClick(() => { this.createExtended(info); })
                }, (info: ColorSpaceInfo) => info.label)
            }
            .width('95%')

            Text('LIMIT Range Color Spaces (API 11+)')
                .id('LimSectionTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 12 })

            Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Center }) {
                ForEach(LIMIT_COLOR_SPACES, (info: ColorSpaceInfo) => {
                    Button(info.label)
                        .id(`LimBtn_${info.label}`)
                        .fontSize(9)
                        .height(30)
                        .margin(2)
                        .onClick(() => { this.createLimit(info); })
                }, (info: ColorSpaceInfo) => info.label)
            }
            .width('95%')
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
