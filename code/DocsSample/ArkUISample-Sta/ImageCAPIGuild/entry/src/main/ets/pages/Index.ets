'use static'

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

import {
  Entry, Text, Column, Component, Button, Row, ContentSlot, State, NodeContent
} from '@kit.ArkUI';
import hilog from '@ohos.hilog';

export class NativeClass {
  static {
    loadLibrary("entry")
  }
  native createNativeRoot(content: Object): int;
  native destroyNativeRoot(): int;
}

@Entry
@Component
struct Index {
  private rootSlot: NodeContent = new NodeContent();
  @State showNative: boolean = false;
  calc: NativeClass = new NativeClass()

  build() {
    Column() {
      Button(this.showNative ? 'Hide Native UI' : 'Show Native UI')
        .onClick(() => {
          this.showNative = !this.showNative
          if (this.showNative) {
            this.calc.createNativeRoot(this.rootSlot)
          } else {
            this.calc.destroyNativeRoot()
          }
        })
        .id('btn')
      Row() {
        ContentSlot(this.rootSlot)
      }.layoutWeight(1)
    }
    .width('100%')
    .height('100%')
  }
}
