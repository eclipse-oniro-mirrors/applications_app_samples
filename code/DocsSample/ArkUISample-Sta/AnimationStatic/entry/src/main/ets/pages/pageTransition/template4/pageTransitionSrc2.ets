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

// [Start pageTransition_template4_pageTransitionSrc2_start]
// PageTransitionSrc2
import {
  $r, Entry, Component, Column, Row, Button, Image, ImageFit,
  HorizontalAlign, FlexAlign, SlideEffect, RowOptions,
  PageTransitionEnter, PageTransitionExit, ClickEvent, TranslateOptions
} from '@kit.ArkUI';

@Entry
@Component
struct PageTransitionSrc2 {
  build(): void {
    Column() {
      // 请将$r('app.media.mountain')替换为实际资源文件
      Image($r('app.media.mountain'))
        .width('90%')
        .height('80%')
        .objectFit(ImageFit.Fill)
        .syncLoad(true) // 同步加载图片，使页面出现时图片已经加载完成
        .margin(30)

      Row({ space: 10 } as RowOptions) {
        Button('pushUrl')
          .onClick((e: ClickEvent) => {
            // 路由到下一页面，push操作
            this.getUIContext().getRouter().pushUrl({ url: 'pages/pageTransition/template4/pageTransitionDst2' });
          })
        Button('back')
          .onClick((e: ClickEvent) => {
            // 返回到上一页面，相当于pop操作
            this.getUIContext().getRouter().back();
          })
      }.justifyContent(FlexAlign.Center)
    }
    .width('100%').height('100%')
    .alignItems(HorizontalAlign.Center)
  }

  pageTransition(): void {
    // 定义页面进入时的效果，从左侧滑入，时长为1000ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionEnter({ duration: 1000 })
      .slide(SlideEffect.START)
    // 定义页面退出时的效果，相对于正常页面位置x方向平移100vp，y方向平移100vp，透明度变为0，时长为1200ms，无论页面栈发生push还是pop操作均可生效
    PageTransitionExit({ duration: 1200 })
      .translate({ x: 100.0, y: 100.0 } as TranslateOptions)
      .opacity(0)
  }
}

// [End pageTransition_template4_pageTransitionSrc2_start]
