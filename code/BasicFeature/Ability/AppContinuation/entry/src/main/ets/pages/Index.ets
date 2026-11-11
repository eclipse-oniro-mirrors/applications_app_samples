/** Main workbench for interface calls, text continuation and operation records. */
import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
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
  @State levelFilter: string = '全部';
  @State operationFilter: string = '全部';
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
      this.message = `选择区暂未恢复：${learningError(error as BusinessError)}`;
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
      this.message = `文本更新未完成：${learningError(error as BusinessError)}`;
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
      this.message = `选择区更新未完成：${learningError(error as BusinessError)}`;
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
      this.message = '正在初始化，请稍后重试。';
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
      this.message = `操作未完成：${learningError(error as BusinessError)}`;
    }
  }

  private openBusiness(kind: string, page: string): void {
    const controller = this.controller;
    if (controller === undefined || !controller.openScene(kind)) {
      this.message = controller === undefined ? 'Ability 正在初始化' : controller.sceneWorkbench.snapshot().error;
      return;
    }
    this.open(page);
  }

  private open(url: string, id: string = ''): void {
    try {
      this.getUIContext().getRouter().pushUrl({ url: url, params: { id: id } }, (error: BusinessError) => {
        if (error) {
          this.message = `页面未打开：${learningError(error)}`;
        }
      });
    } catch (error) {
      this.message = `页面不可用：${learningError(error as BusinessError)}`;
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
      this.message = '正在初始化，请稍后复制摘要。';
      return;
    }
    copyLearningText(controller.diagnosticSummary(), (message: string) => this.feedback(message));
  }

  private openOfficialDoc(): void {
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext | undefined;
      if (context === undefined) {
        this.message = '官方文档暂时无法打开，请稍后重试。';
        return;
      }
      const documentationUrl = context.resourceManager.getStringValue($r('app.string.official_doc_url').id);
      context.startAbility({ action: 'ohos.want.action.viewData', uri: documentationUrl })
        .catch((error: BusinessError) => {
          this.message = `文档打开失败：${learningError(error)}`;
        });
    } catch (error) {
      this.message = `文档打开失败：${learningError(error as BusinessError)}`;
    }
  }

  private confirmExample(): void {
    if (this.snapshot.text.length === 0) {
      this.invoke('example');
      return;
    }
    confirmLearningAction(this.getUIContext(), '用示例替换文本？', '将替换当前文本和选择区。',
      () => this.invoke('example'), (message: string) => this.feedback(message));
  }

  private confirmClearText(): void {
    if (this.snapshot.text.length === 0) {
      this.message = '文本已经为空。';
      return;
    }
    confirmLearningAction(this.getUIContext(), '清空文本？', '将清空文本和选择区，并更新本机保存。',
      () => this.invoke('clearText'), (message: string) => this.feedback(message));
  }

  private confirmClearRecords(): void {
    confirmLearningAction(this.getUIContext(), '清空记录？', '将清除操作记录，保留当前状态和文本。',
      () => this.invoke('clearRecords'), (message: string) => this.feedback(message));
  }

  private filteredRecords(): OperationRecord[] {
    return this.snapshot.records.filter((record: OperationRecord) => {
      const levelMatch = this.levelFilter === '全部' ||
        (this.levelFilter === '失败' && record.level === 'ERROR') ||
        (this.levelFilter === '警告' && record.level === 'WARN');
      const operationMatch = this.operationFilter === '全部' ||
        (this.operationFilter === 'ON' && record.operation === 'ON') ||
        (this.operationFilter === 'OFF' && record.operation === 'OFF') ||
        (this.operationFilter === '系统' && record.operation !== 'ON' && record.operation !== 'OFF');
      return levelMatch && operationMatch;
    });
  }

  private noticeText(): string {
    if (this.message.length > 0) {
      return this.message;
    }
    const notice = this.snapshot.notice;
    if (notice.startsWith('等待 Ability 初始化')) {
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
        this.pageTitle('应用接续')
        Text('调用接续接口，保存文本并查看运行结果。')
          .fontSize(15).lineHeight(24).fontColor(LEARNING_MUTED).width('100%');
        LearningCard({ title: '主要功能' }) {
          LearningLine({ label: '接口调用', value: '检查运行环境，注册或注销结果监听。' })
          LearningLine({ label: '文本接续', value: '编辑和保存文本，接续后恢复文本与选择区。' })
          LearningLine({ label: '调用诊断', value: '查看操作结果、错误信息和过程记录。' })
        }
        LearningAction({ label: '开始使用', onTap: () => this.changeTab(1) })
        LearningAction({ label: '官方文档', secondary: true, onTap: () => this.openOfficialDoc() })
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private operationPage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle('接续工作台')
        Row({ space: 12 }) {
          Text(this.snapshot.sessionState).fontSize(14).lineHeight(21).fontColor(LEARNING_MUTED).layoutWeight(1)
          Button('查看过程', { type: ButtonType.Normal }).height(44).fontSize(14)
            .fontColor(LEARNING_BLUE).backgroundColor('#EEF4FF').borderRadius(10)
            .onClick(() => this.open('pages/ProcessPage'))
        }.width('100%')
        Row({ space: 8 }) {
          LearningAction({ label: '笔记', secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('note', 'pages/NoteScenePage') }).layoutWeight(1)
          LearningAction({ label: '阅读', secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('reading', 'pages/ReadingScenePage') }).layoutWeight(1)
          LearningAction({ label: '表单', secondary: true, actionEnabled: this.snapshot.canEdit,
            onTap: () => this.openBusiness('form', 'pages/FormScenePage') }).layoutWeight(1)
        }.width('100%')
        if (this.snapshot.conflictPending) {
          LearningCard({
            title: this.snapshot.conflictKind === 'document' ? '文档切换冲突' : '版本冲突',
            subtitle: this.snapshot.conflictAccepted ? '已记录选择，等待快速结果与页面门控' : '接续版本尚未覆盖本机正文'
          }) {
            Text(this.snapshot.conflictSummary).fontSize(14).fontColor(LEARNING_INK).width('100%')
            if (this.snapshot.conflictAccepted) {
              Text('接受决定已记录；在系统快速结果与本页面就绪前不会写入。')
                .fontSize(13).fontColor(LEARNING_MUTED).width('100%')
            } else {
              LearningAction({ label: '接受接续版本', onTap: () => this.invoke('acceptConflict') })
              LearningAction({ label: '保留本机版本', secondary: true,
                onTap: () => this.invoke('rejectConflict') })
            }
          }
        }
        LearningCard({ title: '文本' }) {
          TextArea({ text: this.snapshot.text, placeholder: '输入文本…', controller: this.editor })
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
            label: '长度 / 选择区',
            value: `${this.snapshot.text.length} / ${MAX_TEXT_LENGTH}  ·  ` +
              `[${this.snapshot.selectionStart}, ${this.snapshot.selectionEnd})`
          })
          LearningLine({ label: '保存状态', value: this.snapshot.savedTextStatus })
          LearningAction({ label: '保存本机', actionEnabled: this.snapshot.canEdit, onTap: () => this.invoke('save') })
          LearningAction({ label: this.textActionsExpanded ? '收起更多操作' : '更多文本操作', secondary: true,
            onTap: () => { this.textActionsExpanded = !this.textActionsExpanded; } })
          if (this.textActionsExpanded) {
            LearningLine({ label: '文档 / 修订',
              value: this.snapshot.documentId.length > 0 ?
                `${this.snapshot.documentId} · r${this.snapshot.revision}` : '首次保存后启用 v2 载荷' })
            LearningAction({ label: '填入示例', secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => this.confirmExample() })
            LearningAction({ label: '另存为新文档（保留正文）', secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => confirmLearningAction(this.getUIContext(), '另存为新文档？', '保存当前内容并从 r1 建立独立身份；旧修订不再沿用。',
                () => this.invoke('newDocument'), (message: string) => this.feedback(message)) })
            LearningAction({ label: '清空文本', secondary: true, actionEnabled: this.snapshot.canEdit,
              onTap: () => this.confirmClearText() })
          }
        }
        SceneWorkspaceBackup({ controller: this.controller })
        LearningCard({ title: '接续设置' }) {
          LearningAction({ label: this.toolsExpanded ? '收起设置' : '监听与运行环境', secondary: true,
            onTap: () => { this.toolsExpanded = !this.toolsExpanded; } })
          if (this.toolsExpanded) {
            LearningLine({ label: '启动', value: this.snapshot.launchReason })
            LearningLine({ label: '监听', value: this.snapshot.listenerState })
            LearningAction({ label: '注册监听 on', actionEnabled: this.snapshot.canRegister,
              onTap: () => this.invoke('on') })
            LearningAction({ label: '注销监听 off', actionEnabled: this.snapshot.canUnregister,
              secondary: true, onTap: () => this.invoke('off') })
            LearningAction({ label: '检查环境', secondary: true, onTap: () => this.invoke('environment') })
            if (this.snapshot.environment.length > 0) {
              LearningAction({ label: this.environmentExpanded ? '收起环境信息' : '查看环境信息', secondary: true,
                onTap: () => { this.environmentExpanded = !this.environmentExpanded; } })
              if (this.environmentExpanded) { LearningEnvironment({ items: this.snapshot.environment }) }
            }
            LearningAction({ label: '申请分布式权限', secondary: true, actionEnabled: this.controller !== undefined,
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
        this.pageTitle('诊断中心')
        LearningCard({ title: '最近结果' }) {
          if (this.snapshot.latestRecord !== undefined) {
            LearningLine({ label: '结果', value: this.snapshot.latestRecord.result })
            if (this.snapshot.latestRecord.errorCode.length > 0) {
              LearningLine({ label: '错误码', value: this.snapshot.latestRecord.errorCode })
            }
            LearningAction({
              label: '查看详情',
              secondary: true,
              onTap: () => this.open('pages/CallDetailPage',
                this.snapshot.latestRecord === undefined ? '' : this.snapshot.latestRecord.id)
            })
          } else {
            Text('暂无结果').fontSize(14).fontColor(LEARNING_MUTED).width('100%');
          }
        }
        LearningCard({ title: '操作记录', subtitle: `${this.snapshot.records.length} 条` }) {
          Row({ space: 6 }) {
            ForEach(['全部', '失败', '警告'], (filter: string) => {
              Button(filter, { type: ButtonType.Normal }).fontSize(14).height(44).layoutWeight(1).borderRadius(10)
                .fontColor(this.levelFilter === filter ? '#FFFFFF' : LEARNING_BLUE)
                .backgroundColor(this.levelFilter === filter ? LEARNING_BLUE : '#EEF4FF')
                .onClick(() => { this.levelFilter = filter; });
            }, (filter: string) => filter)
          }.width('100%');
          Row({ space: 6 }) {
            ForEach(['全部', 'ON', 'OFF', '系统'], (filter: string) => {
              Button(filter, { type: ButtonType.Normal }).fontSize(13).height(44).layoutWeight(1).borderRadius(10)
                .fontColor(this.operationFilter === filter ? '#FFFFFF' : LEARNING_BLUE)
                .backgroundColor(this.operationFilter === filter ? LEARNING_BLUE : '#EEF4FF')
                .onClick(() => { this.operationFilter = filter; });
            }, (filter: string) => filter)
          }.width('100%');
          if (this.filteredRecords().length === 0) {
            Text('暂无记录').fontSize(14).fontColor(LEARNING_MUTED).width('100%');
          } else {
            ForEach(this.filteredRecords(), (record: OperationRecord) => {
              LearningRecord({ record: record, onOpen: () => this.open('pages/CallDetailPage', record.id) })
            }, (record: OperationRecord) => record.id)
          }
          LearningAction({ label: '复制摘要', onTap: () => this.copySummary() })
          LearningAction({ label: '清空记录', secondary: true, onTap: () => this.confirmClearRecords() })
        }
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  @Builder
  private payloadPage() {
    Scroll() {
      Column({ space: 12 }) {
        LearningDisclosure({ title: '载荷协议', subtitle: this.payloadSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.payloadFieldLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        LearningDisclosure({ title: '准入规则', subtitle: this.readinessSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.readinessLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        LearningDisclosure({ title: '冲突策略', subtitle: this.conflictSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.conflictLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string) => line)
          }.width('100%')
        }
        Button('场景与校验', { type: ButtonType.Normal })
          .width('100%')
          .height(48)
          .fontSize(16)
          .fontColor('#1F6FEB')
          .backgroundColor('#EAF2FF')
          .borderRadius(12)
          .onClick(() => {
            router.pushUrl({ url: 'pages/ScenarioPage' }).catch(() => {});
          })
      }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 24 });
    }.width('100%').height('100%').scrollBar(BarState.Auto).align(Alignment.TopStart);
  }

  private payloadSummary(): string {
    const data: PayloadData = sealPayload(new PayloadData('learning-doc', 3));
    data.title = '学习记录';
    data.body = this.snapshot.text.slice(0, Math.min(this.snapshot.text.length, 256));
    data.cs = this.snapshot.selectionStart;
    data.ce = this.snapshot.selectionEnd;
    data.dev = 'local';
    data.app = '1.0.0';
    const encoded: string = encodePayload(data);
    const decoded = decodePayload(encoded);
    const size = sizeOf(data);
    const diff = diffPayloads(data, decoded.data === undefined ? new PayloadData() : decoded.data);
    return `v${PAYLOAD_VERSION}｜${size.text()}｜解码${decoded.ok() ? '成功' : '失败'}｜${diff.summary()}`;
  }

  private payloadFieldLines(): string[] {
    const lines: string[] = schemaVersionLines();
    PAYLOAD_FIELDS.forEach((field): void => {
      lines.push(field.describe());
    });
    const audit = auditPayloadSchema();
    lines.push(audit.summary());
    lines.push(`转义样例：${unescapeValue(escapeValue('a&b=c'))}`);
    lines.push(`载荷上限 ${PAYLOAD_LIMIT} 字符`);
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
    local.title = this.snapshot.conflictKind.length > 0 ? this.snapshot.conflictKind : '学习记录';
    const remote: PayloadData = new PayloadData('learning-doc', Math.max(0, this.snapshot.revision));
    remote.body = this.snapshot.restoredSummary;
    remote.title = '对端记录';
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
    const note: DocumentSlot = new DocumentSlot('note-1', DocKind.NOTE, '学习记录');
    note.revision = 3;
    note.ownerApp = 'app.continuation';
    workspace.open(note);
    const form: DocumentSlot = new DocumentSlot('form-1', DocKind.FORM, '报销单（半填）');
    form.revision = 1;
    form.ownerApp = 'app.continuation';
    workspace.open(form);
    const reading: DocumentSlot = new DocumentSlot('read-1', DocKind.READING, '接口文档阅读进度');
    reading.revision = 7;
    workspace.open(reading);
    const lines: string[] = workspaceLines(workspace);
    const reasons: string[] = checkIsolation(note, DocKind.NOTE, 'other.app', 1);
    reasons.forEach((reason: string): void => {
      lines.push(`隔离校验：${reason}`);
    });
    lines.push(`隔离规则 ${docLines().length} 条｜允许多份的类别 ${multiSlotKinds().length} 类`);
    return lines;
  }

  private demoFormSession(): FormSession {
    const session: FormSession = new FormSession('expense-1');
    const kind: FormField = new FormField('kind', '类型', true, 8);
    session.addField(kind);
    session.setValue('kind', '采购');
    const budget: FormField = new FormField('budget', '预算科目', true, 16);
    budget.visibleWhen = ['budget'];
    session.addField(budget);
    const remark: FormField = new FormField('remark', '备注', false, 60);
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
    lines.push(`可见字段 ${session.visibleFields().length}｜必填未完成 ${session.blockingFields().length}`);
    lines.push(`分支规则 ${branchLines().length} 条｜需明细但未满足 ${session.missingRows().length} 个`);
    branchLines().slice(0, 3).forEach((line: string): void => {
      lines.push(line);
    });
    return lines;
  }

  private demoTriples(): FieldTriple[] {
    const triples: FieldTriple[] = [];
    const title: FieldTriple = new FieldTriple('title', '标题');
    title.base = '学习记录';
    title.local = '学习记录（本地）';
    title.remote = '学习记录';
    triples.push(title);
    const body: FieldTriple = new FieldTriple('body', '正文');
    body.base = '第一版';
    body.local = '第一版';
    body.remote = '第二版';
    triples.push(body);
    const tags: FieldTriple = new FieldTriple('tags', '标签');
    tags.base = 'a,b';
    tags.local = 'a,b,本地';
    tags.remote = 'a,b,对端';
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
    lines.push(`目标页面缺失可执行动作 ${actionsOf(RecoveryCase.TARGET_MISSING).length} 个`);
    recoveryLines().slice(0, 5).forEach((line: string): void => {
      lines.push(line);
    });
    return lines;
  }

  @Builder
  private workspacePage() {
    Scroll() {
      Column({ space: 16 }) {
        this.pageTitle('文档工作区')
        LearningDisclosure({ title: '多文档隔离', subtitle: '笔记 / 表单 / 阅读进度各自独立' }) {
          Column({ space: 8 }) {
            ForEach(this.docWorkspaceLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `doc-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: '可中断表单', subtitle: this.demoFormSummary() }) {
          Column({ space: 8 }) {
            ForEach(this.demoFormLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `form-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: '字段级合并预览', subtitle: '三方取值逐字段确认' }) {
          Column({ space: 8 }) {
            ForEach(this.demoMergeLines(), (line: string) => {
              LearningLine({ label: line })
            }, (line: string, index: number) => `merge-${index}-${line}`)
          }.width('100%')
        }
        LearningDisclosure({ title: '恢复失败后的继续操作', subtitle: '写入不确定时先读回再决定' }) {
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
          LearningNotice({ title: '提示', message: this.noticeText() })
        }.width('100%').padding({ left: 20, right: 20, top: 8, bottom: 4 })
          .constraintSize({ maxHeight: '25%' }).scrollBar(BarState.Auto).align(Alignment.TopStart);
      }
      Tabs({ barPosition: BarPosition.End, index: this.activeTab }) {
        TabContent() { this.introductionPage() }.tabBar(this.tabLabel('介绍', 0))
        TabContent() { this.operationPage() }.tabBar(this.tabLabel('工作台', 1))
        TabContent() { this.diagnosisPage() }.tabBar(this.tabLabel('记录', 2))
        TabContent() { this.payloadPage() }.tabBar(this.tabLabel('协议', 3))
        TabContent() { this.workspacePage() }.tabBar(this.tabLabel('示例', 4))
      }
      .layoutWeight(1).width('100%').barHeight(60).barMode(BarMode.Fixed)
      .onChange((index: number) => {
        this.activeTab = index;
        if (index === 1) { this.scheduleSelection(); }
      });
    }.width('100%').height('100%').backgroundColor(LEARNING_BG);
  }
}
