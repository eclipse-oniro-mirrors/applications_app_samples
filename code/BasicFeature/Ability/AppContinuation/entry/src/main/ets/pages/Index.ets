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
/** Main workbench for interface calls, text continuation and operation records. */
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getLearningController } from '../learning/LearningContext';
import { SceneWorkspaceBackup } from '../components/SceneWorkspaceBackup';
import {
  DocKind, DocumentSlot, DocumentWorkspace, checkIsolation, docLines, multiSlotKinds, workspaceLines
} from '../learning/document/DocumentWorkspace';
import {
  FormField, FormSession, branchLines, formSummary
} from '../learning/document/FormSession';
import {
  FieldTriple, MergePlan, planMerge, previewLines, tripleStats
} from '../learning/payload/MergePlan';
import {
  RecoveryCase, RecoveryInput, actionsOf, planRecovery, recoveryLines, recoverySummary
} from '../learning/recovery/RecoveryPlan';
import { LearningController } from '../learning/LearningController';
import {
  PAYLOAD_LIMIT, PAYLOAD_VERSION, PAYLOAD_FIELDS, auditPayloadSchema, escapeValue,
  schemaVersionLines, unescapeValue
} from '../learning/payload/PayloadSchema';
import {
  PayloadData, decodePayload, diffPayloads, encodePayload, sealPayload, sizeOf
} from '../learning/payload/PayloadCodec';
import {
  ConflictInput, applyResolution, auditConflictRules, conflictRuleLines, decide
} from '../learning/payload/ConflictPolicy';
import {
  DeviceClass, RuleContext, auditReadinessRules, deviceClassOf, evaluateReadiness,
  readinessRuleLines
} from '../learning/rules/ContinuationRules';
import {
  emptyLearningSnapshot, LearningSnapshot, MAX_TEXT_LENGTH, OperationRecord
} from '../learning/LearningTypes';
import {
  confirmLearningAction, copyLearningText, learningError, LEARNING_BG, LEARNING_BLUE,
  LEARNING_INK, LEARNING_MUTED, LearningAction, LearningCard, LearningDisclosure, LearningEnvironment,
  LearningLine, LearningNotice, LearningRecord
} from '../components/LearningUi';

interface IndexParams {
  tab?: number;
  returnRequest?: string;
}

@Entry
@Component
struct Index {
  @State snapshot: LearningSnapshot = emptyLearningSnapshot();
  @State activeTab: number = 1;
  @State private toolsExpanded: boolean = false;
  @State private textActionsExpanded: boolean = false;
  @State levelFilter: string = localize('ac_index_001');
  @State operationFilter: string = localize('ac_index_001');
  @State message: string = '';
  @State environmentExpanded: boolean = false;
  private controller: LearningController | undefined = undefined;
  private unsubscribe: (() => void) | undefined = undefined;
  private editor: TextAreaController = new TextAreaController();
  private selectionTimer: number = -1;
  private applyingSnapshot: boolean = false;
  private inputEvent: boolean = false;
  private restoringSelection: boolean = false;
  private paramsRead: boolean = false;
  private lastParamTab: number = -1;
  private lastReturnRequest: string = '';
  private editing: boolean = false;
  private selectionNeedsFocus: boolean = true;

  aboutToAppear(): void {
    this.readParams();
    this.bindController();
  }

  onPageShow(): void {
    // Refresh route requests while preserving the current tab on a normal return.
    this.readParams();
    this.bindController();
    this.scheduleSelection();
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
    if (this.selectionTimer !== -1) {
      clearTimeout(this.selectionTimer);
      this.selectionTimer = -1;
    }
  }

