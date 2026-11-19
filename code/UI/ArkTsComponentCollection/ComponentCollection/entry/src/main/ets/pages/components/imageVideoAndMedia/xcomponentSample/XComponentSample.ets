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
 * @file entry/src/main/ets/pages/components/imageVideoAndMedia/xcomponentSample/XComponentSample.ets
 * 文件职责：XComponentSample 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：XComponentSample。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { IntroductionTitle } from '../../../../common/IntroductionTitle';
import { TitleBar } from '../../../../common/TitleBar';
import { LEFT_PADDING, RIGHT_PADDING } from '../../ComponentData';

@Extend(Column) function cardStyle(){
  .backgroundColor($r('app.color.white'))
  .borderRadius(16)
  .width('100%')
  .padding(12)
}

/**
 * XComponentSample：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct XComponentSample {
  private surfaceId : string ='';
  xcomponentController: XComponentController = new XComponentController();

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Column：垂直布局容器
    // 关键属性：高度、背景色
    Column() {
      // TitleBar：TitleBar 自定义组件
      TitleBar({ title: $r('app.string.xcomponent_title') }).id('xcomponent_sample_title_bar_2')
      // Column：垂直布局容器
      // 关键属性：内边距、外边距
      Column(){
        // IntroductionTitle：IntroductionTitle 自定义组件
        IntroductionTitle({introduction:$r('app.string.xcomponent_show')}).id('xcomponent_sample_introduction_title_4')
        // Column：垂直布局容器
        // 关键属性：背景色、cardStyle
        Column() {
          // XComponent：原生渲染组件
          // 关键属性：onLoad、setXComponentSurfaceSize
          XComponent({
            id: 'xcomponent',
            type: 'surface',
            controller: this.xcomponentController
          }).id('xcomponent_sample_xcomponent_6')
            .onLoad(() => {
              this.xcomponentController.setXComponentSurfaceSize({surfaceWidth:500,surfaceHeight:500})
              this.surfaceId = this.xcomponentController.getXComponentSurfaceId()
            })
            .width('400px')
            .height('400px')
        }.id('xcomponent_sample_column_5')
        .backgroundColor(Color.Black)
        .cardStyle()
      }.id('xcomponent_sample_column_3')
      .padding({ left: LEFT_PADDING, right: RIGHT_PADDING })
      .margin({ bottom: 100 })
    }.id('xcomponent_sample_column_1')
    .height('100%')
    .backgroundColor(($r('app.color.background_grey')))

  }
}