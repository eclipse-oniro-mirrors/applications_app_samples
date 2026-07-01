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
// [Start frameNodeDraw_start_sta]
import {
  Button,
  ClickEvent,
  Color,
  Column,
  ColumnOptions,
  Component,
  DrawContext,
  Entry,
  FrameNode,
  LayoutConstraint,
  NodeContainer,
  NodeController,
  Padding,
  Position,
  Row,
  Size,
  UIContext
} from '@kit.ArkUI';
import { drawing } from '@kit.ArkGraphics2D';
import { Vector2 } from 'arkui.Graphics';


function GetChildLayoutConstraint(constraint: LayoutConstraint, child: FrameNode): LayoutConstraint {
  const size = child.getUserConfigSize();
  const width = Math.max(
    Math.min(constraint.maxSize.width, size.width.value),
    constraint.minSize.width
  );
  const height = Math.max(
    Math.min(constraint.maxSize.height, size.height.value),
    constraint.minSize.height
  );
  const finalSize: Size = { width, height };
  const res: LayoutConstraint = {
    maxSize: finalSize,
    minSize: finalSize,
    percentReference: finalSize
  };

  return res;
}

export class MyFrameNode extends FrameNode {
  public width: number = 100;
  public offsetY: number = 0;
  private space: number = 1;
  uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super(uiContext);
    this.uiContext = uiContext;
  }

  onDraw(context: DrawContext): void {
    const size = context.size;
    const canvas = context.canvas;
    const pen = new drawing.Pen();
    pen.setStrokeWidth(15)
    pen.setColor({
      alpha: 255,
      red: 255,
      green: 0,
      blue: 0
    });
    canvas.attachPen(pen);
    canvas.drawRect({
      left: 50,
      right: this.width + 50,
      top: 50,
      bottom: this.width + 50
    })
    canvas.detachPen();
  }

  addWidth(): void {
    this.width = (this.width + 10) % 50 + 100;
  }
}

export class MyFrameNode2 extends FrameNode {
  public width: number = 100;
  public offsetY: number = 0;
  private space: number = 1;
  uiContext: UIContext;

  constructor(uiContext: UIContext) {
    super(uiContext);
    this.uiContext = uiContext;
  }

  onMeasure(constraint: LayoutConstraint): void {
    let sizeRes: Size = { width: this.uiContext.vp2px(100), height: this.uiContext.vp2px(100) };
    for (let i = 0; i < this.getChildrenCount(); i++) {
      let child = this.getChild(i);
      if (child) {
        let childConstraint = GetChildLayoutConstraint(constraint, child);
        child.measure(childConstraint);
        let size = child.getMeasuredSize();
        sizeRes.height += size.height + this.space;
        sizeRes.width = Math.max(sizeRes.width, size.width);
      }
    }
  }

  onLayout(position: Vector2): void {
    let layoutPosition = this.getChild(0)!.getLayoutPosition();
    for (let i = 0; i < this.getChildrenCount(); i++) {
      let child = this.getChild(i);
      if (child) {
        child.layout({
          x: this.uiContext.vp2px(0),
          y: this.uiContext.vp2px(this.offsetY)
        });
        layoutPosition = child.getLayoutPosition();
        console.info('child position:' + JSON.stringify(layoutPosition));
      }
    }
    this.setLayoutPosition(layoutPosition);
  }

  addWidth(): void {
    this.width = (this.width + 150) % 200 + 100;
  }
}

export class MyNodeController extends NodeController {
  public rootNode: MyFrameNode | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new MyFrameNode(context);
    this.rootNode?.commonAttribute?.size({ width: '100%', height: 200 }).backgroundColor(Color.Green);
    return this.rootNode;
  }
}

export class MyNodeController2 extends NodeController {
  public rootNode: MyFrameNode2 | null = null;

  makeNode(context: UIContext): FrameNode | null {
    this.rootNode = new MyFrameNode2(context);
    this.rootNode?.commonAttribute?.size({ width: 100, height: 100 }).backgroundColor(Color.Green);
    let frameNode: FrameNode = new FrameNode(context);
    this.rootNode!.appendChild(frameNode);
    frameNode.commonAttribute.width(10).height(10).backgroundColor(Color.Pink);
    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private nodeController: MyNodeController = new MyNodeController();
  private nodeController2: MyNodeController2 = new MyNodeController2();

  build(): void {
    Row() {
      Column() {
        Row() {
          NodeContainer(this.nodeController)
            .width('30%')
            .height(200)
            .backgroundColor('#FFF0F0F0')
          NodeContainer(this.nodeController2)
            .width('70%')
            .height(200)
            .backgroundColor('#FFF0F0F0')
        }

        Button('Invalidate')
          .margin(10)
          .onClick((event: ClickEvent) => {
            this.nodeController?.rootNode?.addWidth();
            this.nodeController?.rootNode?.invalidate();
          })
        Button('UpdateLayout')
          .onClick((event: ClickEvent) => {
            let node = this.nodeController2.rootNode;
            node!.offsetY = (node!.offsetY + 10) % 110;
            this.nodeController2?.rootNode?.setNeedsLayout();
          })
      }
      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
// [End frameNodeDraw_start_sta]
