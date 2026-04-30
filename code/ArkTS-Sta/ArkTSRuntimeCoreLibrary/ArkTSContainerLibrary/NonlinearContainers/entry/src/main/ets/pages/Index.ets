/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

'use static'

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { Row, ButtonType, Margin, Scroller, Scroll, ForEach, FontWeight } from '@kit.ArkUI';

// [Start nonlinear_container]
// 导入HashMap，TreeMap，LightWeightMap，PlainArray模块
import { HashMap, TreeMap, LightWeightMap, PlainArray } from '@kit.ArkTS';

let logMsg = ''

function testHashMap() {
  // [EndExclude nonlinear_container]
  // HashMap
  let hashMap1: HashMap<string, int> = new  HashMap<string, int>();
  hashMap1.set('a', 123); // 增加一个键为'a'，值为123的元素
  let hashMap2: HashMap<int, int> = new HashMap<int, int>();
  hashMap2.set(4, 123); // 增加一个键为4，值为123的元素
  console.info(`result: ${hashMap2.hasKey(4)}`); // 判断是否含有键为4的元素。输出：result: true
  // [StartExclude nonlinear_container]
  logMsg = `result: ${hashMap2.hasKey(4)}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${hashMap1.get('a')}`); // 访问键为'a'的元素。输出：result: 123
  // [StartExclude nonlinear_container]
  logMsg += `result: ${hashMap1.get('a')}`;
}

function testTreeMap() {
  // [EndExclude nonlinear_container]
  // TreeMap
  let treeMap: TreeMap<string, int> = new TreeMap<string, int>();
  treeMap.set('a', 123); // 增加一个键为'a'，值为123的元素
  treeMap.set('6', 356); // 增加一个键为'6'，值为356的元素
  console.info(`result: ${treeMap.get('a')}`); // 访问键为'a'的元素。输出：result: 123
  // [StartExclude nonlinear_container]
  logMsg = `result: ${treeMap.get('a')}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${treeMap.getFirstKey()}`); // 访问首元素。输出：result: 6
  // [StartExclude nonlinear_container]
  logMsg += `result: ${treeMap.getFirstKey()}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${treeMap.getLastKey()}`); // 访问尾元素。输出：result: a
  // [StartExclude nonlinear_container]
  logMsg += `result: ${treeMap.getLastKey()}`;
}

function testLightWeightMap() {
  // [EndExclude nonlinear_container]
  // LightWeightMap
  let lightWeightMap: LightWeightMap<string, int> = new LightWeightMap<string, int>();
  lightWeightMap.set('x', 123); // 增加一个键为'x'，值为123的元素
  lightWeightMap.set('8', 356); // 增加一个键为'8'，值为356的元素
  console.info(`result: ${lightWeightMap.get('a')}`); // 访问键为'a'的元素。输出：result: undefined
  // [StartExclude nonlinear_container]
  logMsg = `result: ${lightWeightMap.get('a')}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${lightWeightMap.get('x')}`); // 访问键为'x'的元素，获取其值。输出：result: 123
  // [StartExclude nonlinear_container]
  logMsg += `result: ${lightWeightMap.get('x')}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${lightWeightMap.getIndexOfKey('8')}`); // 访问键为'8'的元素，获取其索引。输出：result: 0
  // [StartExclude nonlinear_container]
  logMsg += `result: ${lightWeightMap.getIndexOfKey('8')}`;
}

function testPlainArray() {
  // [EndExclude nonlinear_container]
  // PlainArray
  let plainArray: PlainArray<string> = new PlainArray<string>();
  plainArray.add(1, 'sdd'); // 增加一个键为1，值为'sdd'的元素
  plainArray.add(2, 'sff'); // 增加一个键为2，值为'sff'的元素
  console.info(`result: ${plainArray.get(1)}`); // 访问键为1的元素，获取值。输出：result: sdd
  // [StartExclude nonlinear_container]
  logMsg = `result: ${plainArray.get(1)}\n`;
  // [EndExclude nonlinear_container]
  console.info(`result: ${plainArray.getKeyAt(1)}`); // 访问索引为1的元素，获取键。输出：result: 2
  // [End nonlinear_container]
  logMsg += `result: ${plainArray.getKeyAt(1)}`;

}

@Entry
@Component
struct Index {
  @State width_value: string = '90%'
  @State height_value: string = '8%'
  @State log_msg: string = '未初始化'
  scroller: Scroller = new Scroller()

  build() {
    Row() {
      Scroll(this.scroller) {
        Column() {
          Text("日志信息")
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })
          Text(this.log_msg)
            .fontSize(14)
            .fontColor('#ffb11616')
            .width('100%')
            .padding(10)
            .backgroundColor('#F0F0F0')
            .borderRadius(8)
          Button("HashMap").onClick(() => {
            testHashMap();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("TreeMap").onClick(() => {
            testTreeMap();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("lightWeightMap").onClick(() => {
            testLightWeightMap();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')

          Button("plainArray").onClick(() => {
            testPlainArray();
            this.log_msg = logMsg;
          }).type(ButtonType.Capsule)
            .margin({ top: 4, bottom: 20 } as Margin)
            .width(this.width_value)
            .height(this.height_value)
            .backgroundColor('#F0F0F0')
            .fontSize(16)
            .fontColor('#52C41A')
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
