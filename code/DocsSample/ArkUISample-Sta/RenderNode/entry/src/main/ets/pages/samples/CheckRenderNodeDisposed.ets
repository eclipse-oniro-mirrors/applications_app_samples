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
// [Start rendernode_is_dispose_sta]
import {
  Button,
  Column,
  Component,
  Entry,
  FrameNode,
  NodeContainer,
  NodeController,
  RenderNode,
  State,
  Text,
  UIContext,
  ColumnOptions
} from '@kit.ArkUI';

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;
  private renderNode: RenderNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);
    this.renderNode = new RenderNode();
    this.renderNode!.size = { width: 300, height: 300 };
    this.renderNode!.backgroundColor = 0xffd5d5d5.toInt();

    // 挂载RenderNode
    this.rootNode!.getRenderNode()?.appendChild(this.renderNode!);
    return this.rootNode;
  }

  disposeRenderNode(): void {
    // 解除RenderNode与后端实体节点的引用关系
    this.renderNode?.dispose();
  }

  isDisposed(): string {
    if (this.renderNode !== null) {
      // 查询RenderNode是否解除引用
      if (this.renderNode!.isDisposed()) {
        return 'renderNode isDisposed is true';
      } else {
        return 'renderNode isDisposed is false';
      }
    }
    return 'renderNode is null';
  }
}

@Entry
@Component
export struct CheckRenderNodeDisposed {
  @State text: string = '';
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Column({ space: 4 } as ColumnOptions) {
      NodeContainer(this.myNodeController);
      Button('RenderNode dispose')
        .onClick(() => {
          this.myNodeController.disposeRenderNode();
          this.text = '';
        })
        .width(200)
        .height(50);
      Button('RenderNode isDisposed')
        .onClick(() => {
          this.text = this.myNodeController.isDisposed();
        })
        .width(200)
        .height(50);
      Text(this.text)
        .fontSize(25);
    }
    .width('100%')
    .height('100%');
  }
}
// [End rendernode_is_dispose_sta]
