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
 * @file entry/src/main/ets/pages/components/canvas/methodsSample/MethodsSample.ets
 * 文件职责：MethodsSample 相关的 ArkTS 声明与 UI 构建逻辑。
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
  private img: ImageBitmap = new ImageBitmap('/pages/components/canvas/sampleResources/icon.png');
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);
  private offContext: OffscreenCanvasRenderingContext2D = new OffscreenCanvasRenderingContext2D(600, 600, this.settings);
  private Btns: ShowBtnType[] = [
    {
      name: $r('app.string.canvas_fillRect'),
      func: () => {
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        // 处理：this.context.fillRect(30, 30, 100, 100);
        this.context.fillRect(30, 30, 100, 100);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_strokeRect'),
      func: () => {
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        // 处理：this.context.strokeRect(30, 30, 200, 150);
        this.context.strokeRect(30, 30, 200, 150);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_fillText'),
      func: () => {
        // 处理：this.context.font = '30px sans-serif';
        this.context.font = '30px sans-serif';
        // 处理：this.context.fillText('Hello World!', 20, 100);
        this.context.fillText('Hello World!', 20, 100);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_strokeText'),
      func: () => {
        // 处理：this.context.font = '55px sans-serif';
        this.context.font = '55px sans-serif';
        // 处理：this.context.strokeText('Hello World!', 20, 60);
        this.context.strokeText('Hello World!', 20, 60);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_measureText'),
      func: () => {
        // 处理：this.context.font = '50px sans-serif';
        this.context.font = '50px sans-serif';
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.fillText('Hello World!', 20, 100);
        this.context.fillText('Hello World!', 20, 100);
        // 处理：this.context.fillText('width:' + this.context.me
        this.context.fillText('width:' + this.context.measureText('Hello World!').width, 20, 200);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_stroke'),
      func: () => {
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        // 处理：this.context.save();
        this.context.save();
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：path.moveTo(25, 25);
        path.moveTo(25, 25);
        // 处理：path.lineTo(25, 105);
        path.lineTo(25, 105);
        // 处理：path.lineTo(75, 105);
        path.lineTo(75, 105);
        // 处理：path.lineTo(75, 25);
        path.lineTo(75, 25);
        // 处理：path.lineTo(25, 25);
        path.lineTo(25, 25);
        // 处理：this.context.strokeStyle = 'rgb(0,0,255)';
        this.context.strokeStyle = 'rgb(0,0,255)';
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_createPattern'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：let pattern: CanvasPattern | null = this.context
        let pattern: CanvasPattern | null = this.context.createPattern(this.img, 'repeat');
        // 分支：if(pattern !== null){
        if(pattern !== null){
          // 处理：this.context.fillStyle = pattern;
          this.context.fillStyle = pattern;
        // 结束当前组件块
        }
        // 处理：this.context.fillRect(0, 0, 200, 200);
        this.context.fillRect(0, 0, 200, 200);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_fill'),
      func: () => {
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.rect(20, 20, 100, 100); // Create a
        this.context.rect(20, 20, 100, 100); // Create a 100*100 rectangle at (20, 20)
        // 处理：this.context.fill();
        this.context.fill();
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_clip'),
      func: () => {
        // 处理：let region = new Path2D();
        let region = new Path2D();
        // 处理：region.moveTo(30, 90);
        region.moveTo(30, 90);
        // 处理：region.lineTo(110, 20);
        region.lineTo(110, 20);
        // 处理：region.lineTo(240, 130);
        region.lineTo(240, 130);
        // 处理：region.lineTo(60, 130);
        region.lineTo(60, 130);
        // 处理：region.lineTo(190, 20);
        region.lineTo(190, 20);
        // 处理：region.lineTo(270, 90);
        region.lineTo(270, 90);
        // 处理：region.closePath();
        region.closePath();
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.clip(region,'evenodd');
        this.context.clip(region,'evenodd');
        // 处理：this.context.fillStyle = 'rgb(0,255,0)';
        this.context.fillStyle = 'rgb(0,255,0)';
        // 处理：this.context.fillRect(0, 0, this.context.width, 
        this.context.fillRect(0, 0, this.context.width, this.context.height);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_scale'),
      func: () => {
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.lineWidth = 3;
        this.context.lineWidth = 3;
        // 处理：this.context.strokeRect(30, 30, 50, 50);
        this.context.strokeRect(30, 30, 50, 50);
        // 处理：this.context.scale(2, 2); // Scale to 200%
        this.context.scale(2, 2); // Scale to 200%
        // 处理：this.context.strokeRect(30, 30, 50, 50);
        this.context.strokeRect(30, 30, 50, 50);
        // 处理：this.context.scale(1, 1);
        this.context.scale(1, 1);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_drawImage'),
      func: () => {
        // 处理：this.context.drawImage(this.img, 0, 0, 500, 500,
        this.context.drawImage(this.img, 0, 0, 500, 500, 0, 0, 400, 200);
      // 结束当前组件块
      },
    },

    {
      name: $r('app.string.canvas_setLineDash'),
      func: () => {
        // 处理：this.context.fillStyle = '#000000';
        this.context.fillStyle = '#000000';
        this.context.save();
        let path: Path2D = new Path2D();
        path.arc(100, 75, 50, 0, 6.28);
        this.context.setLineDash([10, 20]);
        this.context.stroke(path);
        this.context.restore();
      },
    },
    {
      name: $r('app.string.canvas_getLineDash'),
      func: () => {
        this.context.fillStyle = '#000000';
        this.context.save();
        let path: Path2D = new Path2D();
        path.arc(100, 75, 50, 0, 6.28);
        this.context.setLineDash([10, 20]);
        this.context.stroke(path);
        let res = this.context.getLineDash();
        console.error(JSON.stringify(res));
        this.context.restore();
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
      TitleBar({ title: $r('app.string.canvas_component_method') }).id('methods_sample_title_bar_2');
      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_canvasZone')).id('methods_sample_text_5')
            .leftTitleStyle();
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Canvas：画布
            // 关键属性：宽度、高度、背景色、cardStyle
            Canvas(this.context).id('methods_sample_canvas_7')
              .width('100%')
              .height('100%')
              .backgroundColor($r('app.color.canvas_background'))
              .width('100%')
              .height(200)
          }.id('methods_sample_column_6').cardStyle();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_attributesOperations')).id('methods_sample_text_8')
            .leftTitleStyle();

          // Grid：网格容器
          // 关键属性：Style
          Grid(this.scroller) {
            ForEach(this.Btns, (item: ShowBtnType) => {
              // GridItem：网格项
              GridItem() {
                // Button：按钮
                // 关键属性：sampleButton、点击事件回调、save
                // 交互：可点击交互
                Button(item.name, { type: ButtonType.Capsule, stateEffect: true }).id('methods_sample_button_11')
                  .sampleButton()
                  .onClick(() => {
                    this.context.save();
                    item.func();
                  });
              }.id('methods_sample_grid_item_10');
            });
          }.id('methods_sample_grid_9').Style();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_clearEffects')).id('methods_sample_text_12')
            .leftTitleStyle();

          // Button：按钮
          // 关键属性：点击事件回调、restore
          // 交互：可点击交互
          Button($r('app.string.canvas_clearRect')).id('methods_sample_button_13')
            .onClick(() => {
              this.context.restore();
              this.context.fillRect(0, 0, this.context.width, this.context.height);
              this.context.resetTransform();
              this.context.clearRect(0, 0, 900, 200);
            })
            .sampleButton();
        }.id('methods_sample_column_4').width('100%');
      }.id('methods_sample_scroll_3');

    }.id('methods_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 });
  }
}
