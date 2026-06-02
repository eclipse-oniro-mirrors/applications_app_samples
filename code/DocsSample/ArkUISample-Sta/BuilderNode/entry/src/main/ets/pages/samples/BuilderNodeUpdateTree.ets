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
// [Start BuilderNodeUpdateTreeSta]
import {
  Builder,
  Button,
  ClickEvent,
  Color,
  Column,
  Component,
  Entry,
  FontWeight,
  NodeContainer,
  Row,
  Text,
  UIContext,
  wrapBuilder,
  PropRef,
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
  }
}

export class TextNodeController extends NodeController {
  private textNode: BuilderNode<Params> | null = null;
  private message: string = '';

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.textNode = new BuilderNode<Params>(context);
    this.textNode!.build(wrapBuilder(buildText), new Params(this.message));
    return this.textNode!.getFrameNode()!;
  }

  update(message: string): void {
    if (this.textNode !== null) {
      this.textNode!.update(new Params(message));
    }
  }
}

@Entry
@Component
struct Index {
  @State message: string = 'hello';
  private textNodeController: TextNodeController = new TextNodeController(this.message);
  private count: number = 0;

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
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
// [End BuilderNodeUpdateTreeSta]