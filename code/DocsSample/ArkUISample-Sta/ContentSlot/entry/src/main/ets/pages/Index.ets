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
// [Start contentslot_one_sta]
import { Column, Component, ContentSlot, Entry, NodeContent, Text } from '@kit.ArkUI';

export class NativeMethods {
  static {
    loadLibrary("entry")
  }

  static native createNativeNode(content: NodeContent): void;

  static native destroyNativeNode(content: NodeContent): void;
}

@Entry
@Component
struct Parent {
  private nodeContent: NodeContent = new NodeContent();

  aboutToAppear(): void {
    // 通过C-API创建节点，并添加到管理器nodeContent上。
    NativeMethods.createNativeNode(this.nodeContent as NodeContent);
  }

  aboutToDisappear(): void {
    NativeMethods.destroyNativeNode(this.nodeContent as NodeContent);
  }

  build(): void {
    Column() {
      Text('This is ContentSlot sample')
        .fontSize(30)
      // 显示nodeContent管理器里存放的Native侧的组件。
      ContentSlot(this.nodeContent)
    }.width('100%')
  }
}
// [End contentslot_one_sta]
