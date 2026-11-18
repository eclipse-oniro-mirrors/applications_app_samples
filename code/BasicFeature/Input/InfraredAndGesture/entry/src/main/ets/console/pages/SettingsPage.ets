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

import { router } from '@kit.ArkUI';
import { AppLogger, StringResources } from 'common';
import { SendLogPanel } from 'consoleui';
import { SendLog, SendLogDao } from 'room';

const SCOPE: string = 'SettingsPage';
/** Maximum number of recent send logs shown on the page. */
const LOG_LIMIT: number = 100;
/** Vertical gap between the settings sections. */
const SECTION_GAP_VP: string = '12vp';
/** Default inner spacing for rows and columns. */
const INNER_GAP_VP: string = '8vp';
/** Height of the back button. */
const BACK_HEIGHT_VP: string = '32vp';

/**
 * Phone-side settings page.
 * Shows the recent infrared send log list for troubleshooting.
 */
@Entry
@ComponentV2
struct SettingsPage {
  @Local logs: SendLog[] = [];
  @Local statusText: string = '';

  /** Kick off the initial log load when the page appears. */
  aboutToAppear(): void {
    this.init();
  }

  /** Load the most recent send logs. */
  private async init(): Promise<void> {
    await this.runAction(async (): Promise<void> => {
      this.logs = await SendLogDao.listRecent(LOG_LIMIT);
    });
  }

  /** Run an action, converting failures into a localized status text. */
  private async runAction(action: () => Promise<void>): Promise<void> {
    try {
      await action();
    } catch (error) {
      const detail: string = error instanceof Error ? error.message :
        StringResources.get($r('app.string.msg_operation_failed'));
      this.statusText = detail;
      AppLogger.error(SCOPE, detail);
    }
  }

  /** Build the page: header, status text and send log section. */
  build() {
    RelativeContainer() {
      Scroll() {
        Column({ space: SECTION_GAP_VP }) {
          Row({ space: INNER_GAP_VP }) {
            Button($r('app.string.phone_back'))
              .id('id_settings_back')
              .height(BACK_HEIGHT_VP)
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.accent'))
              .backgroundColor($r('app.color.bg_card'))
              .borderRadius($r('app.float.card_radius'))
              .onClick(() => {
                router.back();
              })
            Text($r('app.string.phone_settings'))
              .id('id_settings_title')
              .fontSize($r('app.float.title_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Bold)
              .layoutWeight(1)
          }
          .id('id_settings_header')
          .width('100%')
          .alignItems(VerticalAlign.Center)

          if (this.statusText.length > 0) {
            Text(this.statusText)
              .id('id_settings_status')
              .width('100%')
              .fontSize($r('app.float.caption_font'))
              .fontColor($r('app.color.text_secondary'))
          }

          Column({ space: INNER_GAP_VP }) {
            Text($r('app.string.phone_send_logs'))
              .id('id_send_logs_title')
              .fontSize($r('app.float.body_font'))
              .fontColor($r('app.color.text_primary'))
              .fontWeight(FontWeight.Medium)
              .width('100%')

            SendLogPanel({ logs: this.logs })
          }
          .id('id_send_logs_section')
          .width('100%')
        }
        .id('id_settings_content')
        .width('100%')
        .padding($r('app.float.page_padding'))
      }
      .id('id_settings_scroll')
      .width('100%')
      .height('100%')
    }
    .id('id_settings_root')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
