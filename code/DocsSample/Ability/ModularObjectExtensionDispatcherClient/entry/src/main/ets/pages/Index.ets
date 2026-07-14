/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import testNapi from 'libentry.so';

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      Text('Connect')
        .id('Connect')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testConnect();
        })

      Text('Disconnect')
        .id('Disconnect')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'Connect', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testDisconnect();
        })

      Text('CreateMainServiceInstance')
        .id('CreateMainServiceInstance')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'Disconnect', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testCreateMainServiceInstance();
        })

      Text('GetTypeDescriptor')
        .id('GetTypeDescriptor')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'CreateMainServiceInstance', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetTypeDescriptor();
        })

      Text('GetBaseInfo')
        .id('GetBaseInfo')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'GetTypeDescriptor', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetBaseInfo();
        })

      Text('GetStruct')
        .id('GetStruct')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'GetBaseInfo', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetStruct();
        })

      Text('GetEnum')
        .id('GetEnum')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'GetStruct', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetEnum();
        })

      Text('GetInterface')
        .id('GetInterface')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'GetEnum', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetInterface();
        })

      Text('Add')
        .id('Add')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'GetInterface', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testAdd();
        })

      Text('TestTypeArray')
        .id('TestTypeArray')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'Add', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testTestTypeArray();
        })

      Text('TestTypeVector')
        .id('TestTypeVector')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'TestTypeArray', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testTestTypeVector();
        })

      Text('TestTypeSet')
        .id('TestTypeSet')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'TestTypeVector', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testTestTypeSet();
        })

      Text('TestTypeMap')
        .id('TestTypeMap')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'TestTypeSet', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testTestTypeMap();
        })

      Text('TestTypeStruct')
        .id('TestTypeStruct')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'TestTypeMap', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testTestTypeStruct();
        })

      Text('RegisterCallback')
        .id('RegisterCallback')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'TestTypeStruct', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testRegisterCallback();
        })

      Text('GetPrimaryCalculator')
        .id('GetPrimaryCalculator')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })
        .alignRules({
          top: { anchor: 'RegisterCallback', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          testNapi.testGetPrimaryCalculator();
        })
    }
    .height('100%')
    .width('100%')
  }
}
