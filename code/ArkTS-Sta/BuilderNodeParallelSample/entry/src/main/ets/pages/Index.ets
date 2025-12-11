'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { State } from '@ohos.arkui.stateManagement';
import {
  LocalizedAlignRuleOptions,
  LocalizedVerticalAlignParam,
  LocalizedHorizontalAlignParam,
  VerticalAlign,
  HorizontalAlign,
  RelativeContainer,
  $r,
  Column,
  Component,
  Entry,
  Padding,
  Button,
  ClickEvent,
  Text,
  Stack,
  Builder,
  Image,
  Grid,
  GridItem,
  ForEach,
  TextAlign,
  Color,
  BlurStyle,
  BackgroundBlurStyleOptions,
  ThemeColorMode,
  AdaptiveColor,
  Alignment
} from '@ohos.arkui.component';
import hilog from '@ohos.hilog';
import {
  BuilderNode,
  ComponentContent,
  DrawContext,
  FrameNode,
  NodeContent,
  NodeController,
  NodeRenderType,
  RenderOptions,
  Size,
  LayoutConstraint,
} from '@ohos.arkui.node';
import { Builder, UIContext, wrapBuilder, NodeContainer } from '@ohos.arkui.component';

// 数据模型: IconData
// 存储一个App图标的元数据，包含title和icon
class IconData {
  title: string;
  icon: string;

  constructor(title: string, icon: string) {
    this.title = title;
    this.icon = icon;
  }
}

// iconDatas是一个固定数组，存了一堆应用数据（如电话、音乐、时钟）。
const iconDatas: Array<IconData> = new Array<IconData>(
  new IconData('备忘录', 'bwl'),
  new IconData('畅连', 'cl'),
  new IconData('电话', 'dh'),
  new IconData('华为视频', 'hwsp'),
  new IconData('计算器', 'jsq'),
  new IconData('浏览器', 'llq'),
  new IconData('主题', 'zt'),
  new IconData('音乐', 'yy'),
  new IconData('时钟', 'sz'),
);

let builderNodes: Array<BuilderNode<IconData>> = new Array<BuilderNode<IconData>>();


// 定义一个BuilderNode组件AppIcon，用来渲染单个应用图标（图片 + 文本）
@Builder
function appIcon(item: IconData) {
  hilog.info(0x0000, 'testTag', `appIcon ${JSON.stringify(item)}}`);
  RelativeContainer() {
    Image($r(`app.media.${item.icon}`)) // 显示图标
      .borderRadius(10)
      .clip(true)
      .autoResize(true)
      .width(60)
      .height(60)
      .id('image')
      .alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top } as LocalizedVerticalAlignParam,
        middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
      } as LocalizedAlignRuleOptions)
    Text(item.title) // 显示应用名
      .textAlign(TextAlign.Center)
      .opacity(1)
      .fontColor(Color.White)
      .fontSize(13)
      .alignRules({
        top: { anchor: 'image', align: VerticalAlign.Bottom } as LocalizedVerticalAlignParam,
        middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
      } as LocalizedAlignRuleOptions)
  }
}

// MyNodeController用来控制UI节点的生成。
class MyNodeController extends NodeController {
  private builderNode ?: BuilderNode<IconData>;
  private uiContext?: UIContext;
  private params?: IconData;

  constructor(params?: IconData, builderNode ?: BuilderNode<IconData>) {
    this.params = params;
    this.builderNode = builderNode;
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    this.uiContext = uiContext;
    if (this.builderNode == undefined) {
      this.builderNode = new BuilderNode<IconData>(this.uiContext!);
      this.builderNode!.build(wrapBuilder(appIcon), this.params!);
    }
    return this.builderNode ? this.builderNode!.getFrameNode()! : null;
  }

}

// 提前为每个IconData构建BuilderNode，BuilderNode的build方法指定useParallel为true说明是并行构建UI节点。
function createNode(items: Array<IconData>, uiContext: UIContext) {
  for (let i = 0; i < items.length; i++) {
    hilog.info(0x0000, 'testTag', `createNode ${JSON.stringify(items[i])}}`);
    let builderNode = new BuilderNode<IconData>(uiContext);
    builderNode.build(wrapBuilder(appIcon), items[i], { useParallel: true });
    builderNodes.push(builderNode)
  }
}

// getNode函数根据索引返回对应的MyNodeController实例。build方法没有指定useParallel为true，表示是非并行构建UI节点。
function getNode(index: number, param: IconData) {
  hilog.info(0x0000, 'testTag', `getNode length = ${builderNodes.length} index = ${index}`);
  if (builderNodes.length < index + 1) {
    hilog.info(0x0000, 'testTag', `getNode 1`);
    return new MyNodeController(param)
  }
  return new MyNodeController(undefined, builderNodes[index as Int]);
}

// 构建一个小型文件夹UI，用Grid排列3×3的小图标。
@Builder
function smallFolder() {
  Stack() {
    Column() {
    }
    .borderRadius(10)
    .width(160)
    .height(160)
    .backgroundColor(Color.Gray)
    .opacity(0.3)

    Grid() {
      ForEach(iconDatas, (item: IconData, index: Int) => {
        GridItem() {
          Column() {
            Image($r(`app.media.${item.icon}`))
              .borderRadius(10)
              .clip(true)
              .autoResize(true)
              .syncLoad(true)
              .width(43)
              .height(43)
          }
        }
      })
    }
    .width(160)
    .height(160)
    .columnsGap(0)
    .rowsGap(0)
    .columnsTemplate('1fr 1fr 1fr')
    .rowsTemplate('1fr 1fr 1fr')
  }
}

@Entry
@Component
struct Index {
  @State flag: boolean = false;
  @State mode: string = '';
  uiContext?: UIContext

  aboutToAppear() {
    this.uiContext = this.getUIContext()
  }

  build() {
    Stack() {
      Image($r("app.media.bg"))
        .height('100%')
        .width('100%')
      if (!this.flag) {
        Grid() {
          GridItem() {
            Column() {
              smallFolder()
              Text("非并行")
            }
          }
          .onClick((event: ClickEvent) => {
            this.flag = true
            this.mode = "非并行"
          })

          GridItem() {
            Column() {
              smallFolder()
              Text("并行")
            }
          }
          .onClick((event: ClickEvent) => {
            this.flag = true
            this.mode = "并行"
            hilog.info(0x0000, 'testTag', `onClick`);
            createNode(iconDatas, this.uiContext!)
          })
        }
        .margin({
          top: 10
        } as Padding)
        .columnsGap(0)
        .rowsGap(10)
        .columnsTemplate('1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .width(340)
        .height(660)
      } else {
        Stack() {
          Column() {
            Text(`创建模式: ${this.mode}`)
              .fontSize(20)
              .fontColor(Color.Red)
          }
          .borderRadius(15)
          .height(400)
          .width(240)
          .backgroundColor(Color.Gray)
          .opacity(0.3)
          .margin({ top: 60 } as Padding)

          Grid() {
            ForEach(iconDatas, (item: IconData, index: Int) => {
              GridItem() {
                NodeContainer(getNode(index, item))
              }
            })
          }
          .width(240)
          .height(400)
          .margin({ top: 100 } as Padding)
          .columnsTemplate('1fr 1fr 1fr')
          .rowsTemplate('1fr 1fr 1fr 1fr')
        }.height(600)
      }
    }
  }
}

