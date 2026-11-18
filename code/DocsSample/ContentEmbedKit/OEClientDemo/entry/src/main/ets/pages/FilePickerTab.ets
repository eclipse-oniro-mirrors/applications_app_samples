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

import { fileIo as fs, picker } from '@kit.CoreFileKit';
import { PromptAction, window } from '@kit.ArkUI';
import { BusinessError, emitter } from '@kit.BasicServicesKit';
import { fileSelectedEvent } from '../utils/InnerEvent';
import { common } from '@kit.AbilityKit';
import { Logger } from '../common/Logger';

const MAX_SELECT_NUMBER = 1;
const BUTTON_WIDTH = 80;
const CONTAINER_PADDING = 20;
const BORDER_RADIUS = 16;
const BORDER_WIDTH = 1;
const INPUT_MARGIN = 10;
const BUTTON_MARGIN = 10;
const LABEL_RIGHT_MARGIN = 20;
const BUTTON_RIGHT_MARGIN = 10;
const ROW_VERTICAL_MARGIN = 10;

@Entry({ useSharedStorage: true })
@Component
struct FilePickerTab {
  @State filePath: string = '';
  @State fileUri: string = '';
  @State isLinking: boolean = false;
  private context?: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();

  build() {
    RelativeContainer() {
      Column() {
        Row() {
          Text($r('app.string.label_file_path'))
        }
        Flex({ wrap: FlexWrap.Wrap, alignItems: ItemAlign.Center }) {
          TextInput({ text: this.filePath })
            .onChange((value: string) => {
              this.filePath = value;
            })
            .width('70%')
            .margin(INPUT_MARGIN)
          Button($r('app.string.btn_browse'))
            .onClick(() => {
              this.onButtonClick();
            })
            .margin(BUTTON_MARGIN)
        }
        Row() {
          Text($r('app.string.label_insert_method'))
          Radio({ value: 'copy', group: 'isLinkingGroup' })
            .checked(!this.isLinking)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.isLinking = false;
              }
            })
          Text($r('app.string.radio_copy'))
            .margin({ right: LABEL_RIGHT_MARGIN })
          Radio({ value: 'link', group: 'isLinkingGroup' })
            .checked(this.isLinking)
            .onChange((isChecked: boolean) => {
              if (isChecked) {
                this.isLinking = true;
              }
            })
          Text($r('app.string.radio_link'))
        }
        .margin({ top: ROW_VERTICAL_MARGIN, bottom: ROW_VERTICAL_MARGIN })
      }
      .alignItems(HorizontalAlign.Start)
      .alignRules({
        top: { anchor: '__container__', align: VerticalAlign.Top },
        left: { anchor: '__container__', align: HorizontalAlign.Start }
      })
      Row() {
        Button($r('app.string.btn_confirm'), { buttonStyle: ButtonStyleMode.EMPHASIZED })
          .width(BUTTON_WIDTH)
          .margin({ right: BUTTON_RIGHT_MARGIN })
          .onClick(() => {
            if (this.filePath) {
              // Emit the selection to the main window; the main window creates the proxy.
              // fileUri is the picker-returned URI (file://docs/...); linking mode needs
              // it to persist + activate read/write permission via OH_FileShare_*.
              let event: emitter.EventData = {
                data: { path: this.filePath, uri: this.fileUri, isLinking: this.isLinking }
              };
              emitter.emit(fileSelectedEvent, event);
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

  onButtonClick(): void {
    let options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
    options.selectMode = picker.DocumentSelectMode.FILE;
    options.maxSelectNumber = MAX_SELECT_NUMBER;
    let documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
    documentPicker.select(options).then((uris: string[]) => {
      if (uris.length > 0) {
        let dirUri: string = uris[0];
        let file: fs.File | undefined = undefined;
        try {
          file = fs.openSync(dirUri);
          // Keep both: fileUri is the picker URI (file://docs/...) needed for linking-mode
          // permission persistence;
          this.fileUri = dirUri;
          this.filePath = file.path;
        } catch (error) {
          Logger.error('openSync failed: %{public}s', JSON.stringify(error));
        } finally {
          if (file) {
            fs.closeSync(file);
          }
        }
      }
    }).catch((err: BusinessError) => {
      Logger.error('Invoke documentViewPicker.select failed, code is %{public}d, message is %{public}s',
        err.code, err.message);
    });
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
}
