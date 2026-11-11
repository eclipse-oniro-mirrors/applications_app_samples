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
/** Live continuation signals. Navigation never disposes the Ability-scoped controller. */
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningController } from '../learning/LearningController';
import { DiagnosticEvent, emptyLearningSnapshot, LearningSnapshot } from '../learning/LearningTypes';
import {
  confirmLearningAction, learningError, openLearningTab, LEARNING_BG, LearningAction, LearningCard,
  LearningEvents, LearningHeader, LearningLine, LearningNotice
} from '../components/LearningUi';

@Entry
@Component
struct ProcessPage {
  @State snapshot: LearningSnapshot = emptyLearningSnapshot();
  @State message: string = '';
  @State eventsExpanded: boolean = false;
  private controller: LearningController | undefined = undefined;
  private unsubscribe: (() => void) | undefined = undefined;

  aboutToAppear(): void {
    this.bindController();
  }

  onPageShow(): void {
    this.bindController();
  }

  onPageHide(): void {
    this.detach();
  }

  aboutToDisappear(): void {
    this.detach();
    this.controller = undefined;
  }

  private detach(): void {
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) {
      unsubscribe();
      this.unsubscribe = undefined;
    }
  }

  private bindController(): void {
    this.detach();
    const controller = getLearningController();
    this.controller = controller;
    if (controller === undefined) {
      this.snapshot = emptyLearningSnapshot();
      return;
    }
    this.snapshot = controller.snapshot();
    this.unsubscribe = controller.subscribe((next: LearningSnapshot) => {
      this.snapshot = next;
    });
  }

  private feedback(message: string): void {
    this.message = message;
  }

  private confirmStop(): void {
    confirmLearningAction(this.getUIContext(), localize('ac_processpage_001'),
      localize('ac_processpage_002'),
      () => {
        const controller = this.controller;
        if (controller === undefined) {
          this.message = localize('ac_processpage_003');
          return;
        }
        try {
          controller.stopLocalWait();
          this.snapshot = controller.snapshot();
          this.message = localize('ac_processpage_004');
        } catch (error) {
          this.message = localize('ac_processpage_005', [learningError(error as BusinessError)]);
        }
      }, (message: string) => this.feedback(message));
  }

  private openTab(tab: number): void {
    openLearningTab(this.getUIContext(), tab, (message: string) => this.feedback(message));
  }

  private sessionEvents(): DiagnosticEvent[] {
    if (this.snapshot.sessionRecordId.length === 0) {
      return [];
    }
    return this.snapshot.events.filter((event: DiagnosticEvent) => event.operationId === this.snapshot.sessionRecordId);
  }

  private openSessionDiagnostic(): void {
    if (this.snapshot.sessionRecordId.length === 0) {
      this.openTab(2);
      return;
    }
    try {
      this.getUIContext().getRouter().pushUrl({
        url: 'pages/CallDetailPage',
        params: { id: this.snapshot.sessionRecordId }
      },
        (error: BusinessError) => {
          if (error) {
            this.message = localize('ac_processpage_006', [learningError(error)]);
          }
        });
    } catch (error) {
      this.message = localize('ac_processpage_007', [learningError(error as BusinessError)]);
    }
  }

  private back(): void {
    try {
      if (Number(this.getUIContext().getRouter().getLength()) > 1) {
        this.getUIContext().getRouter().back();
      } else {
        this.openTab(1);
      }
    } catch (error) {
      this.message = localize('ac_calldetailpage_004', [learningError(error as BusinessError)]);
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        LearningHeader({ title: localize('ac_processpage_009') })
        LearningNotice({ title: localize('ac_learningui_017'), message: this.message.length > 0 ? this.message : this.snapshot.notice })
        LearningCard({ title: localize('ac_processpage_011') }) {
          LearningLine({ label: localize('ac_processpage_012'), value: this.snapshot.sessionState })
          LearningLine({ label: localize('ac_index_068'), value: this.snapshot.launchReason })
          LearningLine({ label: localize('ac_index_069'), value: this.snapshot.listenerState })
        }
        LearningCard({ title: localize('ac_processpage_015') }) {
          LearningLine({ label: localize('ac_processpage_016'), value: this.snapshot.quickResult })
          LearningLine({ label: localize('ac_processpage_017'), value: this.snapshot.dataState })
          LearningLine({ label: localize('ac_processpage_018'), value: this.snapshot.windowState })
          LearningLine({ label: localize('ac_processpage_019'), value: this.snapshot.businessPositionState })
          LearningLine({ label: localize('ac_processpage_020'), value: this.snapshot.committed ? localize('ac_processpage_021') : localize('ac_processpage_022') })
          if (this.snapshot.sessionActive && this.controller?.positionTarget() !== undefined) {
            LearningAction({ label: localize('ac_processpage_023'), onTap: () => this.controller?.retryBusinessPosition() })
          }
          if (this.snapshot.conflictPending) {
            Text(this.snapshot.conflictSummary).fontSize(14).width('100%')
            LearningAction({ label: this.snapshot.conflictAccepted ? localize('ac_processpage_024') : localize('ac_scenecontinuationstatus_007'),
              actionEnabled: !this.snapshot.conflictAccepted, onTap: () => this.controller?.acceptConflict() })
            LearningAction({ label: localize('ac_processpage_026'), secondary: true, onTap: () => this.controller?.rejectConflict() })
          }
          if (this.snapshot.restoredSummary.length > 0) {
            LearningLine({ label: localize('ac_processpage_027'), value: this.snapshot.restoredSummary })
          }
        }
        LearningCard({ title: localize('ac_processpage_028') }) {
          LearningAction({ label: this.eventsExpanded ? localize('ac_processpage_029') : localize('ac_processpage_030', [this.sessionEvents().length]),
            secondary: true, onTap: () => { this.eventsExpanded = !this.eventsExpanded; } })
          if (this.eventsExpanded) {
            LearningEvents({ events: this.sessionEvents() })
          }
        }
        LearningAction({ label: localize('ac_processpage_031'), actionEnabled: this.snapshot.canStop, secondary: true,
          onTap: () => this.confirmStop() })
        LearningAction({ label: localize('ac_processpage_032'), onTap: () => this.openSessionDiagnostic() })
        LearningAction({ label: localize('ac_calldetailpage_030'), secondary: true, onTap: () => this.openTab(1) })
        LearningAction({ label: localize('ac_calldetailpage_031'), secondary: true, onTap: () => this.back() })
      }
      .width('100%').padding({ left: 20, right: 20, top: 8, bottom: 28 });
    }
    .width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart).backgroundColor(LEARNING_BG);
  }
}