  private readParams(): void {
    const params = this.getUIContext().getRouter().getParams() as IndexParams | undefined;
    if (params !== undefined && typeof params.tab === 'number' &&
      params.tab >= 0 && params.tab <= 2 && Number.isInteger(params.tab)) {
      const hasReturnRequest = typeof params.returnRequest === 'string' &&
        params.returnRequest !== this.lastReturnRequest;
      if (!this.paramsRead || params.tab !== this.lastParamTab || hasReturnRequest) {
        this.activeTab = params.tab;
      }
      this.lastParamTab = params.tab;
      if (typeof params.returnRequest === 'string') {
        this.lastReturnRequest = params.returnRequest;
      }
    }
    this.paramsRead = true;
  }

  private bindController(): void {
    this.detach();
    const controller = getLearningController();
    this.controller = controller;
    if (controller === undefined) {
      this.acceptSnapshot(emptyLearningSnapshot());
      return;
    }
    controller.activateText();
    this.acceptSnapshot(controller.snapshot());
    this.unsubscribe = controller.subscribe((next: LearningSnapshot) => this.acceptSnapshot(next));
  }

  private acceptSnapshot(next: LearningSnapshot): void {
    const changed = next.text !== this.snapshot.text || next.selectionStart !== this.snapshot.selectionStart ||
      next.selectionEnd !== this.snapshot.selectionEnd;
    if (next.notice !== this.snapshot.notice) {
      this.message = '';
    }
    this.applyingSnapshot = true;
    this.snapshot = next;
    this.applyingSnapshot = false;
    if (changed && !this.inputEvent) {
      this.scheduleSelection();
    }
  }

  private scheduleSelection(): void {
    this.selectionNeedsFocus = true;
    if (this.selectionTimer !== -1) {
      clearTimeout(this.selectionTimer);
    }
    this.selectionTimer = setTimeout(() => {
      this.selectionTimer = -1;
      if (this.activeTab === 1) {
        this.restoreSelection();
      }
    }, 0);
  }

  private restoreSelection(): void {
    this.restoringSelection = true;
    try {
      if (this.snapshot.selectionStart === this.snapshot.selectionEnd) {
        this.editor.caretPosition(this.snapshot.selectionStart);
      } else {
        this.editor.setTextSelection(this.snapshot.selectionStart, this.snapshot.selectionEnd);
      }
    } catch (error) {
      this.message = localize('ac_index_003', [learningError(error as BusinessError)]);
    }
    this.restoringSelection = false;
    if (this.editing) {
      this.selectionNeedsFocus = false;
    }
  }

  private changeText(text: string): void {
    const controller = this.controller;
    // Snapshot binding updates already contain the latest programmatic text.
    if (this.applyingSnapshot || controller === undefined || !this.snapshot.canEdit || text === this.snapshot.text) {
      return;
    }
    this.inputEvent = true;
    try {
      controller.updateText(text);
    } catch (error) {
      this.message = localize('ac_index_004', [learningError(error as BusinessError)]);
    } finally {
      this.inputEvent = false;
    }
  }

  private changeSelection(start: number, end: number): void {
    const controller = this.controller;
    if (this.applyingSnapshot || this.restoringSelection || controller === undefined || !this.snapshot.canEdit ||
      this.selectionTimer !== -1 || (start === this.snapshot.selectionStart && end === this.snapshot.selectionEnd)) {
      return;
    }
    this.inputEvent = true;
    try {
      controller.updateSelection(start, end);
    } catch (error) {
      this.message = localize('ac_index_005', [learningError(error as BusinessError)]);
    } finally {
      this.inputEvent = false;
    }
  }

  private feedback(message: string): void {
    this.message = message;
  }

