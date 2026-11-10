import { promptAction, router } from '@kit.ArkUI';
import { deviceInfo, pasteboard } from '@kit.BasicServicesKit';
import { autoStartupService } from '../autostart/AutoStartupService';
import { QueryPhase, QueryRecord, QuerySnapshot, RefreshSource } from '../autostart/AutoStartupTypes';
import { CapabilityQuery, DeviceForm, SystemFlavor } from '../autostart/rules/CapabilityMatrix';
import { GuidanceEntry, guidanceCaption, selectGuidance, stepTexts } from '../autostart/revisit/GuidanceCatalog';
import { ApiCallDetails } from '../components/ApiCallDetails';
import { formatQueryTime, statusLabel, supportLabel } from '../components/QueryPresentation';
import { QueryRecordsSheet } from '../components/QueryRecordsSheet';

@Entry
@Component
struct Index {
  @State private query: QuerySnapshot = new QuerySnapshot();
  @State private queryRecords: QueryRecord[] = [];
  @State private showRecords: boolean = false;
  @State private showCallDetails: boolean = false;
  @State private showGuidanceSteps: boolean = false;
  @State private historyFilter: string = '全部';
  @State private historyNotice: string = '';
  @State private historySummary: string = '';
  @State private guidanceTitle: string = '';
  @State private guidanceCaption: string = '';
  @State private guidanceSteps: string[] = [];
  private unsubscribe: () => void = () => {};

  aboutToAppear(): void {
    this.unsubscribe();
    this.unsubscribe = autoStartupService.subscribe(() => this.syncState());
    this.syncState();
    autoStartupService.refresh(RefreshSource.INITIAL);
  }

  aboutToDisappear(): void {
    this.unsubscribe();
    this.unsubscribe = () => {};
  }

  onPageShow(): void {
    this.syncState();
  }

  private syncState(): void {
    this.query = autoStartupService.snapshot();
    this.queryRecords = autoStartupService.records(this.historyFilter);
    this.historyNotice = autoStartupService.historyNotice();
    this.refreshHistorySummary();
    this.refreshGuidance();
  }

  /**
   * 设备上下文不代替系统返回；发行版、权限和设置入口没有运行时证据，不假定可用。
   */
  private refreshGuidance(): void {
    let form: DeviceForm = DeviceForm.UNKNOWN;
    if (deviceInfo.deviceType === 'phone') {
      form = DeviceForm.PHONE;
    } else if (deviceInfo.deviceType === 'tablet') {
      form = DeviceForm.TABLET;
    } else if (deviceInfo.deviceType === 'tv') {
      form = DeviceForm.TV;
    } else if (deviceInfo.deviceType === 'wearable') {
      form = DeviceForm.WEARABLE;
    }
    const query: CapabilityQuery = new CapabilityQuery(deviceInfo.sdkApiVersion, form,
      SystemFlavor.UNKNOWN, false, false);
    const entry: GuidanceEntry = selectGuidance(query);
    this.guidanceTitle = entry.title;
    this.guidanceCaption = guidanceCaption(entry);
    this.guidanceSteps = stepTexts(entry);
  }

  private refreshHistorySummary(): void {
    const summary = autoStartupService.historySummary();
    this.historySummary = summary.total === 0 ? '暂无历史记录' :
      `共 ${summary.total} 条 · 成功 ${summary.success} · 失败 ${summary.failure} · ` +
      `不支持 ${summary.unsupported} · 超时 ${summary.timeout} · 未知 ${summary.unknown}` +
      (summary.latestValidId >= 0 ? ` · 最近有效 #${summary.latestValidId}` : ' · 无有效样本') +
      (summary.expiringSoon > 0 ? ` · ${summary.expiringSoon} 条将过期` : '');
  }

  private changeFilter(filter: string): void {
    this.historyFilter = filter;
    autoStartupService.setHistoryFilter(filter);
    this.syncState();
  }

