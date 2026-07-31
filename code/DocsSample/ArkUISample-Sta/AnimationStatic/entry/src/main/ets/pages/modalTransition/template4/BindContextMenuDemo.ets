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

// [Start bind_context_menu_demo]
import {
  $r,
  Entry,
  Component,
  Builder,
  Column,
  Row,
  Text,
  Image,
  ForEach,
  Color,
  TextAlign,
  HorizontalAlign,
  ResponseType,
  Resource,
  Padding,
  BorderOptions,
  ShadowOptions
} from '@ohos.arkui.component';

@Entry
@Component
struct BindContextMenuDemo {
  // 请将$r('app.string.modal_transition_text25')替换为实际资源文件，在本示例中该资源文件的value值为"保存图片"
  private menu: Array<Resource> = [$r('app.string.modal_transition_text25'),
    // 请将$r('app.string.modal_transition_text26')替换为实际资源文件，在本示例中该资源文件的value值为"收藏"
    $r('app.string.modal_transition_text26'),
    // 请将$r('app.string.modal_transition_text27')替换为实际资源文件，在本示例中该资源文件的value值为"搜一搜"
    $r('app.string.modal_transition_text27')];
  // 请将$r('app.media.icon_2')替换为实际资源文件
  private pics: Array<Resource> = [$r('app.media.icon_1'), $r('app.media.icon_2')];

  // 通过@Builder构建自定义菜单项
  @Builder
  myMenu(): void {
    Column() {
      ForEach(this.menu, (item: Resource) => {
        Row() {
          Text(item)
            .fontSize(18)
            .width('100%')
            .textAlign(TextAlign.Center)
        }
        .padding(15)
        .border({ width: { bottom: 1 }, color: 0xcccccc } as BorderOptions)
      })
    }
    .width(140)
    .borderRadius(15)
    .shadow({ radius: 15, color: '#f1f1f1' } as ShadowOptions)
    .backgroundColor(0xf1f1f1)
  }

  build(): void {
    Column() {
      Row() {
        // 请将$r('app.string.modal_transition_text28')替换为实际资源文件，在本示例中该资源文件的value值为"查看图片"
        Text($r('app.string.modal_transition_text28'))
          .fontSize(20)
          .fontColor(Color.White)
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 20, bottom: 20 } as Padding)
      }
      .backgroundColor(0x007dfe)

      Column() {
        ForEach(this.pics, (item: Resource) => {
          Row() {
            Image(item)
              .width('100%')
              .draggable(false)
          }
          .padding({
            top: 20,
            bottom: 20,
            left: 10,
            right: 10
          } as Padding)
          .bindContextMenu(this.myMenu, ResponseType.LongPress)
        })
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}

// [End bind_context_menu_demo]
