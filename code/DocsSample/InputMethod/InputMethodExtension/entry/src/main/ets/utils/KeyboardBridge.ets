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
import { Logger } from './Logger';

const SOURCE: string = '键盘';

export class KeyboardBridge {
  private static client: inputMethodEngine.InputClient | undefined = undefined;
  private static status: string = '未连接编辑框（壳外预览）';

  static attach(client: inputMethodEngine.InputClient): void {
    KeyboardBridge.client = client;
    KeyboardBridge.status = '已连接编辑框，输入将写入真实编辑框';
    Logger.info(SOURCE, 'inputStart', KeyboardBridge.status);
  }

  static detach(): void {
    KeyboardBridge.client = undefined;
    KeyboardBridge.status = '编辑框已解绑，回到壳外预览';
    Logger.info(SOURCE, 'inputStop', KeyboardBridge.status);
  }

  static hasClient(): boolean {
    return KeyboardBridge.client !== undefined;
  }

  static statusText(): string {
    return KeyboardBridge.status;
  }

  /** 返回 true 表示编辑框接受了文本；false 表示当前没有编辑框或编辑框拒绝 */
  static async insertText(text: string): Promise<boolean> {
    const current = KeyboardBridge.client;
    if (current === undefined) {
      return false;
    }
    try {
      const accepted = await current.insertText(text);
      Logger.debug(SOURCE, 'insertText', `${accepted ? '已上屏' : '被拒绝'}：${text}`);
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
      Logger.debug(SOURCE, 'deleteBackward', `${accepted ? '已删除' : '被拒绝'}：${length} 个字符`);
      return accepted;
    } catch (err) {
      Logger.error(SOURCE, 'deleteBackward', `${err}`);
      return false;
    }
  }
}
