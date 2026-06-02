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
// [Start BuilderGlobalScene]
import { Entry, Component, Column, Row, Text, Builder, Button, ClickEvent, TextAlign, ForEach, ListItem, State, Observed } from '@kit.ArkUI';

interface ChildTmp {
  val: number;
}

interface Tmp {
  str_value: string;
  num_value: number;
  tmp_value: ChildTmp;
  arrayTmp_value: Array<ChildTmp>;
}

@Builder
function overBuilder(param: Tmp) {
  Column() {
    Text(`str_value: ${param.str_value}`)
      .width(230)
      .height(40)
      .margin(12)
      .backgroundColor('#0d000000')
      .fontColor('#e6000000')
      .borderRadius(20)
      .textAlign(TextAlign.Center)
    Text(`num_value: ${param.num_value}`)
      .width(230)
      .height(40)
      .margin(12)
      .backgroundColor('#0d000000')
      .fontColor('#e6000000')
      .borderRadius(20)
      .textAlign(TextAlign.Center)
    Text(`tmp_value: ${param.tmp_value.val}`)
      .width(230)
      .height(40)
      .margin(12)
      .backgroundColor('#0d000000')
      .fontColor('#e6000000')
      .borderRadius(20)
      .textAlign(TextAlign.Center)
    ForEach(param.arrayTmp_value, (item: ChildTmp) => {
      ListItem() {
        Text(`arrayTmp_value: ${item.val}`)
          .width(230)
          .height(40)
          .margin(12)
          .backgroundColor('#0d000000')
          .fontColor('#e6000000')
          .borderRadius(20)
          .textAlign(TextAlign.Center)
      }
    }, (item: ChildTmp) => JSON.stringify(item))
  }
}

@Entry
@Component
struct Parent {
  @State objParam: Tmp = {
    str_value: 'Hello',
    num_value: 0,
    tmp_value: { val: 1 } as ChildTmp,
    arrayTmp_value: [] as Array<ChildTmp>
  } as Tmp;

  build() {
    Column() {
      Text('通过调用@Builder渲染UI界面')
        .fontSize(20)
        .margin(12)
      overBuilder({
        str_value: this.objParam.str_value,
        num_value: this.objParam.num_value,
        tmp_value: this.objParam.tmp_value,
        arrayTmp_value: this.objParam.arrayTmp_value
      })
      Button('点击改变参数值').onClick((e: ClickEvent) => {
        this.objParam.str_value = 'Hello World';
        this.objParam.num_value = 1;
        this.objParam.tmp_value.val = 8;
        const child_value: ChildTmp = {
          val: 2
        };
        this.objParam.arrayTmp_value.push(child_value);
      })
    }
    .height('100%')
    .width('100%')
  }
}

// [End BuilderGlobalScene]

@Builder
export function builderGlobalScene(): void {
  NavDestination() {
    Parent();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builder_global_scene_title'))
}
