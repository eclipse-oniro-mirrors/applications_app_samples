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
// [Start frameNodeCommon_start_sta]
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
  LayoutPolicy,
  Length,
  NodeContainer,
  NodeController,
  Padding,
  Position,
  ResourceColor,
  Text,
  UIContext,
  WrappedBuilder,
  wrapBuilder
} from '@kit.ArkUI';

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
  public rootNode: FrameNode | null = null;
  private wrapBuilder: WrappedBuilder<paramsbuilder> = wrapBuilder(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode == null) {
      this.rootNode = new FrameNode(uiContext);
      // 对rootNode进行属性修改，该节点为自定义的FrameNode节点，修改生效。
      this.rootNode!.commonAttribute
        .width('100%')
        .height(100)
        .borderWidth(1)
        .backgroundColor(Color.Gray)
    }

    if (this.frameNode == null) {
      this.frameNode = new FrameNode(uiContext);
      // 对frameNode进行属性修改，该节点为自定义的FrameNode节点，修改生效。
      this.frameNode!.commonAttribute
        .width('50%')
        .height(50)
        .borderWidth(1)
        .backgroundColor(Color.Pink);
      this.rootNode!.appendChild(this.frameNode!);
    }
    if (this.buttonNode == null) {
      this.buttonNode = new BuilderNode<Params>(uiContext!);
      this.buttonNode!.build(this.wrapBuilder, new Params('This is a Button'))
      // 对BuilderNode中获取的FrameNode进行属性修改，该节点非自定义的FrameNode节点，修改不生效。
      this.buttonNode?.getFrameNode()?.commonAttribute.position({ x: 100, y: 100 } as Position)
      this.rootNode!.appendChild(this.buttonNode!.getFrameNode()!)
    }
    return this.rootNode;
  }

  modifyNode(frameNode: FrameNode | null | undefined, widthValue: Length | LayoutPolicy | undefined,
    backgroundColorValue: ResourceColor | undefined): void {
    if (frameNode) {
      frameNode.commonAttribute
        .width(widthValue)
        .backgroundColor(backgroundColorValue);
    }
  }

  modifyNodeSize(frameNode: FrameNode | null | undefined, heightValue: Length | LayoutPolicy | undefined,
    widthValue: Length | LayoutPolicy | undefined, positionValue: Position): void {
    if (frameNode) {
      frameNode.commonAttribute
        .height(heightValue)
        .width(widthValue)
        .position(positionValue);
    }
  }

  addClickEvent(frameNode: FrameNode | null | undefined): void {
    if (frameNode) {
      frameNode.commonEvent.setOnClick((event: ClickEvent) => {
        console.info(`FrameNode ${JSON.stringify(event)}`);
      })
    }
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column({ space: 10 } as ColumnOptions) {
        Text('修改节点通用属性-宽高')
        Button('modify ArkTS-FrameNode')
          .onClick((event: ClickEvent) => {
            // 获取到的是当前页面中的开发者创建的FrameNode对象，该节点可修改。即节点宽与背景色。
            console.info('Check the weather the node can be modified ' + this.myNodeController?.frameNode
            ?.isModifiable());
            this.myNodeController.modifyNodeSize(this.myNodeController?.frameNode, 100, 150, { x: 100, y: 0 })
          })
        Button('modify FrameNode get by BuilderNode')
          .onClick((event: ClickEvent) => {
            // 获取到的是当前页面中的BuilderNode的根节点，该节点不可修改。即节点宽与背景色未发生改变。
            console.info('Check the weather the node can be modified ' +
              this.myNodeController?.buttonNode?.getFrameNode()
              ?.isModifiable());
            this.myNodeController.modifyNode(this.myNodeController?.buttonNode?.getFrameNode(), 150, Color.Gray)
          })
        Button('modify proxyFrameNode get by search')
          .onClick((event: ClickEvent) => {
            // rootNode调用getParent()获取到的是当前页面中的NodeContainer节点，该节点不可修改。即节点宽与背景色未发生改变。
            console.info('Check the weather the node can be modified ' + this.myNodeController?.rootNode?.getParent()
            ?.isModifiable());
            this.myNodeController.modifyNode(this.myNodeController?.rootNode?.getParent(), 150, Color.Gray)
          })
      }
      .padding({
        left: 35,
        right: 35,
        top: 35,
        bottom: 35
      } as Padding)

      Column({ space: 10 } as ColumnOptions) {
        Text('修改节点点击事件')
        Button('add click event to ArkTS-FrameNode')
          .onClick((event: ClickEvent) => {
            // 获取到的是当前页面中的开发者创建的FrameNode对象，该节点可增加点击事件。
            // 增加的点击事件参与事件竞争，即点击事件会在该节点被消费且不不再向父组件冒泡。
            console.info('Check the weather the node can be modified ' + this.myNodeController?.rootNode?.getParent()
            ?.isModifiable());
            this.myNodeController.addClickEvent(this.myNodeController?.frameNode)
          })
        Button('add click event to FrameNode get by BuilderNode')
          .onClick((event: ClickEvent) => {
            // 获取到的是当前页面中的BuilderNode的根节点，该类节点可增加点击事件。
            // 点击的时候优先回调通过系统组件接口设置的click事件回调，然后回调通过commonEvent增加的click监听。
            console.info('Check the weather the node can be modified ' +
              this.myNodeController?.buttonNode?.getFrameNode()
              ?.isModifiable());
            this.myNodeController.addClickEvent(this.myNodeController?.buttonNode?.getFrameNode())
          })
        Button('add click event to proxyFrameNode get by search')
          .onClick((event: ClickEvent) => {
            // rootNode调用getParent()获取到的是当前页面中的NodeContainer节点，该类节点可增加点击事件。
            console.info('Check the weather the node can be modified ' + this.myNodeController?.rootNode?.getParent()
            ?.isModifiable());
            this.myNodeController.addClickEvent(this.myNodeController?.rootNode?.getParent());
          })
      }
      .padding({
        left: 35,
        right: 35,
        top: 35,
        bottom: 35
      } as Padding)

      NodeContainer(this.myNodeController)
        .borderWidth(1)
        .width('100%')
        .height(100)
        .onClick((event: ClickEvent) => {
          console.info(`NodeContainer ${JSON.stringify(event)}`);
        })
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
// [End frameNodeCommon_start_sta]
