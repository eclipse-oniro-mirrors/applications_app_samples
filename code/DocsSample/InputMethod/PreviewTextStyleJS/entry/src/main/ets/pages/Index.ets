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

import { common } from '@kit.AbilityKit';
import { inputMethod } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { PreviewEditor } from '../components/PreviewEditor';

@Entry
@Component
struct Index {
  @State private settingsStatus: ResourceStr = '';
  private showSettingsMessage(): void {
    this.getUIContext().showAlertDialog({
      title: $r('app.string.settings'),
      message: this.settingsStatus,
      confirm: {
        value: $r('app.string.confirm'),
        action: (): void => {}
      }
    });
  }

  private async openSettings(): Promise<void> {
    try {
      const element = inputMethod.getSystemInputMethodConfigAbility();
      if (element.bundleName.length === 0 || element.abilityName.length === 0) {
        const current = inputMethod.getCurrentInputMethod();
        this.settingsStatus = current.name === 'com.samples.previewstylejs' ?
          $r('app.string.ime_enabled_hint') :
          $r('app.string.settings_unavailable_hint');
        this.showSettingsMessage();
        return;
      }
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      await context.startAbility({ bundleName: element.bundleName, abilityName: element.abilityName });
      this.settingsStatus = $r('app.string.select_ime_hint');
    } catch (error) {
      const detail = error as BusinessError;
      this.settingsStatus = $r('app.string.settings_open_failed', detail.code);
      this.showSettingsMessage();
    }
  }

  build() {
    Column({ space: 6 }) {
      Row({ space: 8 }) {
        Text($r('app.string.page_title'))
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .layoutWeight(1)
          .maxLines(1)
        Button($r('app.string.settings'))
          .fontSize(12)
          .height(32)
          .width(96)
          .id('openInputMethodSettings')
          .onClick((): void => {
            this.openSettings();
          })
      }
      .width('100%')
      .height(36)
      .id('previewPageHeader')
      Scroll() {
        Column({ space: 8 }) {
          PreviewEditor()
          if (this.settingsStatus !== '') {
            Text(this.settingsStatus)
              .id('inputMethodSettingsStatus')
              .fontSize(12)
              .width('100%')
              .padding({ left: 12, right: 12 })
          }
          Text($r('app.string.page_hint'))
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
            .padding({ left: 12, right: 12 })
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.Start)
      }
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .id('jsPreviewScroll')
    }
    .padding({ top: 8, bottom: 8, left: 12, right: 12 })
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
