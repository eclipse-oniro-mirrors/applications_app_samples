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
 * 键盘页到编辑框的通道。
 *
 * inputStart 回调会给出 InputClient，键盘上的每一次点击都要通过它写进真实编辑框：
 * insertText / deleteBackward 返回的 boolean 表示"编辑框是否接受了这次编辑"。
 * 没有被系统拉起时（自动化环境下的常态），client 为空，这里如实返回 false 让页面
 * 走预览分支——不伪造一次"已上屏"。
 */

import { inputMethodEngine } from '@kit.IMEKit';
import { text } from '../common/StringResource';
import { Logger } from './Logger';

/** 日志来源标识；与 status 文本不同，它只进日志面板，不参与界面文案 */
const SOURCE: string = 'Keyboard';

export class KeyboardBridge {
  private static client: inputMethodEngine.InputClient | undefined = undefined;
  /** 当前状态的资源名称：类加载早于资源管理器绑定，不能在这里存已解析的文案 */
  private static status: string = 'bridge_status_disconnected';

  static attach(client: inputMethodEngine.InputClient): void {
    KeyboardBridge.client = client;
    KeyboardBridge.status = 'bridge_status_connected';
    Logger.info(SOURCE, 'inputStart', KeyboardBridge.statusText());
  }

  static detach(): void {
    KeyboardBridge.client = undefined;
    KeyboardBridge.status = 'bridge_status_detached';
    Logger.info(SOURCE, 'inputStop', KeyboardBridge.statusText());
  }

  static hasClient(): boolean {
    return KeyboardBridge.client !== undefined;
  }

  static statusText(): string {
    return text(KeyboardBridge.status);
  }

  /** 返回 true 表示编辑框接受了文本；false 表示当前没有编辑框或编辑框拒绝 */
  static async insertText(value: string): Promise<boolean> {
    const current = KeyboardBridge.client;
    if (current === undefined) {
      return false;
    }
    try {
      const accepted = await current.insertText(value);
      Logger.debug(SOURCE, 'insertText', `${accepted ? 'sent' : 'rejected'}: ${value}`);
      return accepted;
    } catch (err) {
      Logger.error(SOURCE, 'insertText', `${err}`);
      return false;
    }
  }

  static async deleteBackward(length: number): Promise<boolean> {
    const current = KeyboardBridge.client;
    if (current === undefined) {
      return false;
    }
    try {
      const accepted = await current.deleteBackward(length);
      Logger.debug(SOURCE, 'deleteBackward', `${accepted ? 'deleted' : 'rejected'}: ${length} chars`);
      return accepted;
    } catch (err) {
      Logger.error(SOURCE, 'deleteBackward', `${err}`);
      return false;
    }
  }
}
