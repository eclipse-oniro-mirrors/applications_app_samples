'use static'
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { AdaptationUtil } from '../utils/AdaptationUtil';
import { Entry, Component, State, Column, Row, List, ListItem, Text, Image, Blank, ForEach, Color, FlexAlign } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

let adaptationUtil = new AdaptationUtil();
let v100 = adaptationUtil.getWidth(100);
let v200 = adaptationUtil.getWidth(200);
let v300 = adaptationUtil.getWidth(300);
let v400 = adaptationUtil.getWidth(400);
let v500 = adaptationUtil.getWidth(500);
let v600 = adaptationUtil.getWidth(600);
let v630 = adaptationUtil.getWidth(630);
let v700 = adaptationUtil.getWidth(700);
let v800 = adaptationUtil.getWidth(800);
let v900 = adaptationUtil.getWidth(900);
let v1000 = adaptationUtil.getWidth(1000);
let v1800 = adaptationUtil.getWidth(1800);
export const VALUE_100: int = v100.toInt();
export const VALUE_200: int = v200.toInt();
export const VALUE_300: int = v300.toInt();
export const VALUE_400: int = v400.toInt();
export const VALUE_500: int = v500.toInt();
export const VALUE_600: int = v600.toInt();
export const VALUE_630: int = v630.toInt();
export const VALUE_700: int = v700.toInt();
export const VALUE_800: int = v800.toInt();
export const VALUE_900: int = v900.toInt();
export const VALUE_1000: int = v1000.toInt();
export const VALUE_1800: int = v1800.toInt();

export const STROKE_SAMPLE: string = "你好";

export interface Item {
  text: string;
}

const operationUrls: string[] = [
  'drawing/pages/CanvasGetResult',
  'drawing/pages/CanvasOperationState',
  'drawing/pages/BasicEffect',
  'drawing/pages/ComplexEffect',
  'drawing/pages/ShapeDrawing',
  'drawing/pages/PixelMapDrawing',
  'drawing/pages/TextBlockDrawing'
];

const pageNames: string[] = [
  'Canvas Get Result',
  'Canvas Operation State',
  'Basic Effect',
  'Complex Effect',
  'Shape Drawing',
  'PixelMap Drawing',
  'TextBlock Drawing'
];

@Entry
@Component
struct Index {
  @State listItem: Array<Item> = [] as Array<Item>

  aboutToAppear(): void {
    let items: Array<Item> = [];
    for (let i: Int = 0; i < pageNames.length; i++) {
      items.push({ text: pageNames[i] });
    }
    this.listItem = items;
  }

  routePage(index: Int): void {
    const router = this.getUIContext().getRouter();
    router.pushUrl({ url: operationUrls[index] })
      .then(() => {
        console.info('pushUrl finish');
      })
      .catch((err: Error) => {
        console.error('pushUrl failed');
      });
  }

  build() {
    Column() {
      List({ space: 10 as Int }) {
        ForEach(this.listItem, (item: Item, index: Int) => {
          ListItem() {
            Row() {
              Blank().width('4%')
              Text(item.text)
                .fontSize(16)
                .fontColor('black')
                .width('90%')
              Image('app.media.right')
                .height(12)
                .width(12)
            }
            .onClick(() => { this.routePage(index) })
            .border({ radius: 20 })
            .width('90%')
            .height('8%')
            .backgroundColor(Color.White)
            .margin({ top: 12, left: 15, right: 8 })
          }
        }, (item: Item) => item.text)
      }
      .height('90%')
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}