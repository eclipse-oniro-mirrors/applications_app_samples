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

import { BusinessError } from '@kit.BasicServicesKit';
import { KeyStyle, StyleConfiguration } from '../common/StyleConfiguration';
import { InputHandler } from '../InputMethodExtensionAbility/model/KeyboardController';

@Preview
@Component
export struct TopMenu {
  @StorageLink('inputStyle') inputStyle: KeyStyle = StyleConfiguration.getSavedInputStyle();
  @StorageLink('isSplitKeyboard') isSplitKeyboard: boolean = false;

  // 放手后取布局最外层控件相对屏幕的左上角位置，作为 moveTo 的目标位置
  private handleDragEnd(): void {
    try {
      setTimeout(() => {
        let info = this.getUIContext().getComponentUtils().getRectangleById('keyboardRoot');
        InputHandler.getInstance().movePanelByComponentPos(info.screenOffset.x, info.screenOffset.y);
      }, 200);
    } catch (err) {
      let error = err as BusinessError;
      InputHandler.getInstance().addLog(`handleDragEnd getRectangleById catch error: ${error.code} ${error.message}`);
    }
  }

  // 分体模式左半顶栏
  @Builder
  splitTopLeft() {
    Row() {
      Stack() {
        Image($r('app.media.ic_more'))
          .width(this.inputStyle.downMenuPicWidth)
          .height(this.inputStyle.downMenuPicHeight)
          .objectFit(ImageFit.Contain)
      }
      .margin({ left: 8 })
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        InputHandler.getInstance().switchToFixedPanel();
        this.isSplitKeyboard = false;
      })
    }
    .width('100%')
    .height('100%')
    .alignItems(VerticalAlign.Center)
  }

  // 分体模式右半顶栏
  @Builder
  splitTopRight() {
    Row() {
      Stack() {
        Image($rawfile('down.svg'))
          .width(this.inputStyle.downMenuPicWidth)
          .height(this.inputStyle.downMenuPicHeight)
          .objectFit(ImageFit.Contain)
      }
      .width(this.inputStyle.downMenuWidth)
      .borderRadius(4)
      .height('100%')
      .onClick(() => {
        InputHandler.getInstance().hideKeyboardSelf();
      })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
    .alignItems(VerticalAlign.Center)
  }

  build() {
    if (this.isSplitKeyboard) {
      Row() {
        Column() {
          this.splitTopLeft()
        }
        .width('40%')
        .height('100%')
        .backgroundColor(Color.White)
        .borderRadius(16)
        .gesture(PanGesture()
          .onActionStart(() => {
            InputHandler.getInstance().startMovingPanel();
          })
          .onActionEnd(() => {
            // 放手后取布局最外层控件相对屏幕的左上角位置，作为 moveTo 的目标位置
            this.handleDragEnd();
          }))

        Column()
          .layoutWeight(1)
          .height('100%')

        Column() {
          this.splitTopRight()
        }
        .width('40%')
        .height('100%')
        .backgroundColor(Color.White)
        .borderRadius(16)
        .gesture(PanGesture()
          .onActionStart(() => {
            InputHandler.getInstance().startMovingPanel();
          })
          .onActionEnd(() => {
            // 放手后取布局最外层控件相对屏幕的左上角位置，作为 moveTo 的目标位置
            this.handleDragEnd();
          }))
      }
      .width('100%')
      .height(this.inputStyle.downMenuHeight)
      .padding({
        left: this.inputStyle.paddingLeftRight,
        right: this.inputStyle.paddingLeftRight
      })
    } else {
      Column() {
        Divider()
          .color($r('app.color.light_gray'))
          .width('100%')
          .margin({ bottom: 11 })
        Row() {
          Stack() {
            Image($r('app.media.ic_more'))
              .width(this.inputStyle.downMenuPicWidth)
              .height(this.inputStyle.downMenuPicHeight)
              .objectFit(ImageFit.Contain)
              .id('keyboardMore')
          }
          .margin({ left: 8 })
          .width(this.inputStyle.downMenuWidth)
          .borderRadius(4)
          .height('100%')
          .onClick(() => {
            InputHandler.getInstance().switchToDetachedPanel();
            this.isSplitKeyboard = true;
          })

          Blank()
          Divider()
            .vertical(true)
            .color($r('app.color.light_gray'))
            .margin({ right: 8 })
          Stack() {
            Image($rawfile('down.svg'))
              .width(this.inputStyle.downMenuPicWidth)
              .height(this.inputStyle.downMenuPicHeight)
              .objectFit(ImageFit.Contain)
              .id('kikaInputDown')
          }
          .width(this.inputStyle.downMenuWidth)
          .borderRadius(4)
          .height('100%')
          .onClick(() => {
            InputHandler.getInstance().hideKeyboardSelf();
          })
        }
        .width('100%')
        .layoutWeight(1)

        Row() {
          Divider()
            .color($r('app.color.light_gray'))
            .width(this.inputStyle.editDriverLeft)
          Divider()
            .color($r('app.color.light_gray'))
            .layoutWeight(1)
        }
        .height(12)
        .alignItems(VerticalAlign.Bottom)
      }
      .width('100%')
      .height(this.inputStyle.downMenuHeight)
      .backgroundColor(Color.Transparent)
    }
  }
}