  private invoke(action: string): void {
    const controller = this.controller;
    if (controller === undefined) {
      this.message = localize('ac_index_006');
      return;
    }
    this.message = '';
    try {
      switch (action) {
        case 'environment':
          controller.checkEnvironment();
          this.environmentExpanded = true;
          break;
        case 'on':
          controller.registerProbe();
          break;
        case 'off':
          controller.unregisterProbe();
          break;
        case 'example':
          controller.fillExample();
          break;
        case 'save':
          controller.saveText();
          break;
        case 'acceptConflict':
          controller.acceptConflict();
          break;
        case 'rejectConflict':
          controller.rejectConflict();
          break;
        case 'newDocument':
          controller.newDocument();
          break;
        case 'clearText':
          controller.clearText();
          break;
        case 'clearRecords':
          controller.clearRecords();
          break;
        case 'permission':
          controller.requestPermission();
          break;
      }
      this.acceptSnapshot(controller.snapshot());
    } catch (error) {
      this.message = localize('ac_index_007', [learningError(error as BusinessError)]);
    }
  }

  private openBusiness(kind: string, page: string): void {
    const controller = this.controller;
    if (controller === undefined || !controller.openScene(kind)) {
      this.message = controller === undefined ? localize('ac_index_008') : controller.sceneWorkbench.snapshot().error;
      return;
    }
    this.open(page);
  }

  private open(url: string, id: string = ''): void {
    try {
      this.getUIContext().getRouter().pushUrl({ url: url, params: { id: id } }, (error: BusinessError) => {
        if (error) {
          this.message = localize('ac_index_009', [learningError(error)]);
        }
      });
    } catch (error) {
      this.message = localize('ac_index_010', [learningError(error as BusinessError)]);
    }
  }

  private changeTab(tab: number): void {
    this.activeTab = tab;
    if (tab === 1) {
      this.scheduleSelection();
    }
  }

  private copySummary(): void {
    const controller = this.controller;
    if (controller === undefined) {
      this.message = localize('ac_index_011');
      return;
    }
    copyLearningText(controller.diagnosticSummary(), (message: string) => this.feedback(message));
  }

