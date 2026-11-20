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
import { collections } from '@kit.ArkTS';
import { router } from '@kit.ArkUI';
import Logger from '../utils/Logger';
import { getColorSpaceNameStr } from '../common/ColorSpaceData';

const TAG = '[CustomColorSpace]';
const BTN_W = '60%';
const BTN_H = 40;
const CANVAS_W = 280;
const CANVAS_H = 240;
const MARGIN_PX = 28;

@Entry
@Component
struct CustomColorSpace {
    @State colorSpaceInfo: string = '';
    @State gammaValue: number = 2.2;
    @State gammaDisplay: string = '2.20';
    @State redXText: string = '0.64';
    @State redYText: string = '0.33';
    @State greenXText: string = '0.30';
    @State greenYText: string = '0.60';
    @State blueXText: string = '0.15';
    @State blueYText: string = '0.06';
    @State whiteXText: string = '0.3127';
    @State whiteYText: string = '0.3290';
  private currentColorSpace: sendableColorSpaceManager.ColorSpaceManager | null = null;
  private ctx: CanvasRenderingContext2D = new CanvasRenderingContext2D(new RenderingContextSettings(true));

    aboutToAppear(): void {
        Logger.info(TAG, 'aboutToAppear');
    }

    toCanvasX(x: number): number {
        return MARGIN_PX + x * (CANVAS_W - 2 * MARGIN_PX);
    }

    toCanvasY(y: number): number {
        return CANVAS_H - MARGIN_PX - y * (CANVAS_H - 2 * MARGIN_PX);
    }

    drawCustomGamut(rx: number, ry: number, gx: number, gy: number, bx: number, by: number,
        wx: number, wy: number): void {
            let c: CanvasRenderingContext2D = this.ctx;
            c.clearRect(0, 0, CANVAS_W, CANVAS_H);
            c.fillStyle = '#FAFAFA';
            c.fillRect(0, 0, CANVAS_W, CANVAS_H);
            c.strokeStyle = '#CCCCCC';
            c.lineWidth = 1;
            c.strokeRect(MARGIN_PX, MARGIN_PX, CANVAS_W - 2 * MARGIN_PX, CANVAS_H - 2 * MARGIN_PX);
            let prx: number = this.toCanvasX(rx);
            let pry: number = this.toCanvasY(ry);
            let pgx: number = this.toCanvasX(gx);
            let pgy: number = this.toCanvasY(gy);
            let pbx: number = this.toCanvasX(bx);
            let pby: number = this.toCanvasY(by);
            c.beginPath();
            c.fillStyle = 'rgba(234, 67, 53, 0.15)';
            c.moveTo(prx, pry);
            c.lineTo(pgx, pgy);
            c.lineTo(pbx, pby);
            c.closePath();
            c.fill();
            c.beginPath();
            c.strokeStyle = '#EA4335';
            c.lineWidth = 2;
            c.moveTo(prx, pry);
            c.lineTo(pgx, pgy);
            c.lineTo(pbx, pby);
            c.closePath();
            c.stroke();
            c.fillStyle = '#EA4335';
            c.beginPath();
            c.arc(prx, pry, 5, 0, 2 * Math.PI);
            c.fill();
            c.fillStyle = '#333';
            c.font = '10px sans-serif';
            c.fillText(`R(${rx},${ry})`, prx + 7, pry + 4);
            c.fillStyle = '#34A853';
            c.beginPath();
            c.arc(pgx, pgy, 5, 0, 2 * Math.PI);
            c.fill();
            c.fillStyle = '#333';
            c.fillText(`G(${gx},${gy})`, pgx + 7, pgy + 4);
            c.fillStyle = '#4285F4';
            c.beginPath();
            c.arc(pbx, pby, 5, 0, 2 * Math.PI);
            c.fill();
            c.fillStyle = '#333';
            c.fillText(`B(${bx},${by})`, pbx + 7, pby + 4);
            let pwx: number = this.toCanvasX(wx);
            let pwy: number = this.toCanvasY(wy);
            c.fillStyle = '#FBBC04';
            c.beginPath();
            c.arc(pwx, pwy, 4, 0, 2 * Math.PI);
            c.fill();
            c.strokeStyle = '#333';
            c.lineWidth = 1;
            c.stroke();
            c.fillStyle = '#333';
            c.fillText(`W(${wx},${wy})`, pwx + 6, pwy - 6);
            c.fillStyle = '#999';
            c.font = '10px sans-serif';
            c.fillText('Custom Gamut', MARGIN_PX, CANVAS_H - 6);
        }

