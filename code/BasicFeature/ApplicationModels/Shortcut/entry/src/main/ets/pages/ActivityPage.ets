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
    appNavigation.activate(PageKey.CALL_LOG, () => this.update());
  }

  private deactivate(): void {
    if (!this.active) { return; }
    this.active = false;
    shortcutService.unsubscribe(this.subscription);
    appNavigation.deactivate(PageKey.CALL_LOG);
  }

  private update(): void { this.view = shortcutService.snapshot(); }

  build() {
    Column() {
      PageHeader({ title: uiText("shortcut_text_0217"),
        onBack: (): void => { appNavigation.back(); } })
      Scroll() {
        Column({ space: 14 }) {
          Row({ space: 12 }) {
            Button(uiText("shortcut_text_0782")).height(44).fontSize(14).layoutWeight(1)
              .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft')).enabled(!this.view.busy)
              .onClick(() => { shortcutService.checkSupport(); })
            Button(uiText("shortcut_text_0774")).height(44).fontSize(14).layoutWeight(1)
              .fontColor(ACCENT).backgroundColor($r('app.color.accent_soft'))
              .enabled(this.view.supported && !this.view.busy)
              .onClick(() => { shortcutService.refresh(); })
          }.width('100%')
          StatusBanner({ message: this.view.supportError || this.view.queryError, error: true })
          Row() {
            Text(uiText("shortcut_text_0791", [String(this.view.records.length)])).fontSize(14).fontColor(MUTED).layoutWeight(1)
            Button(uiText("shortcut_text_0438")).fontSize(14).fontColor(MUTED).height(44).backgroundColor(Color.Transparent)
              .enabled(!this.view.busy && this.view.records.length > 0)
              .onClick(() => { shortcutService.clearRecords(); })
          }.width('100%')
          if (this.view.records.length === 0) {
            EmptyState({ title: uiText("shortcut_text_0721") })
          }
          ForEach(this.view.records, (record: CallRecord) => {
            Column({ space: 10 }) {
              Row({ space: 8 }) {
                Text(record.time).fontSize(12).fontColor(MUTED).layoutWeight(1)
                Text(record.status).fontSize(13).fontWeight(FontWeight.Medium)
                  .fontColor(record.status === uiText("shortcut_text_0513") ? DANGER :
                    (record.status === uiText("shortcut_text_0161") || record.status === uiText("shortcut_text_0294") ? OK : ACCENT))
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
