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
// [Start frameNodeTree_start_sta]
import { BusinessError } from '@kit.BasicServicesKit';
import {
  Builder,
  BuilderNode,
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
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
  Position,
  Row,
  SizeOptions,
  State,
  Text,
  TextAlign,
  UIContext,
  WrappedBuilder,
  wrapBuilder
} from '@kit.ArkUI';

const TEST_TAG: string = 'FrameNode'

export class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buttonBuilder(params: Params) {
  Column({ space: 10 } as ColumnOptions) {
    Button(params.text)
      .fontSize(12)
      .borderRadius(8)
      .borderWidth(2)
      .backgroundColor(Color.Orange)

    Button(params.text)
      .fontSize(12)
      .borderRadius(8)
      .borderWidth(2)
      .backgroundColor(Color.Pink)
  }
}

type paramsbuilder = @Builder
(a: Params) => void;

export class MyNodeController extends NodeController {
  public buttonNode: BuilderNode<Params> | null = null;
  public frameNode: FrameNode | null = null;
  public childList: Array<FrameNode> = new Array<FrameNode>();
  public rootNode: FrameNode | null = null;
  private uiContext: UIContext | null = null;
  private wrapBuilder: WrappedBuilder<paramsbuilder> = wrapBuilder(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    if (this.rootNode == null) {
      this.rootNode = new FrameNode(uiContext);
      this.rootNode!.commonAttribute
        .width('50%')
        .height(100)
        .borderWidth(1)
        .backgroundColor(Color.Gray)
    }

    if (this.frameNode == null) {
      this.frameNode = new FrameNode(uiContext);
      this.frameNode!.commonAttribute
        .width('100%')
        .height(50)
        .borderWidth(1)
        .position({ x: 200, y: 0 } as Position)
        .backgroundColor(Color.Pink);
      this.rootNode!.appendChild(this.frameNode!);
    }
    if (this.buttonNode == null) {
      this.buttonNode = new BuilderNode<Params>(uiContext!);
      this.buttonNode!.build(this.wrapBuilder, new Params('This is a Button'))
      this.rootNode!.appendChild(this.buttonNode!.getFrameNode()!)
    }
    return this.rootNode;
  }

  operationFrameNodeWithFrameNode(frameNode: FrameNode | undefined | null): void {
    if (frameNode) {
      console.info(TEST_TAG + ' get ArkTSNode success.')
      console.info(TEST_TAG + ' check rootNode whether is modifiable ' + frameNode.isModifiable());
    }
    if (this.uiContext) {
      let frameNode1 = new FrameNode(this.uiContext!);
      let frameNode2 = new FrameNode(this.uiContext!);
      frameNode1.commonAttribute.size({ width: 50, height: 50 } as SizeOptions)
        .backgroundColor(Color.Black)
        .position({ x: 50, y: 60 } as Position)
      frameNode2.commonAttribute.size({ width: 50, height: 50 } as SizeOptions)
        .backgroundColor(Color.Orange)
        .position({ x: 120, y: 60 } as Position)
      try {
        frameNode?.appendChild(frameNode1);
        console.info(TEST_TAG + ' appendChild success ');
      } catch (err) {
        console.info(TEST_TAG + ' appendChild fail :' + (err as BusinessError).code + ' : ' +
          (err as BusinessError).message);
      }
      try {
        frameNode?.insertChildAfter(frameNode2, null);
        console.info(TEST_TAG + ' insertChildAfter success ');
      } catch (err) {
        console.info(TEST_TAG + ' insertChildAfter fail : ' + (err as BusinessError).code + ' : ' +
          (err as BusinessError).message);
      }
      setTimeout(() => {
        try {
          if (frameNode?.getChild(0)) {
            frameNode?.removeChild(frameNode?.getChild(0)!)
          }
          console.info(TEST_TAG + ' removeChild success ');
        } catch (err) {
          console.info(TEST_TAG + ' removeChild fail : ' + (err as BusinessError).code + ' : ' +
            (err as BusinessError).message);
        }
      }, 2000)
      setTimeout(() => {
        try {
          frameNode?.clearChildren();
          console.info(TEST_TAG + ' clearChildren success ');
        } catch (err) {
          console.info(TEST_TAG + ' clearChildren fail : ' + (err as BusinessError).code + ' : ' +
            (err as BusinessError).message);
        }
      }, 4000)
    }
  }

