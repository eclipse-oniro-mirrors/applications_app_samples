import { ACCENT, BG, CARD, DANGER, EmptyState, MUTED, OK, PageHeader, StatusBanner, TEXT } from '../components/Ui';
import { CallRecord, PageKey, ShortcutView } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';

@Entry
@Component
struct ActivityPage {
  @State view: ShortcutView = new ShortcutView();
  private active: boolean = false;
  private subscription: number = -1;

  aboutToAppear(): void { this.activate(); }
  onPageShow(): void { this.activate(); }
  onPageHide(): void { this.deactivate(); }
  aboutToDisappear(): void { this.deactivate(); }

  private activate(): void {
    if (this.active) { return; }
    this.active = true;
    this.subscription = shortcutService.subscribe(() => this.update());
    this.update();
    appNavigation.activate(PageKey.ACTIVITY, () => this.update());
  }

  private deactivate(): void {
    if (!this.active) { return; }
    this.active = false;
    shortcutService.unsubscribe(this.subscription);
    appNavigation.deactivate(PageKey.ACTIVITY);
  }

  private update(): void { this.view = shortcutService.snapshot(); }

  build() {
    Column() {
      PageHeader({ title: '调用记录',
        onBack: (): void => { appNavigation.back(); } })
      Scroll() {
        Column({ space: 14 }) {
          Row({ space: 12 }) {
            Button('重新检测').height(44).fontSize(14).layoutWeight(1)
              .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft')).enabled(!this.view.busy)
              .onClick(() => { shortcutService.checkSupport(); })
            Button('重新查询').height(44).fontSize(14).layoutWeight(1)
              .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
              .enabled(this.view.supported && !this.view.busy)
              .onClick(() => { shortcutService.refresh(); })
          }.width('100%')
          StatusBanner({ message: this.view.supportError || this.view.queryError, error: true })
          Row() {
            Text(`最近 ${this.view.records.length} 条`).fontSize(14).fontColor(MUTED).layoutWeight(1)
            Button('清空记录').fontSize(14).fontColor(MUTED).height(44).backgroundColor(Color.Transparent)
              .enabled(!this.view.busy && this.view.records.length > 0)
              .onClick(() => { shortcutService.clearRecords(); })
          }.width('100%')
          if (this.view.records.length === 0) {
            EmptyState({ title: '暂无调用记录' })
          }
          ForEach(this.view.records, (record: CallRecord) => {
            Column({ space: 10 }) {
              Row({ space: 8 }) {
                Text(record.time).fontSize(12).fontColor(MUTED).layoutWeight(1)
                Text(record.status).fontSize(13).fontWeight(FontWeight.Medium)
                  .fontColor(record.status === '失败' ? DANGER :
                    (record.status === '成功' || record.status === '回读一致' ? OK : ACCENT))
              }.width('100%')
              Text(record.api).fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
              if (record.target.length > 0) {
                Text(record.target).fontSize(13).fontColor(MUTED).width('100%')
              }
              if (record.message.length > 0) {
                Text(record.message).fontSize(14).fontColor(TEXT).width('100%').copyOption(CopyOptions.InApp)
              }
            }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
          }, (record: CallRecord) => `${record.id}|${record.status}|${record.message}`)
        }.width('100%').padding({ left: 20, right: 20, bottom: 28 })
      }.width('100%').layoutWeight(1).align(Alignment.TopStart).scrollBar(BarState.Off)
    }.width('100%').height('100%').backgroundColor(BG)
  }
}
