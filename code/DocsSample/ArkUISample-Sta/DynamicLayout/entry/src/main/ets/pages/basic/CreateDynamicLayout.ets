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

// [Start CreateDynamicLayout]
import {
  Entry,
  ComponentV2,
  Column,
  ColumnOptions,
  Text,
  Button,
  ButtonOptions,
} from '@ohos.arkui.component';
import { Local } from '@ohos.arkui.stateManagement';
import { DynamicLayout, DynamicLayoutAttribute } from '@ohos.arkui.components.ArkDynamicLayout';
import {
  ColumnLayoutAlgorithm,
  RowLayoutAlgorithm,
  LayoutAlgorithm
} from "@ohos.arkui.layoutAlgorithm";

@Entry
@ComponentV2
struct CreateDynamicLayout {
  @Local algorithm: LayoutAlgorithm = new RowLayoutAlgorithm();

  build() {
    Column({ space: 10 } as ColumnOptions) {
      DynamicLayout(this.algorithm) {
        Text('Item 1')
          .fontSize(16)
          .backgroundColor(0xF5DEB3)
          .padding(10)
        Text('Item 2')
          .fontSize(16)
          .backgroundColor(0xD2B48C)
          .padding(10)
        Text('Item 3')
          .fontSize(16)
          .backgroundColor(0xF5DEB3)
          .padding(10)
      }
      .width('100%')
      .height(150)
      .backgroundColor(0xEFEFEF)

      Button('切换为Column布局')
        .fontSize(16)
        .onClick(() => {
          this.algorithm = new ColumnLayoutAlgorithm();
        })
    }
    .width('100%')
    .padding(20)
  }
}
// [End CreateDynamicLayout]