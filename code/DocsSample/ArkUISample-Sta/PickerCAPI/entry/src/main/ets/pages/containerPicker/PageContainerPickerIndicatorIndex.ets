'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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

import { Column, Component, Content, ContentSlot, Entry, NodeContent } from '@kit.ArkUI';
import { NativeClass } from '../NativeClass'

@Entry
@Component
struct PageContainerPickerIndicatorIndex {
  private nativeClass: NativeClass = new NativeClass()
  private nodeContent: Content = new NodeContent()

  aboutToAppear() {
    this.nativeClass.createIndicatorNode(this.nodeContent);
  }

  build() {
    Column() {
      ContentSlot(this.nodeContent)
    }
    .width('100%')
    .height('100%')
  }
}