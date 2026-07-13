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
// [End frameNodeDisposed_start_sta]
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
  FontWeight,
  FrameNode,
  NodeContainer,
  NodeController,
  Text,
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

@Component
struct TestComponent {
  build() {
    Column() {
      Text('This is a BuilderNode.')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .backgroundColor(Color.Gray)
  }

  aboutToAppear() {
    console.error(TEST_TAG + ' aboutToAppear');
  }

  aboutToDisappear() {
    console.error(TEST_TAG + ' aboutToDisappear');
  }
}

@Builder
function buttonBuilder(params: Params) {
  Column({ space: 10 } as ColumnOptions) {
    TestComponent()
  }
}

type paramsbuilder = @Builder
(a: Params) => void;

export class MyNodeController extends NodeController {
  public builderNode: BuilderNode<Params> | null = null;
  public rootNode: FrameNode | null = null;
  private wrapBuilder: WrappedBuilder<paramsbuilder> = wrapBuilder(buttonBuilder);

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode == null) {
      this.rootNode = new FrameNode(uiContext);
      this.rootNode!.commonAttribute
        .width('50%')
        .height(150)
        .borderWidth(1)
        .backgroundColor(0xff33ff33.toInt());
    }

    if (this.builderNode == null) {
      this.builderNode = new BuilderNode<Params>(uiContext!);
      this.builderNode!.build(this.wrapBuilder, new Params('This is a Text'))
      this.rootNode!.appendChild(this.builderNode!.getFrameNode()!)
    }
    return this.rootNode;
  }

  printUniqueId(): void {
    if (this.rootNode !== null && this.builderNode !== null) {
      console.info(`${TEST_TAG} rootNode's uniqueId: ${this.rootNode!.getUniqueId()}`);
      const frameNode = this.builderNode!.getFrameNode();
      if (frameNode) {
        console.info(`${TEST_TAG} the uniqueId of builderNode's framenode: ${frameNode!.getUniqueId()}`);
      } else {
        console.info(`${TEST_TAG} builderNode's framenode is undefined`);
      }
    }
  }

  disposeFrameNode(): void {
    if (this.rootNode !== null && this.builderNode !== null && this.builderNode!.getFrameNode()) {
      console.info(`${TEST_TAG} disposeFrameNode`);
      this.rootNode!.removeChild(this.builderNode!.getFrameNode()!);
      this.builderNode?.dispose();

      this.rootNode?.dispose();
    }
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Column({ space: 4 } as ColumnOptions) {
      NodeContainer(this.myNodeController)
      Button('FrameNode dispose')
        .onClick((event: ClickEvent) => {
          this.myNodeController.printUniqueId();
          this.myNodeController.disposeFrameNode();
          this.myNodeController.printUniqueId();
        })
        .width('100%')
    }
  }
}
// [End frameNodeDisposed_start_sta]
