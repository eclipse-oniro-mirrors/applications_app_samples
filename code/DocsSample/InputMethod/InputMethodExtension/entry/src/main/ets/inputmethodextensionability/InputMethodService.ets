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
import { bindResourceManager } from '../common/L10n';
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
    // 面板页与 KeyboardBridge 的文案都来自 string.json，先绑定本进程的资源管理器
    bindResourceManager(this.context.resourceManager);
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
        Logger.info(SOURCE, 'inputStop', 'editor unbound, panel destroy requested');
        // 回调签名为 void，无法 await：销毁结果在 destroyPanel 内部落日志，这里只兜住异常
        panelController.destroyPanel().then(() => {
          Logger.info(SOURCE, 'inputStop', `panel teardown finished: ${panelController.statusText()}`);
        });
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

  /** 扩展销毁前先把面板异步销毁做完，避免进程被系统回收时面板资源还没释放 */
  async onDestroy(): Promise<void> {
    await panelController.destroyPanel();
    Logger.info(SOURCE, 'onDestroy', 'ime extension destroyed, panel teardown finished');
  }
}
