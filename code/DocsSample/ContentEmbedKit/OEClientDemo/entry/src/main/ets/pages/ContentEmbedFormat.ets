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

import testNapi, { Result } from 'libentry.so';
import { image } from '@kit.ImageKit';
import { PromptAction, window } from '@kit.ArkUI';
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { formatSelectedEvent } from '../utils/InnerEvent';
import { Logger } from '../common/Logger';
import { getCEErrMsg } from '../common/CEErrorMap';

const CE_ERR_OK = 0;
const LIST_ITEM_FONT_SIZE = 18;
const LIST_LEFT_MARGIN = 10;
const ICON_SIZE = 64;
const ICON_BORDER_WIDTH = 2;
const ICON_MARGIN = 8;
const BUTTON_WIDTH = 80;
const BUTTON_RIGHT_MARGIN = 10;
const DESCRIPTION_PADDING = 10;
const CONTAINER_PADDING = 20;
const BORDER_RADIUS = 16;
const BORDER_WIDTH = 1;
const DEFAULT_LOCALE = 'zh-cn';
const SELECTED_INDEX_NONE = -1;

@Entry({ useSharedStorage: true })
@Component
struct FormatChoose {
  @State selectedIndex: number = SELECTED_INDEX_NONE;
  @State selectedItem?: testNapi.FormatInfo = undefined;
  @State pixelMap?: image.PixelMap = undefined;
  private context?: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private dataItems: testNapi.FormatInfo[] = [];
  private promptAction: PromptAction = this.getUIContext().getPromptAction();

  aboutToAppear(): void {
    // Prefer the system locale stored by EntryAbility.updateConfigurationToStorage
    // (e.g. "zh-hans-cn" lowercased); fall back to 'zh-cn' when unavailable.
    let locale: string = DEFAULT_LOCALE;
    const storedLocale: string | undefined = AppStorage.get<string>('locale');
    if (storedLocale !== undefined && storedLocale.length > 0) {
      locale = storedLocale;
    }
    let result: Result<testNapi.FormatInfo[]> = testNapi.queryAll(locale);
    if (result.errCode === CE_ERR_OK) {
      this.dataItems = result.data;
    } else {
      Logger.error('queryAll failed, errCode: %{public}d', result.errCode);
      this.showResult(result.errCode);
    }
  }

  build() {
    RelativeContainer() {
      List() {
        ForEach(this.dataItems, (item: testNapi.FormatInfo, index: number) => {
          ListItem() {
            Text(item.name)
              .fontSize(LIST_ITEM_FONT_SIZE)
              .margin({ left: LIST_LEFT_MARGIN })
          }
          .align(Alignment.TopStart)
          .borderWidth({ bottom: BORDER_WIDTH })
          .backgroundColor(
            this.selectedIndex === index
              ? $r('app.color.item_selected_background')
              : $r('app.color.item_default_background')
          )
          .width('100%')
          .onClick(() => {
            this.selectedIndex = index;
            this.selectedItem = item;
          })
        })
      }
      .id('list')
      .borderWidth(BORDER_WIDTH)
      .width('calc(100% - 80vp)')
      .height('60%')
      .scrollBar(BarState.Auto)
      .edgeEffect(EdgeEffect.Spring)
      if (this.selectedItem && this.selectedItem.icon) {
        Image(this.selectedItem.icon)
          .width(ICON_SIZE)
          .height(ICON_SIZE)
          .border({
            width: ICON_BORDER_WIDTH,
            color: $r('app.color.brand_color'),
            style: BorderStyle.Dashed
          })
          .margin(ICON_MARGIN)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            left: { anchor: 'list', align: HorizontalAlign.End }
          })
      }
      Row() {
        Text(this.selectedItem?.description)
          .maxLines(2)
      }
      .width('100%')
      .padding(DESCRIPTION_PADDING)
      .alignRules({
        top: { anchor: 'list', align: VerticalAlign.Bottom },
        left: { anchor: '__container__', align: HorizontalAlign.Start }
      })
      Row() {
        Button($r('app.string.btn_confirm'), { buttonStyle: ButtonStyleMode.EMPHASIZED })
          .width(BUTTON_WIDTH)
          .margin({ right: BUTTON_RIGHT_MARGIN })
          .onClick(() => {
            if (this.selectedItem) {
              // Emit the selection to the main window; the main window creates the proxy.
              let event: emitter.EventData = {
                data: { oeid: this.selectedItem.oeid }
              };
              emitter.emit(formatSelectedEvent, event);
              this.closeWindow();
            }
          })
        Button($r('app.string.btn_cancel'), { buttonStyle: ButtonStyleMode.NORMAL })
          .width(BUTTON_WIDTH)
          .onClick(() => {
            this.closeWindow();
          })
      }
      .alignRules({
        bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
        right: { anchor: '__container__', align: HorizontalAlign.End }
      })
    }
    .align(Alignment.TopStart)
    .width('100%')
    .height('100%')
    .padding(CONTAINER_PADDING)
    .backgroundColor($r('app.color.item_default_background'))
    .borderRadius(BORDER_RADIUS)
    .border({ width: BORDER_WIDTH, color: $r('app.color.card_border') })
  }

  private closeWindow(): void {
    if (this.context === undefined) {
      Logger.error('closeWindow: context is undefined.');
      return;
    }
    window.getLastWindow(this.context).then((value: window.Window) => {
      value.destroyWindow().then(() => {
        Logger.info('close subwindow success.');
      }).catch(() => {
        Logger.error('close subwindow failed.');
      });
    }).catch((err: BusinessError) => {
      Logger.error('getLastWindow failed: %{public}s', JSON.stringify(err));
    });
  }

  private showResult(result: number): void {
    if (result === CE_ERR_OK) {
      this.promptAction.showDialog({
        title: $r('app.string.title_success'),
        buttons: [
          { text: $r('app.string.btn_ok'), color: $r('app.color.button_text_color') }
        ]
      });
    } else {
      this.promptAction.showDialog({
        title: $r('app.string.title_failed'),
        message: getCEErrMsg(result, this.context),
        buttons: [
          { text: $r('app.string.btn_ok'), color: $r('app.color.button_text_color') }
        ]
      });
    }
  }
}
