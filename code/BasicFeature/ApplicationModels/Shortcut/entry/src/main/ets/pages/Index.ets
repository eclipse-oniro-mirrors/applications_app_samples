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

import { uiText } from '../i18n/Strings';
import { logWarning } from '../services/Logger';
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
      title: preview.mode === 'restore' ? uiText("shortcut_text_0282") : uiText("shortcut_text_0479"),
      message: external ? uiText("shortcut_text_0137") :
        (preview.mode === 'restore' ? uiText("shortcut_text_0035") :
          uiText("shortcut_text_0036")),
      primaryButton: {
        value: external ? uiText("shortcut_text_0060") : uiText("shortcut_text_0452"),
        action: () => {
          if (external) { void shortcutService.executeBatchPreview(preview.token, false); }
        }
      },
      secondaryButton: {
        value: external ? uiText("shortcut_text_0242") : uiText("shortcut_text_0482"),
        action: () => { void shortcutService.executeBatchPreview(preview.token, external); }
      }
    });
  }

  @Builder
  private batchPanel() {
    Column({ space: 10 }) {
      Text(uiText("shortcut_text_0634")).fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      ForEach(this.view.items, (item: ShortcutItem) => {
        Row({ space: 8 }) {
          Checkbox({ name: `batch-${item.id}` }).width(24).height(24).margin(10)
            .responseRegion({ x: -10, y: -10, width: 44, height: 44 })
            .selectedColor(ACCENT).select(this.selectedBatchIds.includes(item.id))
            .enabled(!this.view.busy).onChange((selected: boolean) => this.selectBatchItem(item.id, selected))
          Text(`${item.title} · ${item.visibleExplicit ? (item.visible ? uiText("shortcut_text_0603") : uiText("shortcut_text_0691")) : uiText("shortcut_text_0786")}`)
            .fontSize(15).fontColor(TEXT).layoutWeight(1)
        }.width('100%')
      }, (item: ShortcutItem) => `batch-select-${item.id}`)
      Row({ space: 8 }) {
        Button(this.batchTarget ? uiText("shortcut_text_0408") : uiText("shortcut_text_0409")).height(44).fontSize(14).fontColor(ACCENT)
          .backgroundColor($r('app.color.accent_soft')).layoutWeight(1)
          .enabled(!this.view.busy).onClick(() => {
            this.batchTarget = !this.batchTarget;
            shortcutService.cancelBatchPreview();
          })
        Button(uiText("shortcut_text_0511")).height(44).fontSize(14).fontColor($r('app.color.on_accent'))
          .backgroundColor(ACCENT).layoutWeight(1)
          .enabled(this.view.batchReady && this.view.supported && !this.view.busy && this.selectedBatchIds.length > 0)
          .onClick(() => { void shortcutService.previewBatch(this.selectedBatchIds, this.batchTarget); })
      }.width('100%')
      if (!this.view.batchReady) {
        Button(this.view.batchLoading ? uiText("shortcut_text_0222") : uiText("shortcut_text_0779")).height(44).fontSize(14)
          .enabled(!this.view.batchLoading && !this.view.busy)
          .onClick(() => { void shortcutService.loadBatches(); })
      }
      if (this.view.batchPreview !== undefined) {
        this.previewPanel(this.view.batchPreview)
      }
      Button({ type: ButtonType.Normal }) {
        Row() {
          Text(uiText("shortcut_text_0420", [String(this.view.batches.length)])).fontSize(15).fontColor(TEXT).layoutWeight(1)
          Text(this.historyExpanded ? uiText("shortcut_text_0525") : uiText("shortcut_text_0727")).fontSize(14).fontColor(ACCENT)
        }.width('100%')
      }.id('batch-history-toggle').height(44).width('100%').backgroundColor(BG)
        .onClick(() => { this.historyExpanded = !this.historyExpanded; })
      if (this.historyExpanded) {
        ForEach(this.view.batches, (plan: BatchPlan) => {
          this.batchHistory(plan)
        }, (plan: BatchPlan) => plan.batchId)
        if (this.view.batches.length === 0) { Text(uiText("shortcut_text_0724")).fontSize(14).fontColor(MUTED) }
      }
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }

  @Builder
  private previewPanel(preview: BatchPreview) {
    Column({ space: 8 }) {
      Text(preview.mode === 'restore' ? uiText("shortcut_text_0286") :
        (preview.mode === 'retry' ? uiText("shortcut_text_0773") : uiText("shortcut_text_0427")))
        .fontSize(16).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
      ForEach(preview.items, (item: BatchPreviewItem) => {
        Text(`${featureForId(item.id)?.title || item.id}：` +
          `${item.currentKnown ? (item.currentVisible ? uiText("shortcut_text_0603") : uiText("shortcut_text_0691")) : uiText("shortcut_text_0582")} → ` +
          `${item.target ? uiText("shortcut_text_0603") : uiText("shortcut_text_0691")}；${item.reason}`)
          .fontSize(12).fontColor(item.eligible ? TEXT : MUTED).width('100%')
      }, (item: BatchPreviewItem) => item.id)
      Button(uiText("shortcut_text_0480")).height(44).fontSize(14).enabled(!this.view.busy &&
        preview.items.some((item: BatchPreviewItem) => item.eligible))
        .onClick(() => this.confirmBatch(preview))
      Button(uiText("shortcut_text_0455")).height(44).fontSize(14).enabled(!this.view.busy)
        .onClick(() => shortcutService.cancelBatchPreview())
    }.width('100%').padding(12).backgroundColor(BG).borderRadius(10)
  }

  @Builder
  private batchHistory(plan: BatchPlan) {
    Column({ space: 8 }) {
      Text(`${plan.batchId}${plan.interrupted ? uiText("shortcut_text_0003") : ''}`)
        .fontSize(14).fontColor(TEXT).width('100%')
      ForEach(plan.items, (row: BatchItem) => {
        Column({ space: 4 }) {
          Text(`${featureForId(row.id)?.title || row.id} · ` +
            `${row.originalKnown ? (row.originalVisible ? uiText("shortcut_text_0603") : uiText("shortcut_text_0691")) : uiText("shortcut_text_0714")} → ` +
            `${row.target ? uiText("shortcut_text_0603") : uiText("shortcut_text_0691")}`)
            .fontSize(14).fontColor(TEXT).width('100%')
          Text(uiText("shortcut_text_0501", [String(batchResultText(row.result)), String(row.attempt)]) +
            uiText("shortcut_text_0277", [String(batchResultText(row.restoreResult)), String(row.restoreAttempt)]) +
            `${row.retryBlocked ? uiText("shortcut_text_0002") : ''}`)
            .fontSize(12).fontColor(MUTED).width('100%')
        }.width('100%')
      }, (row: BatchItem) => row.id)
      Row({ space: 6 }) {
        Button(uiText("shortcut_text_0268")).height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
          .enabled(this.view.batchReady && !this.view.busy)
          .onClick(() => { void shortcutService.reconcileBatch(plan.batchId); })
        Button(uiText("shortcut_text_0772")).height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
          .enabled(this.view.batchReady && !this.view.busy)
          .onClick(() => { void shortcutService.previewBatchRetry(plan.batchId); })
        Button(uiText("shortcut_text_0285")).height(44).fontSize(14).fontColor(ACCENT).backgroundColor(BG).layoutWeight(1)
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
        Text(uiText("shortcut_text_0014", [String(this.view.items.length), String(this.shownCount()), String(this.view.lastQuery)]))
          .fontSize(12).fontColor(MUTED).width('100%')
      }
      Row({ space: 12 }) {
        Button(uiText("shortcut_text_0782")).id('check_support').height(44).fontSize(15).layoutWeight(1)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft')).enabled(!this.view.busy)
          .onClick(() => { shortcutService.checkSupport(); })
        Button(this.view.querying ? uiText("shortcut_text_0537") : uiText("shortcut_text_0535")).id('refresh_shortcuts')
          .height(44).fontSize(15).layoutWeight(1).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent'))
          .enabled(this.view.supported && !this.view.busy)
          .onClick(() => { shortcutService.refresh(); })
      }.width('100%')
      Button(uiText("shortcut_text_0257")).id('open_rule_center').height(44).fontSize(15).width('100%')
        .fontColor(ACCENT).backgroundColor(BG)
        .onClick(() => { router.pushUrl({ url: 'pages/RuleCenterPage' }).catch(() => {
            logWarning('Opening the rule center failed');
          }); })
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }

  build() {
    Column() {
      PageHeader({
        title: uiText("shortcut_text_0365"), actionLabel: uiText("shortcut_text_0217"),
        onAction: (): void => { appNavigation.open(PageKey.CALL_LOG); }
      })
      Scroll() {
        Column({ space: 16 }) {
          Text(uiText("shortcut_text_0151")).fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
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

          Text(uiText("shortcut_text_0369")).fontSize(18).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          Button({ type: ButtonType.Normal }) {
            Row() {
              Text(uiText("shortcut_text_0788")).fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.shortcutsExpanded ? uiText("shortcut_text_0525") : uiText("shortcut_text_0013", [String(this.view.items.length)])).fontSize(14).fontColor(ACCENT)
            }.width('100%')
          }.id('home-shortcuts-toggle').height(52).width('100%').padding({ left: 16, right: 16 })
            .backgroundColor(CARD).borderRadius(16).onClick(() => { this.shortcutsExpanded = !this.shortcutsExpanded; })
          if (this.shortcutsExpanded) {
            Row() {
              Text(uiText("shortcut_text_0604", [String(this.shownCount()), String(this.view.items.length)])).fontSize(14).fontColor(MUTED).layoutWeight(1)
              Button(uiText("shortcut_text_0465")).id('restore_all').fontSize(14).height(44)
                .fontColor(ACCENT).backgroundColor(Color.Transparent)
                .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0 &&
                  this.view.items.some((item: ShortcutItem) => !item.visible))
                .onClick(() => { shortcutService.restoreAll(); })
            }.width('100%')
            ForEach(this.view.items, (item: ShortcutItem) => {
              this.shortcutCard(item)
            }, (item: ShortcutItem) => `${item.id}|${item.visible}|${item.status}|${item.error}|${this.view.busy}`)
            if (this.view.items.length === 0) {
              EmptyState({ title: this.view.querying ? uiText("shortcut_text_0746") :
                (this.view.queryError.length > 0 ? uiText("shortcut_text_0223") : uiText("shortcut_text_0722")) })
            }
          }

          Button({ type: ButtonType.Normal }) {
            Row() {
              Text(uiText("shortcut_text_0424")).fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.batchExpanded ? uiText("shortcut_text_0525") : uiText("shortcut_text_0728")).fontSize(14).fontColor(ACCENT)
            }.width('100%')
          }.id('home-batch-toggle').height(52).width('100%').padding({ left: 16, right: 16 })
            .backgroundColor(CARD).borderRadius(16).onClick(() => { this.batchExpanded = !this.batchExpanded; })
          if (this.batchExpanded) { this.batchPanel() }

          Button({ type: ButtonType.Normal }) {
            Row() {
              Text(uiText("shortcut_text_0500")).fontSize(15).fontColor(TEXT).layoutWeight(1)
              Text(this.deviceExpanded ? uiText("shortcut_text_0525") : uiText("shortcut_text_0728")).fontSize(14).fontColor(ACCENT)
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
          .accessibilityText(uiText("shortcut_text_0030", [String(item.title)]))
          .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0)
          .onChange((visible: boolean) => {
            if (visible !== item.visible) { shortcutService.setVisible(item.id, visible); }
          })
      }.width('100%')
      Row() {
        Text(item.visible ? uiText("shortcut_text_0683") : uiText("shortcut_text_0686")).fontSize(14).fontColor(item.visible ? OK : MUTED)
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
        Button(uiText("shortcut_text_0149")).height(44).layoutWeight(1).fontSize(14)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .onClick(() => { appNavigation.openDetail(item.id); })
        Button(uiText("shortcut_text_0184")).height(44).layoutWeight(1).fontSize(14).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent')).enabled(featureForId(item.id) !== undefined)
          .onClick(() => { this.openItem(item.id); })
      }.width('100%')
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
  }
}