  testInterfaceAboutSearch(frameNode: FrameNode | undefined | null): string {
    let result: string = '';
    if (frameNode) {
      result = result + `current node is ${frameNode.getNodeType()} \n`;
      result = result + `parent node is ${frameNode.getParent()?.getNodeType()} \n`;
      result = result + `child count is ${frameNode.getChildrenCount()} \n`;
      result = result + `first child node is ${frameNode.getFirstChild()?.getNodeType()} \n`;
      result = result + `second child node is ${frameNode.getChild(1)?.getNodeType()} \n`;
      result = result + `previousSibling node is ${frameNode.getPreviousSibling()?.getNodeType()} \n`;
      result = result + `nextSibling node is ${frameNode.getNextSibling()?.getNodeType()} \n`;
    }
    return result;
  }

  checkAppendChild(parent: FrameNode | undefined | null, child: FrameNode | undefined | null): void {
    try {
      if (parent && child) {
        parent.appendChild(child);
        console.info(TEST_TAG + ' appendChild success ');
      }
    } catch (err) {
      console.info(TEST_TAG + ' appendChild fail : ' + (err as BusinessError).code + ' : ' +
        (err as BusinessError).message);
    }
  }
}

@Entry
@Component
struct Index {
  @State index: number = 0;
  @State result: string = ''
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column() {
        Row() {
          Column({ space: 5 } as ColumnOptions) {
            Text('验证FrameNode子节点的增、删、改功能')
            Button('对自定义FrameNode进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对FrameNode节点进行增、删、改操作，正常实现。
                this.myNodeController.operationFrameNodeWithFrameNode(this.myNodeController?.frameNode);
              })
            Button('对BuilderNode中的代理节点进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对BuilderNode代理节点进行增、删、改操作，捕获异常信息。
                this.myNodeController.operationFrameNodeWithFrameNode(this.myNodeController?.buttonNode?.getFrameNode());
              })
            Button('对系统组件中的代理节点进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对代理节点进行增、删、改操作，捕获异常信息。
                this.myNodeController.operationFrameNodeWithFrameNode(this.myNodeController?.rootNode?.getParent());
              })
          }
        }

        Row() {
          Column({ space: 5 } as ColumnOptions) {
            Text('验证FrameNode添加子节点的特殊场景')
            Button('新增BuilderNode的代理节点')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                let buttonNode = new BuilderNode<Params>(this.getUIContext());
                let wrapBuilder1: WrappedBuilder<paramsbuilder> = wrapBuilder(buttonBuilder);
                buttonNode.build(wrapBuilder1, new Params('BUTTON'))
                this.myNodeController.checkAppendChild(this.myNodeController?.frameNode, buttonNode?.getFrameNode());
              })
            Button('新增系统组件代理节点')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                this.myNodeController.checkAppendChild(this.myNodeController?.frameNode,
                  this.myNodeController?.rootNode?.getParent());
              })
            Button('新增已有父节点的自定义节点')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                this.myNodeController.checkAppendChild(this.myNodeController?.frameNode,
                  this.myNodeController?.rootNode);
              })
          }
        }

        Row() {
          Column({ space: 5 } as ColumnOptions) {
            Text('验证FrameNode节点的查询功能')
            Button('对自定义FrameNode进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对FrameNode节点进行查询。当前节点为NodeContainer的子节点。
                this.result = this.myNodeController.testInterfaceAboutSearch(this.myNodeController?.rootNode);
                setTimeout((event: ClickEvent) => {
                  // 对FrameNode节点进行查询。rootNode下的第一个子节点。
                  this.result = this.myNodeController.testInterfaceAboutSearch(this.myNodeController?.frameNode);
                }, 2000)
              })
            Button('对BuilderNode中的代理节点进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对BuilderNode代理节点进行查询。当前节点为BuilderNode中的Column节点。
                this.result =
                  this.myNodeController.testInterfaceAboutSearch(this.myNodeController?.buttonNode?.getFrameNode());
              })
            Button('对系统组件中的代理节点进行操作')
              .fontSize(16)
              .width(400)
              .onClick((event: ClickEvent) => {
                // 对代理节点进行查询。当前节点为NodeContainer。
                this.result =
                  this.myNodeController.testInterfaceAboutSearch(this.myNodeController?.rootNode?.getParent());
              })
          }
        }
      }

      Text(`Result：\n${this.result}`)
        .fontSize(16)
        .width(400)
        .borderWidth(1)
      Column() {
        Text('This is a NodeContainer.')
          .textAlign(TextAlign.Center)
          .borderRadius(10)
          .backgroundColor(0xFFFFFF)
          .width('100%')
          .fontSize(16)
        NodeContainer(this.myNodeController)
          .borderWidth(1)
          .width(400)
          .height(150)
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
// [End frameNodeTree_start_sta]
