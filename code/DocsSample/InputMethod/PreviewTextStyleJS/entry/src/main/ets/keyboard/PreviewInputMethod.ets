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

import { InputMethodExtensionAbility, inputMethodEngine } from '@kit.IMEKit';
import { display } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { previewSender } from './PreviewSender';

export default class PreviewInputMethod extends InputMethodExtensionAbility {
  private ability: inputMethodEngine.InputMethodAbility = inputMethodEngine.getInputMethodAbility();
  private panel: inputMethodEngine.Panel | undefined = undefined;
  private active: boolean = false;
  private inputStopCallback: () => void = (): void => {
    previewSender.setClient(undefined);
  };

  onCreate(): void {
    previewSender.setPreviewText(this.context.resourceManager.getStringSync($r('app.string.preview_text').id));
    this.active = true;
    this.ability.on('inputStart', (_keyboard: inputMethodEngine.KeyboardController,
      client: inputMethodEngine.InputClient): void => {
      previewSender.setClient(client);
    });
    this.ability.on('inputStop', this.inputStopCallback);
    this.createKeyboard();
  }

  private async createKeyboard(): Promise<void> {
    try {
      const panel = await this.ability.createPanel(this.context, {
        type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
        flag: inputMethodEngine.PanelFlag.FLG_FIXED
      });
      if (!this.active) {
        await this.ability.destroyPanel(panel);
        return;
      }
      this.panel = panel;
      const screen = display.getDefaultDisplaySync();
      await panel.resize(screen.width, Math.round(screen.height * 0.38));
      await panel.setUiContent('keyboard/KeyboardPanel');
    } catch (error) {
      const detail = error as BusinessError;
      previewSender.status($r('app.string.keyboard_unavailable', detail.code));
    }
  }

  onDestroy(): void {
    this.active = false;
    this.ability.off('inputStart');
    this.ability.off('inputStop', this.inputStopCallback);
    previewSender.setClient(undefined);
    const panel = this.panel;
    this.panel = undefined;
    if (panel !== undefined) {
      this.ability.destroyPanel(panel).catch((error: BusinessError): void => {
        previewSender.status($r('app.string.keyboard_close_failed', error.code));
      });
    }
  }
}
