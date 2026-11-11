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

import { localize } from '../common/LocaleStrings';
import { getLearningController } from '../learning/LearningContext';
import { LearningSnapshot, emptyLearningSnapshot } from '../learning/LearningTypes';
import { LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED } from './LearningUi';

/** Actual coordinator facts; no scene payload or personal fields are exported here. */
@Component
export struct SceneContinuationStatus {
  @State private state: LearningSnapshot = emptyLearningSnapshot();
  @State private detailsExpanded: boolean = false;
  private unsubscribe: (() => void) | undefined = undefined;
  aboutToAppear(): void {
    this.unsubscribe?.();
    this.unsubscribe = getLearningController()?.subscribe((snapshot: LearningSnapshot): void => {
      this.state = snapshot;
    });
  }
  aboutToDisappear(): void { this.unsubscribe?.(); this.unsubscribe = undefined; }
  build() {
    Column({ space: 10 }) {
      Row({ space: 12 }) {
        Text(this.state.sessionState).fontSize(13).lineHeight(20).fontColor(LEARNING_INK).layoutWeight(1)
        if (!this.state.sessionActive && !this.state.conflictPending) {
          Button(this.detailsExpanded ? localize('ac_learningui_015') : localize('ac_scenecontinuationstatus_002'), { type: ButtonType.Normal })
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .onClick((): void => { this.detailsExpanded = !this.detailsExpanded; })
        }
      }.width('100%')
      if (this.detailsExpanded || this.state.sessionActive || this.state.conflictPending) {
        Text(localize('ac_scenecontinuationstatus_003', [this.state.quickResult])).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
        Text(localize('ac_scenecontinuationstatus_004', [this.state.windowState])).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
        Text(localize('ac_scenecontinuationstatus_005', [this.state.businessPositionState])).fontSize(13).fontColor(LEARNING_MUTED).width('100%')
      }
      if (this.state.conflictPending) {
        Text(this.state.conflictSummary).fontSize(14).fontColor(LEARNING_INK).width('100%')
        Button(this.state.conflictAccepted ? localize('ac_scenecontinuationstatus_006') : localize('ac_scenecontinuationstatus_007'))
          .width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .enabled(!this.state.conflictAccepted).onClick((): void => { getLearningController()?.acceptConflict(); })
        Button($r('app.string.ac_scenecontinuationstatus_008'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { getLearningController()?.rejectConflict(); })
      }
      if (this.state.sessionActive) {
        Button($r('app.string.ac_scenecontinuationstatus_009')).width('100%').height(48).fontSize(15).backgroundColor(LEARNING_BLUE).borderRadius(10)
          .onClick((): void => { getLearningController()?.retryBusinessPosition(); })
        Button($r('app.string.ac_scenecontinuationstatus_010'), { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
          .onClick((): void => { getLearningController()?.stopLocalWait(); })
      }
    }.width('100%').padding(12).backgroundColor('#FFFFFF').borderRadius(14)
  }
}
