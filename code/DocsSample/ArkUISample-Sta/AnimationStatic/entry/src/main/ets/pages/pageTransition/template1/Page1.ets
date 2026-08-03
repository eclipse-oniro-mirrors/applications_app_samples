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
  Entry,
  Component,
  State,
  Column,
  Image,
  $r,
  Curve,
  RouteType,
  PageTransitionEnter,
  PageTransitionExit,
  PageTransitionOptions,
  ScaleOptions,
  PageTransitionCallback
} from '@kit.ArkUI';

@Entry
@Component
struct pageTransitionPage1 {
  @State scale2: double = 1;
  @State opacity2: double = 1;

  build() {
    Column() {
      // 请将$r('app.media.transition_image2')替换为实际资源文件
      Image($r('app.media.transition_image2')).width('100%').height('100%') // 图片存放在media文件夹下
    }
    .width('100%')
    .height('100%')
    .scale({ x: this.scale2 } as ScaleOptions)
    .opacity(this.opacity2)
    .onClick(() => {
      this.getUIContext().getRouter().pushUrl({ url: 'pages/pageTransition/template1/Index' });
    })
  }

  pageTransition() {
    PageTransitionEnter({ duration: 1200, curve: Curve.Linear } as PageTransitionOptions)
      .onEnter((type: RouteType, progress: double) => {
        if (type == RouteType.Push || type == RouteType.Pop) {
          this.scale2 = progress;
        }
        this.opacity2 = progress;
      } as PageTransitionCallback)
    PageTransitionExit({ duration: 1200, curve: Curve.Ease } as PageTransitionOptions)
      .onExit((type: RouteType, progress: double) => {
        if (type == RouteType.Pop) {
          this.scale2 = 1 - progress;
          this.opacity2 = 1 - progress;
        }
      } as PageTransitionCallback)
  }
}
