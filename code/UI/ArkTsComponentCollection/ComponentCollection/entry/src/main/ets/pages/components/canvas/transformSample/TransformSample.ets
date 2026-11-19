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
 * @file entry/src/main/ets/pages/components/canvas/transformSample/TransformSample.ets
 * 文件职责：TransformSample 相关的 ArkTS 声明与 UI 构建逻辑。
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
  private Btns: ShowBtnType[] = [
    {
      name: $r('app.string.canvas_translate'),
      func: () => {
        // 处理：this.context.fillRect(90, 90, 100, 100);
        this.context.fillRect(90, 90, 100, 100);
        // 处理：this.context.translate(90, 90)
        this.context.translate(90, 90)
        // 处理：this.context.fillRect(90, 90, 100, 100);
        this.context.fillRect(90, 90, 100, 100);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_transform'),
      func: () => {
        // 处理：this.context.fillStyle = 'rgb(0,0,0)';
        this.context.fillStyle = 'rgb(0,0,0)';
        // 处理：this.context.fillRect(0, 0, 100, 100);
        this.context.fillRect(0, 0, 100, 100);
        // 处理：this.context.transform(1, 0.5, -0.5, 1, 10, 10);
        this.context.transform(1, 0.5, -0.5, 1, 10, 10);
        // 处理：this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillStyle = 'rgb(255,0,0)';
        // 处理：this.context.fillRect(0, 0, 100, 100);
        this.context.fillRect(0, 0, 100, 100);
        // 处理：this.context.transform(1, 0.5, -0.5, 1, 10, 10);
        this.context.transform(1, 0.5, -0.5, 1, 10, 10);
        // 处理：this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillStyle = 'rgb(0,0,255)';
        // 处理：this.context.fillRect(0, 0, 100, 100);
        this.context.fillRect(0, 0, 100, 100);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_setTransform'),
      func: () => {
        // 处理：this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillStyle = 'rgb(0,0,255)';
        // 处理：this.context.fillRect(20, 20, 100, 100);
        this.context.fillRect(20, 20, 100, 100);
        this.context.setTransform(1, 0.5, -0.5, 1, 10, 10);
      },
    },
    {
      name: $r('app.string.canvas_rotate'),
      func: () => {
        this.context.rotate(45 * Math.PI / 180);
        this.context.fillRect(70, 20, 50, 50);
      }
    }
  ];
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.canvas_component_transform') }).id('transform_sample_title_bar_2');
      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_canvasZone')).id('transform_sample_text_5')
            .leftTitleStyle();
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Canvas：画布
            // 关键属性：宽度、高度、背景色、cardStyle
            Canvas(this.context).id('transform_sample_canvas_7')
              .width('100%')
              .height('100%')
              .backgroundColor($r('app.color.canvas_background'))
              .width('100%')
              .height(200)
          }.id('transform_sample_column_6').cardStyle();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_attributesOperations')).id('transform_sample_text_8')
            .leftTitleStyle();

          // Grid：网格容器
          // 关键属性：Style
          Grid(this.scroller) {
            ForEach(this.Btns, (item: ShowBtnType) => {
              // GridItem：网格项
              // 关键属性：外边距
              GridItem() {
                // Button：按钮
                // 关键属性：sampleButton、点击事件回调、func
                // 交互：可点击交互
                Button(item.name, { type: ButtonType.Capsule, stateEffect: true }).id('transform_sample_button_11')
                  .sampleButton()
                  .onClick(() => {
                    item.func();
                  });
              }.id('transform_sample_grid_item_10').margin(0);
            });
          }.id('transform_sample_grid_9').Style();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_clearEffects')).id('transform_sample_text_12')
            .leftTitleStyle();

          // Button：按钮
          // 关键属性：点击事件回调、resetTransform
          // 交互：可点击交互
          Button($r('app.string.canvas_clearRect')).id('transform_sample_button_13')
            .onClick(() => {
              this.context.resetTransform();
              this.context.clearRect(0, 0, 900, 200);
            })
            .sampleButton();
        }.id('transform_sample_column_4').width('100%');
      }.id('transform_sample_scroll_3');
    }.id('transform_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 });
  }
}
