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
// [Start rendering_properties_sta]
import {
  Entry,
  Column,
  Component,
  Button,
  ClickEvent,
  NodeContainer,
  BorderStyle,
  Flex,
  FlexDirection,
  ItemAlign,
  FlexAlign,
  Padding,
  UIContext,
  NodeController,
  FrameNode,
  RenderNode,
  ShapeMask,
  ShapeClip
} from '@kit.ArkUI';

const TEST_TAG: string = 'RenderNode';
const mask = new ShapeMask();
mask.setRectShape({
  left: 0,
  right: 150,
  top: 0,
  bottom: 150
});
mask.fillColor = 0x55ff0000.toInt();
mask.strokeColor = 0xffff0000.toInt();
mask.strokeWidth = 24;

const clip = new ShapeClip();
clip.setCommandPath({ commands: 'M100 0 L0 100 L50 200 L150 200 L200 100 Z' });

const renderNode = new RenderNode();
renderNode.backgroundColor = 0xff519db4.toInt();
renderNode.size = { width: 100, height: 100 };

export class MyNodeController extends NodeController {
  private rootNode: FrameNode | null = null;

  makeNode(uiContext: UIContext): FrameNode | null {
    this.rootNode = new FrameNode(uiContext);

    const rootRenderNode = this.rootNode!.getRenderNode();
    if (rootRenderNode !== null) {
      rootRenderNode.appendChild(renderNode);
    }

    return this.rootNode;
  }
}

@Entry
@Component
struct Index {
  private myNodeController: MyNodeController = new MyNodeController();

  build(): void {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.SpaceBetween }) {
      Column() {
        NodeContainer(this.myNodeController)
      }
      .height(300)

      Flex() {
        Button('position')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.position = { x: 10, y: 10 };
            console.info(TEST_TAG + ' position:' + JSON.stringify(renderNode.position));
          })
        Button('pivot')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.pivot = { x: 0.5, y: 0.6 };
            console.info(TEST_TAG + ' pivot:' + JSON.stringify(renderNode.pivot));
          })
      }

      Flex() {
        Button('scale')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.scale = { x: 0.5, y: 1 };
            console.info(TEST_TAG + ' scale:' + JSON.stringify(renderNode.scale));
          })
        Button('translation')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.translation = { x: 100, y: 0 };
            console.info(TEST_TAG + ' translation:' + JSON.stringify(renderNode.translation));
          })
      }

      Flex() {
        Button('rotation')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.rotation = { x: 135, y: 0, z: 0 };
            console.info(TEST_TAG + ' rotation:' + JSON.stringify(renderNode.rotation));
          })
        Button('transform')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.transform = [
              1, 0, 0, 0,
              0, 2, 0, 0,
              0, 0, 1, 0,
              0, 0, 0, 1
            ];
            console.info(TEST_TAG + ' transform:' + JSON.stringify(renderNode.transform));
          })
      }

      Flex() {
        Button('shadow')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.shadowElevation = 10;
            renderNode.shadowColor = 0xff2787d9.toInt();
            renderNode.shadowOffset = { x: 10, y: 10 };
            renderNode.shadowAlpha = 0.1;
            console.info(TEST_TAG + ' shadowElevation:' + JSON.stringify(renderNode.shadowElevation));
            console.info(TEST_TAG + ' shadowColor:' + JSON.stringify(renderNode.shadowColor));
            console.info(TEST_TAG + ' shadowOffset:' + JSON.stringify(renderNode.shadowOffset));
            console.info(TEST_TAG + ' shadowAlpha:' + JSON.stringify(renderNode.shadowAlpha));
          })
        Button('shadowRadius')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.shadowOffset = { x: 10, y: 10 };
            renderNode.shadowAlpha = 0.7
            renderNode.shadowRadius = 30;
            console.info(TEST_TAG + ' shadowOffset:' + JSON.stringify(renderNode.shadowOffset));
            console.info(TEST_TAG + ' shadowAlpha:' + JSON.stringify(renderNode.shadowAlpha));
            console.info(TEST_TAG + ' shadowRadius:' + JSON.stringify(renderNode.shadowRadius));
          })
      }

      Flex() {
        Button('border')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.borderWidth = {
              left: 8,
              top: 8,
              right: 8,
              bottom: 8
            };
            renderNode.borderStyle = {
              left: BorderStyle.Solid,
              top: BorderStyle.Dotted,
              right: BorderStyle.Dashed,
              bottom: BorderStyle.Solid
            }
            renderNode.borderColor = {
              left: 0xffd5d5d5.toInt(),
              top: 0xffd5d5d5.toInt(),
              right: 0xffd5d5d5.toInt(),
              bottom: 0xffd5d5d5.toInt()
            };
            renderNode.borderRadius = {
              topLeft: 32,
              topRight: 32,
              bottomLeft: 32,
              bottomRight: 32
            };
            console.info(TEST_TAG + ' borderWidth:' + JSON.stringify(renderNode.borderWidth));
            console.info(TEST_TAG + ' borderStyle:' + JSON.stringify(renderNode.borderStyle));
            console.info(TEST_TAG + ' borderColor:' + JSON.stringify(renderNode.borderColor));
            console.info(TEST_TAG + ' borderRadius:' + JSON.stringify(renderNode.borderRadius));
          })
        Button('shapeMask')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.shapeMask = mask;
            console.info(TEST_TAG + ' shapeMask:' + JSON.stringify(renderNode.shapeMask));
          })
      }

      Flex() {
        Button('shapeClip')
          .width(300)
          .onClick((event: ClickEvent) => {
            renderNode.shapeClip = clip;
            console.info(TEST_TAG + ' shapeClip:' + JSON.stringify(renderNode.shapeClip));
          })
      }
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

// [End rendering_properties_sta]
