/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
 * @file ShareElementTransitionSampleTo.ets
 * 文件职责：ShareElementTransitionSampleTo 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShareElementTransitionSampleTo。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router'

/**
 * ShareElementTransitionSampleTo：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ShareElementTransitionSampleTo {
  // @State image：组件内部状态
  @State image: Resource | undefined = undefined;

  // @State sharedTransitionID：组件内部状态
  @State sharedTransitionID: number = -1;

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：内边距、背景色、主轴对齐
    Column() {
      // Image：图片
      // 关键属性：objectFit、sharedTransition、点击事件回调、back
      // 交互：可点击交互
      Image(this.image)
        .objectFit(ImageFit.Contain)
        .sharedTransition(`sharedImage_${this.sharedTransitionID}`)
        .onClick(() => {
          router.back()
        }).id('test_back')
    }.id('share_element_transition_sample_to_column_1')
    .padding(12)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    let params = router.getParams() as Record<string, string | number | Resource>;
    this.image = params.image as Resource;
    this.sharedTransitionID = params.id as number;
  }
}