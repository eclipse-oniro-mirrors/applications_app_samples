/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

// [Start action]
import { Decimal } from '@kit.ArkTS';
import { ArcSwiper, ArcSwiperContentTransitionProxy } from '@ohos.arkui.ArcSwiper';
import { Color, Component, $r, ColumnOptions, Column, ForEach, Padding, Text, TextAlign, Entry, NavDestination } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
// [StartExclude action]
import { ComponentCard } from '../../common/Card';

// [EndExclude action]

// 如需作为页面入口，请取消@Entry的注释并删除export关键字
@Entry
@Component
export struct ArcSwiperAction {
  private MIN_SCALE: number = 0.1;
  @State backgroundColors: Array<Color> = [Color.Green, Color.Blue, Color.Yellow, Color.Pink, Color.Gray, Color.Orange];
  @State opacityList: Array<number> = new Array<number>();
  @State scaleList: Array<number> = new Array<number>();

  aboutToAppear(): void {
    for (let i = 0; i < this.backgroundColors.length; i++) {
      this.opacityList.push(1.0);
      this.scaleList.push(1.0);
    }
  }

  build(): void {
    // [StartExclude action]
    NavDestination() {
      // [EndExclude action]
      Column({ space: 12 } as ColumnOptions) {
        // [StartExclude action]
        ComponentCard({ title: $r('app.string.ArcSwiperAction_title') }) {
          // [EndExclude action]
          ArcSwiper() {
            ForEach(this.backgroundColors, (backgroundColor: Color, index: int) => {
              Text(index.toString())
                .width(233)
                .height(233)
                .fontSize(50)
                .textAlign(TextAlign.Center)
                .backgroundColor(backgroundColor)
                .opacity(this.opacityList[index])
                .scale({ x: this.scaleList[index], y: this.scaleList[index] })
            })
          }
          .customContentTransition({
            timeout: 1000,
            transition: (proxy: ArcSwiperContentTransitionProxy) => {
              if (proxy.position <= -1 || proxy.position >= 1) {
                // 页面完全滑出视窗外时，重置属性值
                this.opacityList[proxy.index] = 1.0;
                this.scaleList[proxy.index] = 1.0;
              } else {
                let position: number = Decimal.abs(proxy.position).toNumber();
                this.opacityList[proxy.index] = 1 - position;
                this.scaleList[proxy.index] =
                  this.MIN_SCALE + (1 - this.MIN_SCALE) * (1 - position);
              }
            }
          })

          // [StartExclude action]
        }

        // [EndExclude action]
      }
      .width('100%')
      // [StartExclude action]
      .height('100%')
      .padding({ left: 12, right: 12 } as Padding)
    }
    .backgroundColor('#f1f2f3')
    .title($r('app.string.ArcSwiperAction_title'))

    // [EndExclude action]
  }
}

// [End action]