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

// [Start bind_popup_demo]
import {
  $r,
  Entry,
  Component,
  Builder,
  Column,
  ColumnOptions,
  Row,
  Text,
  Button,
  FlexAlign,
  Placement,
  Color,
  CustomPopupOptions
} from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';

@Entry
@Component
struct BindPopupDemo {
  // 第一步：定义变量控制弹窗显示
  @State customPopup: boolean = false;

  // 第二步：popup构造器定义弹框内容
  @Builder
  popupBuilder(): void {
    Column({ space: 2 } as ColumnOptions) {
      Row().width(64)
        .height(64)
        .backgroundColor(0x409eff)
      Text('Popup')
        .fontSize(10)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.SpaceAround)
    .width(100)
    .height(100)
    .padding(5)
  }

  build(): void {
    Column() {

      Button('click')
      // 第四步：创建点击事件，控制弹窗显隐
        .onClick((): void => {
          this.customPopup = !this.customPopup;
        })
        .backgroundColor(0xf56c6c)
        // 第三步：使用bindPopup接口将弹窗内容绑定给元素
        .bindPopup(this.customPopup, {
          builder: this.popupBuilder,
          placement: Placement.Top,
          mask: { color: '#33000000' },
          popupColor: '#f56c6c',
          enableArrow: true,
          onStateChange: (e): void => {
            if (!e.isVisible) {
              this.customPopup = false;
            }
          }
        } as CustomPopupOptions)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height(437)
  }
}

// [End bind_popup_demo]
