/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
 * @file harB/src/main/ets/components/mainpage/HarB.ets
 * 文件职责：HarB 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：harBuilder、harInit。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import { RouterModule } from 'RouterModule/src/main/ets/utils/RouterModule';

/**
 * harBuilder：函数定义，承载本文件对应的逻辑与数据。
 */
@Builder
export function harBuilder(values: Object) {
  // NavDestination：导航目的地
  // 关键属性：title
  /**
   * NavDestination：执行 NavDestination 相关逻辑。
   */
  NavDestination() {
    // Column：垂直布局容器
    // 关键属性：宽度、高度、主轴对齐
    Column() {
      // Button：按钮
      // 关键属性：点击事件回调、push
      // 交互：可点击交互
      Button() {
        // Text：文本
        // 关键属性：字号、字体颜色
        Text($r('app.string.navigation_router_har1')).id('har_b_text_3')
          .fontSize(16)
          .fontColor(Color.White)
      }
      .onClick(() => {
        RouterModule.push('HapA_Router', 'HarA_Builder');
      })
      .height(40)
      .width('88%')
      .backgroundColor('#007DFF')
      .borderRadius(20)
      .id('gotohar1')
    }.id('har_b_column_2')
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
  .title('Har2')
}

/**
 * harInit：函数定义，承载本文件对应的逻辑与数据。
 */
export function harInit() {
  if (!RouterModule.getBuilder('HarB_Builder')) {
    let builder: WrappedBuilder<[Object]> = wrapBuilder(harBuilder);
    RouterModule.registerBuilder('HarB_Builder', builder);
  }
}

// 自执行函数，将builder注册到RouterModule中，在首次引用时触发
harInit();