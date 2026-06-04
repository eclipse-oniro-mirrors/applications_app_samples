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

// [Start view_port_one]
import {
  Entry,
  Text,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Component,
  $r,
  Shape,
  Rect,
  Circle,
  ViewportRect
} from '@ohos.arkui.component';

@Entry
@Component
export struct ViewPort1 {
  viep: ViewportRect = {
    x: 0,
    y: 0,
    width: 75,
    height: 75
  } as ViewportRect;
  viep1: ViewportRect = {
    x: 0,
    y: 0,
    width: 300,
    height: 300
  } as ViewportRect;

  build(): void {
    Column() {
      // 请将$r('app.string.OriginalSizeCircle')替换为实际资源文件，在本示例中该资源文件的value值为"原始尺寸Circle组件"
      Text($r('app.string.OriginalSizeCircle')).margin({ top: 20 })
      Circle({ width: 75, height: 75 }).fill('rgb(39, 135, 217)')

      Row({ space: 10 } as RowOptions) {
        Column() {
          // 请将$r('app.string.EnlargedCircle')替换为实际资源文件，在本示例中该资源文件的value值为"shape内放大的Circle组件"
          Text($r('app.string.EnlargedCircle'))
          Shape() {
            Rect().width('100%').height('100%').fill('rgb(39, 135, 217)')
            Circle({ width: 75, height: 75 }).fill('rgb(213, 213, 213)')
          }
          .viewPort(this.viep)
          .width(150)
          .height(150)
          .backgroundColor('rgb(23, 169, 141)')
        }

        Column() {
          // 请将$r('app.string.ShrunkCircle')替换为实际资源文件，在本示例中该资源文件的value值为"Shape内缩小的Circle组件"
          Text($r('app.string.ShrunkCircle'))
          Shape() {
            Rect().width('100%').height('100%').fill('rgb(213, 213, 213)')
            Circle({ width: 75, height: 75 }).fill('rgb(39, 135, 217)')
          }
          .viewPort(this.viep1)
          .width(150)
          .height(150)
          .backgroundColor('rgb(23, 169, 141)')
        }
      }
    }
  }
}
// [End view_port_one]