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
/** The actual local scene backup panel used by Index and by isolated component tests. */
import { LearningController } from '../learning/LearningController';
import { getLearningController } from '../learning/LearningContext';
import { SCENE_WORKSPACE_LIMIT, sceneLabel } from '../learning/scene/SceneModel';
import {
  SceneBackupExport, SceneBackupPreview, sceneBackupPreviewText
} from '../learning/scene/SceneWorkspaceBackupModel';
import { confirmLearningAction, LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED } from './LearningUi';

@Component
export struct SceneWorkspaceBackup {
  controller: LearningController | undefined = undefined;
  onResumeScene: ((kind: string) => void) | undefined = undefined;
  @State private scopeNote: boolean = true;
  @State private scopeReading: boolean = true;
  @State private scopeForm: boolean = true;
  @State private canResume: boolean = false;
  @State private expanded: boolean = false;
  @State private status: string = '';
  @State private summary: string = '';
  @State private importRaw: string = '';
  @State private exportRaw: string = '';
  @State private previewReady: boolean = false;
  @State private exportReady: boolean = false;
  @State private canOperate: boolean = false;
  @State private canRestore: boolean = false;
  @State private busy: boolean = false;
  private bound: LearningController | undefined = undefined;
  private generated: SceneBackupExport | undefined = undefined;
  private preview: SceneBackupPreview | undefined = undefined;
  private subscriptions: (() => void)[] = [];
  private lifecycle: number = 0;
  private inputGeneration: number = 0;
  private mounted: boolean = false;

  aboutToAppear(): void { this.mounted = true; this.bind(); }
  aboutToDisappear(): void {
    this.mounted = false; this.lifecycle++; this.clearSensitiveState(); this.detach(); this.bound = undefined;
  }

  private detach(): void {
    this.subscriptions.forEach((stop: () => void): void => { stop(); });
    this.subscriptions = [];
  }

  private bind(): void {
    const current = this.controller === undefined ? getLearningController() : this.controller;
    if (current === this.bound && this.subscriptions.length > 0) { this.refreshGate(); return; }
    this.detach(); this.lifecycle++; this.clearSensitiveState(); this.bound = current;
    if (current === undefined) { this.canOperate = false; this.canRestore = false; this.canResume = false; return; }
    const generation = this.lifecycle;
    this.subscriptions.push(current.subscribe((): void => {
      if (!this.mounted || generation !== this.lifecycle) { return; }
      this.refreshGate();
      if (!this.canOperate) { this.invalidateGenerated(localize('ac_sceneworkspacebackup_001')); }
    }));
    this.subscriptions.push(current.sceneWorkbench.subscribe((): void => {
      if (!this.mounted || generation !== this.lifecycle) { return; }
      this.refreshGate(); this.invalidateGenerated(localize('ac_sceneworkspacebackup_002'));
    }));
    this.refreshGate();
  }

  private refreshGate(): void {
    const current = this.bound;
    if (current === undefined) { this.canOperate = false; this.canRestore = false; this.canResume = false; return; }
    this.canOperate = current.snapshot().canEdit;
    this.canRestore = this.canOperate && !current.sceneWorkbench.snapshot().storageFrozen;
    this.canResume = current.canResumeSceneBackupDrafts();
  }

  private invalidateGenerated(message: string): void {
    const hadData = this.generated !== undefined || this.preview !== undefined;
    this.generated = undefined; this.preview = undefined;
    this.exportRaw = ''; this.exportReady = false; this.previewReady = false;
    this.bound?.cancelSceneBackupPreview();
    if (hadData) { this.summary = ''; this.status = message; }
  }

  private clearSensitiveState(): void {
    this.bound?.cancelSceneBackupPreview();
    this.inputGeneration++; this.generated = undefined; this.preview = undefined;
    this.importRaw = ''; this.exportRaw = ''; this.summary = ''; this.status = '';
    this.exportReady = false; this.previewReady = false; this.busy = false;
    this.scopeNote = true; this.scopeReading = true; this.scopeForm = true;
  }

