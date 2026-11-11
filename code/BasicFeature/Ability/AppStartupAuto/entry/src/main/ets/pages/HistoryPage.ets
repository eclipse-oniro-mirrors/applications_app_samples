import { pasteboard } from '@kit.BasicServicesKit';
import { StartupArchivePanel } from '../components/StartupArchivePanel';
import { promptAction, router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { QueryRecord } from '../autostart/AutoStartupTypes';
import { HistoryComparison, HistorySummary } from '../autostart/AutoStartupHistory';
import {
  HistoryFilter, RANGE_OPTIONS, RangeOption, RangePreset, OUTCOME_OPTIONS, OutcomeOption,
  SOURCE_OPTIONS, SourceOption, TimeRange, comparisonLines, dayCountLines, exportPreview,
  HistoryScope, describeRecord, detailLines, rangeOf, recordLines, summaryLines, validRange
} from '../autostart/history/HistoryView';

@Entry
@Component
struct HistoryPage {
  @State private filter: HistoryFilter = new HistoryFilter();
  @State private recordText: string[] = [];
  @State private summaryText: string[] = [];
  @State private comparisonText: string[] = [];
  @State private dayText: string[] = [];
  @State private exportText: string[] = [];
  @State private notice: string = '';
  @State private rangeText: string = '全部时间';
  private unsubscribe: (() => void) | undefined = undefined;
  private lastExport: string = '';
  private scope: HistoryScope = new HistoryScope();
  @State private records: QueryRecord[] = [];
  @State private selectedBefore: number = 0;
  @State private selectedAfter: number = 0;
  @State private selectedDetail: number = 0;
  @State private details: string[] = [];
  @State private latestText: string = '';
  @State private storageNotice: string = '';
  @State private showFilters: boolean = false;
  @State private showHistoryTools: boolean = false;
  @State private showAnalysis: boolean = false;
  @State private showArchive: boolean = false;

  aboutToAppear(): void {
    this.unsubscribe = autoStartupService.subscribe((): void => {
      this.refresh();
    });
    this.refresh();
  }

  aboutToDisappear(): void {
    const unsubscribe: (() => void) | undefined = this.unsubscribe;
    if (unsubscribe !== undefined) {
      unsubscribe();
      this.unsubscribe = undefined;
    }
  }

  private refresh(): void {
    this.scope = autoStartupService.historyScope(this.filter, this.selectedBefore, this.selectedAfter);
    this.rangeText = rangeOf(this.filter.preset, this.scope.generatedAt).text();
    this.records = this.scope.records;
    this.recordText = recordLines(this.records);
    this.summaryText = summaryLines(this.scope.summary);
    this.comparisonText = this.scope.comparisonText;
    this.dayText = dayCountLines(this.records);
    this.latestText = this.scope.latestValid === undefined ? '当前范围无有效成功样本' :
      `当前范围最近有效：${describeRecord(this.scope.latestValid)}`;
    this.details = detailLines(this.records.find((row: QueryRecord): boolean => row.id === this.selectedDetail));
    this.storageNotice = autoStartupService.historyNotice();
    this.exportText = exportPreview(this.lastExport);
  }

  private chooseOutcome(value: string): void {
    this.filter.outcome = value;
    this.notice = `结果筛选：${this.filter.text()}`;
    this.refresh();
  }

  private chooseSource(value: string): void {
    this.filter.source = value;
    this.notice = `来源筛选：${this.filter.text()}`;
    this.refresh();
  }

  private chooseRange(preset: RangePreset): void {
    this.filter.preset = preset;
    this.notice = `时间范围：${this.filter.text()}`;
    this.refresh();
  }

  private resetFilter(): void {
    this.filter.reset();
    this.selectedBefore = 0;
    this.selectedAfter = 0;
    this.selectedDetail = 0;
    this.notice = '筛选和比较选择已重置';
    this.refresh();
  }

  private exportHistory(all: boolean = false): void {
    const text: string = all ? autoStartupService.exportHistory() : this.scope.exportText;
    if (!all && this.records.length === 0) {
      this.notice = '当前范围为空，没有可导出的记录；全量导出有独立入口';
      return;
    }
    this.lastExport = `${all ? '全量历史' : '当前筛选范围'}\n${text}`;
    this.exportText = exportPreview(this.lastExport);
    try {
      const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, this.lastExport);
      pasteboard.getSystemPasteboard().setData(data).then((): void => {
        this.notice = `${all ? '全量' : '当前范围'}脱敏历史已复制`;
      }).catch((): void => { this.notice = '复制失败，请点击同一导出按钮重试；存储未改变'; });
    } catch (_) { this.notice = '复制失败，请点击同一导出按钮重试；存储未改变'; }
  }

  private confirmClear(): void {
    this.getUIContext().showAlertDialog({
      title: '清空历史记录',
      message: '清空已保存的查询历史？该操作只影响本应用的历史记录。',
      primaryButton: { value: '取消', action: (): void => {} },
      secondaryButton: {
        value: '清空',
        action: (): void => {
          autoStartupService.clearRecords();
          this.lastExport = '';
          this.notice = '已请求清空；写入失败时页面会保留提示';
          this.refresh();
        }
      }
    });
  }

  private retryPersistence(): void {
    autoStartupService.retryPersistence();
    this.notice = '已请求重试保存';
    this.refresh();
  }

  private retryRead(): void {
    autoStartupService.retryHistoryRead();
    this.notice = '已请求重新读取历史';
    this.refresh();
  }

  @Builder
  private chip(label: string, active: boolean, onTap: () => void) {
    Button(label, { type: ButtonType.Normal })
      .height(44)
      .fontSize(12)
      .fontColor(active ? Color.White : $r('app.color.accent_color'))
      .backgroundColor(active ? $r('app.color.accent_color') : $r('app.color.accent_soft'))
      .borderRadius(9)
      .padding({ left: 12, right: 12 })
      .margin({ right: 8, bottom: 8 })
      .onClick(onTap)
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 8 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary')).width('100%')
      ForEach(lines, (line: string) => {
        Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
      }, (line: string) => line)
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button('‹ 返回', { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick((): void => { router.back(); })
        Text('查询历史').fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary')).width('100%')
        Text(`${this.records.length} 条记录 · ${this.filter.text()}`)
          .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
        Row({ space: 12 }) {
          Button(this.showFilters ? '收起筛选 −' : '筛选 +', { type: ButtonType.Normal })
            .layoutWeight(1).height(44).fontSize(14).fontColor($r('app.color.accent_color'))
            .backgroundColor($r('app.color.card_background')).borderRadius(12)
            .onClick(() => { this.showFilters = !this.showFilters; })
          Button('导出当前范围', { type: ButtonType.Normal }).layoutWeight(1).height(44).fontSize(14)
            .fontColor(Color.White).backgroundColor($r('app.color.accent_color')).borderRadius(12)
            .onClick((): void => this.exportHistory())
        }.width('100%')
        if (this.showFilters) {
          Column({ space: 8 }) {
            Text('结果').fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(OUTCOME_OPTIONS, (option: OutcomeOption) => {
                this.chip(option.label, this.filter.outcome === option.value, (): void => {
                  this.chooseOutcome(option.value);
                })
              }, (option: OutcomeOption) => `outcome-${option.value}`)
            }.width('100%')
            Text('来源').fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(SOURCE_OPTIONS, (option: SourceOption) => {
                this.chip(option.label, this.filter.source === option.value, (): void => {
                  this.chooseSource(option.value);
                })
              }, (option: SourceOption) => `source-${option.value}`)
            }.width('100%')
            Text('时间').fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Flex({ wrap: FlexWrap.Wrap }) {
              ForEach(RANGE_OPTIONS, (option: RangeOption) => {
                this.chip(option.label, this.filter.preset === option.preset, (): void => {
                  this.chooseRange(option.preset);
                })
              }, (option: RangeOption) => `range-${option.preset}`)
            }.width('100%')
            Button('重置筛选').height(44).fontSize(14).onClick((): void => this.resetFilter())
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
        }
        if (this.storageNotice.length > 0) {
          Text(this.storageNotice).fontSize(14).fontColor($r('app.color.error_color')).width('100%')
        }
        if (this.notice.length > 0) {
          Text(this.notice).fontSize(14).fontColor($r('app.color.accent_color')).width('100%')
        }
        Button(this.showHistoryTools ? '收起存储操作 −' : '存储与更多操作 +', { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showHistoryTools = !this.showHistoryTools; })
        if (this.showHistoryTools || this.storageNotice.length > 0) {
          Column({ space: 12 }) {
            Row({ space: 12 }) {
              Button('重试读取').layoutWeight(1).height(44).fontSize(14).onClick((): void => this.retryRead())
              Button('重试保存').layoutWeight(1).height(44).fontSize(14).onClick((): void => this.retryPersistence())
            }.width('100%')
            Button('全量脱敏导出（忽略筛选）').height(44).fontSize(14).onClick((): void => this.exportHistory(true))
            Button('清空').height(44).fontSize(14).fontColor($r('app.color.error_color'))
              .onClick((): void => this.confirmClear())
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }
        Button(this.showArchive ? '收起已保存归档 −' : '已保存归档 +', { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showArchive = !this.showArchive; })
        if (this.showArchive) { StartupArchivePanel({ liveRecords: this.records }) }
        Text(this.latestText).fontSize(13).fontColor($r('app.color.text_secondary')).width('100%')
        if (this.records.length === 0) { this.card('记录', this.recordText) }
        ForEach(this.records, (record: QueryRecord) => {
          Column({ space: 12 }) {
            Text(describeRecord(record)).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
            Row({ space: 8 }) {
              Button(this.selectedBefore === record.id ? '已选为前' : '选为前').height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedBefore = record.id; this.refresh(); })
              Button(this.selectedAfter === record.id ? '已选为后' : '选为后').height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedAfter = record.id; this.refresh(); })
              Button('详情').height(44).fontSize(13).layoutWeight(1)
                .onClick((): void => { this.selectedDetail = record.id; this.refresh(); })
            }.width('100%')
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }, (record: QueryRecord): string => String(record.id))
        if (this.selectedDetail > 0) { this.card('当前范围记录详情（本机）', this.details) }
        if (this.selectedBefore > 0 || this.selectedAfter > 0) { this.card('当前范围前后比较', this.comparisonText) }
        Button(this.showAnalysis ? '收起统计与预览 −' : '统计、比较与导出预览 +', { type: ButtonType.Normal })
          .height(44).width('100%').fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showAnalysis = !this.showAnalysis; })
        if (this.showAnalysis) {
          this.card('当前范围汇总', this.summaryText)
          if (this.selectedBefore === 0 && this.selectedAfter === 0) { this.card('当前范围前后比较', this.comparisonText) }
          this.card('按日期分布', this.dayText)
          this.card('导出预览', this.exportText)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor($r('app.color.page_background')).scrollBar(BarState.Auto)
  }
}
