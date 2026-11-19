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
import { PromptAction } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';
import { getCEErrMsg } from '../common/CEErrorMap';

const CE_ERR_OK = 0;
const LABEL_FONT_SIZE = 14;
const SELECT_WIDTH = 100;
const SELECT_HEIGHT = 40;
const SMALL_MARGIN = 10;
const CELL_PADDING = 12;
const ICON_SIZE = 64;
const BORDER_WIDTH = 1;
const CONTAINER_PADDING = 20;
const BORDER_RADIUS = 16;
const DEFAULT_LOCALE = 'zh-cn';

@Entry
@Component
struct FormatChooseQuery {
  @State oeid: string = '';
  @State locale: string = DEFAULT_LOCALE;
  @State datas: testNapi.FormatInfo[] = [];
  private context?: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();
  private stateOptions: SelectOption[] = [
    { value: 'zh-cn' },
    { value: 'en' },
  ];

  aboutToAppear(): void {
    // Prefer the system locale stored by EntryAbility.updateConfigurationToStorage
    // (e.g. "zh-hans-cn" lowercased); fall back to 'zh-cn' when unavailable.
    // If the system locale is not one of the preset options, prepend it so the
    // Select shows a valid entry for the default value.
    const storedLocale: string | undefined = AppStorage.get<string>('locale');
    if (storedLocale !== undefined && storedLocale.length > 0) {
      this.locale = storedLocale;
      if (storedLocale !== DEFAULT_LOCALE && storedLocale !== 'en') {
        this.stateOptions = [{ value: storedLocale }, ...this.stateOptions];
      }
    }
  }

  build() {
    Scroll() {
      Column() {
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
          Text($r('app.string.label_oeid'))
          TextInput({ text: this.oeid })
            .onChange((value: string) => {
              this.oeid = value;
            })
            .fontSize(LABEL_FONT_SIZE)
            .layoutWeight(1)
            .margin({ right: SMALL_MARGIN })
          Text($r('app.string.label_locale'))
          Select(this.stateOptions)
            .width(SELECT_WIDTH)
            .height(SELECT_HEIGHT)
            .value(this.locale)
            .onSelect((index: number, value: string) => {
              this.locale = value;
            })
            .margin({ right: SMALL_MARGIN })
          Button($r('app.string.btn_query'))
            .onClick((event: ClickEvent) => {
              if (this.oeid) {
                let result: Result<testNapi.FormatInfo> = testNapi.query(this.oeid, this.locale);
                if (result.errCode === CE_ERR_OK) {
                  this.datas = [ result.data ];
                } else {
                  this.showResult(result.errCode);
                }
              } else {
                let result: Result<testNapi.FormatInfo[]> = testNapi.queryAll(this.locale);
                if (result.errCode === CE_ERR_OK) {
                  this.datas = result.data;
                } else {
                  this.showResult(result.errCode);
                }
              }
            })
        }
        .margin({ bottom: SMALL_MARGIN })
        // Result list.
        Column() {
          Row() {
            Text($r('app.string.query_header_oeid'))
              .width('22%')
              .textAlign(TextAlign.Start)
            Text($r('app.string.query_header_name'))
              .width('12%')
              .textAlign(TextAlign.Start)
            Text($r('app.string.query_header_description'))
              .width('26%')
              .textAlign(TextAlign.Start)
            Text($r('app.string.query_header_extensions'))
              .width('25%')
              .textAlign(TextAlign.Start)
            Text($r('app.string.query_header_icon'))
              .width('15%')
              .textAlign(TextAlign.Start)
          }
          .padding(CELL_PADDING)
          .backgroundColor($r('app.color.toolbar_background'))
          .border({ width: BORDER_WIDTH, color: $r('app.color.table_divider') })
          if (this.datas.length) {
            List() {
              ForEach(this.datas, (item: testNapi.FormatInfo) => {
                ListItem() {
                  Row() {
                    Text(item.oeid)
                      .textSelectable(TextSelectableMode.SELECTABLE_FOCUSABLE)
                      .copyOption(CopyOptions.InApp)
                      .width('22%')
                      .textAlign(TextAlign.Start)
                    Text(item.name)
                      .width('12%')
                      .textAlign(TextAlign.Start)
                    Text(item.description)
                      .width('26%')
                      .textAlign(TextAlign.Start)
                    Text(item.fileExtensions.join(', '))
                      .textSelectable(TextSelectableMode.SELECTABLE_FOCUSABLE)
                      .copyOption(CopyOptions.InApp)
                      .width('25%')
                      .textAlign(TextAlign.Start)
                    Column() {
                      Image(item.icon).width(ICON_SIZE).height(ICON_SIZE)
                    }
                    .width('15%')
                    .alignItems(HorizontalAlign.Center)
                  }
                  .padding(CELL_PADDING)
                  .border({ width: BORDER_WIDTH, color: $r('app.color.table_divider') })
                }
              })
            }.width('100%')
          } else {
            Row() {
              Text($r('app.string.no_data'))
                .width('100%')
                .textAlign(TextAlign.Center)
            }
            .padding(CELL_PADDING)
            .border({ width: BORDER_WIDTH, color: $r('app.color.table_divider') })
          }
        }
      }
    }
    .padding(CONTAINER_PADDING)
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.item_default_background'))
    .borderRadius(BORDER_RADIUS)
    .border({ width: BORDER_WIDTH, color: $r('app.color.card_border') })
  }

  showResult(result: number): void {
    if (result === CE_ERR_OK) {
      this.promptAction.showDialog({
        title: $r('app.string.title_success'),
        buttons: [
          {
            text: $r('app.string.btn_ok'),
            color: $r('app.color.button_text_color')
          }
        ]
      })
    } else {
      this.promptAction.showDialog({
        title: $r('app.string.title_failed'),
        message: getCEErrMsg(result, this.context),
        buttons: [
          {
            text: $r('app.string.btn_ok'),
            color: $r('app.color.button_text_color')
          }
        ]
      })
    }
  }
}
