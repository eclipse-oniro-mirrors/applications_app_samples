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
 * @file entry/src/main/ets/pages/components/canvas/shadowsSample/ShadowsSample.ets
 * 文件职责：ShadowsSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShowBtnType、methodsSample。
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
 * methodsSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct methodsSample {
  scroller: Scroller = new Scroller();
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private Btns: ShowBtnType[] = [
    {
      name: $r('app.string.canvas_shadowBlur'),
      func: () => {
        // 处理：this.context.shadowBlur = 30;
        this.context.shadowBlur = 30;
        // 处理：this.context.shadowColor = 'rgb(0,0,0)';
        this.context.shadowColor = 'rgb(0,0,0)';
        // 处理：this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillStyle = 'rgb(255,0,0)';
        // 处理：this.context.fillRect(20, 20, 100, 80);
        this.context.fillRect(20, 20, 100, 80);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_shadowColor'),
      func: () => {
        // 处理：this.context.shadowBlur = 30;
        this.context.shadowBlur = 30;
        // 处理：this.context.shadowColor = 'rgb(0,0,255)';
        this.context.shadowColor = 'rgb(0,0,255)';
        // 处理：this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillStyle = 'rgb(255,0,0)';
        // 处理：this.context.fillRect(160, 30, 100, 100);
        this.context.fillRect(160, 30, 100, 100);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_shadowOffsetX'),
      func: () => {
        // 处理：this.context.shadowBlur = 10;
        this.context.shadowBlur = 10;
        // 处理：this.context.shadowOffsetX = 20;
        this.context.shadowOffsetX = 20;
        // 处理：this.context.shadowOffsetY = 0;
        this.context.shadowOffsetY = 0;
        // 处理：this.context.shadowColor = 'rgb(0,0,0)';
        this.context.shadowColor = 'rgb(0,0,0)';
        // 处理：this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillStyle = 'rgb(255,0,0)';
        // 处理：this.context.fillRect(30, 70, 100, 80);
        this.context.fillRect(30, 70, 100, 80);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_shadowOffsetY'),
      func: () => {
        // 处理：this.context.shadowBlur = 10;
        this.context.shadowBlur = 10;
        this.context.shadowOffsetX = 0;
        this.context.shadowOffsetY = 20;
        this.context.shadowColor = 'rgba(0, 95, 255, 1.00)';
        this.context.fillStyle = 'rgba(130, 255, 0, 1.00)';
        this.context.fillRect(140, 40, 100, 100);
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
      TitleBar({ title: $r('app.string.canvas_component_shadow') }).id('shadows_sample_title_bar_2');
      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_canvasZone')).id('shadows_sample_text_5')
            .leftTitleStyle();
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Canvas：画布
            // 关键属性：宽度、高度、背景色、cardStyle
            Canvas(this.context).id('shadows_sample_canvas_7')
              .width('100%')
              .height('100%')
              .backgroundColor($r('app.color.canvas_background'))
              .width('100%')
              .height(200)
          }.id('shadows_sample_column_6').cardStyle();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_attributesOperations')).id('shadows_sample_text_8')
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
                Button(item.name, { type: ButtonType.Capsule, stateEffect: true }).id('shadows_sample_button_11')
                  .sampleButton()
                  .onClick(() => {
                    item.func();
                  });
              }.id('shadows_sample_grid_item_10');
            });
          }.id('shadows_sample_grid_9').Style();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_clearEffects')).id('shadows_sample_text_12')
            .leftTitleStyle();

          // Button：按钮
          // 关键属性：点击事件回调、clearRect
          // 交互：可点击交互
          Button($r('app.string.canvas_clearRect')).id('shadows_sample_button_13')
            .onClick(() => {
              this.context.clearRect(0, 0, 900, 200);
            })
            .sampleButton();
        }.id('shadows_sample_column_4').width('100%');
      }.id('shadows_sample_scroll_3');

    }.id('shadows_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 });
  }
}
