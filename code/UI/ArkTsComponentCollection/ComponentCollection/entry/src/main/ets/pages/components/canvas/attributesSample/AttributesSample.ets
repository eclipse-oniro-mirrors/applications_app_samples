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
 * @file entry/src/main/ets/pages/components/canvas/attributesSample/AttributesSample.ets
 * 文件职责：AttributesSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShowBtnType、CanvasSample。
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
 * CanvasSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct CanvasSample {
  scroller: Scroller = new Scroller();
  private img: ImageBitmap = new ImageBitmap('/pages/components/canvas/sampleResources/smoothoff.png');

  private Btns: ShowBtnType[] = [
    {
      name: $r('app.string.canvas_fillStyle'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.fillStyle = '#0000ff';
        this.context.fillStyle = '#0000ff';
        // 处理：this.context.fillRect(20, 20, 150, 100);
        this.context.fillRect(20, 20, 150, 100);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_lineWidth'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.lineWidth = 5;
        this.context.lineWidth = 5;
        // 处理：this.context.strokeRect(25, 25, 85, 105);
        this.context.strokeRect(25, 25, 85, 105);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_strokeStyle'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.lineWidth = 10;
        this.context.lineWidth = 10;
        // 处理：this.context.strokeStyle = '#0000ff';
        this.context.strokeStyle = '#0000ff';
        // 处理：this.context.strokeRect(25, 25, 155, 105);
        this.context.strokeRect(25, 25, 155, 105);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_lineCap'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.lineWidth = 8;
        this.context.lineWidth = 8;
        // 处理：this.context.strokeStyle = '#000000';
        this.context.strokeStyle = '#000000';
        // 处理：this.context.lineCap = 'round';
        this.context.lineCap = 'round';
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：path.moveTo(30, 50);
        path.moveTo(30, 50);
        // 处理：path.lineTo(220, 50);
        path.lineTo(220, 50);
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_lineJoin'),
      func: () => {
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.strokeStyle = '#000000';
        this.context.strokeStyle = '#000000';
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：this.context.lineWidth = 8;
        this.context.lineWidth = 8;
        // 处理：this.context.lineJoin = 'miter';
        this.context.lineJoin = 'miter';
        // 处理：path.moveTo(30, 30);
        path.moveTo(30, 30);
        // 处理：path.lineTo(120, 60);
        path.lineTo(120, 60);
        // 处理：path.lineTo(30, 110);
        path.lineTo(30, 110);
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_miterLimit'),
      func: () => {
        // 处理：this.context.strokeStyle = '#000000';
        this.context.strokeStyle = '#000000';
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：this.context.lineWidth = 8;
        this.context.lineWidth = 8;
        // 处理：this.context.lineJoin = 'miter';
        this.context.lineJoin = 'miter';
        // 处理：this.context.miterLimit = 3;
        this.context.miterLimit = 3;
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：path.moveTo(30, 30);
        path.moveTo(30, 30);
        // 处理：path.lineTo(60, 35);
        path.lineTo(60, 35);
        // 处理：path.lineTo(30, 37);
        path.lineTo(30, 37);
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_font'),
      func: () => {
        // 处理：this.context.font = '30px sans-serif';
        this.context.font = '30px sans-serif';
        // 处理：this.context.fillText('Hello World', 20, 60);
        this.context.fillText('Hello World', 20, 60);
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_textAlign'),
      func: () => {
        // 处理：this.context.strokeStyle = '#0000ff';
        this.context.strokeStyle = '#0000ff';
        // 处理：this.context.save();
        this.context.save();
        // 处理：this.context.beginPath();
        this.context.beginPath();
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：path.moveTo(140, 10);
        path.moveTo(140, 10);
        // 处理：path.lineTo(140, 160);
        path.lineTo(140, 160);
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.font = '18px sans-serif';
        this.context.font = '18px sans-serif';
        // 处理：this.context.textAlign = 'start';
        this.context.textAlign = 'start';
        // 处理：this.context.fillText('textAlign=start', 140, 60
        this.context.fillText('textAlign=start', 140, 60);
        // 处理：this.context.textAlign = 'end';
        this.context.textAlign = 'end';
        // 处理：this.context.fillText('textAlign=end', 140, 80);
        this.context.fillText('textAlign=end', 140, 80);
        // 处理：this.context.textAlign = 'left';
        this.context.textAlign = 'left';
        // 处理：this.context.fillText('textAlign=left', 140, 100
        this.context.fillText('textAlign=left', 140, 100);
        // 处理：this.context.textAlign = 'center';
        this.context.textAlign = 'center';
        // 处理：this.context.fillText('textAlign=center', 140, 1
        this.context.fillText('textAlign=center', 140, 120);
        // 处理：this.context.textAlign = 'right';
        this.context.textAlign = 'right';
        // 处理：this.context.fillText('textAlign=right', 140, 14
        this.context.fillText('textAlign=right', 140, 140);
        // 处理：this.context.restore();
        this.context.restore();
      // 结束当前组件块
      },
    },
    {
      name: $r('app.string.canvas_textBaseline'),
      func: () => {
        // 处理：this.context.strokeStyle = '#0000ff';
        this.context.strokeStyle = '#0000ff';
        // 处理：this.context.save();
        this.context.save();
        // 处理：let path: Path2D = new Path2D();
        let path: Path2D = new Path2D();
        // 处理：path.moveTo(0, 120);
        path.moveTo(0, 120);
        // 处理：path.lineTo(400, 120);
        path.lineTo(400, 120);
        // 处理：this.context.stroke(path);
        this.context.stroke(path);
        // 处理：this.context.font = '20px sans-serif';
        this.context.font = '20px sans-serif';
        // 处理：this.context.textBaseline = 'top';
        this.context.textBaseline = 'top';
        // 处理：this.context.fillText('Top', 10, 120);
        this.context.fillText('Top', 10, 120);
        // 处理：this.context.textBaseline = 'bottom';
        this.context.textBaseline = 'bottom';
        // 处理：this.context.fillText('Bottom', 55, 120);
        this.context.fillText('Bottom', 55, 120);
        // 处理：this.context.textBaseline = 'middle';
        this.context.textBaseline = 'middle';
        // 处理：this.context.fillText('Middle', 125, 120);
        this.context.fillText('Middle', 125, 120);
        // 处理：this.context.textBaseline = 'alphabetic';
        this.context.textBaseline = 'alphabetic';
        // 处理：this.context.fillText('Alphabetic', 195, 120);
        this.context.fillText('Alphabetic', 195, 120);
        // 处理：this.context.textBaseline = 'hanging';
        this.context.textBaseline = 'hanging';
        // 处理：this.context.fillText('Hanging', 295, 120);
        this.context.fillText('Hanging', 295, 120);
        this.context.restore();
      },
    },
    {
      name: $r('app.string.canvas_globalAlpha'),
      func: () => {
        this.context.save();
        this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillRect(0, 0, 50, 50);
        this.context.globalAlpha = 0.4;
        this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillRect(50, 50, 50, 50);
        this.context.globalAlpha = 1.0;
        this.context.restore();
      },
    },
    {
      name: $r('app.string.canvas_lineDashOffset'),
      func: () => {
        this.context.save();
        this.context.fillStyle = '#000000';
        let path: Path2D = new Path2D();
        path.arc(100, 75, 50, 0, 6.28);
        this.context.setLineDash([10, 20]);
        this.context.lineDashOffset = 10.0;
        this.context.stroke(path);
        this.context.lineDashOffset = 0.0;
        this.context.restore();
      },
    },
    {
      name: $r('app.string.canvas_globalCompositeOperation'),
      func: () => {
        this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillRect(20, 20, 50, 50);
        this.context.globalCompositeOperation = 'source-over';
        this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillRect(50, 50, 50, 50);
        this.context.fillStyle = 'rgb(255,0,0)';
        this.context.fillRect(120, 20, 50, 50);
        this.context.globalCompositeOperation = 'destination-over';
        this.context.fillStyle = 'rgb(0,0,255)';
        this.context.fillRect(150, 50, 50, 50);
      },
    },
    {
      name: $r('app.string.canvas_imageSmoothingEnabled'),
      func: () => {
        this.context.imageSmoothingEnabled = false;
        this.context.scale(0.5, 0.5);
        this.context.drawImage(this.img, 0, 0, 400, 200);
        this.context.scale(1, 1);
      },
    },
  ];
  private settings: RenderingContextSettings = new RenderingContextSettings(true);
  private context: CanvasRenderingContext2D = new CanvasRenderingContext2D(this.settings);

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色、内边距
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.canvas_component_attributes') }).id('attributes_sample_title_bar_2')
      // Scroll：滚动容器
      Scroll(this.scroller) {
        // Column：垂直布局容器
        // 关键属性：宽度
        Column() {
          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_canvasZone')).id('attributes_sample_text_5')
            .leftTitleStyle();
          // Column：垂直布局容器
          // 关键属性：cardStyle
          Column() {
            // Canvas：画布
            // 关键属性：宽度、高度、背景色、cardStyle
            Canvas(this.context).id('attributes_sample_canvas_7')
              .width('100%')
              .height('100%')
              .backgroundColor($r('app.color.canvas_background'))
              .width('100%')
              .height(200);
          }.id('attributes_sample_column_6').cardStyle();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_attributesOperations')).id('attributes_sample_text_8')
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
                Button(item.name, { type: ButtonType.Capsule, stateEffect: true }).id('attributes_sample_button_11')
                  .sampleButton()
                  .onClick(() => {
                    this.context.save();
                    item.func();
                  });
              }.id('attributes_sample_grid_item_10');
            });
          }.id('attributes_sample_grid_9').Style();

          // Text：文本
          // 关键属性：leftTitleStyle
          Text($r('app.string.canvas_clearEffects')).id('attributes_sample_text_12')
            .leftTitleStyle();

          // Button：按钮
          // 关键属性：宽度、sampleButton
          Button($r('app.string.canvas_clearRect')).onClick(()=>{
            this.context.restore();
            this.context.fillRect(0, 0, this.context.width, this.context.height);
            this.context.resetTransform();
            this.context.clearRect(0, 0, this.context.width, this.context.height);
          }).width('90%')
            .sampleButton();

        }.id('attributes_sample_column_4').width('100%');
      }.id('attributes_sample_scroll_3');

    }.id('attributes_sample_column_1')
    .height('100%')
    .backgroundColor($r('app.color.background_light_gray'))
    .padding({ left: 20, right: 20 });

  }
}