  private togglePanel(): void {
    this.bind();
    if (this.expanded) {
      this.lifecycle++;
      this.clearSensitiveState();
      this.detach();
      this.expanded = false;
    } else {
      this.expanded = true;
      this.bind();
    }
  }

  private generate(): void {
    this.bind(); const current = this.bound;
    if (current === undefined) { this.status = localize('ac_sceneworkspacebackup_003'); return; }
    const exported = current.sceneBackupSnapshot();
    this.generated = exported.ok ? exported : undefined;
    this.exportRaw = exported.ok ? exported.raw : ''; this.exportReady = exported.ok;
    this.status = exported.message;
  }

  private changedInput(value: string): void {
    if (value === this.importRaw) { return; }
    this.importRaw = value; this.inputGeneration++;
    this.bound?.cancelSceneBackupPreview(); this.preview = undefined;
    this.previewReady = false; this.summary = ''; this.status = localize('ac_sceneworkspacebackup_004');
  }

  private selectedScope(): string[] {
    const scope: string[] = [];
    if (this.scopeNote) { scope.push('note'); }
    if (this.scopeReading) { scope.push('reading'); }
    if (this.scopeForm) { scope.push('form'); }
    return scope;
  }

  private changeScope(kind: string, selected: boolean): void {
    if (kind === 'note') {
      if (this.scopeNote === selected) { return; }
      this.scopeNote = selected;
    } else if (kind === 'reading') {
      if (this.scopeReading === selected) { return; }
      this.scopeReading = selected;
    } else if (kind === 'form') {
      if (this.scopeForm === selected) { return; }
      this.scopeForm = selected;
    } else {
      return;
    }
    this.inputGeneration++; this.bound?.cancelSceneBackupPreview();
    this.preview = undefined; this.previewReady = false; this.summary = '';
    this.status = this.selectedScope().length === 0 ? localize('ac_sceneworkspacebackup_005') : localize('ac_sceneworkspacebackup_006');
  }

  private scopeSummary(): string {
    const scope = this.selectedScope();
    if (scope.length === 0) { return localize('ac_sceneworkspacebackup_007'); }
    return localize('ac_sceneworkspacebackup_008', [scope.map((kind: string): string => sceneLabel(kind)).join('、')]) +
      localize('ac_sceneworkspacebackup_009');
  }

  private inspect(): void {
    this.bind(); const current = this.bound;
    if (current === undefined) { this.status = localize('ac_sceneworkspacebackup_003'); return; }
    const preview = current.previewSceneBackup(this.importRaw, this.selectedScope());
    this.preview = preview.ok ? preview : undefined; this.previewReady = preview.ok;
    this.summary = sceneBackupPreviewText(preview); this.status = preview.message;
  }

  private cancelPreview(): void {
    this.bound?.cancelSceneBackupPreview(); this.inputGeneration++;
    this.preview = undefined; this.previewReady = false; this.importRaw = ''; this.summary = '';
    this.status = localize('ac_sceneworkspacebackup_011');
  }

  private confirmRestore(): void {
    const current = this.bound; const preview = this.preview;
    if (current === undefined || preview === undefined || !this.canRestore || this.busy) { return; }
    const generation = this.lifecycle; const inputGeneration = this.inputGeneration;
    const scope = this.selectedScope();
    const warning = preview.requiresDirtyConfirmation ? localize('ac_sceneworkspacebackup_012') : '';
    confirmLearningAction(this.getUIContext(), localize('ac_sceneworkspacebackup_013'),
      localize('ac_sceneworkspacebackup_014', [warning, scope.map((kind: string): string => sceneLabel(kind)).join('、')]) +
        localize('ac_sceneworkspacebackup_015'),
      (): void => {
        if (!this.mounted || !this.expanded || generation !== this.lifecycle || current !== this.bound) { return; }
        if (inputGeneration !== this.inputGeneration) { this.status = localize('ac_sceneworkspacebackup_016'); return; }
        this.busy = true;
        try {
          const result = current.restoreSceneBackup(preview.token, true, scope);
          this.status = result.message; this.preview = undefined; this.previewReady = false;
          if (result.ok) { this.importRaw = ''; this.summary = result.message; this.inputGeneration++; }
        } catch (error) {
          this.status = localize('ac_sceneworkspacebackup_017');
        } finally {
          this.busy = false;
          this.refreshGate();
        }
      }, (message: string): void => {
        if (this.mounted && generation === this.lifecycle) { this.status = message; }
      });
  }

