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
 * @file src/main/ets/components/pages/ScalePhotoPage.ets
 * 文件职责：ScalePhotoPage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ScalePhotoPage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { scaleTaskDatas } from '../model/AdjustModels';
import { ScaleTasks, TaskData } from '../model/AdjustData';
import image from '@ohos.multimedia.image';

const SCALE_COUNT: number = 3;

/**
 * ScalePhotoPage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct ScalePhotoPage {
  // @Link pixelMap：与父组件双向绑定的状态
  @Link pixelMap: PixelMap | null;

  // @State scaleCount：组件内部状态
  @State scaleCount: number = SCALE_COUNT; // 缩小次数
  // @State amplificationCount：组件内部状态
  @State amplificationCount: number = 0; // 放大次数
  // @State canClick：组件内部状态
  @State canClick: boolean = true;

  // @Link dpi：与父组件双向绑定的状态
  @Link dpi: string;
  private tempPixelMap: PixelMap | undefined | null = undefined;

  /**
   * computeDpi：执行 computeDpi 相关逻辑。
   */
  async computeDpi() {
    if (this.pixelMap !== null && this.pixelMap !== undefined) {
      const imageInfo: image.ImageInfo = await this.pixelMap.getImageInfo();
      this.dpi = imageInfo.size.width + '*' + imageInfo.size.height;
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    Row() {
      ForEach(scaleTaskDatas, (item: TaskData, index) => {
        Column() {
          Image(item.image)
            .height($r('app.float.size_30'))
            .width($r('app.float.size_30'))
            .id('scale_photo_page_image_2')
          Text(item.text)
            .fontColor(Color.White)
            .fontSize($r('app.float.size_15'))
            .margin({ top: $r('app.float.size_5') })
            .id('scale_photo_page_text_3')
        }
        .justifyContent(FlexAlign.Center)
        .width('50%')
        .height('100%')
        .layoutWeight(1)
        .onClick(async () => {
          if (item.task === ScaleTasks.NARROW && this.scaleCount > 0 && this.scaleCount <= 6) {
            this.scaleCount--;
            if (this.scaleCount < 0) {
              this.scaleCount = 0;
            }
            if (this.canClick) {
              this.canClick = false;
              await this.pixelMap?.scale(0.8, 0.8);
              this.computeDpi();
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          } else if (item.task === ScaleTasks.AMPLIFICARION && this.scaleCount >= 0 && this.scaleCount < 6) {
            this.scaleCount++;
            if (this.scaleCount > 6) {
              this.scaleCount = 6;
            }
            if (this.canClick) {
              this.canClick = false;
              await this.pixelMap?.scale(1.25, 1.25);
              this.computeDpi();
              setTimeout(() => {
                this.canClick = true;
              }, 300);
            }
          }
          this.flushPage();
        })
        .id('scale_photo_page_column_1')
      })
    }
    .id('scale_photo_page_row_0')
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