  private exportHistory(): void {
    const text: string = autoStartupService.exportHistory();
    try {
      pasteboard.getSystemPasteboard().setData(pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text))
        .then(() => {
          promptAction.showToast({ message: '脱敏历史已复制' });
        })
        .catch(() => {
          promptAction.showToast({ message: '复制失败，请重试' });
        });
    } catch (_) {
      this.historyNotice = this.historyNotice.length > 0 ? `${this.historyNotice}；复制失败，请重试` : '复制失败，请重试';
    }
  }

  private statusColor(): Resource {
    switch (this.query.phase) {
      case QueryPhase.SUCCEEDED:
        return this.query.value === true ? $r('app.color.success_color') : $r('app.color.text_primary');
      case QueryPhase.FAILED:
      case QueryPhase.TIMEOUT:
        return $r('app.color.error_color');
      case QueryPhase.UNSUPPORTED:
        return $r('app.color.text_secondary');
      default:
        return $r('app.color.accent_color');
    }
  }

  private refreshLabel(): string {
    if (this.query.pending) {
      return this.query.phase === QueryPhase.TIMEOUT ? '等待系统响应' : '正在查询';
    }
    switch (this.query.phase) {
      case QueryPhase.FAILED:
      case QueryPhase.TIMEOUT:
        return '重试';
      case QueryPhase.UNSUPPORTED:
        return '重新检测';
      default:
        return '刷新状态';
    }
  }

  private showLastResult(): boolean {
    return this.query.lastValue !== null &&
      (this.query.phase === QueryPhase.FAILED || this.query.phase === QueryPhase.TIMEOUT);
  }

  private lastQueryTime(): string {
    const timestamp: number = this.queryRecords.length > 0 ? this.queryRecords[0].timestamp :
      (this.query.sampleTime > 0 ? this.query.sampleTime : this.query.lastSampleTime);
    return formatQueryTime(timestamp);
  }

  @Builder
  private statusCard() {
    Column({ space: 18 }) {
      Text('自启状态')
        .fontSize(16)
        .fontColor($r('app.color.text_secondary'))
      Text(statusLabel(this.query))
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor(this.statusColor())
        .width('100%')

      if (this.query.pending) {
        LoadingProgress()
          .width(28)
          .height(28)
          .color($r('app.color.accent_color'))
      }
      if (this.query.phase === QueryPhase.TIMEOUT && this.query.pending) {
        Text('系统响应等待中')
          .fontSize(16)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }

      Divider().color($r('app.color.line_color'))
      Column({ space: 8 }) {
        if (this.query.phase !== QueryPhase.UNSUPPORTED) {
          Text(`设备支持：${supportLabel(this.query.support)}`)
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        Text(`最近查询：${this.lastQueryTime()}`)
          .fontSize(16)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        if (this.showLastResult()) {
          Text(`上次查询：${this.query.lastValue === true ? '已开启' : '未开启'} ` +
            formatQueryTime(this.query.lastSampleTime))
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }

  @Builder
  private actionButtons() {
    Button(this.refreshLabel(), { type: ButtonType.Normal })
      .fontSize(16).fontWeight(FontWeight.Medium).fontColor(Color.White)
      .width('100%').height(48).backgroundColor($r('app.color.accent_color')).borderRadius(12)
      .enabled(!this.query.pending).opacity(this.query.pending ? 0.6 : 1)
      .onClick(() => autoStartupService.refresh(RefreshSource.MANUAL))
  }

  @Builder
  private toolsCard() {
    Row({ space: 12 }) {
      Button('诊断报告', { type: ButtonType.Normal })
        .fontSize(14).fontColor($r('app.color.text_secondary'))
        .layoutWeight(1).height(44).backgroundColor($r('app.color.card_background')).borderRadius(12)
        .onClick(() => { router.pushUrl({ url: 'pages/DiagnosticPage' }).catch(() => {}); })
      Button('故障与归档', { type: ButtonType.Normal })
        .fontSize(14).fontColor($r('app.color.text_secondary'))
        .layoutWeight(1).height(44).backgroundColor($r('app.color.card_background')).borderRadius(12)
        .onClick(() => { router.pushUrl({ url: 'pages/FaultPage' }).catch(() => {}); })
    }.width('100%')
  }

  @Builder
  private guidanceCard() {
    Column({ space: 8 }) {
      Row({ space: 12 }) {
        Column({ space: 4 }) {
          Text('需要调整设置？').fontSize(16).fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary')).width('100%')
          Text('按指引手动设置，返回后回查').fontSize(13)
            .fontColor($r('app.color.text_secondary')).width('100%')
        }.layoutWeight(1).alignItems(HorizontalAlign.Start)
        Button('如何设置', { type: ButtonType.Normal })
          .fontSize(14).height(44).fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft')).borderRadius(12)
          .onClick(() => { router.pushUrl({ url: 'pages/GuidancePage' }).catch(() => {}); })
      }.width('100%')
      Button(this.showGuidanceSteps ? '收起设备指引 −' : '设备指引 +', { type: ButtonType.Normal })
        .height(44).fontSize(13).fontColor($r('app.color.text_secondary'))
        .backgroundColor(Color.Transparent).constraintSize({ minHeight: 44 }).padding(0)
        .onClick(() => { this.showGuidanceSteps = !this.showGuidanceSteps; })
      if (this.showGuidanceSteps) {
        Text(this.guidanceTitle).fontSize(14).fontColor($r('app.color.text_primary')).width('100%')
        if (this.guidanceCaption.length > 0) {
          Text(this.guidanceCaption).fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
        }
        ForEach(this.guidanceSteps, (step: string) => {
          Text(step).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        }, (step: string): string => step)
      }
    }.width('100%').padding(16).backgroundColor($r('app.color.card_background'))
      .borderRadius(16).alignItems(HorizontalAlign.Start)
  }

  @Builder
  private callDetailsCard() {
    Column({ space: 18 }) {
      Button({ type: ButtonType.Normal }) {
        Text(this.showCallDetails ? '调用详情 −' : '调用详情 +')
          .fontSize(17)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }
      .width('100%')
      .constraintSize({ minHeight: 44 }).padding(0)
      .backgroundColor($r('app.color.card_background'))
      .borderRadius(12)
      .onClick(() => this.showCallDetails = !this.showCallDetails)

      if (this.showCallDetails) {
        Divider().color($r('app.color.line_color'))
        ApiCallDetails({
          supportResult: this.query.supportResult,
          statusResult: this.query.statusResult,
          errorCode: this.query.errorCode,
          errorMessage: this.query.errorMessage
        })
      }
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }

  @Builder
  private recordSheet() {
    QueryRecordsSheet({
      records: this.queryRecords,
      filter: this.historyFilter,
      notice: this.historyNotice,
      summary: this.historySummary,
      onFilter: (filter: string): void => this.changeFilter(filter),
      onExport: (): void => this.exportHistory(),
      onClear: () => autoStartupService.clearRecords(),
      onClose: () => this.showRecords = false
    })
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Column({ space: 10 }) {
          Text('开机自启')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text('查看状态，按需手动设置')
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        this.statusCard()
        this.actionButtons()
        this.guidanceCard()

        Button({ type: ButtonType.Normal }) {
          Text(`查询记录 · ${this.queryRecords.length}条`)
            .fontSize(16)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
        }
        .width('100%')
        .constraintSize({ minHeight: 52 })
        .padding(16)
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
        .onClick(() => this.showRecords = true)

        Button({ type: ButtonType.Normal }) {
          Text('历史管理 · 筛选 / 比较 / 导出')
            .fontSize(16)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .constraintSize({ minHeight: 52 })
        .padding(16)
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
        .onClick(() => {
          router.pushUrl({ url: 'pages/HistoryPage' }).catch(() => {});
        })
        this.toolsCard()
        this.callDetailsCard()
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 20, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Auto)
    .bindSheet($$this.showRecords, this.recordSheet(), {
      height: SheetSize.LARGE,
      dragBar: true,
      showClose: false,
      backgroundColor: $r('app.color.page_background'),
      onDisappear: () => this.showRecords = false
    })
  }
}
