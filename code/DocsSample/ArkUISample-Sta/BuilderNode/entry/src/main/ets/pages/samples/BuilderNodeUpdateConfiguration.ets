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
// [Start BuilderNodeUpdateConfigurationSta]
import {
  $r,
  Builder,
  Button,
  ClickEvent,
  Column,
  Component,
  Entry,
  FontWeight,
  NodeContainer,
  Row,
  Text,
  UIContext,
  wrapBuilder,
  State,
  BuilderNode,
  FrameNode,
  NodeController
} from '@kit.ArkUI';

export class Params {
  text: string = '';

  constructor(text: string) {
    this.text = text;
  }
}

@Builder
function buildText(params: Params) {
  Column() {
    Text(params.text)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
  }.backgroundColor($r('sys.color.ohos_id_color_background'))
}

export class TextNodeController extends NodeController {
  private textNode: BuilderNode<Params> | null = null;
  private message: string = '';

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    return this.textNode?.getFrameNode() ? this.textNode!.getFrameNode()! : null;
  }

  createNode(context: UIContext): void {
    this.textNode = new BuilderNode<Params>(context);
    this.textNode!.build(wrapBuilder(buildText), new Params(this.message));
    builderNodeMap.push(this.textNode!);
  }

  deleteNode(): void {
    let node = builderNodeMap.pop();
    node?.dispose();
  }

  update(message: string): void {
    if (this.textNode !== null) {
      // 调用update进行更新。
      this.textNode!.update(new Params(message));
    }
  }
}

// 记录创建的自定义节点对象
const builderNodeMap: Array<BuilderNode<Params>> = new Array<BuilderNode<Params>>();

function updateColorMode(): void {
  builderNodeMap.forEach((value, index) => {
    // 通知BuilderNode环境变量改变，触发深浅色切换
    value.updateConfiguration();
  })
}

@Entry
@Component
struct Index {
  @State message: string = 'hello';
  private textNodeController: TextNodeController = new TextNodeController(this.message);
  private count: number = 0;

  aboutToAppear(): void {
    //创建自定义节点并添加至map
    this.textNodeController.createNode(this.getUIContext());
  }

  aboutToDisappear(): void {
    //移除map中的引用，并将自定义节点释放
    this.textNodeController.deleteNode();
  }

  build(): void {
    Row() {
      Column() {
        NodeContainer(this.textNodeController)
          .width('100%')
          .height(200)
          .backgroundColor('#FFF0F0F0')
        Button('Update')
          .onClick((event: ClickEvent) => {
            this.count += 1;
            const message = 'Update ' + this.count.toString();
            this.textNodeController.update(message);
          })
        Button('通知切换环境变量')
          .onClick((event: ClickEvent) => {
            updateColorMode()
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
// [End BuilderNodeUpdateConfigurationSta]
