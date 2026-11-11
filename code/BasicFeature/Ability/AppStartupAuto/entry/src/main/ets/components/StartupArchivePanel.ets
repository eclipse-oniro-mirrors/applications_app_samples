import { pasteboard } from '@kit.BasicServicesKit';
import { QueryOutcome, QueryRecord, RefreshSource } from '../autostart/AutoStartupTypes';
import { detailLines, describeRecord } from '../autostart/history/HistoryView';
import {
  ArchiveAction, ArchiveCleanup, ArchiveClipboardPort, ArchiveQuery, ArchivedQuery,
  ArchiveSnapshot, ArchiveStage, ArchiveView, StartupArchiveRepository, startupArchiveRepository
} from '../autostart/archive/StartupArchive';

export class SystemArchiveClipboard implements ArchiveClipboardPort {
  async writeText(text: string): Promise<void> {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    await pasteboard.getSystemPasteboard().setData(data);
  }
}

/** The production history page and isolated test pages embed this same component. */
@Component
export struct StartupArchivePanel {
  repository: StartupArchiveRepository = startupArchiveRepository;
  clipboard: ArchiveClipboardPort = new SystemArchiveClipboard();
  @Prop liveRecords: QueryRecord[] = [];
  @State private state: ArchiveSnapshot = new ArchiveSnapshot();
  @State private viewState: ArchiveView = new ArchiveView();
  @State private query: ArchiveQuery = new ArchiveQuery();
  @State private selectedId: number = 0;
  @State private details: string = '请选择已保存归档查看详情';
  @State private confirmation: string = '';
  @State private actionNotice: string = '';
  @State private working: boolean = false;
  @State private showInformation: boolean = false;
  private unsubscribe: (() => void) | undefined = undefined;
  private generation: number = 0;
  private operation: number = 0;
  private confirmationRevision: number = 0;
  private automaticTarget: boolean = false;
  private cleanup: ArchiveCleanup = new ArchiveCleanup();

