'use static';
/**
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

import { Entry, Component } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement';
import { UIContext, Router, PromptAction } from '@ohos.arkui.UIContext'
import promptAction from '@ohos.promptAction';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {
  Row, Column, Text, Button, Toggle, Checkbox, Select, Radio, Scroll, Flex, Scroller,
  ForEach, TapGesture,
  FontWeight, ButtonType, FlexDirection, BarState, ScrollDirection, TextAlign,
  ToggleType, FontStyle, HorizontalAlign, ClickEvent, SelectOption
} from '@ohos.arkui.component'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State count: int = 0;
  private scroller: Scroller = new Scroller();
  private arr: int[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  private router: Router | null = null;

  aboutToAppear(): void {
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
        Text('Next')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
        Text('after click')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
        Text('idTest')
          .id('idTest')
          .fontSize(10)
          .fontWeight(FontWeight.Bold)
        Column() {
          Scroll(this.scroller) {
            Flex({ direction: FlexDirection.Column }) {
              ForEach(this.arr, (item: int) => {
                Row() {
                  Text(item.toString())
                    .width('90%')
                    .height(100)
                    .id('scroll_item')
                    .backgroundColor('#3366CC')
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 5 })
                }
              }, (item: int) => item.toString())
            }.margin({ right: 10 })
          }.id('scroll_test')
          .scrollBar(BarState.Off)
          .scrollable(ScrollDirection.Vertical)
        }.height('300').width('100%')

        Row() {
          Button() {
            Text('ButtonTest')
          }.id('btnTest')
          .onClick(() => {
            this.router?.replaceUrl({
              url: 'pages/Scroller'
            });
          })

          Button() {
            Text('ButtonTest1')
          }.id('btnTest')
          .onClick(() => {

          })

          Button('showToast', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .onClick((): void => {
              let uiContext: UIContext = this.getUIContext()
              let prompt: PromptAction = uiContext.getPromptAction()
              prompt.showToast({
                message: 'testMessage',
                duration: 2000
              });
            })
          Button('showDialog', { type: ButtonType.Normal, stateEffect: true })
            .borderRadius(8)
            .backgroundColor(0x317aff)
            .width(90)
            .onClick((): void => {
              let uiContext: UIContext = this.getUIContext()
              let prompt: PromptAction = uiContext.getPromptAction()
              prompt.showDialog({
                title: 'testDialog',
                message: 'testMessage'
              })
            });
          Button() {
            Text('Drag')
          }.id('drag')
          .onClick(() => {
            this.router?.pushUrl({
              url: 'pages/Drag'
            });
          })

          Button() {
            Text('Pinch')
          }.id('inch')
          .onClick(() => {
            this.router?.pushUrl({
              url: 'pages/Pinch'
            });
          })
          .margin({ left: 10 })
        }.margin({ top: 10 })

        Row() {
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn);
            }).id('Toggle_switch_false')

          Toggle({ type: ToggleType.Switch, isOn: true })
            .selectedColor('#007DFF')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn);
            })
            .id('Toggle_switch_true')

        }.margin({ top: 10 })

        Row() {
          Checkbox({ name: 'checkbox1', group: 'checkboxGroup' })
            .select(true)
            .selectedColor(0xed6f21)
            .onChange((value: boolean) => {
              console.info('Checkbox1 change is' + value);
            }).id('check_test_checked')
          Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
            .select(false)
            .selectedColor(0x39a2db)
            .onChange((value: boolean) => {
              console.info('Checkbox2 change is' + value);
            }).id('check_test_not_checked')

        }.margin({ top: 10 })

        Row() {
          Select([{ value: 'aaa', icon: '/common/1.png' },
            { value: 'bbb', icon: '/common/2.png' },
            { value: 'ccc', icon: '/common/3.png' },
            { value: 'ddd', icon: '/common/4.png' }])
            .selected(2)
            .value('TTT')
            .font({
              size: 30,
              weight: 400,
              family: 'serif',
              style: FontStyle.Normal
            })
            .selectedOptionFont({
              size: 40,
              weight: 500,
              family: 'serif',
              style: FontStyle.Normal
            })
            .optionFont({
              size: 30,
              weight: 400,
              family: 'serif',
              style: FontStyle.Normal
            })
            .onSelect((index: int) => {
              console.info('Select:' + index.toString());
            })
        }.margin({ top: 10 })

        Row() {
          Radio({ value: 'Radio1', group: 'radioGroup' })
            .checked(false).id('radio_test')
          Radio({ value: 'Radio2', group: 'radioGroup' })
            .checked(true).id('radio_test1')
        }.margin({ top: 10 })

        Text('unit_jsunit')
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .gesture(
            TapGesture({ count: 2 })
              .onAction(() => {
                this.router?.pushUrl({ url: 'pages/Swipe' });
              })
          )
      }
      .width('100%').height('100%').alignItems(HorizontalAlign.Start).backgroundColor('#800000')
    }
    .height('100%').backgroundColor('#FF3333')
  }
}
