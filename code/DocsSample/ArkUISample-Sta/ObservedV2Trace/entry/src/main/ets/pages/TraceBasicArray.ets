'use static'

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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start TraceBasicArray]
import {
  Button,
  Column,
  ComponentV2,
  Divider,
  Entry,
  FontWeight,
  ForEach,
  Row,
  Text,
  ObservedV2,
  Trace,
  List,
  ListItem
} from '@kit.ArkUI';

let nextId: number = 0;

@ObservedV2
class Arr {
  id: number = 0;
  @Trace numberArr: number[] = [];

  constructor() {
    this.id = nextId++;
    this.numberArr = [0, 1, 2];
  }
}

@Entry
@ComponentV2
struct Index {
  arr: Arr = new Arr();

  build() {
    Column() {
      // 展开arr.numberArr数组内容
      Text(`arr.numberArr: ${this.arr.numberArr}`)
        .fontSize(20)
        .margin(10)
      if (this.arr.numberArr.length >= 3) {
        Text(`${this.arr.numberArr[0]}`)
          .fontSize(20)
          .margin(10)
          .onClick((e) => {
            this.arr.numberArr[0]++;
          })
        Text(`${this.arr.numberArr[1]}`)
          .fontSize(20)
          .margin(10)
          .onClick((e) => {
            this.arr.numberArr[1]++;
          })
        Text(`${this.arr.numberArr[2]}`)
          .fontSize(20)
          .margin(10)
          .onClick((e) => {
            this.arr.numberArr[2]++;
          })
      }

      Button('push')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.push(50);
        })

      Button('pop')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.pop();
        })

      Button('shift')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.shift();
        })

      Button('splice')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.splice(1, 0 as int, 60);
        })


      Button('unshift')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.unshift(100);
        })

      Button('copywithin')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.copyWithin(0, 1, 2);
        })

      Button('fill')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.fill(0, 2, 4);
        })

      Button('reverse')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.reverse();
        })

      Button('sort')
        .width(300)
        .margin(10)
        .onClick((e) => {
          this.arr.numberArr.sort();
        })
    }
    .width('100%')
  }
}

// [End TraceBasicArray]

@Builder
export function traceBasicArray(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_basic_array_title'))
}