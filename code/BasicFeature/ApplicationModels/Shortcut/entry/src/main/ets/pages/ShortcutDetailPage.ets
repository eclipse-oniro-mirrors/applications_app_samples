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
import { shortcutManager } from '@kit.AbilityKit';
import { router } from '@kit.ArkUI';
import { ACCENT, BG, CARD, EmptyState, FieldRow, MUTED, PageHeader, StatusBanner, TEXT } from '../components/Ui';
import { FeatureInfo, PageKey, ShortcutItem, ShortcutView, featureForId, sourceText } from '../model/ShortcutModels';
import { appNavigation } from '../navigation/AppNavigation';
import { shortcutService } from '../services/ShortcutService';

@Entry
@Component
struct ShortcutDetailPage {
  @State view: ShortcutView = new ShortcutView();
  @State item: ShortcutItem | undefined = undefined;
  @State private detailsExpanded: boolean = false;
  private shortcutId: string = '';
  private subscription: number = -1;
  private active: boolean = false;

  aboutToAppear(): void { this.activate(); }
  onPageShow(): void { this.activate(); }
  onPageHide(): void { this.deactivate(); }
  aboutToDisappear(): void { this.deactivate(); }

  private activate(): void {
    if (this.active) { return; }
    this.active = true;
    const params = router.getParams() as Record<string, string>;
    this.shortcutId = params === undefined ? '' : params['shortcutId'];
    this.subscription = shortcutService.subscribe(() => this.update());
    this.update();
    appNavigation.activate(PageKey.DETAIL, () => this.update());
  }

  private deactivate(): void {
    if (!this.active) { return; }
    this.active = false;
    shortcutService.unsubscribe(this.subscription);
    appNavigation.deactivate(PageKey.DETAIL);
  }

  private update(): void {
    this.view = shortcutService.snapshot();
    this.item = this.view.items.find((item: ShortcutItem) => item.id === this.shortcutId);
  }

  private openFeature(): void {
    const feature: FeatureInfo | undefined = featureForId(this.shortcutId);
    if (feature !== undefined) { appNavigation.open(feature.page); }
  }

  build() {
    Column() {
      PageHeader({ title: uiText("shortcut_text_0368"), onBack: (): void => { appNavigation.back(); } })
      Scroll() {
        Column({ space: 16 }) {
          StatusBanner({ message: this.view.queryError || this.view.supportError, error: true })
          if (this.item !== undefined) {
            this.detailContent(this.item)
          } else {
            EmptyState({ title: uiText("shortcut_text_0487"), detail: uiText("shortcut_text_0536") })
          }
          Button(this.view.querying ? uiText("shortcut_text_0744") : uiText("shortcut_text_0774")).width('100%').height(46)
            .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
            .enabled(this.view.supported && !this.view.busy)
            .onClick(() => { shortcutService.refresh(); })
        }.width('100%').padding({ left: 20, right: 20, bottom: 28 })
      }.width('100%').layoutWeight(1).align(Alignment.TopStart).scrollBar(BarState.Off)
    }.width('100%').height('100%').backgroundColor(BG)
  }

  @Builder
  private detailContent(item: ShortcutItem) {
    Column({ space: 14 }) {
      Text(item.title).fontSize(24).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
      Text(item.visible ? uiText("shortcut_text_0683") : uiText("shortcut_text_0686")).fontSize(14).fontColor(ACCENT).width('100%')
      StatusBanner({ message: item.error || item.status, error: item.error.length > 0 })
      Row({ space: 12 }) {
        Button(item.visible ? uiText("shortcut_text_0692") : uiText("shortcut_text_0605")).height(44).layoutWeight(1)
          .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
          .enabled(this.view.supported && !this.view.busy && this.view.queryError.length === 0)
          .onClick(() => { shortcutService.setVisible(item.id, !item.visible); })
        Button(uiText("shortcut_text_0184")).height(44).layoutWeight(1).backgroundColor(ACCENT)
          .fontColor($r('app.color.on_accent')).enabled(featureForId(item.id) !== undefined)
          .onClick(() => this.openFeature())
      }.width('100%')
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)

    Button({ type: ButtonType.Normal }) {
      Row() {
        Text(uiText("shortcut_text_0489")).fontSize(15).fontColor(TEXT).layoutWeight(1)
        Text(this.detailsExpanded ? uiText("shortcut_text_0525") : uiText("shortcut_text_0149")).fontSize(14).fontColor(ACCENT)
      }.width('100%')
    }.height(52).width('100%').padding({ left: 16, right: 16 }).backgroundColor(CARD).borderRadius(16)
      .onClick(() => { this.detailsExpanded = !this.detailsExpanded; })

    if (this.detailsExpanded) {
    Column() {
      Text(uiText("shortcut_text_0311")).fontSize(18).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
      FieldRow({ label: 'ID', value: item.id })
      FieldRow({ label: uiText("shortcut_text_0041"), value: item.raw.bundleName })
      FieldRow({ label: uiText("shortcut_text_0404"), value: item.raw.moduleName || uiText("shortcut_text_0575") })
      FieldRow({ label: uiText("shortcut_text_0542"), value: item.raw.hostAbility || uiText("shortcut_text_0575") })
      FieldRow({ label: uiText("shortcut_text_0371"), value: `${sourceText(item.raw.sourceType)} (${item.raw.sourceType})` })
      FieldRow({ label: uiText("shortcut_text_0693"), value: `${item.raw.appIndex}` })
      FieldRow({ label: 'visible', value: item.visibleExplicit ? `${item.raw.visible}` : uiText("shortcut_text_0474") })
      if (item.raw.label !== undefined) {
        FieldRow({ label: uiText("shortcut_text_0111"), value: item.raw.label })
      }
      if (item.raw.labelId !== undefined) {
        FieldRow({ label: uiText("shortcut_text_0114"), value: `${item.raw.labelId}` })
      }
      if (item.raw.icon !== undefined) {
        FieldRow({ label: uiText("shortcut_text_0560"), value: item.raw.icon })
      }
      if (item.raw.iconId !== undefined) {
        FieldRow({ label: uiText("shortcut_text_0561"), value: `${item.raw.iconId}` })
      }
    }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)

    ForEach(item.raw.wants || [], (want: shortcutManager.ShortcutWant, index: number) => {
      Column() {
        Text(uiText("shortcut_text_0406", [String(index + 1)])).fontSize(18).fontWeight(FontWeight.Bold).fontColor(TEXT).width('100%')
        FieldRow({ label: uiText("shortcut_text_0410"), value: want.targetBundle })
        FieldRow({ label: uiText("shortcut_text_0411"), value: want.targetModule || uiText("shortcut_text_0575") })
        FieldRow({ label: uiText("shortcut_text_0407"), value: want.targetAbility })
        Text(uiText("shortcut_text_0138")).fontSize(15).fontWeight(FontWeight.Medium).fontColor(TEXT).width('100%')
          .margin({ top: 10 })
        if (want.parameters === undefined || want.parameters.length === 0) {
          Text(uiText("shortcut_text_0719")).fontSize(14).fontColor(MUTED).width('100%').margin({ top: 10 })
        }
        ForEach(want.parameters || [], (parameter: shortcutManager.ParameterItem) => {
          FieldRow({ label: parameter.key, value: parameter.value })
        }, (parameter: shortcutManager.ParameterItem) => `${parameter.key}|${parameter.value}`)
      }.width('100%').padding(16).backgroundColor(CARD).borderRadius(16)
    }, (want: shortcutManager.ShortcutWant, index: number) => `${index}|${want.targetBundle}|${want.targetAbility}`)
    }
  }
}
