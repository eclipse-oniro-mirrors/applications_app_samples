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
// [Start BuilderNodeRenderNodeSta]
import {
  Builder,
  Column,
  Component,
  Entry,
  FontWeight,
  NodeContainer,
  Row,
  Text,
  UIContext,
  wrapBuilder,
  BuilderNode,
  FrameNode,
  NodeController,
  RenderNode,
  State
} from '@kit.ArkUI';

export class Params {
  text: string = "";

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
  private rootNode: FrameNode | null = null;
  private textNode: BuilderNode<Params> | null = null;
  private message: string = "DEFAULT";

  constructor(message: string) {
    super();
    this.message = message;
  }

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(context);
    let renderNode = new RenderNode();
    renderNode.clipToFrame = false;
    this.textNode = new BuilderNode<Params>(context, { selfIdealSize: { width: 150, height: 150 } });
    this.textNode?.build(wrapBuilder(buildText), new Params(this.message));
    const textRenderNode = this.textNode?.getFrameNode()?.getRenderNode();
    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null && textRenderNode) {
      rootRenderNode!.appendChild(renderNode);
      renderNode.appendChild(textRenderNode!);
    }
    return this.rootNode!;
  }
}

@Entry
@Component
struct Index {
  @State message: string = "hello";

  build(): void {
    Row() {
      Column() {
        NodeContainer(new TextNodeController(this.message))
          .width('100%')
          .height(100)
          .backgroundColor('#FFF0F0F0')
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
// [End BuilderNodeRenderNodeSta]