  private confirmCopy(): void {
    const current = this.bound; const generated = this.generated;
    if (current === undefined || generated === undefined || !this.canOperate || this.busy) { return; }
    const generation = this.lifecycle;
    confirmLearningAction(this.getUIContext(), localize('ac_sceneworkspacebackup_018'),
      localize('ac_sceneworkspacebackup_019'),
      (): void => {
        if (!this.mounted || !this.expanded || generation !== this.lifecycle || current !== this.bound) { return; }
        this.busy = true; this.status = localize('ac_sceneworkspacebackup_020');
        current.copySceneBackup(generated).then((result): void => {
          if (this.mounted && generation === this.lifecycle) { this.status = result.message; }
        }).catch((): void => {
          if (this.mounted && generation === this.lifecycle) { this.status = localize('ac_sceneworkspacebackup_021'); }
        }).finally((): void => {
          if (this.mounted && generation === this.lifecycle) { this.busy = false; }
        });
      }, (message: string): void => {
        if (this.mounted && generation === this.lifecycle) { this.status = message; }
      });
  }

  private resumeScene(kind: string): void {
    const current = this.bound;
    if (current === undefined || this.busy || !current.resumeSceneBackupDrafts(kind)) {
      this.status = localize('ac_sceneworkspacebackup_022'); return;
    }
    this.clearSensitiveState(); this.refreshGate();
    this.status = localize('ac_sceneworkspacebackup_023', [sceneLabel(kind)]);
    try {
      const navigate = this.onResumeScene;
      if (navigate !== undefined) { navigate(kind); return; }
      const page = kind === 'note' ? 'pages/NoteScenePage' :
        kind === 'reading' ? 'pages/ReadingScenePage' : 'pages/FormScenePage';
      this.getUIContext().getRouter().pushUrl({ url: page }).catch((): void => {
        current.activateText();
        if (this.mounted) { this.status = localize('ac_sceneworkspacebackup_024'); }
      });
    } catch (error) {
      current.activateText(); this.status = localize('ac_sceneworkspacebackup_024');
    }
  }

