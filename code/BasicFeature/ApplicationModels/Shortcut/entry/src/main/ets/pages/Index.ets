import { router } from '@kit.ArkUI';
import {
  ACCENT, BG, CARD, DANGER, EmptyState, LINE, MUTED, OK, PageHeader, StatusBanner, TEXT
} from '../components/Ui';
import { FEATURES, FeatureInfo, PageKey, ShortcutItem, ShortcutView, featureForId } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';
import { BatchItem, BatchPlan, BatchPreview, BatchPreviewItem, batchResultText } from '../services/VisibilityBatch';

@Entry
@Component
struct Index {
  @State view: ShortcutView = new ShortcutView();
  @State private selectedBatchIds: string[] = [];
  @State private batchTarget: boolean = false;
  @State private shortcutsExpanded: boolean = false;
  @State private batchExpanded: boolean = false;
  @State private historyExpanded: boolean = false;
  @State private deviceExpanded: boolean = false;
  private subscription: number = -1;
  private active: boolean = false;

  aboutToAppear(): void { this.activate(); }
  onPageShow(): void { this.activate(); }
  onPageHide(): void { this.deactivate(); }
  aboutToDisappear(): void { this.deactivate(); }

  private activate(): void {
    if (this.active) { return; }
    this.active = true;
    this.subscription = shortcutService.subscribe(() => this.update());
    this.update();
    appNavigation.activate(PageKey.HOME, () => this.update());
    if (this.view.supported && !this.view.busy) {
      shortcutService.refresh();
    }
  }

  private deactivate(): void {
    if (!this.active) { return; }
    this.active = false;
    shortcutService.unsubscribe(this.subscription);
    appNavigation.deactivate(PageKey.HOME);
  }

  private update(): void {
    this.view = shortcutService.snapshot();
  }

  private shownCount(): number {
    return this.view.items.filter((item: ShortcutItem) => item.visible).length;
  }

  private openItem(id: string): void {
    const feature: FeatureInfo | undefined = featureForId(id);
    if (feature !== undefined) {
      appNavigation.open(feature.page);
    }
  }

  private selectBatchItem(id: string, selected: boolean): void {
    this.selectedBatchIds = this.selectedBatchIds.filter((value: string) => value !== id);
    if (selected) { this.selectedBatchIds.push(id); }
    shortcutService.cancelBatchPreview();
  }

  private confirmBatch(preview: BatchPreview): void {
    const external: boolean = preview.items.some((item: BatchPreviewItem) => item.externalChange && item.eligible);
    this.getUIContext().showAlertDialog({
      title: preview.mode === 'restore' ? '恢复入口设置' : '确认批量设置',
      message: external ? '部分入口已在外部更改。保留改动并处理其它入口，或覆盖改动后恢复？操作逐项执行，可能部分成功。' :
        (preview.mode === 'restore' ? '按预览恢复已知的原设置，可能部分成功。状态变化时请重新预览。' :
          '按预览逐个更新显示状态，可能部分成功。状态变化时请重新预览。'),
      primaryButton: {
        value: external ? '保留改动，处理其它' : '取消',
        action: () => {
          if (external) { void shortcutService.executeBatchPreview(preview.token, false); }
        }
      },
      secondaryButton: {
        value: external ? '覆盖改动并恢复' : '确认执行',
        action: () => { void shortcutService.executeBatchPreview(preview.token, external); }
      }
    });
  }

