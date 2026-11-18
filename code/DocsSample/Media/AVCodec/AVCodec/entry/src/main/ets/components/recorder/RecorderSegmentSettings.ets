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

import { RecorderSettingsDraft } from '../../model/SettingsDraftModels';

@Component
export struct RecorderSegmentSettings {
  @ObjectLink draft: RecorderSettingsDraft;
  private durations: number[] = [0, 60, 180, 300];
  private sizes: number[] = [0, 256, 512, 1024];

  private options(values: number[], unit: string): SelectOption[] {
    return values.map((value: number): SelectOption =>
      ({ value: value === 0 ? $r('app.string.rec_segments_off') : value + unit }));
  }

  build() {
    Column({ space: 8 }) {
      Text($r('app.string.rec_segments_title')).fontSize(16).fontWeight(FontWeight.Medium)
      Row() {
        Text($r('app.string.rec_segments_seconds')).layoutWeight(1)
        Select(this.options(this.durations, ' s')).selected(this.durations.indexOf(this.draft.segmentSeconds))
          .value(this.options(this.durations, ' s')[this.durations.indexOf(this.draft.segmentSeconds)].value)
          .onSelect((index: number): void => { this.draft.segmentSeconds = this.durations[index]; })
      }
      Row() {
        Text($r('app.string.rec_segments_size')).layoutWeight(1)
        Select(this.options(this.sizes, ' MiB')).selected(this.sizes.indexOf(this.draft.segmentMiB))
          .value(this.options(this.sizes, ' MiB')[this.sizes.indexOf(this.draft.segmentMiB)].value)
          .onSelect((index: number): void => { this.draft.segmentMiB = this.sizes[index]; })
      }
      Text($r('app.string.rec_segments_hint')).fontSize(12).fontColor('#667085')
    }.width('100%').alignItems(HorizontalAlign.Start).enabled(this.draft.outputFormat === 0)
  }
}
