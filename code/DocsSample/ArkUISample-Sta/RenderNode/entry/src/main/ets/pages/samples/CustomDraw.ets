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

// [Start custom_draw_sta]
import {
  Button,
  ClickEvent,
  Column,
  Component,
  DrawContext,
  Entry,
  FrameNode,
  NodeContainer,
  NodeController,
  RenderNode,
  UIContext
} from '@kit.ArkUI';
import { drawing } from '@kit.ArkGraphics2D';

export class MyRenderNode extends RenderNode {
  width: number = 200;

  draw(context: DrawContext): void {
    // 获取canvas对象
    const canvas = context.canvas;
    const brush = new drawing.Brush();
    brush.setColor({
      alpha: 255,
      red: 81,
      green: 157,
      blue: 180
    })
    canvas.attachBrush(brush);
    // 绘制矩阵
    canvas.drawRect({
      left: 0,
      right: this.width,
      top: 0,
      bottom: 200
    });
    canvas.detachBrush();
  }
}

const renderNode = new MyRenderNode();
renderNode.frame = {
  x: 0,
  y: 0,
  width: 300,
  height: 300
};
renderNode.backgroundColor = 0xffd5d5d5.toInt();
renderNode.opacity = 0.5;

class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode?.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode!.frame = {
        x: 0,
        y: 0,
        width: 500,
        height: 500
      }
      rootRenderNode!.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Column() {
      NodeContainer(this.myNodeController)
        .width('100%')
        .height(320)
      Button('Invalidate')
        .onClick((event: ClickEvent) => {
          // 同步调用多次，仅触发一次重绘，draw回调中的日志仅打印一次
          renderNode.width += 10;
          renderNode.invalidate();
          renderNode.invalidate();
        })
    }
  }
}
// [End custom_draw_sta]
