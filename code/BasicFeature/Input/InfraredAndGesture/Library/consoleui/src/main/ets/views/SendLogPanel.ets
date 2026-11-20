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

import { SendLog } from 'room';

/** Send-log result markers used by the send_log table. */
const RESULT_SUCCESS: string = 'SUCCESS';
/** Values below this threshold are padded to two digits in time formatting. */
const TWO_DIGIT_THRESHOLD: number = 10;
/** Single-digit prefix used when padding time segments. */
const PAD_PREFIX: string = '0';
/** Separator used between hour, minute and second segments. */
const TIME_SEPARATOR: string = ':';

/**
 * Panel that renders the recent manual send logs as rows.
 * It is purely presentational and performs no side effects.
 */
@ComponentV2
export struct SendLogPanel {
  /** Send logs rendered by the panel, newest last. */
  @Param logs: SendLog[] = [];

  /** Maps a send result marker to its localized label. */
  private resultText(result: string): Resource {
    return result === RESULT_SUCCESS ?
      $r('app.string.send_success') : $r('app.string.send_failed');
  }

  /** Maps a send result marker to its row color. */
  private resultColor(result: string): Resource {
    return result === RESULT_SUCCESS ?
      $r('app.color.success') : $r('app.color.danger');
  }

  /** Pads a value to two digits, e.g. 7 becomes 07. */
  private pad(value: number): string {
    return value < TWO_DIGIT_THRESHOLD ? `${PAD_PREFIX}${value}` : value.toString();
  }

  /** Formats a timestamp as a local HH:MM:SS string. */
  private formatTime(timestamp: number): string {
    const date: Date = new Date(timestamp);
    const hours: string = this.pad(date.getHours());
    const minutes: string = this.pad(date.getMinutes());
    const seconds: string = this.pad(date.getSeconds());
    return `${hours}${TIME_SEPARATOR}${minutes}${TIME_SEPARATOR}${seconds}`;
  }

  /** Renders either the empty hint or the log rows. */
  build() {
    Column({ space: '8vp' }) {
      if (this.logs.length === 0) {
        Text($r('app.string.no_logs'))
          .id('id_log_empty')
          .fontSize($r('app.float.caption_font'))
          .fontColor($r('app.color.text_secondary'))
      } else {
        Column({ space: '6vp' }) {
          Repeat<SendLog>(this.logs)
            .each((item: RepeatItem<SendLog>) => {
              Row({ space: '8vp' }) {
                Text(this.formatTime(item.item.timestamp))
                  .id('id_log_time_' + item.item.id)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_secondary'))
                Text(item.item.deviceId)
                  .id('id_log_device_' + item.item.id)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_primary'))
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(item.item.keyId)
                  .id('id_log_key_' + item.item.id)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_primary'))
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text(this.resultText(item.item.result))
                  .id('id_log_result_' + item.item.id)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(this.resultColor(item.item.result))
                Text($r('app.string.duration_ms', item.item.durationMs))
                  .id('id_log_duration_' + item.item.id)
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_secondary'))
              }
              .id('id_log_row_' + item.item.id)
              .width('100%')
              .alignItems(VerticalAlign.Center)
            })
            .key((item: SendLog): string => item.id)
        }
        .id('id_log_list')
        .width('100%')
      }
    }
    .id('id_send_log_panel')
    .width('100%')
    .padding($r('app.float.page_padding'))
    .backgroundColor($r('app.color.bg_card'))
    .borderRadius($r('app.float.card_radius'))
  }
}
