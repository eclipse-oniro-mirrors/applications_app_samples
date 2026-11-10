import { router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { RevisitSession, RevisitStage } from '../autostart/revisit/RevisitTracker';
import { FALLBACK_GUIDANCE, stepTexts } from '../autostart/revisit/GuidanceCatalog';
import { formatQueryTime } from '../components/QueryPresentation';
import { revisitDetails } from '../autostart/revisit/RevisitView';

@Entry
@Component
struct GuidancePage {
  @State private session: RevisitSession = new RevisitSession();
  @State private notice: string = '';
  @State private archived: RevisitSession[] = [];
  @State private detail: string[] = [];
  @State private selectedSessionId: string = '';
  @State private readBlocked: boolean = false;
  @State private showDetails: boolean = false;
  @State private showStorage: boolean = false;
  @State private showArchive: boolean = false;
  private unsubscribe: () => void = () => {};
  aboutToAppear(): void {
    this.unsubscribe = autoStartupService.subscribe((): void => this.syncState());
    this.syncState();
  }
  aboutToDisappear(): void { this.unsubscribe(); }
  onPageShow(): void { this.syncState(); }
  private syncState(): void {
    this.session = autoStartupService.revisitSnapshot();
    this.notice = autoStartupService.revisitNotice();
    this.archived = autoStartupService.revisitArchive();
    this.readBlocked = autoStartupService.revisitReadBlocked();
    this.detail = revisitDetails(this.archived.find((session: RevisitSession): boolean =>
      session.sessionId === this.selectedSessionId));
  }
  private sampleText(before: boolean): string {
    const record = before ? this.session.before : this.session.after;
    return record === undefined ? '无' : `#${record.id} ${record.result} ${formatQueryTime(record.timestamp)}`;
  }
  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button('‹ 返回', { type: ButtonType.Normal }).height(44).fontSize(14)
          .fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
          .onClick(() => router.back())
        Text('手动设置回访').fontSize(26).fontWeight(FontWeight.Bold).fontColor($r('app.color.text_primary'))
        Column({ space: 12 }) {
          Text(FALLBACK_GUIDANCE.summary).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          ForEach(stepTexts(FALLBACK_GUIDANCE), (step: string) => {
            Text(step).fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
          }, (step: string): string => step)
          Text('开始后，请在10分钟内完成设置并返回。').fontSize(12).fontColor($r('app.color.text_secondary'))
          Button('开始手动设置回访', { type: ButtonType.Normal }).width('100%').height(48).fontSize(15)
            .backgroundColor($r('app.color.accent_color')).fontColor(Color.White).borderRadius(12)
            .enabled(!this.readBlocked).onClick(() => { autoStartupService.beginRevisit(); })
        }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
          .alignItems(HorizontalAlign.Start)
        Column({ space: 12 }) {
          Text('本轮回访').fontSize(17).fontWeight(FontWeight.Medium).fontColor($r('app.color.text_primary'))
          Text(this.session.conclusion).fontSize(15).fontColor($r('app.color.text_primary')).width('100%')
          Text(`离开前：${this.sampleText(true)}`).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          Text(`返回后：${this.sampleText(false)}`).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
          if (this.notice.length > 0) {
            Text(this.notice).fontSize(14).fontColor($r('app.color.warning_color')).width('100%')
          }
          if (this.session.stage === RevisitStage.RETURNED || this.session.stage === RevisitStage.RECHECKED) {
            Button('重试返回后查询').height(44).fontSize(14).onClick(() => autoStartupService.retryRevisitQuery())
          }
          if (this.session.stage === RevisitStage.GUIDED || this.session.stage === RevisitStage.LEFT ||
            this.session.stage === RevisitStage.RETURNED) {
            Button('取消本轮回访').height(44).fontSize(14).onClick(() => autoStartupService.cancelRevisit())
          }
          Button(this.showDetails ? '收起回访详情 −' : '回访详情 +', { type: ButtonType.Normal })
            .height(44).fontSize(14).fontColor($r('app.color.accent_color')).backgroundColor(Color.Transparent).padding(0)
            .onClick(() => { this.showDetails = !this.showDetails; })
          if (this.showDetails) {
            Text(`阶段：${this.session.stage}`).fontSize(12).fontColor($r('app.color.text_secondary'))
            Text(`离开：${formatQueryTime(this.session.leftAt)}；返回：${formatQueryTime(this.session.returnedAt)}`)
              .fontSize(12).fontColor($r('app.color.text_secondary'))
            Text(`回查关联ID：${this.session.expectedQueryId || '无'}`).fontSize(12).fontColor($r('app.color.text_secondary'))
          }
        }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
          .alignItems(HorizontalAlign.Start)
        Button(this.showStorage ? '收起存储操作 −' : '存储与恢复 +', { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showStorage = !this.showStorage; })
        if (this.showStorage || this.readBlocked) {
          Column({ space: 12 }) {
            Button('重试保存').height(44).fontSize(14).onClick(() => autoStartupService.retryPersistence())
            Button('重试读取回访').height(44).fontSize(14).enabled(this.readBlocked)
              .onClick(() => autoStartupService.retryRevisitRead())
            if (this.readBlocked) {
              Button('放弃未读/损坏回访存档').height(44).fontSize(14).onClick((): void => {
                this.getUIContext().showAlertDialog({
                  title: '放弃原回访存档？', message: '仅重置本应用私有回访。读取失败时建议先重试，确认后原存档将被替换。',
                  primaryButton: { value: '保留', action: (): void => {} },
                  secondaryButton: { value: '放弃并重置', action: (): void => autoStartupService.discardUnreadRevisit() }
                });
              })
            }
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
        }
        Button(this.showArchive ? '收起回访归档 −' : `回访归档 · ${this.archived.length} 轮 +`, { type: ButtonType.Normal })
          .width('100%').height(44).fontSize(14).fontColor($r('app.color.text_secondary'))
          .backgroundColor($r('app.color.card_background')).borderRadius(12)
          .onClick(() => { this.showArchive = !this.showArchive; })
        if (this.showArchive) {
          Column({ space: 12 }) {
            Text('保留最多10轮、30天；每轮最多5条回查尝试。').fontSize(12).fontColor($r('app.color.text_secondary'))
            if (this.archived.length === 0) { Text('暂无已结束回访').fontSize(14).fontColor($r('app.color.text_secondary')) }
            ForEach(this.archived, (session: RevisitSession) => {
              Button(`${session.sessionId}｜${session.stage}`).height(44).fontSize(13)
                .onClick((): void => { this.selectedSessionId = session.sessionId; this.syncState(); })
            }, (session: RevisitSession): string => session.sessionId)
            ForEach(this.detail, (line: string, index: number) => {
              Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
            }, (line: string, index: number): string => `${index}:${line}`)
          }.width('100%').padding(16).backgroundColor($r('app.color.card_background')).borderRadius(16)
            .alignItems(HorizontalAlign.Start)
        }
      }.width('100%').padding({ left: 20, right: 20, top: 20, bottom: 28 }).alignItems(HorizontalAlign.Start)
    }.width('100%').height('100%').backgroundColor($r('app.color.page_background'))
  }
}
