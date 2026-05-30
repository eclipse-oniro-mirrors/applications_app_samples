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
// [Start frameNodeTypeNode_start_sta]
import {
  Button,
  ClickEvent,
  Color,
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
  UIContext,
  Visibility,
  State,
  typeNode,
} from '@kit.ArkUI';

const TEST_TAG: string = 'FrameNode'

export class MyNodeController extends NodeController {
  public frameNode: typeNode.Column | null = null;
  public uiContext: UIContext | undefined = undefined;
  private rootNode: FrameNode | null = null;
  private message: string = 'DEFAULT';

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.uiContext = uiContext;
    this.frameNode = typeNode.createColumnNode(uiContext);
    this.frameNode!.attribute
      .width('100%')
      .height('100%')
      .customProperty('key1', 'value1')
      .visibility(Visibility.Visible)
      .opacity(0.7)
      .id('buildText');
    this.frameNode!.commonAttribute.width(50).height(50).backgroundColor(Color.Yellow);
    this.rootNode!.appendChild(this.frameNode!);
    return this.rootNode;
  }

  removeChild(frameNode: FrameNode): void {
    let parent = frameNode.getParent();
    if (parent) {
      parent.removeChild(frameNode);
    }
  }

  getUserConfigBorderWidth(frameNode: FrameNode): void {
    let userConfigBorderWidth = frameNode?.getUserConfigBorderWidth(); // 获取用户设置的边框宽度。
    console.info('FrameNode:left.unit:' + userConfigBorderWidth?.left?.unit + ',left.value:' +
      userConfigBorderWidth?.left?.value
      + 'right.unit:' + userConfigBorderWidth?.right?.unit + ',right.value:' + userConfigBorderWidth?.right?.value
      + 'top.unit:' + userConfigBorderWidth?.top?.unit + ',top.value:' + userConfigBorderWidth?.top?.value
      + 'bottom.unit:' + userConfigBorderWidth?.bottom?.unit + ',bottom.value:' + userConfigBorderWidth?.bottom?.value);
  }

  getUserConfigPadding(frameNode: FrameNode): void {
    let userConfigPadding = frameNode?.getUserConfigPadding(); // 获取用户设置的内边距。
    console.info('FrameNode:left.unit:' + userConfigPadding?.left?.unit + ',left.value:' +
      userConfigPadding?.left?.value
      + 'right.unit:' + userConfigPadding?.right?.unit + ',right.value:' + userConfigPadding?.right?.value
      + 'top.unit:' + userConfigPadding?.top?.unit + ',top.value:' + userConfigPadding?.top?.value
      + 'bottom.unit:' + userConfigPadding?.bottom?.unit + ',bottom.value:' + userConfigPadding?.bottom?.value);
  }

  getUserConfigMargin(frameNode: FrameNode): void {
    let userConfigMargin = frameNode?.getUserConfigMargin(); // 获取用户设置的外边距。
    console.info('FrameNode:left.unit:' + userConfigMargin?.left?.unit + ',left.value:' + userConfigMargin?.left?.value
      + 'right.unit:' + userConfigMargin?.right?.unit + ',right.value:' + userConfigMargin?.right?.value
      + 'top.unit:' + userConfigMargin?.top?.unit + ',top.value:' + userConfigMargin?.top?.value
      + 'bottom.unit:' + userConfigMargin?.bottom?.unit + ',bottom.value:' + userConfigMargin?.bottom?.value);
  }

  getUserConfigSize(frameNode: FrameNode): void {
    let userConfigSize = frameNode?.getUserConfigSize(); // 获取用户设置的宽高。
    console.info('FrameNode:width.unit:' + userConfigSize?.width?.unit + ',width.value:' + userConfigSize?.width?.value
      + 'height.unit:' + userConfigSize?.height?.unit + ',height.value:' + userConfigSize?.height?.value);
  }

  getId(frameNode: FrameNode): void {
    let id = frameNode?.getId(); // 获取用户设置的节点ID。
    console.info(`${TEST_TAG} ${id}`);
  }

  getUniqueId(frameNode: FrameNode): void {
    let uniqueId = frameNode?.getUniqueId(); // 获取系统分配的唯一标识的节点UniqueID。
    console.info(`${TEST_TAG} ${uniqueId}`);
  }

  getNodeType(frameNode: FrameNode): void {
    let nodeType = frameNode?.getNodeType(); // 获取节点的类型。
    console.info(`${TEST_TAG} ${nodeType}`);
  }

  getOpacity(frameNode: FrameNode): void {
    let opacity = frameNode?.getOpacity(); // 获取节点的不透明度。
    console.info(`${TEST_TAG} ${opacity}`);
  }

  isVisible(frameNode: FrameNode): void {
    let visible = frameNode?.isVisible(); // 获取节点是否可见。
    console.info('FrameNode:' + visible);
  }

  isClipToFrame(frameNode: FrameNode): void {
    let clipToFrame = frameNode?.isClipToFrame(); // 获取节点是否是剪裁到组件区域。
    console.info(`${TEST_TAG} ${clipToFrame}`);
  }

  isAttached(frameNode: FrameNode): void {
    let attached = frameNode?.isAttached(); // 获取节点是否被挂载到主节点树上。
    console.info(`${TEST_TAG} ${attached}`);
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();
  @State index: number = 0;

  build(): void {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
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

      Button('getUserConfigBorderWidth')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getUserConfigBorderWidth(node);
            }
          }
        })
      Button('getUserConfigPadding')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getUserConfigPadding(node);
            }
          }
        })
      Button('getUserConfigMargin')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getUserConfigMargin(node);
            }
          }
        })
      Button('getUserConfigSize')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getUserConfigSize(node);
            }
          }
        })
      Button('getId')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getId(node);
            }
          }
        })
      Button('getUniqueId')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getUniqueId(node);
            }
          }
        })
      Button('getNodeType')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getNodeType(node);
            }
          }
        })
      Button('getOpacity')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.getOpacity(node);
            }
          }
        })
      Button('isVisible')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.isVisible(node);
            }
          }
        })
      Button('isClipToFrame')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.isClipToFrame(node);
            }
          }
        })
      Button('isAttached')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              this.myNodeController.isAttached(node);
            }
          }
        })
      Button('remove Text')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('textTypeNode') || null;
            if (node) {
              this.myNodeController.removeChild(node);
              this.myNodeController.isAttached(node);
            }
          }
        })
      Button('getCustomProperty')
        .width(300)
        .onClick((event: ClickEvent) => {
          const uiContext: UIContext = this.getUIContext();
          if (uiContext) {
            const node: FrameNode | null = uiContext.getFrameNodeById('buildText') || null;
            if (node) {
              const property = node.getCustomProperty('key1');
              console.info(TEST_TAG, property);
            }
          }
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
// [End frameNodeTypeNode_start_sta]
