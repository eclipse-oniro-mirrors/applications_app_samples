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
// [Start rendercontrol_ifelse_sta4]
import { Button, Column, ColumnOptions, Component, Entry, FlexAlign, If, State, Text } from '@kit.ArkUI';

@Entry
@Component
struct NestedIf {
  @State toggle: boolean = false;
  @State toggleColor: boolean = false;

  build() {
    Column({ space: 20 } as ColumnOptions) {
      Text('Before')
        .fontSize(15)
      If(this.toggle) { // 条件渲染
        Text('Top True, positive 1 top')
          .backgroundColor('#aaffaa').fontSize(20)
        // 内部If语句
        If(this.toggleColor) { // 条件渲染
          Text('Top True, Nested True, positive COLOR  Nested ')
            .backgroundColor('#00aaaa').fontSize(15)
        }.Else() {
          Text('Top True, Nested False, Negative COLOR  Nested ')
            .backgroundColor('#aaaaff').fontSize(15)
        }
      }.Else() {
        Text('Top false, negative top level').fontSize(20)
          .backgroundColor('#ffaaaa')
        If(this.toggleColor) { // 条件渲染
          Text('positive COLOR  Nested ')
            .backgroundColor('#00aaaa').fontSize(15)
        }.Else() {
          Text('Negative COLOR  Nested ')
            .backgroundColor('#aaaaff').fontSize(15)
        }
      }
      Text('After')
        .fontSize(15)
      Button('Toggle Outer')
        .onClick(() => {
          this.toggle = !this.toggle;
        })
      Button('Toggle Inner')
        .onClick(() => {
          this.toggleColor = !this.toggleColor;
        })
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}
// [End rendercontrol_ifelse_sta4]
