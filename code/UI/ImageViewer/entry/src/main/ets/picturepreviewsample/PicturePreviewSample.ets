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

/**
 * @file entry/src/main/ets/picturepreviewsample/PicturePreviewSample.ets
 * 文件职责：PicturePreviewSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：PicturePreviewSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { PicturePreview } from '../view/PicturePreview';

// 图片预览使用案例
/**
 * 功能说明：本示例介绍使用List、LazyForEach、matrix4、组合手势实现图片预览功能
 *
 * 推荐场景：需要图片预览的场景
 *
 * 核心组件：
 * 1. PicturePreview：实现图片预览的布局和循环设置多图预览
 * 2. PicturePreviewImage ： 具体某个图片预览
 *
 * 实现步骤：
 * 1. 数据准备：首先构建一个需要预览的图片数组
 *  @example
 *  @State imageList: string[] = [$r("app.media.picturepreview_image")];
 * 2. 数据准备：创建好主轴方向
 *  @example
 *  @State listDirection: Axis = Axis.Horizontal;
 * 3.构建图片预览
 *  @example
 *  PicturePreview({ imageList: this.imageList, listDirection: this.listDirection })
 */
/**
 * PicturePreviewSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Component
export struct PicturePreviewSample {
  // @State imageList：组件内部状态
  @State imageList: string[] = [];

  // @State listDirection：组件内部状态
  @State listDirection: Axis = Axis.Horizontal;

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear(): void {
    let imageSource:string = $r('app.media.picturepreview_image') as ESObject;
    this.imageList.push(
      imageSource,
      imageSource,
      imageSource
    )
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // PicturePreview：PicturePreview 自定义组件
    PicturePreview({ imageList: this.imageList, listDirection: this.listDirection })
      .id('picture_preview_sample_picture_preview_1')
  }
}