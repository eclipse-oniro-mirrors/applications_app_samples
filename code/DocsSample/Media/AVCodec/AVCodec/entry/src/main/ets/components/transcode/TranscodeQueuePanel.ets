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

@Component
export struct TranscodeQueuePanel {
  @ObjectLink queue: TranscodeQueueModel;
  @Prop running: boolean = false;
  @Prop canAdd: boolean = false;
  onAdd: () => void = (): void => {};
  onRun: () => void = (): void => {};
  onChanged: () => void = (): void => {};
  onRelink: (id: string) => void = (_id: string): void => {};

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
          Text(this.stateLabel(item.state)).fontSize(12).fontColor('#667085')
          Progress({ value: item.progress, total: 100, type: ProgressType.Linear }).width('100%')
          if (item.id !== this.queue.activeId) {
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
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).borderRadius(16)
  }
}
