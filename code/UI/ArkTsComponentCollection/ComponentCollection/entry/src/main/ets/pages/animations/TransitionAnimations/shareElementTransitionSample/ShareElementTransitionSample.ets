/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
 * @file ShareElementTransitionSample.ets
 * 文件职责：ShareElementTransitionSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：ShareElementTransitionSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import router from '@ohos.router'
import { TitleBar } from '../../../../common/TitleBar'

/**
 * ShareElementTransitionSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct ShareElementTransitionSample {
  private imageArr: Resource[] =
    [
    $r('app.media.ic_scenery1'), $r('app.media.ic_scenery2'), $r('app.media.ic_scenery3'), $r('app.media.ic_scenery4'),
    $r('app.media.ic_scenery1'), $r('app.media.ic_scenery2'), $r('app.media.ic_scenery3'), $r('app.media.ic_scenery4')
    ]

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.share_element_transition') }).id('share_element_transition_sample_title_bar_2')
      // Grid：网格容器
      // 关键属性：内边距、行间距、列间距、布局权重、columnsTemplate
      Grid() {
        ForEach(this.imageArr, (item: Resource, index: number) => {
          // GridItem：网格项
          // 关键属性：sharedTransition
          GridItem() {
            // Image：图片
            // 关键属性：高度、objectFit
            Image(item).id('share_element_transition_sample_image_4')
              .height(120)
              .objectFit(ImageFit.Contain)
          }
          .sharedTransition(`sharedImage_${index}`, {
            delay: 10,
            duration: 2000,
            curve: Curve.FastOutLinearIn,
            type: SharedTransitionEffectType.Exchange,
            // Motion path information, Path is the motion path of the bit movement drawing, using the svg path string
            motionPath: {
              path: 'Mstart.x start.y L300 200 L300 500 Lend.x end.y',
              from: 0.0,
              to: 1.0,
              rotatable: true
            }
          })
          .onClick(() => {
            router.push({
              url: 'pages/animations/TransitionAnimations/shareElementTransitionSample/ShareElementTransitionSampleTo',
              params: { image: item, id: index }
            })
          }).id('test_grid' + index)
        })
      }.id('share_element_transition_sample_grid_3')
      .padding(12)
      .rowsGap(20)
      .columnsGap(20)
      .layoutWeight(1)
      .columnsTemplate('1fr 1fr 1fr')
    }.id('share_element_transition_sample_column_1')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.background_shallow_grey'))
  }
}