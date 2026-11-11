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
/** Immutable operation evidence, not a second controller and never an automatic retry. */
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningController } from '../learning/LearningController';
import { OperationRecord, LearningSnapshot } from '../learning/LearningTypes';
import {
  copyLearningText, learningError, learningLevel, openLearningTab, LEARNING_BG, LearningAction, LearningCard,
  LearningEnvironment, LearningEvents, LearningFacts, LearningHeader, LearningLine, LearningNotice,
  rawLearningRecord
} from '../components/LearningUi';

interface DetailParams {
  id?: string;
}

@Entry
@Component
struct CallDetailPage {
  @State operationId: string = '';
  @State record: OperationRecord | undefined = undefined;
  @State notice: string = '';
  @State message: string = '';
  @State environmentExpanded: boolean = false;
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
    const params = this.getUIContext().getRouter().getParams() as DetailParams | undefined;
    this.operationId = params !== undefined && typeof params.id === 'string' ? params.id : '';
    const controller = getLearningController();
    this.controller = controller;
    if (controller === undefined) {
      this.record = undefined;
      this.notice = localize('ac_calldetailpage_001');
      return;
    }
    this.refresh();
    this.unsubscribe = controller.subscribe((_snapshot: LearningSnapshot) => {
      this.record = controller.record(this.operationId);
    });
  }

  private refresh(): void {
    const controller = this.controller;
    if (controller !== undefined) {
      this.record = controller.record(this.operationId);
      this.notice = '';
    }
  }

  private feedback(message: string): void {
    this.message = message;
  }

  private copyRaw(): void {
    const record = this.record;
    if (record === undefined) {
      this.message = localize('ac_calldetailpage_002');
      return;
    }
    copyLearningText(rawLearningRecord(record), (message: string) => this.feedback(message));
  }

  private copySummary(): void {
    const controller = this.controller;
    if (controller === undefined || this.record === undefined) {
      this.message = localize('ac_calldetailpage_003');
      return;
    }
    copyLearningText(controller.diagnosticSummary(this.operationId), (message: string) => this.feedback(message));
  }

  private openTab(tab: number): void {
    openLearningTab(this.getUIContext(), tab, (message: string) => this.feedback(message));
  }

  private back(): void {
    try {
      if (Number(this.getUIContext().getRouter().getLength()) > 1) {
        this.getUIContext().getRouter().back();
      } else {
        this.openTab(2);
      }
    } catch (error) {
      this.message = localize('ac_calldetailpage_004', [learningError(error as BusinessError)]);
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        LearningHeader({ title: localize('ac_calldetailpage_005') })
        LearningNotice({ title: localize('ac_learningui_017'), message: this.message.length > 0 ? this.message : this.notice })
        if (this.record === undefined) {
          LearningCard({ title: localize('ac_calldetailpage_007') }) {
            LearningAction({ label: localize('ac_calldetailpage_008'), onTap: () => this.openTab(2) })
          }
        } else {
          LearningCard({ title: this.record.title }) {
            LearningLine({ label: localize('ac_calldetailpage_009'), value: this.record.result })
            LearningLine({ label: localize('ac_calldetailpage_010'), value: `${this.record.stage} · ${learningLevel(this.record.level)}` })
            LearningLine({
              label: localize('ac_calldetailpage_011'),
              value: `${this.record.startedAt}\n` +
                `${this.record.endedAt.length > 0 ? this.record.endedAt : localize('ac_calldetailpage_012')}`
            })
            LearningLine({ label: localize('ac_calldetailpage_013'), value: `${this.record.durationMillis} ms` })
          }
          LearningCard({ title: localize('ac_calldetailpage_014') }) {
            LearningLine({ label: localize('ac_calldetailpage_015'), value: this.record.errorCode })
            if (this.record.rawMessage.length > 0) {
              LearningLine({ label: localize('ac_calldetailpage_016'), value: this.record.rawMessage })
            }
            if (this.record.rawResultState.length > 0) {
              LearningLine({ label: localize('ac_calldetailpage_017'), value: this.record.rawResultState })
            }
            if (this.record.resultInfo.length > 0) {
              LearningLine({ label: localize('ac_calldetailpage_018'), value: this.record.resultInfo })
            }
            LearningAction({ label: localize('ac_calldetailpage_019'), secondary: true, onTap: () => this.copyRaw() })
          }
          if (this.record.facts.length > 0 || this.record.explanation.length > 0 || this.record.nextSteps.length > 0) {
            LearningCard({ title: localize('ac_calldetailpage_020') }) {
              if (this.record.facts.length > 0) {
                LearningFacts({ title: localize('ac_calldetailpage_021'), lines: this.record.facts })
              }
              if (this.record.explanation.length > 0) {
                LearningFacts({ title: localize('ac_calldetailpage_022'), lines: this.record.explanation })
              }
              if (this.record.nextSteps.length > 0) {
                LearningFacts({ title: localize('ac_calldetailpage_023'), lines: this.record.nextSteps })
              }
              LearningAction({ label: localize('ac_calldetailpage_024'), secondary: true, onTap: () => this.copySummary() })
            }
          }
          LearningCard({ title: localize('ac_calldetailpage_025') }) {
            LearningAction({ label: this.environmentExpanded ? localize('ac_calldetailpage_026') : localize('ac_calldetailpage_027'), secondary: true,
              onTap: () => { this.environmentExpanded = !this.environmentExpanded; } })
            if (this.environmentExpanded) {
              LearningEnvironment({ items: this.record.environment })
            }
            LearningAction({ label: this.eventsExpanded ? localize('ac_calldetailpage_028') : localize('ac_calldetailpage_029', [this.record.events.length]),
              secondary: true, onTap: () => { this.eventsExpanded = !this.eventsExpanded; } })
            if (this.eventsExpanded) {
              LearningEvents({ events: this.record.events })
            }
          }
        }
        LearningAction({ label: localize('ac_calldetailpage_030'), onTap: () => this.openTab(1) })
        LearningAction({ label: localize('ac_calldetailpage_031'), secondary: true, onTap: () => this.back() })
      }
      .width('100%').padding({ left: 20, right: 20, top: 8, bottom: 28 });
    }
    .width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart).backgroundColor(LEARNING_BG);
  }
}
