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

/**
 * 输入法扩展 Ability：被系统拉起后接管编辑框的连接。
 *
 * 生命周期与面板的关系：
 * onCreate 只登记 inputStart / inputStop，不建面板；
 * inputStart 拿到 InputClient 后才创建面板并挂载键盘页；
 * inputStop / onDestroy 解绑并销毁面板，避免留下无人控制的空面板。
 *
 * 注意：扩展运行在独立进程，这里写入 AppStorage 的日志本应用的 UIAbility 读不到，
 * 排查时请用 hilog 过滤 tag InputMethodExt。
 */

import { Want } from '@kit.AbilityKit';
import { InputMethodExtensionAbility, inputMethodEngine } from '@kit.IMEKit';
import { StorageKeys } from '../common/AppConstants';
import { LogItem } from '../model/LogStore';
import { CallOutcome } from '../model/CallOutcome';
import { Logger } from '../utils/Logger';
import { KeyboardBridge } from '../utils/KeyboardBridge';
import { panelController } from '../utils/PanelController';

const SOURCE: string = 'InputMethodAbility';

export default class InputMethodService extends InputMethodExtensionAbility {
  onCreate(want: Want): void {
    if (!AppStorage.has(StorageKeys.APP_LOGS)) {
      AppStorage.setOrCreate<LogItem[]>(StorageKeys.APP_LOGS, []);
    }
    Logger.info(SOURCE, 'onCreate', `ime extension created, want=${want.abilityName}`);
    this.registerEvents();
  }

  private registerEvents(): void {
    try {
      const ability = inputMethodEngine.getInputMethodAbility();
      ability.on('inputStart', (controller: inputMethodEngine.KeyboardController,
        client: inputMethodEngine.InputClient) => {
        KeyboardBridge.attach(client);
        Logger.info(SOURCE, 'inputStart', 'editor bound, preparing panel');
        this.preparePanel();
      });
      ability.on('inputStop', () => {
        KeyboardBridge.detach();
        panelController.destroyPanel();
        Logger.info(SOURCE, 'inputStop', 'editor unbound, panel destroyed');
      });
      Logger.info(SOURCE, 'Register', 'inputStart / inputStop registered');
    } catch (err) {
      Logger.error(SOURCE, 'Register', `register events failed: ${err}`);
    }
  }

  private preparePanel(): void {
    panelController.ensurePanel(this.context).then((outcome: CallOutcome) => {
      Logger.info(SOURCE, 'Panel', outcome.describe());
    }).catch((err: Object) => {
      Logger.error(SOURCE, 'Panel', `create panel failed: ${err}`);
    });
  }

  onDestroy(): void {
    Logger.info(SOURCE, 'onDestroy', 'ime extension destroyed');
    panelController.destroyPanel();
  }
}