  aboutToAppear(): void {
    this.generation++; this.working = false; this.confirmation = ''; this.actionNotice = '';
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) { unsubscribe(); }
    this.unsubscribe = this.repository.subscribe((): void => this.refresh());
    this.refresh();
  }

  aboutToDisappear(): void {
    this.generation++; this.operation++;
    const unsubscribe = this.unsubscribe;
    if (unsubscribe !== undefined) { unsubscribe(); this.unsubscribe = undefined; }
  }

  private refresh(): void {
    this.state = this.repository.snapshot();
    this.viewState = this.repository.view(this.query);
    const selected = this.state.rows.find((row: ArchivedQuery): boolean => row.archiveId === this.selectedId);
    const inRange = selected !== undefined && this.repository.view(this.query).rows.some(
      (row: ArchivedQuery): boolean => row.archiveId === this.selectedId);
    this.details = selected === undefined || !inRange ? '请选择已保存归档查看详情' :
      `归档 #${selected.archiveId}｜原查询 #${selected.record.id}\n` +
      detailLines(selected.viewRecord()).join('\n') + '\n长期归档不保存原始错误说明；不证明实际开机拉起。';
  }

  private run(request: Promise<ArchiveAction>): void {
    const generation = this.generation; const operation = ++this.operation;
    this.working = true; this.confirmation = ''; this.actionNotice = '正在处理，尚未确认保存';
    request.then((result: ArchiveAction): void => {
      if (generation !== this.generation || operation !== this.operation) { return; }
      this.working = false; this.actionNotice = result.message; this.refresh();
    }).catch((): void => {
      if (generation !== this.generation || operation !== this.operation) { return; }
      this.working = false; this.actionNotice = '操作未完成，请重试；未确认成功'; this.refresh();
    });
  }

  private chooseSource(value: string): void {
    this.operation++; this.working = false; this.query.source = value; this.query.page = 0;
    this.query = this.query.clone(); this.actionNotice = '来源筛选已更新'; this.confirmation = ''; this.refresh();
  }

  private chooseOutcome(value: string): void {
    this.operation++; this.working = false; this.query.outcome = value; this.query.page = 0;
    this.query = this.query.clone(); this.actionNotice = '结果筛选已更新'; this.confirmation = ''; this.refresh();
  }

  private ask(kind: string): void {
    this.confirmationRevision = this.state.revision; this.confirmation = kind;
    if (kind === 'auto') { this.automaticTarget = !this.state.automatic; }
    if (kind === 'clean') {
      this.cleanup = this.repository.previewCleanup(); this.actionNotice = this.cleanup.preview.text();
    } else if (kind === 'clear') {
      this.actionNotice = `确认清空 ${this.state.rows.length} 条已保存归档？live历史不受影响。`;
    } else {
      this.actionNotice = this.state.automatic ? '确认停用后续新查询的自动归档？已保存证据不删除。' :
        '确认启用自动归档，并保存当前范围？仅保留实际查询证据，不保存原始错误说明。';
    }
  }

  private confirmAutomatic(): void {
    this.run(this.repository.setAutomatic(this.automaticTarget, this.liveRecords));
  }

  @Builder
  private filterButton(label: string, id: string, active: boolean, onTap: () => void) {
    Button(label, { type: ButtonType.Normal }).id(id).height(44).fontSize(13)
      .fontColor(active ? Color.White : $r('app.color.accent_color'))
      .backgroundColor(active ? $r('app.color.accent_color') : $r('app.color.accent_soft'))
      .borderRadius(10).padding({ left: 12, right: 12 }).margin({ right: 8, bottom: 8 })
      .onClick(onTap)
  }

  @Builder
  private filters() {
    TextInput({ text: this.query.needle, placeholder: '#归档编号或精确错误码' })
      .id('archive-search').maxLength(64)
      .onChange((text: string): void => {
        this.operation++; this.working = false; this.query.needle = text; this.query.page = 0;
        this.query = this.query.clone(); this.confirmation = ''; this.actionNotice = '检索条件已更新'; this.refresh();
      })
    TextInput({ text: this.query.day, placeholder: '日期 yyyy-MM-dd（空表示不限）' })
      .id('archive-day').maxLength(10)
      .onChange((text: string): void => {
        this.operation++; this.working = false; this.confirmation = ''; this.actionNotice = '日期筛选已更新';
        this.query.day = text; this.query.page = 0; this.query = this.query.clone(); this.refresh();
      })
    Flex({ wrap: FlexWrap.Wrap }) {
      this.filterButton('全部来源', 'archive-source-all', this.query.source === '', (): void => this.chooseSource(''))
      this.filterButton('手动', 'archive-source-manual', this.query.source === RefreshSource.MANUAL,
        (): void => this.chooseSource(RefreshSource.MANUAL))
      this.filterButton('设置后', 'archive-source-settings', this.query.source === RefreshSource.SETTINGS,
        (): void => this.chooseSource(RefreshSource.SETTINGS))
      this.filterButton('首次', 'archive-source-initial', this.query.source === RefreshSource.INITIAL,
        (): void => this.chooseSource(RefreshSource.INITIAL))
      this.filterButton('前台', 'archive-source-foreground', this.query.source === RefreshSource.FOREGROUND,
        (): void => this.chooseSource(RefreshSource.FOREGROUND))
    }.width('100%')
    Flex({ wrap: FlexWrap.Wrap }) {
      this.filterButton('全部结果', 'archive-outcome-all', this.query.outcome === '', (): void => this.chooseOutcome(''))
      this.filterButton('成功', 'archive-outcome-success', this.query.outcome === QueryOutcome.SUCCESS,
        (): void => this.chooseOutcome(QueryOutcome.SUCCESS))
      this.filterButton('失败', 'archive-outcome-failure', this.query.outcome === QueryOutcome.FAILURE,
        (): void => this.chooseOutcome(QueryOutcome.FAILURE))
      this.filterButton('不支持', 'archive-outcome-unsupported', this.query.outcome === QueryOutcome.UNSUPPORTED,
        (): void => this.chooseOutcome(QueryOutcome.UNSUPPORTED))
      this.filterButton('超时', 'archive-outcome-timeout', this.query.outcome === QueryOutcome.TIMEOUT,
        (): void => this.chooseOutcome(QueryOutcome.TIMEOUT))
      this.filterButton('未知', 'archive-outcome-unknown', this.query.outcome === QueryOutcome.UNKNOWN,
        (): void => this.chooseOutcome(QueryOutcome.UNKNOWN))
    }.width('100%')
  }

  build() {
    Column({ space: 12 }) {
      Text('本机查询证据归档').fontSize(18).fontColor($r('app.color.text_primary')).fontWeight(FontWeight.Bold)
      Button(this.showInformation ? '收起保存与隐私说明 −' : '保存与隐私说明 +', { type: ButtonType.Normal })
        .height(44).fontSize(13).fontColor($r('app.color.text_secondary')).backgroundColor(Color.Transparent).padding(0)
        .onClick(() => { this.showInformation = !this.showInformation; })
      if (this.showInformation) {
        Text('已保存证据不随live最近20条裁剪；不保存原始错误说明，不证明实际开机拉起。')
          .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      }
      Text(`状态 ${this.state.stage}｜自动 ${this.state.automatic ? '启用' : '关闭'}｜` +
        `待保存 ${this.state.pending}｜${this.state.paused ? '暂停' : '可处理'}`)
        .id('archive-status').fontSize(12).width('100%')
      Text(`已保存 ${this.state.rows.length} 条｜当前范围 ${this.viewState.matchedTotal} 条｜${this.state.bytes}/1048576 字节`)
        .id('archive-count').fontSize(12).width('100%')
      Text(this.actionNotice || this.viewState.notice || this.state.notice)
        .id('archive-notice').fontSize(12).width('100%').fontColor($r('app.color.warning_color'))
      if (this.state.pending > 0) {
        Text('待保存项尚未确认落盘；存储故障或容量满时自动采集会暂停，后续查询仍只有live最近20条。')
          .fontSize(12).width('100%')
      }
      Column({ space: 8 }) {
        Button('保存当前范围到归档').id('archive-save').fontColor(Color.White)
          .backgroundColor($r('app.color.accent_color')).width('100%')
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.liveRecords.length > 0)
          .onClick((): void => this.run(this.repository.save(this.liveRecords)))
        Button(this.state.automatic ? '停用自动归档' : '启用自动归档').id('archive-auto')
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .width('100%').constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working).onClick((): void => this.ask('auto'))
        if (this.confirmation === 'auto') {
          Button('确认自动归档设置').id('archive-auto-confirm').constraintSize({ minHeight: 44 }).fontSize(14)
            .enabled(!this.working)
            .onClick((): void => this.confirmAutomatic())
          Button('取消').id('archive-cancel').constraintSize({ minHeight: 44 }).fontSize(14)
            .onClick((): void => {
              this.confirmation = '';
              this.actionNotice = '已取消，归档未改变';
            })
        }
      }.width('100%')
      Row({ space: 6 }) {
        Button('重试读取/保存').id('archive-retry').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => {
            if (this.state.stage === ArchiveStage.BLOCKED || this.state.stage === ArchiveStage.DETACHED) {
              const generation = this.generation;
              this.repository.reload().then((): void => {
                if (generation === this.generation) { this.run(this.repository.retryPending()); }
              });
            } else { this.run(this.repository.retryPending()); }
          })
        Button('复制脱敏归档').id('archive-copy').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.viewState.matchedTotal > 0)
          .onClick((): void => this.run(this.repository.copy(this.query, this.clipboard)))
      }.width('100%')
      Row({ space: 6 }) {
        Button('清理预览').id('archive-clean-preview').layoutWeight(1)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14).enabled(this.state.canWrite && !this.working)
          .onClick((): void => this.ask('clean'))
        Button('清空归档').id('archive-clear').layoutWeight(1)
          .fontColor($r('app.color.error_color')).backgroundColor($r('app.color.error_soft'))
          .constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.state.canWrite && !this.working && this.state.rows.length > 0)
          .onClick((): void => this.ask('clear'))
      }
      if (this.confirmation === 'clean') {
        Button('确认清理').id('archive-clean-confirm').constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => this.run(this.repository.applyCleanup(this.cleanup)))
      }
      if (this.confirmation === 'clear') {
        Button('确认清空').id('archive-clear-confirm').constraintSize({ minHeight: 44 }).fontSize(14).enabled(!this.working)
          .onClick((): void => this.run(this.repository.clear(this.confirmationRevision)))
      }
      if (this.confirmation.length > 0 && this.confirmation !== 'auto') {
        Button('取消').id('archive-cancel').constraintSize({ minHeight: 44 }).fontSize(14)
          .onClick((): void => {
            this.confirmation = '';
            this.actionNotice = '已取消，归档未改变';
          })
      }
      this.filters()
      Text(this.viewState.summary).id('archive-summary').fontSize(12).width('100%')
      if (this.viewState.matchedTotal === 0) {
        Text('当前范围没有已保存归档').id('archive-empty').fontSize(13)
      }
      ForEach(this.viewState.rows, (row: ArchivedQuery) => {
        Button(`#${row.archiveId}｜原查询 #${row.record.id}｜${describeRecord(row.viewRecord())}`)
          .id(`archive-row-${row.archiveId}`).constraintSize({ minHeight: 44 }).fontSize(14)
          .fontColor($r('app.color.text_primary')).backgroundColor($r('app.color.muted_background')).width('100%')
          .onClick((): void => { this.selectedId = row.archiveId; this.refresh(); })
      }, (row: ArchivedQuery): string => String(row.archiveId))
      Row({ space: 10 }) {
        Button('上一页').id('archive-prev').constraintSize({ minHeight: 44 }).fontSize(14).enabled(this.viewState.page > 0)
          .onClick((): void => {
            this.query.page = this.viewState.page - 1;
            this.query = this.query.clone();
            this.refresh();
          })
        Text(`${this.viewState.page + 1}/${this.viewState.pageCount}`).id('archive-page')
        Button('下一页').id('archive-next').constraintSize({ minHeight: 44 }).fontSize(14)
          .enabled(this.viewState.page + 1 < this.viewState.pageCount)
          .onClick((): void => {
            this.query.page = this.viewState.page + 1;
            this.query = this.query.clone();
            this.refresh();
          })
      }
      Text(this.details).id('archive-details').fontSize(12).width('100%')
      Text('按日期分布').fontSize(14)
      ForEach(this.viewState.dayLines, (line: string) => {
        Text(line).fontSize(12).width('100%')
      }, (line: string): string => line)
    }.id('archive-panel').width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
  }
}
