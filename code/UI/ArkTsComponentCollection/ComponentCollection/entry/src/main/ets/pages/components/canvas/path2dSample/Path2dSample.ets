/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

/**
 * @file entry/src/main/ets/pages/components/canvas/path2dSample/Path2dSample.ets
 * 文件职责：Path2dSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShowBtnType、DataPanelSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { TitleBar } from '../../../../common/TitleBar';

/**
 * ShowBtnType：接口定义，承载本文件对应的逻辑与数据。
 */
interface ShowBtnType {
  name: Resource,
  func: Function
}

@Extend(Text) function leftTitleStyle() {
  .fontColor($r('app.color.sub_title_color'))
  .fontSize(14)
  .height(22)
  .alignSelf(ItemAlign.Start)
  .margin({ left: 12, top: 12 })
}

@Extend(Column) function cardStyle() {
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .padding(15)
}

@Extend(Grid) function Style() {
  .columnsTemplate('1fr 1fr')
  .columnsGap(12)
  .rowsGap(12)
  .backgroundColor(Color.White)
  .borderRadius(24)
  .width('100%')
  .height('100%')
  .padding(15)
  .height(300)
  .align(Alignment.Center)
}

@Extend(Button) function sampleButton() {
  .width('100%')
  .height(40)
  .fontColor(Color.White)
  .alignSelf(ItemAlign.Center)
  .type(ButtonType.Capsule)
}

/**
 * DataPanelSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct DataPanelSample {
  scroller: Scroller = new Scroller();
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private Btns: ShowBtnType[] = [
    {
      name: $r('app.string.canvas_beginPath'),
      func: () => {
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(15, 80);
        path2d.moveTo(15, 80);
        // 处理：path2d.lineTo(280, 160);
        path2d.lineTo(280, 160);
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_moveTo'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(10, 10);
        path2d.moveTo(10, 10);
        // 处理：path2d.lineTo(280, 160);
        path2d.lineTo(280, 160);
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_lineTo'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：path2d.moveTo(10, 10);
        path2d.moveTo(10, 10);
        // 处理：path2d.lineTo(280, 160);
        path2d.lineTo(280, 160);
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_closePath'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(30, 30);
        path2d.moveTo(30, 30);
        // 处理：path2d.lineTo(110, 30);
        path2d.lineTo(110, 30);
        // 处理：path2d.lineTo(70, 90);
        path2d.lineTo(70, 90);
        // 处理：path2d.closePath();
        path2d.closePath();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_bezierCurveTo'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(10, 10);
        path2d.moveTo(10, 10);
        // 处理：path2d.bezierCurveTo(20, 100, 200, 100, 200, 20)
        path2d.bezierCurveTo(20, 100, 200, 100, 200, 20);
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_quadraticCurveTo'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(20, 20);
        path2d.moveTo(20, 20);
        // 处理：path2d.quadraticCurveTo(100, 100, 200, 20);
        path2d.quadraticCurveTo(100, 100, 200, 20);
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_arc'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.arc(100, 75, 50, 0, 6.28);
        path2d.arc(100, 75, 50, 0, 6.28);
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.stroke(path2d);
        this.context.stroke(path2d);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_arcTo'),
      func: () => {
        // 处理：let path2d:Path2D = new Path2D();
        let path2d:Path2D = new Path2D();
        // 处理：path2d.moveTo(100, 20);
        path2d.moveTo(100, 20);
        // 处理：path2d.arcTo(150, 20, 150, 70, 50);
        path2d.arcTo(150, 20, 150, 70, 50);
        this.context.beginPath();
        this.context.stroke(path2d);
      },
    },
    {
      name: $r('app.string.canvas_ellipse'),
      func: () => {
        let path2d:Path2D = new Path2D();
        path2d.ellipse(200, 100, 25, 50, Math.PI * 0.25, Math.PI * 0.5, Math.PI * 2);
        this.context.beginPath();
        this.context.stroke(path2d);
      },
    },
    {
      name: $r('app.string.canvas_rect'),
      func: () => {
        let path2d:Path2D = new Path2D();
        path2d.rect(20, 20, 100, 100); // Create a 100*100 rectangle at (20, 20)
        this.context.beginPath();
        this.context.stroke(path2d);
      },
    },
  ];

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.canvas_component_path_2d') }).id('path2d_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_canvasZone')).id('path2d_sample_text_5')
            .leftTitleStyle();
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Canvas：画布
            // 关键属性：宽度、高度、背景色、cardStyle
            Canvas(this.context).id('path2d_sample_canvas_7')
              .width('100%')
              .height('100%')
              .backgroundColor($r('app.color.canvas_background'))
              .width('100%')
              .height(200)
          }.id('path2d_sample_column_6').cardStyle();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_attributesOperations')).id('path2d_sample_text_8')
            .leftTitleStyle();

          // Grid：网格容器
          // 关键属性：Style
          Grid(this.scroller) {
            ForEach(this.Btns, (item: ShowBtnType) => {
              // GridItem：网格项
              GridItem() {
                // Button：按钮
                // 关键属性：sampleButton、点击事件回调、func
                // 交互：可点击交互
                Button(item.name, { type: ButtonType.Capsule, stateEffect: true }).id('path2d_sample_button_11')
                  .sampleButton()
                  .onClick(() => {
                    item.func();
                  });
              }.id('path2d_sample_grid_item_10');
            });
          }.id('path2d_sample_grid_9').Style();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_clearEffects')).id('path2d_sample_text_12')
            .leftTitleStyle();

          // Button：按钮
          // 关键属性：点击事件回调、clearRect
          // 交互：可点击交互
          Button($r('app.string.canvas_clearRect')).id('path2d_sample_button_13')
            .onClick(() => {
              this.context.clearRect(0, 0, 900, 200);
            })
            .sampleButton();
        }.id('path2d_sample_column_4').width('100%');
      }.id('path2d_sample_scroll_3');
    }.id('path2d_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 });
  }
}
