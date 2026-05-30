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
// [Start frameNodeMoveTo_start_sta]
import {
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  Entry,
  FrameNode,
  NodeContainer,
  NodeController,
  RowOptions,
  UIContext,
  typeNode
} from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export class MyNodeController extends NodeController {
  uiContext: UIContext | null = null;
  rootNode: FrameNode | null = null;
  rowNode: FrameNode | null = null;
  stackNode1: FrameNode | null = null;
  stackNode2: FrameNode | null = null;
  stackNode3: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    this.rootNode = new FrameNode(uiContext);

    const row = typeNode.createRowNode(this.uiContext!);
    row.initialize({ space: 10 } as RowOptions);
    this.rowNode = row;
    this.rootNode!.appendChild(this.rowNode!);

    const stack1 = typeNode.createStackNode(this.uiContext!);
    stack1.commonAttribute.width(50).height(50).backgroundColor(Color.Pink);
    this.stackNode1 = stack1;
    this.rowNode?.appendChild(this.stackNode1!);
    const stack2 = typeNode.createStackNode(this.uiContext!);
    stack2.commonAttribute.width(50).height(50).backgroundColor(Color.Yellow);
    this.stackNode2 = stack2;
    this.rowNode?.appendChild(this.stackNode2!);
    const stack3 = typeNode.createStackNode(this.uiContext!);
    stack3.commonAttribute.width(50).height(50).backgroundColor(Color.Green);
    this.stackNode3 = stack3;
    this.rowNode?.appendChild(this.stackNode3!);

    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private myNodeController1: MyNodeController = new MyNodeController()
  private myNodeController2: MyNodeController = new MyNodeController()

  build(): void {
    Column({ space: 20 } as ColumnOptions) {
      NodeContainer(this.myNodeController1)
      NodeContainer(this.myNodeController2)
      Button('move')
        .onClick((event: ClickEvent) => {
          try {
            this.myNodeController1.stackNode1?.moveTo(this.myNodeController2.rowNode!, 2);
          } catch (err) {
            console.info('wll moveTo:' + (err as BusinessError).code + ' : ' + (err as BusinessError).message);
            console.info('wll moveTo  result: fail.');
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}
// [End frameNodeMoveTo_start_sta]
