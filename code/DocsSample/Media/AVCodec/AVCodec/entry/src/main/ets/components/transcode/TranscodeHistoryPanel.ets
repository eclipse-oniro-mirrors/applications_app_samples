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

import { TranscodeModel } from '../../model/TranscodeModel';
import { TranscodeHistoryEntry } from '../../model/TranscodeFilesModel';
import { TranscodeHistoryController } from '../../controller/TranscodeHistoryController';
import { LocalizedText } from '../../common/LocalizedText';

const HINT_FONT_SIZE: number = 12;
const WARNING_FONT_SIZE: number = 13;
const HISTORY_TITLE_FONT_SIZE: number = 14;
const HISTORY_TITLE_MAX_LINES: number = 2;
const HISTORY_CARD_PADDING: number = 12;
const HISTORY_CARD_RADIUS: number = 10;
const BYTES_PER_MIB: number = 1048576;
const MS_PER_SECOND: number = 1000;

@Component
export struct TranscodeHistoryPanel {
  @ObjectLink model: TranscodeModel;
  @ObjectLink history: TranscodeHistoryController;

  build() {
    Column({ space: 8 }) {
      Text($r('app.string.transcode_history')).fontSize(17).fontWeight(FontWeight.Medium)
      Text(LocalizedText.format($r('app.string.transcode_storage_usage'),
        (this.history.storageBytes / BYTES_PER_MIB).toFixed(1), this.history.orphanCount.toString()))
        .fontSize(HINT_FONT_SIZE)
        .fontColor('#667085')
      ForEach(this.history.entries, (entry: TranscodeHistoryEntry) => {
        Row({ space: 8 }) {
          Column({ space: 4 }) {
            Text(entry.title)
              .fontSize(HISTORY_TITLE_FONT_SIZE)
              .maxLines(HISTORY_TITLE_MAX_LINES)
            Text(`${new Date(entry.createdAt).toLocaleString()} · ${entry.configuration}`)
              .fontSize(HINT_FONT_SIZE)
            Text(`${(entry.status.elapsedMs / MS_PER_SECOND).toFixed(1)} s · ` +
              `${(entry.status.fileBytes / BYTES_PER_MIB).toFixed(1)} MiB · ${entry.status.stage}`)
              .fontSize(HINT_FONT_SIZE)
          }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)
            .onClick((): void => { void this.model.openHistory(this.getUIContext(), entry); })
          Button($r('app.string.transcode_delete_file'))
            .fontSize(HINT_FONT_SIZE)
            .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting && !this.model.picking &&
              !this.model.inspecting)
            .onClick((): void => { void this.model.deleteHistoryEntry(this.getUIContext(), entry); })
        }
        .width('100%')
        .padding(HISTORY_CARD_PADDING)
        .backgroundColor('#F2F4F7')
        .borderRadius(HISTORY_CARD_RADIUS)
      }, (entry: TranscodeHistoryEntry): string => entry.id)
      if (this.history.hasMore || this.history.loading) {
        Button(this.history.loading ? $r('app.string.transcode_history_loading') :
          $r('app.string.transcode_history_more'))
          .width('100%')
          .fontSize(WARNING_FONT_SIZE)
          .enabled(!this.history.loading && !this.model.busy && !this.model.queueRunning &&
            !this.model.exporting && !this.model.picking && !this.model.inspecting)
          .onClick((): void => { void this.model.loadMoreHistory(this.getUIContext()); })
      }
      Button($r('app.string.transcode_cleanup_orphans'))
        .width('100%')
        .fontSize(WARNING_FONT_SIZE)
        .enabled(!this.model.busy && !this.model.queueRunning && !this.model.exporting &&
          !this.model.picking && !this.model.inspecting && this.history.orphanCount > 0)
        .onClick((): void => { void this.model.cleanOrphanFiles(this.getUIContext()); })
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
  }
}
