/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { PromptAction } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { CECardViewModel } from '../common/CECardViewModel';
import { getCEErrMsg } from '../common/CEErrorMap';

const CE_ERR_OK = 0;
const NAME_FONT_SIZE = 16;
const CARD_PADDING = 2;
const CARD_WIDTH = 400;
const CARD_HEIGHT = 300;
const CARD_MARGIN = 8;
const CARD_BORDER_WIDTH = 2;
const CLOSE_ICON_SIZE = 24;
const CLOSE_ICON_MARGIN = 4;

@Component
export struct FileCard {
  @ObjectLink item: CECardViewModel;
  @State showCloseButton: boolean = false;
  onRemove: () => void = () => {};
  private context?: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Column() {
        if (this.item.hasSnapshotImage) {
          Image(this.item.snapshotImage)
            .objectFit(ImageFit.Contain)
            .width('100%')
            .height('100%')
        } else if (this.item.snapshotUri) {
          Image(this.item.snapshotUri)
            .objectFit(ImageFit.Contain)
            .width('100%')
            .height('100%')
        } else {
          Text(this.item.name)
            .fontSize(NAME_FONT_SIZE)
        }
      }
      .padding(CARD_PADDING)
      .gesture(
        TapGesture({ count: 2 })
          .onAction(() => {
            const errCode: number = this.item.proxy.doEdit();
            if (errCode !== CE_ERR_OK) {
              this.promptAction.showDialog({
                title: $r('app.string.title_open_failed'),
                message: getCEErrMsg(errCode, this.context),
                buttons: [
                  { text: $r('app.string.btn_ok'), color: $r('app.color.button_text_color') }
                ]
              });
            }
          })
      )
      .width(CARD_WIDTH)
      .height(CARD_HEIGHT)
      .margin(CARD_MARGIN)
      .border({
        width: CARD_BORDER_WIDTH,
        color: $r('app.color.brand_color'),
        style: BorderStyle.Dashed
      })
      if (this.showCloseButton) {
        Text() {
          SymbolSpan($r('sys.symbol.xmark_circle'))
            .width(CLOSE_ICON_SIZE)
            .height(CLOSE_ICON_SIZE)
            .margin(CLOSE_ICON_MARGIN)
        }
        .backgroundColor(Color.White)
        .onClick(() => {
          this.item.proxy.destroy();
          this.onRemove();
        })
      }
    }
    .onHover((isHover: boolean) => {
      this.showCloseButton = isHover;
    })
    .gesture(
      TapGesture({ count: 1 })
        .onAction(() => {
          this.showCloseButton = !this.showCloseButton;
        })
    )
  }
}