  build() {
    Column({ space: 12 }) {
      Button(this.expanded ? localize('ac_sceneworkspacebackup_026') : localize('ac_sceneworkspacebackup_027'), { type: ButtonType.Normal })
        .id('ACBackupPanelToggle').width('100%').height(44).fontSize(15).fontWeight(FontWeight.Medium)
        .fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10)
        .onClick((): void => { this.togglePanel(); })
      if (this.expanded) {
        Text($r('app.string.ac_sceneworkspacebackup_028')).fontSize(14).fontColor(LEARNING_MUTED).width('100%')
        Row({ space: 8 }) {
          Button($r('app.string.ac_sceneworkspacebackup_029'), { type: ButtonType.Normal }).id('ACBackupGenerate').layoutWeight(1)
            .height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(LEARNING_BLUE).borderRadius(10)
            .enabled(this.canOperate && !this.busy).onClick((): void => { this.generate(); })
          Button($r('app.string.ac_sceneworkspacebackup_030'), { type: ButtonType.Normal }).id('ACBackupCopy').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .enabled(this.exportReady && this.canOperate && !this.busy).onClick((): void => { this.confirmCopy(); })
        }.width('100%')
        if (this.exportReady) {
          Text(localize('ac_sceneworkspacebackup_031', [this.exportRaw.length]))
            .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
          Text(this.exportRaw.slice(0, 512)).id('ACBackupExportText')
            .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
            .maxLines(6).textOverflow({ overflow: TextOverflow.Ellipsis }).copyOption(CopyOptions.None)
        }
        Text($r('app.string.ac_sceneworkspacebackup_032')).fontSize(14).fontColor(LEARNING_INK).width('100%')
        Row({ space: 8 }) {
          Row({ space: 4 }) {
            Checkbox({ name: 'note' }).id('ACBackupScopeNote').width(44).height(44).padding(10).select(this.scopeNote)
              .enabled(this.canOperate && !this.busy)
              .onChange((value: boolean): void => { this.changeScope('note', value); })
            Text($r('app.string.ac_sceneworkspacebackup_033')).fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
          Row({ space: 4 }) {
            Checkbox({ name: 'reading' }).id('ACBackupScopeReading')
              .width(44).height(44).padding(10).select(this.scopeReading)
              .enabled(this.canOperate && !this.busy)
              .onChange((value: boolean): void => { this.changeScope('reading', value); })
            Text($r('app.string.ac_sceneworkspacebackup_034')).fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
          Row({ space: 4 }) {
            Checkbox({ name: 'form' }).id('ACBackupScopeForm').width(44).height(44).padding(10).select(this.scopeForm)
              .enabled(this.canOperate && !this.busy)
              .onChange((value: boolean): void => { this.changeScope('form', value); })
            Text($r('app.string.ac_sceneworkspacebackup_035')).fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
        }.width('100%')
        Text(this.scopeSummary()).id('ACBackupScopeSummary').fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        TextArea({ text: this.importRaw, placeholder: localize('ac_sceneworkspacebackup_036') })
          .id('ACBackupImportText').height(130).width('100%').fontSize(14).backgroundColor('#F5F7FA').borderRadius(10)
          .maxLength(SCENE_WORKSPACE_LIMIT + 1)
          .enabled(this.canOperate && !this.busy).onChange((value: string): void => { this.changedInput(value); })
        Text(localize('ac_sceneworkspacebackup_037', [this.importRaw.length, SCENE_WORKSPACE_LIMIT]))
          .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        Row({ space: 8 }) {
          Button($r('app.string.ac_sceneworkspacebackup_038'), { type: ButtonType.Normal }).id('ACBackupPreview').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .enabled(this.canRestore && !this.busy && this.selectedScope().length > 0)
            .onClick((): void => { this.inspect(); })
          Button($r('app.string.ac_sceneworkspacebackup_039'), { type: ButtonType.Normal }).id('ACBackupApply').layoutWeight(1)
            .height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(LEARNING_BLUE).borderRadius(10)
            .enabled(this.previewReady && this.canRestore && !this.busy && this.selectedScope().length > 0)
            .onClick((): void => { this.confirmRestore(); })
          Button($r('app.string.ac_sceneworkspacebackup_040'), { type: ButtonType.Normal }).id('ACBackupCancel').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_MUTED).backgroundColor('#F5F7FA').borderRadius(10)
            .enabled(!this.busy).onClick((): void => { this.cancelPreview(); })
        }.width('100%')
        if (this.canResume) {
          Text($r('app.string.ac_sceneworkspacebackup_041')).fontSize(12).fontColor(LEARNING_MUTED).width('100%')
          Row({ space: 8 }) {
            Button($r('app.string.ac_sceneworkspacebackup_042'), { type: ButtonType.Normal }).id('ACBackupResumeNote').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('note'); })
            Button($r('app.string.ac_sceneworkspacebackup_043'), { type: ButtonType.Normal }).id('ACBackupResumeReading').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('reading'); })
            Button($r('app.string.ac_sceneworkspacebackup_044'), { type: ButtonType.Normal }).id('ACBackupResumeForm').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('form'); })
          }.width('100%')
        }
        Text(this.summary.length > 0 ? this.summary : localize('ac_sceneworkspacebackup_045'))
          .id('ACBackupSummary').fontSize(14).fontColor(LEARNING_INK).width('100%')
        Text(this.status.length > 0 ? this.status : localize('ac_sceneworkspacebackup_046'))
          .id('ACBackupStatus').fontSize(14).fontColor(LEARNING_BLUE).width('100%')
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
  }
}
