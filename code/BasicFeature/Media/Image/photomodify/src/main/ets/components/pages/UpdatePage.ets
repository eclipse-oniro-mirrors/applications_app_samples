/*
 * Copyright (c) 2023-2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
 * @file src/main/ets/components/pages/UpdatePage.ets
 * 文件职责：UpdatePage 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：UpdatePage。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router';
import { logger } from '../util/Logger';
import { readImage } from '../util/MediaUtil';

/**
 * UpdatePage：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct UpdatePage {
  // @State mediaUri：组件内部状态
  @State mediaUri: string = (router.getParams() as Record<string, Object>)['mediaUri'] as string;

  // @State isLand：组件内部状态
  @State isLand: boolean = false;

  // @State pixelMap：组件内部状态
  @State pixelMap: PixelMap | null = null;

 async aboutToAppear(): Promise<void> {
    logger.info('UpdatePage mediaUri' + this.mediaUri);
    // 更新 pixelMap
    this.pixelMap = await readImage(this.mediaUri);
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    Column() {
      // Row：水平布局容器
      Row() {
        // Image：图片
        Image($r("app.media.back1"))
          .width($r('app.float.size_35'))
          .height($r('app.float.size_35'))
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            router.back();
          })
      }
      .padding({ left: $r('app.float.size_14') })
      .margin({ top: $r('app.float.size_20') })
      .justifyContent(FlexAlign.Start)
      .width('100%')

      // Row：水平布局容器
      Row() {
        // Image：图片
        Image(this.pixelMap)
          .objectFit(ImageFit.Contain)
          .backgroundColor($r('app.color.update_page_image'))
          .width('90%')
          .height('90%')
      }
      .layoutWeight(1)
      .alignItems(VerticalAlign.Center)

      // Row：水平布局容器
      Row() {
        // Column：垂直布局容器
        Column() {
          // Image：图片
          Image($r('app.media.ic_edit'))
            .width($r('app.float.size_35'))
            .height($r('app.float.size_35'))
          Text($r('app.string.update_page_edit'))
            .fontSize($r('app.float.size_18'))
            .fontColor(Color.White)
            .margin({ top: $r('app.float.size_5') })
        }
        .height($r('app.float.size_60'))
        .width($r('app.float.size_100'))
        .id('Edit')
        .onClick(() => {
          router.pushUrl({
            // 字段 url：声明并维护该成员的状态
            url: 'pages/EditImages',
            // 字段 params：声明并维护该成员的状态
            params: { mediaUris: this.mediaUri }
          });
        })

        // Column：垂直布局容器
        Column() {
          // Image：图片
          Image($r('app.media.ic_delete'))
            .width($r('app.float.size_35'))
            .height($r('app.float.size_35'))
          Text($r('app.string.update_page_delete'))
            .fontColor(Color.White)
            .fontSize($r('app.float.size_18'))
            .margin({ top: $r('app.float.size_5') })
        }
        .height($r('app.float.size_60'))
        .width($r('app.float.size_100'))
        .onClick(() => {
          // 删除图片
          let imageList: Array<string> = AppStorage.get('imageList') as Array<string>;
          // let 语句
          let index: number = AppStorage.get('selectIndex') as number;
          imageList.splice(index, 1);
          AppStorage.setOrCreate<Array<string>>('imageList', imageList);
          // 返回
          router.back();
        })
      }
      .align(Alignment.Center)
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceAround)
    }
    .backgroundColor(Color.Black)
    .height('100%')
    .width('100%')
  }
}