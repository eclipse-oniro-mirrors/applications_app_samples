import { deviceInfo, pasteboard } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { capabilityDiagnostic } from '../autostart/diagnostics/DiagnosticRuntime';
import { DiagnosticReport, ProbeResult } from '../autostart/diagnostics/CapabilityProbe';
import { HISTORY_SCHEMA, HISTORY_LIMIT, HISTORY_MESSAGE_LIMIT } from '../autostart/AutoStartupHistory';
import { permissionLines, policySeries } from '../autostart/permission/PermissionPlan';
import { DEFAULT_REMINDER, inQuietHours, quietText } from '../autostart/notify/ReminderPolicy';
import { messageLines, userFacingCount } from '../autostart/text/MessageCatalog';
import { defaultRetentionPolicy, describePolicy } from '../autostart/archive/RetentionPolicy';

@Entry
@Component
struct DiagnosticPage {
  @State private report: DiagnosticReport = new DiagnosticReport();
  @State private running: boolean = false;
  @State private notice: string = '';
  @State private showReference: boolean = false;
  @State private permissionLinesState: string[] = [];
  @State private messageLinesState: string[] = [];
  @State private retentionLinesState: string[] = [];
  private unsubscribe: () => void = () => {};
  aboutToAppear(): void {
    this.unsubscribe = capabilityDiagnostic.subscribe((): void => this.syncState());
    this.syncState();
    this.rebuildSections();
  }
  onPageShow(): void {
    this.rebuildSections();
  }

  /**
   * 权限、文案与保留策略按当前系统时间重算，只展示规则目录，不代表已申请权限或已发通知。
   */
  private rebuildSections(): void {
    const hour: number = new Date().getHours();
    const quiet: string = inQuietHours(hour, DEFAULT_REMINDER) ? '处于免打扰时段' : '不在免打扰时段';
    this.permissionLinesState = permissionLines().slice(0, 6).concat(policySeries());
    this.messageLinesState = [`${userFacingCount()} 条用户可见文案`, quiet, quietText(DEFAULT_REMINDER)]
      .concat(messageLines().slice(0, 4));
    this.retentionLinesState = describePolicy(defaultRetentionPolicy());
  }
  aboutToDisappear(): void {
    this.unsubscribe();
    capabilityDiagnostic.dispose();
  }
  private syncState(): void {
    this.report = capabilityDiagnostic.reportSnapshot();
    this.running = capabilityDiagnostic.isRunning();
  }
  private run(ability: boolean): void {
    const request = ability ? capabilityDiagnostic.runAbilityProbe() : capabilityDiagnostic.runStatusProbe();
    this.syncState();
    request.then((): void => this.syncState());
  }
  private copyReport(): void {
    // No model/serial/account, raw platform message, permission assertion or illustrative schema.
    const content = `自启独立诊断（实际API，不是开机拉起证据）\nAPI等级 ${deviceInfo.sdkApiVersion}\n` +
      `设备形态 ${deviceInfo.deviceType}\n能力 ${this.report.ability.stage} ${this.report.ability.value}\n` +
      `状态 ${this.report.status.stage} ${this.report.status.value}\n` + autoStartupService.exportHistory();
    try {
      pasteboard.getSystemPasteboard().setData(pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, content))
        .then((): void => { this.notice = '脱敏报告已复制'; })
        .catch((): void => { this.notice = '导出失败，请点击复制重试；查询结果未改变'; });
    } catch (_) { this.notice = '导出失败，请点击复制重试；查询结果未改变'; }
  }
  @Builder
  private linesCard(title: string, lines: string[]) {
    Column({ space: 6 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
      ForEach(lines, (line: string) => {
        Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
      }, (line: string, index: number) => `${index}-${line}`)
      if (lines.length === 0) { Text('暂无内容').fontSize(14) }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.card_background')).borderRadius(16)
  }

  @Builder
  private resultCard(title: string, result: ProbeResult) {
    Column({ space: 8 }) {
      Text(title).fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
      Text(result.conclusion || '尚未检测').fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
      Text(`阶段 ${result.stage}；返回 ${result.value === null ? '未获取' : String(result.value)}`)
        .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      Text(`错误码 ${result.errorCode || '无'}；耗时 ${result.elapsedMillis} ms`)
        .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
      if (result.errorMessage.length > 0) { Text(result.errorMessage).fontSize(14).fontColor($r('app.color.error_color')) }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.card_background')).borderRadius(16)
  }
  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button('‹ 返回', { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick(() => router.back())
        Text('独立API诊断').fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary'))
        Text('分别检查设备能力与本应用状态，不申请额外权限。')
          .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        Button('检测设备能力', { type: ButtonType.Normal }).width('100%').height(48).fontSize(15)
          .fontColor(Color.White).backgroundColor($r('app.color.accent_color')).borderRadius(12)
          .enabled(!this.running).onClick(() => this.run(true))
        this.resultCard('设备能力', this.report.ability)
        Button('查询本应用状态', { type: ButtonType.Normal }).width('100%').height(44).fontSize(15)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.accent_soft')).borderRadius(12)
          .enabled(!this.running).onClick(() => this.run(false))
        this.resultCard('本应用状态', this.report.status)
        if (this.running) {
          Text('正在查询，请等待系统响应。').fontSize(14).fontColor($r('app.color.accent_color'))
        }
        if (this.report.advice.length > 0) {
          Text(this.report.advice).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        }
        Button('复制脱敏诊断报告 / 失败重试', { type: ButtonType.Normal }).width('100%').height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => this.copyReport())
        if (this.notice.length > 0) {
          Text(this.notice).fontSize(14).fontColor($r('app.color.warning_color')).width('100%')
        }
        Button(this.showReference ? '收起诊断说明与策略 −' : '诊断说明与策略 +', { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showReference = !this.showReference; })
        if (this.showReference) {
          Column({ space: 12 }) {
            Text(`API ${deviceInfo.sdkApiVersion} · ${deviceInfo.deviceType} · ${deviceInfo.osFullName}`)
              .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
            Text('能力检测为false表示设备不支持，不等于自启未开启；状态以各接口实际返回为准。')
              .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            Text('这里只查询、不自动修改设置；查询结果不证明实际开机拉起。以下为参考策略，不代表已授权或已发送通知。')
              .fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            Text(`查询历史：私有存储，最多${HISTORY_LIMIT}条、30天；格式${HISTORY_SCHEMA}，错误信息上限${HISTORY_MESSAGE_LIMIT}。`)
              .fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
          this.linesCard('权限申请策略', this.permissionLinesState)
          this.linesCard('文案与提醒时段', this.messageLinesState)
          this.linesCard('存档保留策略', this.retentionLinesState)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').align(Alignment.TopStart).backgroundColor($r('app.color.page_background'))
  }
}
