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
// [Start frameNodePosition_start]
import {
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  Flex,
  FlexAlign,
  FlexDirection,
  FrameNode,
  ItemAlign,
  NodeContainer,
  NodeController,
  Padding,
  Text,
  TextAlign,
  UIContext
} from '@kit.ArkUI';

const TEST_TAG: string = 'FrameNode'

export class MyNodeController extends NodeController {
  public frameNode: FrameNode | null = null;
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.frameNode = new FrameNode(uiContext);
    this.rootNode!.appendChild(this.frameNode!);
    return this.rootNode;
  }

  getPositionToWindow(): void {
    let positionToWindow = this.rootNode?.getPositionToWindow(); // 获取FrameNode相对于窗口的位置偏移。
    console.info('FrameNode:x:' + positionToWindow?.x + ',y:' + positionToWindow?.y)
  }

  getPositionToParent(): void {
    let positionToParent = this.rootNode?.getPositionToParent(); // 获取FrameNode相对于父组件的位置偏移。
    console.info('FrameNode:x:' + positionToParent?.x + ',y:' + positionToParent?.y)
  }

  getPositionToScreen(): void {
    let positionToScreen = this.rootNode?.getPositionToScreen(); // 获取FrameNode相对于屏幕的位置偏移。
    console.info('FrameNode:x:' + positionToScreen?.x + ',y:' + positionToScreen?.y)
  }

  getPositionToWindowWithTransform(): void {
    let positionToWindowWithTransform =
      this.rootNode?.getPositionToWindowWithTransform(); // 获取FrameNode相对于窗口带有绘制属性的位置偏移。
    console.info('FrameNode:x:' + positionToWindowWithTransform?.x + ',y:' + positionToWindowWithTransform?.y)
  }

  getPositionToParentWithTransform(): void {
    let positionToParentWithTransform =
      this.rootNode?.getPositionToParentWithTransform(); // 获取FrameNode相对于父组件带有绘制属性的位置偏移。
    console.info('FrameNode:x:' + positionToParentWithTransform?.x + ',y:' + positionToParentWithTransform?.y)
  }

  getPositionToScreenWithTransform(): void {
    let positionToScreenWithTransform =
      this.rootNode?.getPositionToScreenWithTransform(); // 获取FrameNode相对于屏幕带有绘制属性的位置偏移。
    console.info('FrameNode:x:' + positionToScreenWithTransform?.x + ',y:' + positionToScreenWithTransform?.y)
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Button('getPositionToWindow')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToWindow();
        })
      Button('getPositionToParent')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToParent();
        })
      Button('getPositionToScreen')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToScreen();
        })
      Button('getPositionToParentWithTransform')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToParentWithTransform();
        })
      Button('getPositionToWindowWithTransform')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToWindowWithTransform();
        })
      Button('getPositionToScreenWithTransform')
        .width(300)
        .onClick((event: ClickEvent) => {
          this.myNodeController.getPositionToScreenWithTransform();
        })
      Column() {
        Text('This is a NodeContainer.')
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .width('100%')
          .fontSize(16)
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(300)
          .height(100)
      }
    }
    .padding({
      left: 35,
      right: 35,
      top: 35,
      bottom: 35
    } as Padding)
    .width('100%')
    .height('100%')
  }
}
// [End frameNodePosition_start]
