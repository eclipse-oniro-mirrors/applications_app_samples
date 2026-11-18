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

import { SendState } from 'ircore';
import { StepProgressView } from '../viewmodel/ConsoleViewModel';

/**
 * Panel that lists per-step progress rows of the current scene run
 * and offers a retry action once the run has finished with failures.
 */
@ComponentV2
export struct RunProgressPanel {
  /** Progress rows, one per scene step. */
  @Param steps: StepProgressView[] = [];
  /** Whether the run is currently executing. */
  @Param running: boolean = false;
  /** Indexes of steps that did not succeed. */
  @Param failedIndexes: number[] = [];
  /** Fired when the user taps the retry button. */
  @Event onRetryFailed: () => void = (): void => {};

  /** Returns true when the step at the given index did not succeed. */
  private isFailed(index: number): boolean {
    return this.failedIndexes.indexOf(index) >= 0;
  }

  /** Color for step texts, highlighting failed steps in the danger color. */
  private rowColor(index: number): Resource {
    return this.isFailed(index) ? $r('app.color.danger') : $r('app.color.text_primary');
  }

  /** Maps a send state to its localized status label. */
  private statusText(state: SendState): Resource {
    switch (state) {
      case SendState.SENDING:
        return $r('app.string.status_sending');
      case SendState.SUCCESS:
        return $r('app.string.status_success');
      case SendState.FAILED:
        return $r('app.string.status_failed');
      default:
        return $r('app.string.status_pending');
    }
  }

  /** Maps a send state to its status color. */
  private statusColor(state: SendState): Resource {
    switch (state) {
      case SendState.SENDING:
        return $r('app.color.accent');
      case SendState.SUCCESS:
        return $r('app.color.success');
      case SendState.FAILED:
        return $r('app.color.danger');
      default:
        return $r('app.color.text_secondary');
    }
  }

  /** Renders the step rows and the retry button. */
  build() {
    Column({ space: '8vp' }) {
      Column({ space: '6vp' }) {
        Repeat<StepProgressView>(this.steps)
          .each((item: RepeatItem<StepProgressView>) => {
            Column({ space: '2vp' }) {
              Row({ space: '6vp' }) {
                Text($r('app.string.step_label', item.index + 1))
                  .id('id_step_no_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(this.rowColor(item.index))
                Text(item.item.deviceName)
                  .id('id_step_device_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(this.rowColor(item.index))
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text($r('app.string.step_dash'))
                  .id('id_step_dash_a_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_secondary'))
                Text(item.item.keyLabel)
                  .id('id_step_key_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(this.rowColor(item.index))
                  .layoutWeight(1)
                  .maxLines(1)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
                Text($r('app.string.step_dash'))
                  .id('id_step_dash_b_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.text_secondary'))
                Text(this.statusText(item.item.state))
                  .id('id_step_state_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor(this.statusColor(item.item.state))
                  .fontWeight(this.isFailed(item.index) ? FontWeight.Medium : FontWeight.Normal)
              }
              .id('id_step_line_' + item.index.toString())
              .width('100%')
              .alignItems(VerticalAlign.Center)

              // Show the failure reason only for failed steps that carry a message.
              if (item.item.state === SendState.FAILED && item.item.message.length > 0) {
                Text(item.item.message)
                  .id('id_step_message_' + item.index.toString())
                  .fontSize($r('app.float.caption_font'))
                  .fontColor($r('app.color.danger'))
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })
              }
            }
            .id('id_step_row_' + item.index.toString())
            .width('100%')
          })
          // The key function keeps row identity stable across progress updates.
          .key((item: StepProgressView): string => item.index.toString())
      }
      .id('id_step_list')
      .width('100%')

      // Offer retry only after the run finished and at least one step failed.
      if (this.failedIndexes.length > 0 && !this.running) {
        Button($r('app.string.retry_failed'))
          .id('id_retry_failed')
          .height('36vp')
          .padding({ left: '16vp', right: '16vp' })
          .fontSize($r('app.float.caption_font'))
          .fontColor(Color.White)
          .backgroundColor($r('app.color.danger'))
          .borderRadius('18vp')
          .onClick(() => {
            this.onRetryFailed();
          })
      }
    }
    .id('id_run_progress_panel')
    .width('100%')
  }
}
