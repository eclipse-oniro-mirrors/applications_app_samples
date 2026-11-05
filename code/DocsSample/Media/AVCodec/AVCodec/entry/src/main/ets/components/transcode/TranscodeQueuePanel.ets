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

import { TranscodeQueueModel, TranscodeQueueItem } from '../../model/TranscodeQueueModel';
import { TranscodeExportController, TranscodeExportResult } from '../../controller/TranscodeExportController';
import { LocalizedText } from '../../common/LocalizedText';

@Component
export struct TranscodeQueuePanel {
  @ObjectLink queue: TranscodeQueueModel;
  @ObjectLink exports: TranscodeExportController;
  @Prop running: boolean = false;
  @Prop canAdd: boolean = false;
  onAdd: () => void = (): void => {};
  onRun: () => void = (): void => {};
  onChanged: () => void = (): void => {};
  onRelink: (id: string) => void = (_id: string): void => {};
  onBatch: (gallery: boolean) => void = (_gallery: boolean): void => {};
  onExport: (gallery: boolean) => void = (_gallery: boolean): void => {};
  @Prop canBatch: boolean = false;

  private summary(item: TranscodeQueueItem): string {
    const mode: string = item.options[1] === 0 ? 'Buffer' : item.options[1] === 2 ? 'OpenGL' :
      LocalizedText.get($r('app.string.transcode_window_mode'));
    return (item.quality?.operation === 1 ? 'Remux' : item.options[0] === 0 ? 'H.264' : 'H.265') +
      ' · ' + mode + ' · ' + ([0, 1920, 1080, 720][item.options[2]] || 'Original') +
      ' · ' + [2, 4, 8, 16][item.options[3]] + ' Mbps · ' +
      (item.quality?.codecMode === 1 ? 'Async' : 'Sync') + '\n' +
      ['Nearest', 'Bilinear', 'Area'][item.quality?.filter ?? 0] + ' · ' +
      ['Fit', 'Crop', 'Letterbox'][item.options[7] ?? 0] + ' · ' +
      ((item.startTimeMs ?? 0) / 1000) + '–' + ((item.endTimeMs ?? 0) > 0 ? item.endTimeMs! / 1000 : 'End') + ' s';
  }

  private stateLabel(state: string): Resource {
    if (state === 'completed') { return $r('app.string.task_completed'); }
    if (state === 'failed') { return $r('app.string.task_failed'); }
    if (state === 'cancelled') { return $r('app.string.task_cancelled'); }
    if (state === 'interrupted') { return $r('app.string.task_interrupted'); }
    return state === 'running' ? $r('app.string.task_running') : $r('app.string.task_waiting');
  }

  build() {
    Column({ space: 10 }) {
      Text($r('app.string.task_queue')).fontSize(17).fontWeight(FontWeight.Medium)
      Text($r('app.string.task_queue_hint')).fontSize(12).fontColor('#667085')
      Text($r('app.string.transcode_batch_hint')).fontSize(12).fontColor('#667085')
      Row({ space: 8 }) {
        Button($r('app.string.transcode_batch_files')).layoutWeight(1).fontSize(12)
          .onClick((): void => this.onBatch(false))
        Button($r('app.string.transcode_batch_gallery')).layoutWeight(1).fontSize(12)
          .onClick((): void => this.onBatch(true))
      }.enabled(this.canBatch)
      Row() {
        Text($r('app.string.transcode_queue_stop_failure')).layoutWeight(1).fontSize(13)
        Toggle({ type: ToggleType.Switch, isOn: this.queue.stopOnFailure })
          .onChange((value: boolean): void => { this.queue.stopOnFailure = value; this.onChanged(); })
      }
      Text($r('app.string.transcode_relink_hint')).fontSize(12).fontColor('#667085')
      Progress({ value: this.queue.totalProgress(), total: 100, type: ProgressType.Linear }).width('100%')
      Row({ space: 8 }) {
        Button($r('app.string.task_enqueue')).layoutWeight(1).fontSize(13).enabled(this.canAdd)
          .onClick((): void => this.onAdd())
        Button(this.running && !this.queue.paused ? $r('app.string.task_pause_queue') : $r('app.string.task_run_queue'))
          .layoutWeight(1).fontSize(13).enabled(this.running ? !this.queue.paused :
            this.queue.items.some((item: TranscodeQueueItem): boolean => item.state === 'waiting'))
          .onClick((): void => {
            if (this.running) { this.queue.paused = true; this.onChanged(); } else { this.onRun(); }
          })
      }.width('100%')
      ForEach(this.queue.items, (item: TranscodeQueueItem) => {
        Column({ space: 6 }) {
          Text(item.title).fontSize(14).maxLines(2)
          Text(this.summary(item)).fontSize(12).fontColor('#475467')
          Text(this.stateLabel(item.state)).fontSize(12).fontColor('#667085')
          Progress({ value: item.progress, total: 100, type: ProgressType.Linear }).width('100%')
          if (item.id !== this.queue.activeId) {
            if (item.state === 'waiting') {
              Row({ space: 8 }) {
                Button($r('app.string.transcode_queue_up')).fontSize(12)
                  .onClick((): void => { this.queue.move(item.id, -1); this.onChanged(); })
                Button($r('app.string.transcode_queue_down')).fontSize(12)
                  .onClick((): void => { this.queue.move(item.id, 1); this.onChanged(); })
              }
            }
            Row({ space: 8 }) {
              Button($r('app.string.transcode_relink_source')).fontSize(12).onClick((): void => {
                this.onRelink(item.id);
              }).enabled(!this.running)
              if (item.state === 'failed' || item.state === 'cancelled' || item.state === 'interrupted') {
                Button($r('app.string.task_retry')).fontSize(12).onClick((): void => {
                  this.queue.retry(item.id); this.onChanged();
                })
              }
              Button($r('app.string.task_remove')).fontSize(12).onClick((): void => {
                this.queue.remove(item.id); this.onChanged();
              })
            }
          }
        }.width('100%').padding(10).alignItems(HorizontalAlign.Start).backgroundColor('#F2F4F7').borderRadius(10)
      }, (item: TranscodeQueueItem): string => item.id)
      Row({ space: 8 }) {
        Button($r('app.string.transcode_batch_export_files')).layoutWeight(1).fontSize(12)
          .onClick((): void => this.onExport(false))
        Button($r('app.string.transcode_batch_export_gallery')).layoutWeight(1).fontSize(12)
          .onClick((): void => this.onExport(true))
      }.enabled(this.canBatch && this.queue.items.some((item: TranscodeQueueItem): boolean =>
        item.state === 'completed'))
      ForEach(this.exports.results, (result: TranscodeExportResult) => {
        Text(result.path.substring(result.path.lastIndexOf('/') + 1) + ' · ' +
          LocalizedText.get(result.state === 'saved' ? $r('app.string.transcode_saved') :
          result.state === 'cancelled' ? $r('app.string.task_cancelled') : $r('app.string.transcode_save_failed')) +
          (result.detail.length > 0 ? ' · ' + result.detail : '')).fontSize(12)
          .fontColor(result.state === 'saved' ? '#16794B' : '#B54708')
      }, (result: TranscodeExportResult): string => result.path)
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
  }
}
