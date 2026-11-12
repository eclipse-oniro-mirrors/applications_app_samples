'use static'

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

import { hilog } from '@kit.PerformanceAnalysisKit';

import { InputMethodExtensionAbility, inputMethodEngine } from '@kit.IMEKit';
import { Want } from '@kit.AbilityKit';
import { display, AppStorage, $r } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { previewSender } from './PreviewSender';

const DOMAIN = 0xF811;
const TAG = 'PreviewTextStyleStatic';

export default class PreviewInputMethod extends InputMethodExtensionAbility {
  private ability: inputMethodEngine.InputMethodAbility | null = inputMethodEngine.getInputMethodAbility();
  private panel: inputMethodEngine.Panel | undefined = undefined;
  private active: boolean = false;
  private inputStopCallback: () => void = (): void => {
    previewSender.setClient(undefined);
  };

  // [Start preview_style_sta_input_start]
  onCreate(_want: Want): void {
    previewSender.setPreviewText(this.context.resourceManager.getStringSync($r('app.string.preview_text').id));
    const ability = this.ability;
    if (ability === null) {
      return;
    }
    this.active = true;
    ability.onInputStart( (_keyboard: inputMethodEngine.KeyboardController,
      client: inputMethodEngine.InputClient): void => {
      previewSender.setClient(client);
    });
    ability.onInputStop(this.inputStopCallback);
    this.createKeyboard();
  }

  // [End preview_style_sta_input_start]

  private async createKeyboard(): Promise<void> {
    const ability = this.ability;
    if (ability === null) {
      return;
    }
    try {
      const panel = await ability.createPanel(this.context, {
        type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
        flag: inputMethodEngine.PanelFlag.FLG_FIXED
      });
      if (!this.active) {
        await ability.destroyPanel(panel);
        return;
      }
      this.panel = panel;
      const screen = display.getDefaultDisplaySync();
      const panelHeight: long = (screen.height * 0.38).toInt();
      const panelHeightVp: number = panelHeight / screen.densityPixels;
      AppStorage.setOrCreate<number>('previewPanelHeightVp', panelHeightVp);
      hilog.info(DOMAIN, TAG, '%{public}s', `STA display ${screen.width}x${screen.height}, density ${screen.densityPixels}`);
      hilog.info(DOMAIN, TAG, '%{public}s', `STA panel request ${screen.width}x${panelHeight}, root height ${panelHeightVp}vp`);
      await panel.resize(screen.width, panelHeight);
      const portraitWidth = Math.min(screen.width, screen.height).toInt();
      const portraitHeight = Math.max(screen.width, screen.height).toInt();
      const panelRect: inputMethodEngine.PanelRect = {
        portraitRect: { left: 0, top: 0, width: portraitWidth,
          height: Math.min(panelHeight.toInt(), Math.floor(portraitHeight * 0.7)).toInt() },
        landscapeRect: { left: 0, top: 0, width: portraitHeight,
          height: Math.min(panelHeight.toInt(), Math.floor(portraitWidth * 0.7)).toInt() }
      };
      panel.adjustPanelRect(inputMethodEngine.PanelFlag.FLG_FIXED, panelRect);
      hilog.info(DOMAIN, TAG, '%{public}s', `STA panel resize complete ${screen.width}x${panelHeight}`);
      await panel.setUiContent('keyboard/KeyboardPanel');
      hilog.info(DOMAIN, TAG, '%{public}s', 'STA keyboard content loaded');
    } catch (error) {
      const detail = error as BusinessError;
      previewSender.status($r('app.string.keyboard_unavailable', detail.code));
    }
  }

  onDestroy(): void {
    this.active = false;
    const ability = this.ability;
    if (ability === null) {
      return;
    }
    ability.offInputStart();
    ability.offInputStop(this.inputStopCallback);
    previewSender.setClient(undefined);
    const panel = this.panel;
    this.panel = undefined;
    if (panel !== undefined) {
      ability.destroyPanel(panel).catch((error: Error): void => {
        previewSender.status($r('app.string.keyboard_close_failed', error.code));
      });
    }
  }
}