  @Builder
  private batchPanel() {
    Column({ space: 10 }) {
      Text('选择要调整的入口').fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      ForEach(this.view.items, (item: ShortcutItem) => {
        Row({ space: 8 }) {
          Checkbox({ name: `batch-${item.id}` }).width(24).height(24).margin(10)
            .responseRegion({ x: -10, y: -10, width: 44, height: 44 })
            .selectedColor(ACCENT).select(this.selectedBatchIds.includes(item.id))
            .enabled(!this.view.busy).onChange((selected: boolean) => this.selectBatchItem(item.id, selected))
          Text(`${item.title} · ${item.visibleExplicit ? (item.visible ? '显示' : '隐藏') : '状态未知'}`)
            .fontSize(15).fontColor(TEXT).layoutWeight(1)
        }.width('100%')
      }, (item: ShortcutItem) => `batch-select-${item.id}`)
      Row({ space: 8 }) {
        Button(this.batchTarget ? '目标：显示' : '目标：隐藏').height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor($r('app.color.accent_soft')).layoutWeight(1)
          .enabled(!this.view.busy).onClick(() => {
            this.batchTarget = !this.batchTarget;
            shortcutService.cancelBatchPreview();
          })
        Button('生成预览').height(44).fontSize(14).fontColor($r('app.color.on_accent'))
          .backgroundColor(ACCENT).layoutWeight(1)
          .enabled(this.view.batchReady && this.view.supported && !this.view.busy && this.selectedBatchIds.length > 0)
          .onClick(() => { void shortcutService.previewBatch(this.selectedBatchIds, this.batchTarget); })
      }.width('100%')
      if (!this.view.batchReady) {
        Button(this.view.batchLoading ? '读取批次中' : '重新读取批次').height(44).fontSize(14)
          .enabled(!this.view.batchLoading && !this.view.busy)
          .onClick(() => { void shortcutService.loadBatches(); })
      }
      if (this.view.batchPreview !== undefined) {
        this.previewPanel(this.view.batchPreview)
      }
      Button({ type: ButtonType.Normal }) {
        Row() {
          Text(`批次历史（${this.view.batches.length}）`).fontSize(15).fontColor(TEXT).layoutWeight(1)
          Text(this.historyExpanded ? '收起' : '展开').fontSize(14).fontColor(ACCENT)
        }.width('100%')
      }.id('batch-history-toggle').height(44).width('100%').backgroundColor(BG)
        .onClick(() => { this.historyExpanded = !this.historyExpanded; })
      if (this.historyExpanded) {
        ForEach(this.view.batches, (plan: BatchPlan) => {
          this.batchHistory(plan)
        }, (plan: BatchPlan) => plan.batchId)
        if (this.view.batches.length === 0) { Text('暂无批次记录').fontSize(14).fontColor(MUTED) }
      }
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }

  @Builder
  private previewPanel(preview: BatchPreview) {
    Column({ space: 8 }) {
      Text(preview.mode === 'restore' ? '恢复设置预览' :
        (preview.mode === 'retry' ? '重试预览' : '批量设置预览'))
        .fontSize(16).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      ForEach(preview.items, (item: BatchPreviewItem) => {
        Text(`${featureForId(item.id)?.title || item.id}：` +
          `${item.currentKnown ? (item.currentVisible ? '显示' : '隐藏') : '未知'} → ` +
          `${item.target ? '显示' : '隐藏'}；${item.reason}`)
          .fontSize(12).fontColor(item.eligible ? TEXT : MUTED).width('100%')
      }, (item: BatchPreviewItem) => item.id)
      Button('确认设置').height(44).fontSize(14).enabled(!this.view.busy &&
        preview.items.some((item: BatchPreviewItem) => item.eligible))
        .onClick(() => this.confirmBatch(preview))
      Button('取消预览').height(44).fontSize(14).enabled(!this.view.busy)
        .onClick(() => shortcutService.cancelBatchPreview())
    }.width('100%').padding(12).backgroundColor(BG).borderRadius(10)
  }

  @Builder
  private batchHistory(plan: BatchPlan) {
    Column({ space: 8 }) {
      Text(`${plan.batchId}${plan.interrupted ? ' · 未完成' : ''}`)
        .fontSize(14).fontColor(TEXT).width('100%')
      ForEach(plan.items, (row: BatchItem) => {
        Column({ space: 4 }) {
          Text(`${featureForId(row.id)?.title || row.id} · ` +
            `${row.originalKnown ? (row.originalVisible ? '显示' : '隐藏') : '原设置未知'} → ` +
            `${row.target ? '显示' : '隐藏'}`)
            .fontSize(14).fontColor(TEXT).width('100%')
          Text(`设置：${batchResultText(row.result)} · ${row.attempt}次；` +
            `恢复：${batchResultText(row.restoreResult)} · ${row.restoreAttempt}次` +
            `${row.retryBlocked ? ' · 权限或入口不可用' : ''}`)
            .fontSize(12).fontColor(MUTED).width('100%')
        }.width('100%')
      }, (row: BatchItem) => row.id)
      Row({ space: 6 }) {
        Button('核对状态').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
          .enabled(this.view.batchReady && !this.view.busy)
          .onClick(() => { void shortcutService.reconcileBatch(plan.batchId); })
        Button('重试失败项').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
          .enabled(this.view.batchReady && !this.view.busy)
          .onClick(() => { void shortcutService.previewBatchRetry(plan.batchId); })
        Button('恢复设置').height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
          .enabled(this.view.batchReady && !this.view.busy)
          .onClick(() => { void shortcutService.previewBatchRestore(plan.batchId); })
      }.width('100%')
    }.width('100%').padding(12).border({ width: 1, color: LINE }).borderRadius(10)
  }

  @Builder
  private devicePanel() {
    Column({ space: 12 }) {
      Row() {
        Text(this.view.support).fontSize(15).fontColor(this.view.supported ? OK : MUTED).layoutWeight(1)
        if (this.view.checking || this.view.querying) { LoadingProgress().width(24).height(24).color(ACCENT) }
      }.width('100%')
      if (this.view.lastQuery.length > 0) {
        Text(`${this.view.items.length} 个入口 · 显示 ${this.shownCount()} 个 · ${this.view.lastQuery} 更新`)
          .fontSize(12).fontColor(MUTED).width('100%')
      }
      Row({ space: 12 }) {
        Button('重新检测').id('check_support').height(44).fontSize(15).layoutWeight(1)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft')).enabled(!this.view.busy)
          .onClick(() => { shortcutService.checkSupport(); })
        Button(this.view.querying ? '刷新中' : '刷新列表').id('refresh_shortcuts')
          .height(44).fontSize(15).layoutWeight(1).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent'))
          .enabled(this.view.supported && !this.view.busy)
          .onClick(() => { shortcutService.refresh(); })
      }.width('100%')
      Button('规则中心').id('open_rule_center').height(44).fontSize(15).width('100%')
        .fontColor(ACCENT).backgroundColor(BG)
        .onClick(() => { router.pushUrl({ url: 'pages/RuleCenterPage' }).catch(() => {}); })
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }

  build() {
    Column() {
      PageHeader({
        title: '快捷方式', actionLabel: '调用记录',
        onAction: (): void => { appNavigation.open(PageKey.ACTIVITY); }
      })
      Scroll() {
        Column({ space: 16 }) {
          Text('常用功能').fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          Row({ space: 12 }) {
            ForEach(FEATURES, (feature: FeatureInfo) => {
              Button({ type: ButtonType.Normal }) {
                Column({ space: 12 }) {
                  Image(feature.icon).width(36).height(36)
                  Text(feature.title).fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT)
                }.width('100%')
              }.layoutWeight(1).height(112).padding(12).backgroundColor(CARD).borderRadius(16)
                .onClick(() => { appNavigation.open(feature.page); })
            }, (feature: FeatureInfo) => feature.id)
          }.width('100%')

          StatusBanner({ message: this.view.supportError || this.view.queryError, error: true })
          StatusBanner({ message: this.view.batchError, error: true })
          StatusBanner({ message: this.view.batchMessage })

          Text('快捷入口管理').fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          Button({ type: ButtonType.Normal }) {
            Row() {
              Text('桌面快捷入口').fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.shortcutsExpanded ? '收起' : `${this.view.items.length} 个入口  ›`).fontSize(14).fontColor(ACCENT)
            }.width('100%')
          }.id('home-shortcuts-toggle').height(52).width('100%').padding({ left: 16, right: 16 })
            .backgroundColor(CARD).borderRadius(16).onClick(() => { this.shortcutsExpanded = !this.shortcutsExpanded; })
          if (this.shortcutsExpanded) {
            Row() {
              Text(`显示 ${this.shownCount()} / ${this.view.items.length}`).fontSize(14).fontColor(MUTED).layoutWeight(1)
              Button('全部显示').id('restore_all').fontSize(14).height(44)
                .fontColor(ACCENT).backgroundColor(Color.Transparent)
                .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0 &&
                  this.view.items.some((item: ShortcutItem) => !item.visible))
                .onClick(() => { shortcutService.restoreAll(); })
            }.width('100%')
            ForEach(this.view.items, (item: ShortcutItem) => {
              this.shortcutCard(item)
            }, (item: ShortcutItem) => `${item.id}|${item.visible}|${item.status}|${item.error}|${this.view.busy}`)
            if (this.view.items.length === 0) {
              EmptyState({ title: this.view.querying ? '正在读取快捷入口' :
                (this.view.queryError.length > 0 ? '读取失败' : '暂无快捷入口') })
            }
          }

          Button({ type: ButtonType.Normal }) {
            Row() {
              Text('批量管理').fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.batchExpanded ? '收起' : '展开  ›').fontSize(14).fontColor(ACCENT)
            }.width('100%')
          }.id('home-batch-toggle').height(52).width('100%').padding({ left: 16, right: 16 })
            .backgroundColor(CARD).borderRadius(16).onClick(() => { this.batchExpanded = !this.batchExpanded; })
          if (this.batchExpanded) { this.batchPanel() }

          Button({ type: ButtonType.Normal }) {
            Row() {
              Text('设备与更多').fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.deviceExpanded ? '收起' : '展开  ›').fontSize(14).fontColor(ACCENT)
            }.width('100%')
          }.id('home-device-toggle').height(52).width('100%').padding({ left: 16, right: 16 })
            .backgroundColor(CARD).borderRadius(16).onClick(() => { this.deviceExpanded = !this.deviceExpanded; })
          if (this.deviceExpanded) { this.devicePanel() }
        }.width('100%').padding({ left: 20, right: 20, bottom: 28 })
      }.layoutWeight(1).width('100%').align(Alignment.TopStart).scrollBar(BarState.Off)
    }.width('100%').height('100%').backgroundColor(BG)
  }

  @Builder
  private shortcutCard(item: ShortcutItem) {
    Column({ space: 14 }) {
      Row({ space: 12 }) {
        if (featureForId(item.id) !== undefined) {
          Image(featureForId(item.id)!.icon).width(48).height(48)
        }
        Column({ space: 5 }) {
          Text(item.title).fontSize(18).fontWeight(FontWeight.Bold).fontColor(TEXT)
          Text(featureForId(item.id)?.description || item.id).fontSize(14).fontColor(MUTED)
        }.alignItems(HorizontalAlign.Start).layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: item.visible }).id(`visibility_${item.id}`)
          .selectedColor(ACCENT).height(44)
          .accessibilityText(`${item.title}显示开关`)
          .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0)
          .onChange((visible: boolean) => {
            if (visible !== item.visible) { shortcutService.setVisible(item.id, visible); }
          })
      }.width('100%')
      Row() {
        Text(item.visible ? '已显示' : '已隐藏').fontSize(14).fontColor(item.visible ? OK : MUTED)
        Text(item.id).fontSize(12).fontColor(MUTED).layoutWeight(1).textAlign(TextAlign.End)
      }.width('100%')
      if (item.status.length > 0 && item.status !== item.error) {
        Text(item.status).fontSize(14).fontColor(item.error.length > 0 ? DANGER : ACCENT).width('100%')
      }
      if (item.error.length > 0) {
        Text(item.error).fontSize(14).fontColor(DANGER).width('100%')
      }
      Divider().color(LINE)
      Row({ space: 12 }) {
        Button('查看详情').height(44).layoutWeight(1).fontSize(14)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .onClick(() => { appNavigation.openDetail(item.id); })
        Button('打开功能').height(44).layoutWeight(1).fontSize(14).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent')).enabled(featureForId(item.id) !== undefined)
          .onClick(() => { this.openItem(item.id); })
      }.width('100%')
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }
}