  private openOfficialDoc(): void {
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext | undefined;
      if (context === undefined) {
        this.message = localize('ac_index_012');
        return;
      }
      const documentationUrl = context.resourceManager.getStringValue($r('app.string.official_doc_url').id);
      context.startAbility({ action: 'ohos.want.action.viewData', uri: documentationUrl })
        .catch((error: BusinessError) => {
          this.message = localize('ac_index_013', [learningError(error)]);
        });
    } catch (error) {
      this.message = localize('ac_index_013', [learningError(error as BusinessError)]);
    }
  }

  private confirmExample(): void {
    if (this.snapshot.text.length === 0) {
      this.invoke('example');
      return;
    }
    confirmLearningAction(this.getUIContext(), localize('ac_index_015'), localize('ac_index_016'),
      () => this.invoke('example'), (message: string) => this.feedback(message));
  }

  private confirmClearText(): void {
    if (this.snapshot.text.length === 0) {
      this.message = localize('ac_index_017');
      return;
    }
    confirmLearningAction(this.getUIContext(), localize('ac_index_018'), localize('ac_index_019'),
      () => this.invoke('clearText'), (message: string) => this.feedback(message));
  }

  private confirmClearRecords(): void {
    confirmLearningAction(this.getUIContext(), localize('ac_index_020'), localize('ac_index_021'),
      () => this.invoke('clearRecords'), (message: string) => this.feedback(message));
  }

  private filteredRecords(): OperationRecord[] {
    return this.snapshot.records.filter((record: OperationRecord) => {
      const levelMatch = this.levelFilter === localize('ac_index_001') ||
        (this.levelFilter === localize('ac_index_023') && record.level === 'ERROR') ||
        (this.levelFilter === localize('ac_index_024') && record.level === 'WARN');
      const operationMatch = this.operationFilter === localize('ac_index_001') ||
        (this.operationFilter === 'ON' && record.operation === 'ON') ||
        (this.operationFilter === 'OFF' && record.operation === 'OFF') ||
        (this.operationFilter === localize('ac_index_026') && record.operation !== 'ON' && record.operation !== 'OFF');
      return levelMatch && operationMatch;
    });
  }

  private noticeText(): string {
    if (this.message.length > 0) {
      return this.message;
    }
    const notice = this.snapshot.notice;
    if (notice.startsWith(localize('ac_index_027'))) {
      return '';
    }
    return notice;
  }

  @Builder
  private pageTitle(title: string) {
    Text(title).fontSize(26).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK)
      .width('100%').padding({ top: 12, bottom: 8 });
  }

  @Builder
  private introductionPage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle(localize('ac_index_028'))
        Text($r('app.string.ac_index_029'))
          .fontSize(15).lineHeight(24).fontColor(LEARNING_MUTED).width('100%');
        LearningCard({ title: localize('ac_index_030') }) {
          LearningLine({ label: localize('ac_index_031'), value: localize('ac_index_032') })
          LearningLine({ label: localize('ac_index_033'), value: localize('ac_index_034') })
          LearningLine({ label: localize('ac_index_035'), value: localize('ac_index_036') })
        }
        LearningAction({ label: localize('ac_index_037'), onTap: () => this.changeTab(1) })
        LearningAction({ label: localize('ac_index_038'), secondary: true, onTap: () => this.openOfficialDoc() })
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private operationPage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle(localize('ac_index_039'))
        Row({ space: 12 }) {
          Text(this.snapshot.sessionState).fontSize(14).lineHeight(21).fontColor(LEARNING_MUTED).layoutWeight(1)
          Button($r('app.string.ac_index_040'), { type: ButtonType.Normal }).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .onClick(() => this.open('pages/ProcessPage'))
        }.width('100%')
        Row({ space: 8 }) {
          LearningAction({ label: localize('ac_sceneworkspacebackup_033'), secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('note', 'pages/NoteScenePage') }).layoutWeight(1)
          LearningAction({ label: localize('ac_sceneworkspacebackup_034'), secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('reading', 'pages/ReadingScenePage') }).layoutWeight(1)
          LearningAction({ label: localize('ac_sceneworkspacebackup_035'), secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('form', 'pages/FormScenePage') }).layoutWeight(1)
        }.width('100%')
        if (this.snapshot.conflictPending) {
          LearningCard({
            title: this.snapshot.conflictKind === 'document' ? localize('ac_index_044') : localize('ac_index_045'),
            subtitle: this.snapshot.conflictAccepted ? localize('ac_index_046') : localize('ac_index_047')
          }) {
            Text(this.snapshot.conflictSummary).fontSize(14).fontColor(LEARNING_INK).width('100%')
            if (this.snapshot.conflictAccepted) {
              Text($r('app.string.ac_index_048'))
                .fontSize(13).fontColor(LEARNING_MUTED).width('100%')
            } else {
              LearningAction({ label: localize('ac_scenecontinuationstatus_007'), onTap: () => this.invoke('acceptConflict') })
              LearningAction({ label: localize('ac_index_050'), secondary: true,
                onTap: () => this.invoke('rejectConflict') })
            }
          }
        }
        LearningCard({ title: localize('ac_index_051') }) {
          TextArea({ text: this.snapshot.text, placeholder: localize('ac_index_052'), controller: this.editor })
            .width('100%').height(160).fontSize(15).fontColor(LEARNING_INK).backgroundColor('#F5F7FA')
            .borderRadius(12).maxLength(MAX_TEXT_LENGTH).enabled(this.snapshot.canEdit)
            .onChange((text: string) => this.changeText(text))
            .onTextSelectionChange((start: number, end: number) => this.changeSelection(start, end))
            .onEditChange((editing: boolean) => {
              this.editing = editing;
              if (editing && this.selectionNeedsFocus) { this.scheduleSelection(); }
            })
            .onAppear(() => this.scheduleSelection());
          LearningLine({
            label: localize('ac_index_053'),
            value: `${this.snapshot.text.length} / ${MAX_TEXT_LENGTH}  ·  ` +
              `[${this.snapshot.selectionStart}, ${this.snapshot.selectionEnd})`
          })
          LearningLine({ label: localize('ac_index_054'), value: this.snapshot.savedTextStatus })
          LearningAction({ label: localize('ac_index_055'), actionEnabled: this.snapshot.canEdit, onTap: () => this.invoke('save') })
          LearningAction({ label: this.textActionsExpanded ? localize('ac_index_056') : localize('ac_index_057'), secondary: true,
            onTap: () => { this.textActionsExpanded = !this.textActionsExpanded; } })
          if (this.textActionsExpanded) {
            LearningLine({ label: localize('ac_index_058'),
              value: this.snapshot.documentId.length > 0 ?
                `${this.snapshot.documentId} · r${this.snapshot.revision}` : localize('ac_index_059') })
            LearningAction({ label: localize('ac_index_060'), secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => this.confirmExample() })
            LearningAction({ label: localize('ac_index_061'), secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => confirmLearningAction(this.getUIContext(), localize('ac_index_062'), localize('ac_index_063'),
                () => this.invoke('newDocument'), (message: string) => this.feedback(message)) })
            LearningAction({ label: localize('ac_index_064'), secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => this.confirmClearText() })
          }
        }
        SceneWorkspaceBackup({ controller: this.controller })
        LearningCard({ title: localize('ac_index_065') }) {
          LearningAction({ label: this.toolsExpanded ? localize('ac_index_066') : localize('ac_index_067'), secondary: true,
            onTap: () => { this.toolsExpanded = !this.toolsExpanded; } })
          if (this.toolsExpanded) {
            LearningLine({ label: localize('ac_index_068'), value: this.snapshot.launchReason })
            LearningLine({ label: localize('ac_index_069'), value: this.snapshot.listenerState })
            LearningAction({ label: localize('ac_index_070'), actionEnabled: this.snapshot.canRegister,
              onTap: () => this.invoke('on') })
            LearningAction({ label: localize('ac_index_071'), actionEnabled: this.snapshot.canUnregister,
              secondary: true, onTap: () => this.invoke('off') })
            LearningAction({ label: localize('ac_index_072'), secondary: true, onTap: () => this.invoke('environment') })
            if (this.snapshot.environment.length > 0) {
              LearningAction({ label: this.environmentExpanded ? localize('ac_calldetailpage_026') : localize('ac_calldetailpage_027'), secondary: true,
                onTap: () => { this.environmentExpanded = !this.environmentExpanded; } })
              if (this.environmentExpanded) { LearningEnvironment({ items: this.snapshot.environment }) }
            }
            LearningAction({ label: localize('ac_index_075'), secondary: true, actionEnabled: this.controller !== undefined,
              onTap: () => this.invoke('permission') })
          }
        }
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private diagnosisPage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle(localize('ac_index_076'))
        LearningCard({ title: localize('ac_index_077') }) {
          if (this.snapshot.latestRecord !== undefined) {
            LearningLine({ label: localize('ac_calldetailpage_009'), value: this.snapshot.latestRecord.result })
            if (this.snapshot.latestRecord.errorCode.length > 0) {
              LearningLine({ label: localize('ac_calldetailpage_015'), value: this.snapshot.latestRecord.errorCode })
            }
            LearningAction({
              label: localize('ac_learningui_023'),
              secondary: true,
              onTap: () => this.open('pages/CallDetailPage',
                this.snapshot.latestRecord === undefined ? '' : this.snapshot.latestRecord.id)
            })
          } else {
            Text($r('app.string.ac_index_081')).fontSize(14).fontColor(LEARNING_MUTED).width('100%');
          }
        }
        LearningCard({ title: localize('ac_calldetailpage_021'), subtitle: localize('ac_index_083', [this.snapshot.records.length]) }) {
          Row({ space: 6 }) {
            ForEach([localize('ac_index_001'), localize('ac_index_023'), localize('ac_index_024')], (filter: string) => {
              Button(filter, { type: ButtonType.Normal }).fontSize(14).height(44).layoutWeight(1).borderRadius(10)
                .fontColor(this.levelFilter === filter ? '#FFFFFF' : LEARNING_BLUE)
                .backgroundColor(this.levelFilter === filter ? LEARNING_BLUE : '#EEF4FF')
                .onClick(() => { this.levelFilter = filter; });
            }, (filter: string) => filter)
          }.width('100%');
          Row({ space: 6 }) {
            ForEach([localize('ac_index_001'), 'ON', 'OFF', localize('ac_index_026')], (filter: string) => {
              Button(filter, { type: ButtonType.Normal }).fontSize(13).height(44).layoutWeight(1).borderRadius(10)
                .fontColor(this.operationFilter === filter ? '#FFFFFF' : LEARNING_BLUE)
                .backgroundColor(this.operationFilter === filter ? LEARNING_BLUE : '#EEF4FF')
                .onClick(() => { this.operationFilter = filter; });
            }, (filter: string) => filter)
          }.width('100%');
          if (this.filteredRecords().length === 0) {
            Text($r('app.string.ac_index_089')).fontSize(14).fontColor(LEARNING_MUTED).width('100%');
          } else {
            ForEach(this.filteredRecords(), (record: OperationRecord) => {
              LearningRecord({ record: record, onOpen: () => this.open('pages/CallDetailPage', record.id) })
            }, (record: OperationRecord) => record.id)
          }
          LearningAction({ label: localize('ac_index_090'), onTap: () => this.copySummary() })
          LearningAction({ label: localize('ac_index_091'), secondary: true, onTap: () => this.confirmClearRecords() })
        }
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private payloadPage() {
    Scroll() {
      Column({ space: 12 }) {
        LearningDisclosure({ title: localize('ac_index_092'), subtitle: this.payloadSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.payloadFieldLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        LearningDisclosure({ title: localize('ac_index_093'), subtitle: this.readinessSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.readinessLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        LearningDisclosure({ title: localize('ac_index_094'), subtitle: this.conflictSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.conflictLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        Button($r('app.string.ac_index_095'), { type: ButtonType.Normal })
          .width('100%')
          .height(48)
          .fontSize(16)
          .fontColor('#1F6FEB')
          .backgroundColor('#EAF2FF')
          .borderRadius(12)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ScenarioPage' }).catch((error: BusinessError): void => {
              hilog.warn(0xF811, '[Sample_AppContinuation]',
                'ScenarioPage navigation failed, code=%{public}d', error.code);
            });
          })
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  private payloadSummary(): string {
    const data: PayloadData = sealPayload(new PayloadData('learning-doc', 3));
    data.title = localize('ac_index_141');
    data.body = this.snapshot.text.slice(0, Math.min(this.snapshot.text.length, 256));
    data.cs = this.snapshot.selectionStart;
    data.ce = this.snapshot.selectionEnd;
    data.dev = 'local';
    data.app = '1.0.0';
    const encoded: string = encodePayload(data);
    const decoded = decodePayload(encoded);
    const size = sizeOf(data);
    const diff = diffPayloads(data, decoded.data === undefined ? new PayloadData() : decoded.data);
    return localize('ac_index_097', [PAYLOAD_VERSION, size.text(), decoded.ok() ? localize('ac_index_098') : localize('ac_index_023'), diff.summary()]);
  }

  private payloadFieldLines(): string[] {
    const lines: string[] = schemaVersionLines();
    PAYLOAD_FIELDS.forEach((field): void => {
      lines.push(field.describe());
    });
    const audit = auditPayloadSchema();
    lines.push(audit.summary());
    lines.push(localize('ac_index_100', [unescapeValue(escapeValue('a&b=c'))]));
    lines.push(localize('ac_index_101', [PAYLOAD_LIMIT]));
    return lines;
  }

  private readinessSummary(): string {
    const context: RuleContext = new RuleContext(26, deviceClassOf('phone'), true);
    context.payloadChars = this.snapshot.text.length;
    context.sessionActive = this.snapshot.sessionActive;
    const result = evaluateReadiness(context);
    return result.text();
  }

  private readinessLines(): string[] {
    const lines: string[] = readinessRuleLines();
    lines.push(auditReadinessRules().summary());
    const classes: DeviceClass[] = [DeviceClass.PHONE, DeviceClass.TABLET, DeviceClass.PC,
      DeviceClass.TV, DeviceClass.WEARABLE];
    classes.forEach((device: DeviceClass): void => {
      const context: RuleContext = new RuleContext(26, device, true);
      lines.push(`${device as string}：${evaluateReadiness(context).text()}`);
    });
    return lines;
  }

  private conflictSummary(): string {
    const local: PayloadData = sealPayload(new PayloadData('learning-doc', 3));
    local.body = this.snapshot.text;
    local.title = this.snapshot.conflictKind.length > 0 ? this.snapshot.conflictKind : localize('ac_index_141');
    const remote: PayloadData = new PayloadData('learning-doc', Math.max(0, this.snapshot.revision));
    remote.body = this.snapshot.restoredSummary;
    remote.title = localize('ac_index_142');
    const input: ConflictInput = new ConflictInput(local, remote);
    input.localDirty = this.snapshot.conflictAccepted;
    input.remoteDirty = this.snapshot.conflictPending;
    const decision = decide(input);
    const merged = applyResolution(input, decision);
    return `${decision.text()}｜${merged.summary()}`;
  }

  private conflictLines(): string[] {
    const lines: string[] = conflictRuleLines();
    lines.push(auditConflictRules().summary());
    return lines;
  }

  private docWorkspaceLines(): string[] {
    const workspace: DocumentWorkspace = new DocumentWorkspace();
    const note: DocumentSlot = new DocumentSlot('note-1', DocKind.NOTE, localize('ac_index_141'));
    note.revision = 3;
    note.ownerApp = 'app.continuation';
    workspace.open(note);
    const form: DocumentSlot = new DocumentSlot('form-1', DocKind.FORM, localize('ac_index_143'));
    form.revision = 1;
    form.ownerApp = 'app.continuation';
    workspace.open(form);
    const reading: DocumentSlot = new DocumentSlot('read-1', DocKind.READING, localize('ac_index_144'));
    reading.revision = 7;
    workspace.open(reading);
    const lines: string[] = workspaceLines(workspace);
    const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'other.app', 1);
    reasons.forEach((reason: string): void => {
      lines.push(localize('ac_index_107', [reason]));
    });
    lines.push(localize('ac_index_108', [docLines().length, multiSlotKinds().length]));
    return lines;
  }

  private demoFormSession(): FormSession {
    const session: FormSession = new FormSession('expense-1');
    const kind: FormField = new FormField('kind', localize('ac_index_109'), true, 8);
    session.addField(kind);
    session.setValue('kind', localize('ac_index_152'));
    const budget: FormField = new FormField('budget', localize('ac_index_111'), true, 16);
    budget.visibleWhen = ['budget'];
    session.addField(budget);
    const remark: FormField = new FormField('remark', localize('ac_index_112'), false, 60);
    remark.visibleWhen = ['remark'];
    session.addField(remark);
    return session;
  }

  private demoFormSummary(): string {
    return formSummary(this.demoFormSession());
  }

  private demoFormLines(): string[] {
    const session: FormSession = this.demoFormSession();
    const lines: string[] = [];
    lines.push(localize('ac_index_113', [session.visibleFields().length, session.blockingFields().length]));
    lines.push(localize('ac_index_114', [branchLines().length, session.missingRows().length]));
    branchLines().slice(0, 3).forEach((line: string): void => {
      lines.push(line);
    });
    return lines;
  }

  private demoTriples(): FieldTriple[] {
    const triples: FieldTriple[] = [];
    const title: FieldTriple = new FieldTriple('title', localize('ac_index_115'));
    title.base = localize('ac_index_141');
    title.local = localize('ac_index_145');
    title.remote = localize('ac_index_141');
    triples.push(title);
    const body: FieldTriple = new FieldTriple('body', localize('ac_index_119'));
    body.base = localize('ac_index_146');
    body.local = localize('ac_index_146');
    body.remote = localize('ac_index_147');
    triples.push(body);
    const tags: FieldTriple = new FieldTriple('tags', localize('ac_index_123'));
    tags.base = 'a,b';
    tags.local = `a,b,${localize('ac_index_148')}`;
    tags.remote = `a,b,${localize('ac_index_149')}`;
    triples.push(tags);
    return triples;
  }

  private demoMergeLines(): string[] {
    const triples: FieldTriple[] = this.demoTriples();
    const plan: MergePlan = planMerge(triples, true);
    const lines: string[] = [];
    lines.push(tripleStats(triples));
    previewLines(plan).forEach((line: string): void => {
      lines.push(line);
    });
    return lines;
  }

  private demoRecoveryLines(): string[] {
    const input: RecoveryInput = new RecoveryInput();
    input.failure = RecoveryCase.WRITE_UNCERTAIN;
    input.hasLocalCache = true;
    input.localDirty = true;
    input.rereadOk = true;
    const lines: string[] = [];
    lines.push(recoverySummary(planRecovery(input)));
    lines.push(localize('ac_index_126', [actionsOf(RecoveryCase.TARGET_MISSING).length]));
    recoveryLines().slice(0, 5).forEach((line: string): void => {
      lines.push(line);
    });
    return lines;
  }

  @Builder
  private workspacePage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle(localize('ac_index_127'))
        LearningDisclosure({ title: localize('ac_index_128'), subtitle: localize('ac_index_129') }) {
          Column({ space: 8 }) {
            ForEach(this.docWorkspaceLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `doc-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: localize('ac_index_130'), subtitle: this.demoFormSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.demoFormLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `form-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: localize('ac_index_131'), subtitle: localize('ac_index_132') }) {
          Column({ space: 8 }) {
            ForEach(this.demoMergeLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `merge-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: localize('ac_index_133'), subtitle: localize('ac_index_134') }) {
          Column({ space: 8 }) {
            ForEach(this.demoRecoveryLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `rec-${index}-${line}`)
          }.width('100%')
        }
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private tabLabel(label: string, index: number) {
    Column() {
      Text(label).fontSize(14).fontWeight(this.activeTab === index ? FontWeight.Bold : FontWeight.Normal)
        .fontColor(this.activeTab === index ? LEARNING_BLUE : LEARNING_MUTED);
    }.width('100%').height(56).justifyContent(FlexAlign.Center);
  }

  build() {
    Column() {
      if (this.noticeText().length > 0) {
        Scroll() {
          LearningNotice({ title: localize('ac_learningui_017'), message: this.noticeText() })
        }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 4 })
          .constraintSize({ maxHeight: '25%' }).scrollBar(BarState.Auto).align(Alignment.TopStart);
      }
      Tabs({ barPosition: BarPosition.End, index: this.activeTab }) {
        TabContent() { this.introductionPage() }.tabBar(this.tabLabel(localize('ac_index_136'), 0))
        TabContent() { this.operationPage() }.tabBar(this.tabLabel(localize('ac_index_137'), 1))
        TabContent() { this.diagnosisPage() }.tabBar(this.tabLabel(localize('ac_index_138'), 2))
        TabContent() { this.payloadPage() }.tabBar(this.tabLabel(localize('ac_index_139'), 3))
        TabContent() { this.workspacePage() }.tabBar(this.tabLabel(localize('ac_index_140'), 4))
      }
      .layoutWeight(1).width('100%').barHeight(60).barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.activeTab = index;
        if (index === 1) { this.scheduleSelection(); }
      });
    }.width('100%').height('100%').backgroundColor(LEARNING_BG);
  }
}
