/*
 * Copyright (c) 2023 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * @file src/main/ets/components/pages/ColorSpacePage.ets
 * 文件职责：ColorSpacePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ColorSpacePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { colorSpaceTaskDatas } from '../model/AdjustModels';
import { ColorSpaceTasks, ScaleTasks, TaskData } from '../model/AdjustData';
import image from '@ohos.multimedia.image';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

// const 语句
const SCALE_COUNT: number = 3;

/**
 * ColorSpacePage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ColorSpacePage {
  // @State scaleCount：组件内部状态
  @State scaleCount: number = SCALE_COUNT; // 缩小次数
  // @State amplificationCount：组件内部状态
  @State amplificationCount: number = 0; // 放大次数
  // @State canClick：组件内部状态
  @State canClick: boolean = true;

  // @Link dpi：与父组件双向绑定的状态
  @Link dpi: string;

  // @Link pixelMap：与父组件双向绑定的状态
  @Link pixelMap: PixelMap | null;

  // 字段 tempPixelMap：声明并维护该成员的状态
  private tempPixelMap: PixelMap | undefined | null = undefined;

  /**
   * computeDpi：执行 computeDpi 相关逻辑。
   */
  async computeDpi() {
    // if 语句
    if (this.pixelMap !== null && this.pixelMap !== undefined) {
      // const 语句
      const imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
      // 更新 dpi
      this.dpi = imageInfo.size.width + '*' + imageInfo.size.height;
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    Row() {
      ForEach(colorSpaceTaskDatas, (item: TaskData, index) => {
        // Column：垂直布局容器
        Column() {
          // Image：图片
          Image(item.image)
            .height($r('app.float.size_30'))
            .width($r('app.float.size_30'))
            .id('color_space_page_image_2')
          Text(item.text)
            .fontColor(Color.White)
            .fontSize($r('app.float.size_15'))
            .margin({ top: $r('app.float.size_5') })
            .id('color_space_page_text_3')
        }
        .justifyContent(FlexAlign.Center)
        .width('50%')
        .height('100%')
        .layoutWeight(1)
        .onClick(async () => {
          // if 语句
          if (item.task === ColorSpaceTasks.ADOBERGB) {
            // if 语句
            if (this.canClick) {
              // 更新 canClick
              this.canClick = false
              let colorSpaceName = colorSpaceManager.ColorSpace.ADOBE_RGB_1998;
              let csm : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
              this.pixelMap!.applyColorSpace(csm).then(() => {
                this.flushPage();
              });
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          } else if (item.task === ColorSpaceTasks.DCIP3) {
            if (this.canClick) {
              this.canClick = false;
              let colorSpaceName = colorSpaceManager.ColorSpace.DCI_P3;
              let csm : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
              this.pixelMap!.applyColorSpace(csm,()=>{
                this.flushPage();
              });
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          } else if (item.task === ColorSpaceTasks.SRGB) {
            if (this.canClick) {
              this.canClick = false;
              let colorSpaceName = colorSpaceManager.ColorSpace.SRGB;
              let csm : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
              await this.pixelMap!.applyColorSpace(csm);
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          } else if (item.task === ColorSpaceTasks.DISPLAYP3) {
            if (this.canClick) {
              this.canClick = false;
              let colorSpaceName = colorSpaceManager.ColorSpace.DISPLAY_P3;
              let csm : colorSpaceManager.ColorSpaceManager = colorSpaceManager.create(colorSpaceName);
              await this.pixelMap!.applyColorSpace(csm);
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          }
          this.flushPage();
        })
        .id('color_space_page_column_1')
      })
    }
    .id('color_space_page_row_0')
  }

  /**
   * flushPage：执行 flushPage 相关逻辑。
   */
  flushPage() {
    this.tempPixelMap = this.pixelMap;
    this.pixelMap = null;
    this.pixelMap = this.tempPixelMap;
  }
}