    parseFloat(val: string, defaultVal: number): number {
        let parsed: number = parseFloat(val);
        if (isNaN(parsed)) {
            return defaultVal;
        }
        return parsed;
    }

    createCustomColorSpace(): void {
        let rx: number = this.parseFloat(this.redXText, 0.64);
        let ry: number = this.parseFloat(this.redYText, 0.33);
        let gx: number = this.parseFloat(this.greenXText, 0.30);
        let gy: number = this.parseFloat(this.greenYText, 0.60);
        let bx: number = this.parseFloat(this.blueXText, 0.15);
        let by: number = this.parseFloat(this.blueYText, 0.06);
        let wx: number = this.parseFloat(this.whiteXText, 0.3127);
        let wy: number = this.parseFloat(this.whiteYText, 0.3290);
        try {
            let primaries: colorSpaceManager.ColorSpacePrimaries = {
                redX: rx, redY: ry, greenX: gx, greenY: gy, blueX: bx, blueY: by,
                whitePointX: wx, whitePointY: wy
            };
            let cs: sendableColorSpaceManager.ColorSpaceManager =
                sendableColorSpaceManager.create(primaries, this.gammaValue);
            this.currentColorSpace = cs;
            let name: string = getColorSpaceNameStr(cs.getColorSpaceName());
            let whitePoint: collections.Array<number> = cs.getWhitePoint();
            let wpX: number = 0;
            let wpY: number = 0;
            if(whitePoint.length >= 2) {
        wpX = whitePoint[0];
        wpY = whitePoint[1];
    }
    let actualGamma: number = cs.getGamma();
    this.colorSpaceInfo =
        `Type: Custom\nColorSpaceName: ${name}\n` +
        `WhitePoint: [${wpX.toFixed(4)}, ${wpY.toFixed(4)}]\nGamma: ${actualGamma}\n` +
        `Primaries: R(${rx},${ry}) G(${gx},${gy}) B(${bx},${by})\n` +
        `WhitePoint Input: (${wx},${wy})`;
    this.drawCustomGamut(rx, ry, gx, gy, bx, by, wx, wy);
    Logger.info(TAG, 'Created custom color space');
} catch (err) {
    let errStr: string = JSON.stringify(err) ?? '';
    this.colorSpaceInfo = `Error: ${errStr}`;
    Logger.error(TAG, `Error creating custom: ${errStr}`);
}
  }

resetParams(): void {
    this.gammaValue = 2.2;
    this.gammaDisplay = '2.20';
    this.redXText = '0.64';
    this.redYText = '0.33';
    this.greenXText = '0.30';
    this.greenYText = '0.60';
    this.blueXText = '0.15';
    this.blueYText = '0.06';
    this.whiteXText = '0.3127';
    this.whiteYText = '0.3290';
    this.colorSpaceInfo = '';
    this.currentColorSpace = null;
    let c: CanvasRenderingContext2D = this.ctx;
    c.clearRect(0, 0, CANVAS_W, CANVAS_H);
    c.fillStyle = '#FAFAFA';
    c.fillRect(0, 0, CANVAS_W, CANVAS_H);
}

goBack(): void {
    router.back();
}

build() {
    Scroll() {
        Column({ space: 8 }) {
            Row() {
                Button('< Back')
                    .id('CustomBtnBack')
                    .fontSize(14)
                    .height(36)
                    .onClick(() => { this.goBack(); })
                Text('Custom Color Space')
                    .id('CustomPageTitle')
                    .fontSize(18)
                    .fontWeight(FontWeight.Bold)
                    .margin({ left: 12 })
            }
        .width('100%')
                .margin({ top: 12 })
                .padding({ left: 12, right: 12 })

            Text('Gamma')
                .id('GammaLabel')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 8 })
                .alignSelf(ItemAlign.Start)
                .padding({ left: 16 })

            Row({ space: 12 }) {
                Slider({
                    value: this.gammaValue,
                    min: 0.1,
                    max: 5.0,
                    step: 0.1,
                    style: SliderStyle.OutSet
                })
                    .id('GammaSlider')
                    .width('70%')
                    .onChange((value: number) => {
                        this.gammaValue = value;
                        this.gammaDisplay = value.toFixed(2);
                    })
                Text(this.gammaDisplay)
                    .id('GammaValue')
                    .fontSize(14)
                    .fontColor('#4285F4')
                    .width(50)
            }
        .width('90%')
                .padding({ left: 16, right: 16 })
                .justifyContent(FlexAlign.Center)

            Text('Primaries (CIE xy)')
                .id('PrimariesLabel')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 4 })
                .alignSelf(ItemAlign.Start)
                .padding({ left: 16 })

            Row({ space: 8 }) {
                Text('R:').fontSize(12).width(20)
                TextInput({ text: this.redXText, placeholder: 'x' })
                    .id('InputRedX')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.redXText = val; })
                TextInput({ text: this.redYText, placeholder: 'y' })
                    .id('InputRedY')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.redYText = val; })
            }.width('90%').padding({ left: 16 }).justifyContent(FlexAlign.Start)

            Row({ space: 8 }) {
                Text('G:').fontSize(12).width(20)
                TextInput({ text: this.greenXText, placeholder: 'x' })
                    .id('InputGreenX')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.greenXText = val; })
                TextInput({ text: this.greenYText, placeholder: 'y' })
                    .id('InputGreenY')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.greenYText = val; })
            }.width('90%').padding({ left: 16 }).justifyContent(FlexAlign.Start)

            Row({ space: 8 }) {
                Text('B:').fontSize(12).width(20)
                TextInput({ text: this.blueXText, placeholder: 'x' })
                    .id('InputBlueX')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.blueXText = val; })
                TextInput({ text: this.blueYText, placeholder: 'y' })
                    .id('InputBlueY')
                    .width(60).height(32).fontSize(11)
                    .onChange((val: string) => { this.blueYText = val; })
            }.width('90%').padding({ left: 16 }).justifyContent(FlexAlign.Start)

            Text('White Point (CIE xy)')
                .id('WhitePointLabel')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 4 })
                .alignSelf(ItemAlign.Start)
                .padding({ left: 16 })

            Row({ space: 8 }) {
                Text('W:').fontSize(12).width(20)
                TextInput({ text: this.whiteXText, placeholder: 'x' })
                    .id('InputWhiteX')
                    .width(70).height(32).fontSize(11)
                    .onChange((val: string) => { this.whiteXText = val; })
                TextInput({ text: this.whiteYText, placeholder: 'y' })
                    .id('InputWhiteY')
                    .width(70).height(32).fontSize(11)
                    .onChange((val: string) => { this.whiteYText = val; })
            }.width('90%').padding({ left: 16 }).justifyContent(FlexAlign.Start)

            Row({ space: 12 }) {
                Button('Create Custom')
                    .id('BtnCreateCustom')
                    .width(BTN_W)
                    .height(BTN_H)
                    .fontSize(14)
                    .onClick(() => { this.createCustomColorSpace(); })
                Button('Reset')
                    .id('BtnReset')
                    .width('30%')
                    .height(BTN_H)
                    .fontSize(14)
                    .backgroundColor('#F5F5F5')
                    .fontColor('#333333')
                    .onClick(() => { this.resetParams(); })
            }
        .width('90%')
                .justifyContent(FlexAlign.Center)
                .margin({ top: 4 })

            Text(this.colorSpaceInfo)
                .id('CustomColorSpaceInfo')
                .width('90%')
                .fontSize(12)
                .fontColor('#333333')
                .backgroundColor('#F5F5F5')
                .padding(10)
                .borderRadius(8)

            Text('Gamut Visualization')
                .id('CustomGamutTitle')
                .fontSize(14)
                .fontWeight(FontWeight.Medium)
                .margin({ top: 8 })

            Canvas(this.ctx)
                .id('CustomGamutCanvas')
                .width(CANVAS_W)
                .height(CANVAS_H)
                .backgroundColor('#FAFAFA')
                .borderRadius(8)
                .border({ width: 1, color: '#E0E0E0' })
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
