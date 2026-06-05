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

import {
  Entry,
  Component,
  Flex,
  FlexOptions,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Text,
  FontWeight,
  Row,
  Button,
  Column,
  ButtonType,
  NavPathStack,
  Navigation,
  NavigationMode,
  SideBarContainer,
  Resource,
  $r,
  Color,
  ColumnOptions,
  ForEach,
  Image,
  ButtonIconOptions,
  ButtonStyle,
  DividerStyle,
  SideBarContainerType
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';

@Entry
@Component
struct SideBarContainerExample {
  // 请将$r('app.media.icon')替换为实际资源文件
  normalIcon: Resource = $r('app.media.icon');
  selectedIcon: Resource = $r('app.media.icon');
  @State arr: Array<int> = [1, 2, 3];
  @State current: number = 1;

  build() {
    SideBarContainer(SideBarContainerType.Embed) {
      Column() {
        ForEach(this.arr, (item: int) => {
          Column({ space: 5 } as ColumnOptions) {
            Image(this.current === item ? this.selectedIcon : this.normalIcon).width(64).height(64)
            Text('Index0' + item)
              .fontSize(25)
              .fontColor(this.current === item ? '#0A59F7' : '#999')
              .fontFamily('source-sans-pro,cursive,sans-serif')
          }
          .onClick(() => {
            this.current = item;
          })
        }, (item: int) => item.toString())
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor('#19000000')

      Column() {
        Text('SideBarContainer content text1').fontSize(25)
        Text('SideBarContainer content text2').fontSize(25)
      }
      .margin({ top: 50, left: 20, right: 30 })
    }
    // 请将$r('app.media.drawer')替换为实际资源文件
    .controlButton({
      icons: {
        hidden: $r('app.media.drawer'),
        shown: $r('app.media.drawer'),
        switching: $r('app.media.drawer')
      } as ButtonIconOptions
    } as ButtonStyle)
    .sideBarWidth(150)
    .minSideBarWidth(50)
    .maxSideBarWidth(300)
    .minContentWidth(0)
    .onChange((value: boolean) => {
      console.info('status:' + value);
    })
    .divider({ strokeWidth: '1vp', color: Color.Gray, startMargin: '4vp', endMargin: '4vp' } as DividerStyle)
  }
}