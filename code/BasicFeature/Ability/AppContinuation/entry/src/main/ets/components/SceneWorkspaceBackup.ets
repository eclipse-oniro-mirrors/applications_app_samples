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
      if (!this.canOperate) { this.invalidateGenerated('系统接续在途或运行时已释放，请稍后重新生成和预览。'); }
    }));
    this.subscriptions.push(current.sceneWorkbench.subscribe((): void => {
      if (!this.mounted || generation !== this.lifecycle) { return; }
      this.refreshGate(); this.invalidateGenerated('业务状态已变化，请重新生成备份或校验预览。');
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
    if (current === undefined) { this.status = '运行时尚未初始化，请稍后重试。'; return; }
    const exported = current.sceneBackupSnapshot();
    this.generated = exported.ok ? exported : undefined;
    this.exportRaw = exported.ok ? exported.raw : ''; this.exportReady = exported.ok;
    this.status = exported.message;
  }

  private changedInput(value: string): void {
    if (value === this.importRaw) { return; }
    this.importRaw = value; this.inputGeneration++;
    this.bound?.cancelSceneBackupPreview(); this.preview = undefined;
    this.previewReady = false; this.summary = ''; this.status = '导入文本已变更，请校验并预览后再恢复。';
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
    this.status = this.selectedScope().length === 0 ? '请至少选择一个恢复场景。' : '恢复范围已变更，请重新校验并预览。';
  }

  private scopeSummary(): string {
    const scope = this.selectedScope();
    if (scope.length === 0) { return '请至少选择一个恢复场景。生成和复制仍包含完整业务工作区。'; }
    return `恢复范围：${scope.map((kind: string): string => sceneLabel(kind)).join('、')}；未选场景及其未保存草稿保留，不随本次写盘。生成备份始终包含完整工作区。`;
  }

  private inspect(): void {
    this.bind(); const current = this.bound;
    if (current === undefined) { this.status = '运行时尚未初始化，请稍后重试。'; return; }
    const preview = current.previewSceneBackup(this.importRaw, this.selectedScope());
    this.preview = preview.ok ? preview : undefined; this.previewReady = preview.ok;
    this.summary = sceneBackupPreviewText(preview); this.status = preview.message;
  }

  private cancelPreview(): void {
    this.bound?.cancelSceneBackupPreview(); this.inputGeneration++;
    this.preview = undefined; this.previewReady = false; this.importRaw = ''; this.summary = '';
    this.status = '已取消恢复预览。';
  }

  private confirmRestore(): void {
    const current = this.bound; const preview = this.preview;
    if (current === undefined || preview === undefined || !this.canRestore || this.busy) { return; }
    const generation = this.lifecycle; const inputGeneration = this.inputGeneration;
    const scope = this.selectedScope();
    const warning = preview.requiresDirtyConfirmation ? '将替换所选场景中未保存的业务修改。' : '';
    confirmLearningAction(this.getUIContext(), '恢复本地业务工作区？',
      `${warning}仅替换${scope.map((kind: string): string => sceneLabel(kind)).join('、')}及其历史；未选场景与原文本学习区不受影响。建议先主动导出本机备份。`,
      (): void => {
        if (!this.mounted || !this.expanded || generation !== this.lifecycle || current !== this.bound) { return; }
        if (inputGeneration !== this.inputGeneration) { this.status = '恢复预览已过期，请重新校验并预览。'; return; }
        this.busy = true;
        try {
          const result = current.restoreSceneBackup(preview.token, true, scope);
          this.status = result.message; this.preview = undefined; this.previewReady = false;
          if (result.ok) { this.importRaw = ''; this.summary = result.message; this.inputGeneration++; }
        } catch (error) {
          this.status = '本地恢复未完成，当前状态请重新检查；未回显备份内容。';
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
    confirmLearningAction(this.getUIContext(), '复制未加密业务备份？',
      '副本含当前草稿、姓名电话地址及历史版本。只设置本机剪贴板分享范围，不会自动上传；请自行妥善保管和清除副本。',
      (): void => {
        if (!this.mounted || !this.expanded || generation !== this.lifecycle || current !== this.bound) { return; }
        this.busy = true; this.status = '正在等待本机剪贴板复制结果…';
        current.copySceneBackup(generated).then((result): void => {
          if (this.mounted && generation === this.lifecycle) { this.status = result.message; }
        }).catch((): void => {
          if (this.mounted && generation === this.lifecycle) { this.status = '备份复制未完成；业务状态保持不变。'; }
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
      this.status = '当前不能继续业务场景，请先结束接续或检查草稿状态。'; return;
    }
    this.clearSensitiveState(); this.refreshGate();
    this.status = `已保留其它未保存草稿，继续${sceneLabel(kind)}。`;
    try {
      const navigate = this.onResumeScene;
      if (navigate !== undefined) { navigate(kind); return; }
      const page = kind === 'note' ? 'pages/NoteScenePage' : kind === 'reading' ? 'pages/ReadingScenePage' : 'pages/FormScenePage';
      this.getUIContext().getRouter().pushUrl({ url: page }).catch((): void => {
        current.activateText();
        if (this.mounted) { this.status = '业务页面未打开；所有未保存草稿仍保留。'; }
      });
    } catch (error) {
      current.activateText(); this.status = '业务页面未打开；所有未保存草稿仍保留。';
    }
  }

  build() {
    Column({ space: 12 }) {
      Button(this.expanded ? '收起备份与恢复' : '备份与恢复', { type: ButtonType.Normal })
        .id('ACBackupPanelToggle').width('100%').height(44).fontSize(15).fontWeight(FontWeight.Medium)
        .fontColor(LEARNING_BLUE).backgroundColor('#FFFFFF').borderRadius(10)
        .onClick((): void => { this.togglePanel(); })
      if (this.expanded) {
        Text('保存笔记、阅读与表单的草稿和历史。').fontSize(14).fontColor(LEARNING_MUTED).width('100%')
        Row({ space: 8 }) {
          Button('生成备份', { type: ButtonType.Normal }).id('ACBackupGenerate').layoutWeight(1)
            .height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(LEARNING_BLUE).borderRadius(10)
            .enabled(this.canOperate && !this.busy).onClick((): void => { this.generate(); })
          Button('复制备份', { type: ButtonType.Normal }).id('ACBackupCopy').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .enabled(this.exportReady && this.canOperate && !this.busy).onClick((): void => { this.confirmCopy(); })
        }.width('100%')
        if (this.exportReady) {
          Text(`已生成 ${this.exportRaw.length} 字符，预览前512字符。副本未加密，请妥善保管。`)
            .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
          Text(this.exportRaw.slice(0, 512)).id('ACBackupExportText').fontSize(12).fontColor(LEARNING_MUTED).width('100%')
            .maxLines(6).textOverflow({ overflow: TextOverflow.Ellipsis }).copyOption(CopyOptions.None)
        }
        Text('选择恢复内容').fontSize(14).fontColor(LEARNING_INK).width('100%')
        Row({ space: 8 }) {
          Row({ space: 4 }) {
            Checkbox({ name: 'note' }).id('ACBackupScopeNote').width(44).height(44).padding(10).select(this.scopeNote)
              .enabled(this.canOperate && !this.busy).onChange((value: boolean): void => { this.changeScope('note', value); })
            Text('笔记').fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
          Row({ space: 4 }) {
            Checkbox({ name: 'reading' }).id('ACBackupScopeReading').width(44).height(44).padding(10).select(this.scopeReading)
              .enabled(this.canOperate && !this.busy).onChange((value: boolean): void => { this.changeScope('reading', value); })
            Text('阅读').fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
          Row({ space: 4 }) {
            Checkbox({ name: 'form' }).id('ACBackupScopeForm').width(44).height(44).padding(10).select(this.scopeForm)
              .enabled(this.canOperate && !this.busy).onChange((value: boolean): void => { this.changeScope('form', value); })
            Text('表单').fontSize(14).fontColor(LEARNING_INK)
          }.layoutWeight(1)
        }.width('100%')
        Text(this.scopeSummary()).id('ACBackupScopeSummary').fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        TextArea({ text: this.importRaw, placeholder: '粘贴完整备份，再校验预览' })
          .id('ACBackupImportText').height(130).width('100%').fontSize(14).backgroundColor('#F5F7FA').borderRadius(10)
          .maxLength(SCENE_WORKSPACE_LIMIT + 1)
          .enabled(this.canOperate && !this.busy).onChange((value: string): void => { this.changedInput(value); })
        Text(`输入 ${this.importRaw.length}/${SCENE_WORKSPACE_LIMIT} 字符；超限只拒绝，不截断后恢复。`)
          .fontSize(12).fontColor(LEARNING_MUTED).width('100%')
        Row({ space: 8 }) {
          Button('校验预览', { type: ButtonType.Normal }).id('ACBackupPreview').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .enabled(this.canRestore && !this.busy && this.selectedScope().length > 0).onClick((): void => { this.inspect(); })
          Button('恢复备份', { type: ButtonType.Normal }).id('ACBackupApply').layoutWeight(1)
            .height(44).fontSize(14).fontColor('#FFFFFF').backgroundColor(LEARNING_BLUE).borderRadius(10)
            .enabled(this.previewReady && this.canRestore && !this.busy && this.selectedScope().length > 0)
            .onClick((): void => { this.confirmRestore(); })
          Button('取消预览', { type: ButtonType.Normal }).id('ACBackupCancel').layoutWeight(1)
            .height(44).fontSize(14).fontColor(LEARNING_MUTED).backgroundColor('#F5F7FA').borderRadius(10)
            .enabled(!this.busy).onClick((): void => { this.cancelPreview(); })
        }.width('100%')
        if (this.canResume) {
          Text('继续编辑，保留其它未保存草稿。').fontSize(12).fontColor(LEARNING_MUTED).width('100%')
          Row({ space: 8 }) {
            Button('继续笔记', { type: ButtonType.Normal }).id('ACBackupResumeNote').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('note'); })
            Button('继续阅读', { type: ButtonType.Normal }).id('ACBackupResumeReading').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('reading'); })
            Button('继续表单', { type: ButtonType.Normal }).id('ACBackupResumeForm').layoutWeight(1)
              .height(44).fontSize(14).fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
              .enabled(this.canOperate && !this.busy).onClick((): void => { this.resumeScene('form'); })
          }.width('100%')
        }
        Text(this.summary.length > 0 ? this.summary : '尚未预览；校验和取消均不会写入业务存储。')
          .id('ACBackupSummary').fontSize(14).fontColor(LEARNING_INK).width('100%')
        Text(this.status.length > 0 ? this.status : '准备就绪。')
          .id('ACBackupStatus').fontSize(14).fontColor(LEARNING_BLUE).width('100%')
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
  }
}
