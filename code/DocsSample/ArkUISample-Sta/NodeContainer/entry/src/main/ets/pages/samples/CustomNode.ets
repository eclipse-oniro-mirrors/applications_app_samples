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
// [Start place_holder_custom_node_sta]
import {
  Builder,
  BuilderNode,
  Button,
  Color,
  Column,
  Component,
  Entry,
  FrameNode,
  NodeController,
  NodeContainer,
  Size,
  TouchEvent,
  UIContext,
  wrapBuilder
} from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export class Params {
  public text: string = 'this is a text';
}

let buttonNode: BuilderNode<Params> | null = null;

@Builder
function buttonBuilder(params: Params) {
  Column() {
    Button(params.text)
      .fontSize(12)
      .borderRadius(8)
      .borderWidth(2)
      .backgroundColor(Color.Orange)
  }
}

export function createNode(uiContext: UIContext): BuilderNode<Params> {
  buttonNode = new BuilderNode<Params>(uiContext);
  buttonNode!.build(wrapBuilder(buttonBuilder), new Params());
  return buttonNode!;
}

export function getOrCreateNode(uiContext: UIContext): BuilderNode<Params> | null {
  if (buttonNode?.getFrameNode() && buttonNode?.getFrameNode()?.getUniqueId() != -1) {
    return buttonNode;
  } else {
    return createNode(uiContext);
  }
}

const DOMAIN = 0xF811
const TAG = '[Sample_ArkTSUserPlaceHolder]';

export class MyNodeController extends NodeController {
  private isShow: boolean = false;

  constructor(isShow: boolean) {
    super();
    this.isShow = isShow;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (!this.isShow) {
      return null;
    }
    let frameNode = getOrCreateNode(uiContext)?.getFrameNode();
    return frameNode ? frameNode : null;
  }

  aboutToResize(size: Size): void {
    hilog.info(DOMAIN, TAG, ' aboutToResize width : ' + size.width + ' height : ' + size.height);
  }

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, ' aboutToAppear');
  }

  aboutToDisappear(): void {
    hilog.info(DOMAIN, TAG, ' aboutToDisappear');
  }

  onTouchEvent(event: TouchEvent): void {
    hilog.info(DOMAIN, TAG, ' onTouchEvent');
  }

  toShow(): void {
    this.isShow = true;
    this.rebuild();
  }

  toHide(): void {
    this.isShow = false;
    this.rebuild();
  }
}

@Entry
@Component
struct Index {
  private myNodeController1: MyNodeController = new MyNodeController(true);
  private myNodeController2: MyNodeController = new MyNodeController(false);

  build(): void {
    Column() {
      NodeContainer(this.myNodeController1)
        .width('100%')
        .height('40%')
        .backgroundColor(Color.Brown)
      NodeContainer(this.myNodeController2)
        .width('100%')
        .height('40%')
        .backgroundColor(Color.Gray)
      Button('Change the place of button')
        .onClick(() => {
          // 先在原始占位节点中下树
          // 后在新的占位节点中上树
          // 保证自定义节点仅作为一个节点的子节点存在
          this.myNodeController1.toHide();
          this.myNodeController2.toShow();
        })
    }
    .padding({ left: 35, right: 35, top: 35 })
    .width('100%')
    .height('100%')
  }
}
// [End place_holder_custom_node_sta]
