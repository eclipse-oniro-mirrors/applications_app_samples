'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  $r, Entry, Component, Column, Row, Button, Image, ImageFit,
  HorizontalAlign, FlexAlign, SlideEffect, RouteType, RowOptions,
  PageTransitionEnter, PageTransitionExit, ClickEvent
} from '@kit.ArkUI';

@Entry
@Component
struct PageTransitionSrc3 {
  build(): void {
    Column() {
      // 请将$r('app.media.forest')替换为实际资源文件
      Image($r('app.media.forest'))
        .width('90%')
        .height('80%')
        .objectFit(ImageFit.Fill)
        .syncLoad(true) // 同步加载图片，使页面出现时图片已经加载完成
        .margin(30)

      Row({ space: 10 } as RowOptions) {
        Button('pushUrl')
          // 路由到下一页面，push操作
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().pushUrl({ url: 'pages/pageTransition/template5/pageB' });
          })
        Button('back')
          // 返回到上一页面，相当于pop操作
          .onClick((e: ClickEvent) => {
            this.getUIContext().getRouter().back();
          })
      }.justifyContent(FlexAlign.Center)
    }
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  // [Start pageTransition_template5_pageA_start]
  // page A
  pageTransition(): void {
    // 定义页面进入时的效果，从左侧滑入，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ type: RouteType.None, duration: 1200 })
      .slide(SlideEffect.START)
    // 定义页面退出时的效果，向左侧滑出，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ type: RouteType.None, duration: 1000 })
      .slide(SlideEffect.START)
  }
  // [End pageTransition_template5_pageA_start]
}
