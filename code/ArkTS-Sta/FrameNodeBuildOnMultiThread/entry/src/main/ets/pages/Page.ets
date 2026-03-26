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

'use static'

import {
  Entry, Text, Column, Component, Button, ClickEvent, ContentSlot, Alignment, TextAlign, FontWeight, Flex
} from '@kit.ArkUI';
import { State, Link } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { NodeUtils } from '../node/NodeUtils';
import { NodeContent, FrameNode } from '@ohos.arkui.node';
import { RouterInfo } from '../models/RouterInfo';

@Component
struct FrameNodeComponent {
  private rootSlot: NodeContent = new NodeContent();
  @State isOnUIThread: boolean = false;

  aboutToAppear(): void {
    if (this.isOnUIThread) {
      // 在UI线程创建组件
      NodeUtils.createNodeTreeOnUIThread(this.rootSlot, this.getUIContext());
    } else {
      // 多线程创建组件
      NodeUtils.createNodeTreeOnMultiThread(this.rootSlot, this.getUIContext());
    }
  }

  aboutToDisappear(): void {
    // 释放已创建的FrameNode节点
    NodeUtils.disposeNodeTree(this.rootSlot);
  }

  build() {
    Column() {
      // FrameNode节点挂载点
      ContentSlot(this.rootSlot)
    }
    .width('100%')
  }
}

@Component
struct TitleComponent {
  @Link message: string;

  build() {
    Column() {
      Text(this.message)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .margin(5)
    .align(Alignment.Center)
    .width('95%')
    .height('8%')
    .borderRadius(10)
    .backgroundColor('#FFFFFFFF')
  }
}

@Entry
@Component
struct Page {
  isOnUIThread: boolean = false;
  @State message: string = 'CreateNodeTreeOnMultiThread';

  aboutToAppear(): void {
    const params = this.getUIContext().getRouter().getParams() as RouterInfo;
    this.isOnUIThread = params.isOnUIThread;
    if (this.isOnUIThread) {
      this.message = 'CreateNodeTreeOnUIThread';
    } else {
      this.message = 'CreateNodeTreeOnMultiThread'
    }
  }

  build() {
    Flex() {
      Column() {
        TitleComponent({ message: this.message })
          .width('100%')
          .align(Alignment.Center)
        FrameNodeComponent({ isOnUIThread: this.isOnUIThread })
          .width('100%')
      }
      .backgroundColor('#EEEEEE')
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}
