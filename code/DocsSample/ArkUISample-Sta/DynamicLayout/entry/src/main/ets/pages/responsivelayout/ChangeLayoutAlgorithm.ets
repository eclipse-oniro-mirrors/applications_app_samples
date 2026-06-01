'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

// [Start ChangeLayoutAlgorithm]
import {
  Entry,
  ComponentV2,
  Column,
  ColumnOptions,
  Text,
  Row,
  RowOptions,
  Button,
  ButtonOptions,
  VerticalAlign,
  HorizontalAlign,
  LocalizedAlignment,
  TextAlign,
  FlexAlign
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { FrameNode, LayoutConstraint, NodePosition, IDataSource, LengthMetrics } from '@kit.ArkUI';
import {
  RowLayoutAlgorithm,
  LayoutAlgorithm,
  ColumnLayoutAlgorithm,
  StackLayoutAlgorithm,
  GridLayoutAlgorithm
} from '@ohos.arkui.layoutAlgorithm';
import { DynamicLayout } from '@ohos.arkui.components.ArkDynamicLayout';

@Entry
@ComponentV2
struct LayoutSwitchExample {
  @Local algorithm: LayoutAlgorithm = new RowLayoutAlgorithm({
    space: LengthMetrics.vp(10),
    alignItems: VerticalAlign.Center
  });
  @Local childWidth: string = '20%'
  @Local childHeight: string = '20%'

  build() {
    Column() {
      // 使用状态变量控制布局算法
      DynamicLayout(this.algorithm) {
        Text('Item 1')
          .width(this.childWidth)
          .height(this.childHeight)
          .fontSize(14)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xF5DEB3)
          .borderRadius(8)
          .layoutGravity(LocalizedAlignment.TOP_START)
        Text('Item 2')
          .width(this.childWidth)
          .height(this.childHeight)
          .fontSize(14)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xF5DEB3)
          .borderRadius(8)
          .layoutGravity(LocalizedAlignment.TOP_END)
        Text('Item 3')
          .width(this.childWidth)
          .height(this.childHeight)
          .fontSize(14)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xF5DEB3)
          .borderRadius(8)
          .layoutGravity(LocalizedAlignment.BOTTOM_START)
        Text('Item 4')
          .width(this.childWidth)
          .height(this.childHeight)
          .fontSize(14)
          .textAlign(TextAlign.Center)
          .backgroundColor(0xF5DEB3)
          .borderRadius(8)
          .layoutGravity(LocalizedAlignment.BOTTOM_END)
      }
      .width(300)
      .height(280)
      .backgroundColor(0xEFEFEF)
      .borderRadius(12)
      .padding(10)

      Column({ space: 10 } as ColumnOptions) {
        Row({ space: 10 } as RowOptions) {
          Button('Row布局')
            .onClick(() => {
              this.algorithm = new RowLayoutAlgorithm({
                space: LengthMetrics.vp(10),
                alignItems: VerticalAlign.Center
              });
              this.childWidth = '20%'
              this.childHeight = '20%'
            })
          Button('Column布局')
            .onClick(() => {
              this.algorithm = new ColumnLayoutAlgorithm({
                space: LengthMetrics.vp(10),
                alignItems: HorizontalAlign.Center
              });
              this.childWidth = '20%'
              this.childHeight = '20%'
            })
        }

        Row({ space: 10 } as RowOptions) {
          Button('Stack布局')
            .onClick(() => {
              this.algorithm = new StackLayoutAlgorithm({
                alignContent: LocalizedAlignment.CENTER
              });
              this.childWidth = '20%'
              this.childHeight = '20%'
            })
          Button('Grid布局')
            .onClick(() => {
              this.algorithm = new GridLayoutAlgorithm({
                columnsTemplate: '1fr 1fr',
                rowsGap: LengthMetrics.vp(5),
                columnsGap: LengthMetrics.vp(5)
              });
              this.childWidth = '100%'
              this.childHeight = '50%'
            })
        }
      }
      .margin({ top: 20 })
    }
    .padding(20)
  }
}
// [End ChangeLayoutAlgorithm]