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

// [Start manage_agent_sessions]

import { inputMethodEngine } from '@kit.IMEKit';
import type { KeyEvent } from '@kit.InputKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_InAppCustomKeyboard]';

export class InAppKeyboardSession {
  // 保存代理对象和最近一次绑定的编辑会话，实例在获取前为空。
  private ability: inputMethodEngine.ProxyInputMethodAbility | null = null;
  private delegate: inputMethodEngine.ProxyKeyboardDelegate | null = null;
  private client: inputMethodEngine.ProxyTextInputClient | null = null;
  private controller: inputMethodEngine.ProxyKeyboardController | null = null;
  private active: boolean = true;
  private registered: boolean = false;
  private registering: boolean = false;
  private disposed: boolean = false;
  private generation: number = 0;
  private updateVisible: (visible: boolean) => void;

  constructor(updateVisible: (visible: boolean) => void) {
    this.updateVisible = updateVisible;
  }

  // 编辑框绑定时更新客户端和控制器，后续操作使用最新实例。
  private handleInputStart: inputMethodEngine.ProxyInputStartCallback =
    (client: inputMethodEngine.ProxyTextInputClient, controller: inputMethodEngine.ProxyKeyboardController) => {
    if (this.active) {
      this.client = client;
      this.controller = controller;
    }
  };
  private handleShow: () => void = () => {
    if (this.active) { this.updateVisible(true); }
  };
  private handleHide: () => void = () => {
    if (this.active) { this.updateVisible(false); }
  };
  // 被动注销后清理失效实例，并尝试在应用获焦时重新注册。
  private handleUnregister: () => void = () => {
    this.client = null;
    this.controller = null;
    this.registered = false;
    if (this.active) {
      this.updateVisible(false);
      // 未获焦时注册会失败，页面通过窗口获焦事件再次发起注册。
      this.register().catch((error: BusinessError) => {
        hilog.error(DOMAIN, TAG, 'Re-registration after passive unregister failed. Code: %{public}d, message: %{public}s',
          error.code, error.message);
      });
    }
  };
  // 返回false，将物理按键事件继续交给编辑框处理。
  private handleKeyEvent: inputMethodEngine.InputKeyEventCallback = (event: KeyEvent) => {
    return false;
  };

  /**
   * 允许当前页面注册代理输入法并进行文本操作。
   * 递增generation计数器，用于在注册完成后识别过期的注册结果。
   */
  activate(): void {
    this.generation++;
    this.active = true;
  }

  /**
   * 注册应用内代理输入法。先订阅输入法回调，再调用registerInAppProxyIme。
   * 通过registering标记避免重复注册。
   * 注册完成后比较generation计数器的值，判断该结果是否仍属于当前会话。
   * @returns Promise对象，无返回结果。注册失败时可捕获BusinessError。
   */
  async register(): Promise<void> {
    if (!this.active || this.registering || this.registered) { return; }
    this.registering = true;
    const generation: number = this.generation;
    try {
      // 先获取对象并订阅回调，再注册代理，避免错过立即触发的绑定事件。
      if (this.ability === null) {
        const ability: inputMethodEngine.ProxyInputMethodAbility | null =
          inputMethodEngine.getProxyInputMethodAbility();
        if (ability === null) {
          throw new Error('ProxyInputMethodAbility is unavailable.');
        }
        this.ability = ability;
        ability.onInputStart(this.handleInputStart);
        ability.onKeyboardShow(this.handleShow);
        ability.onKeyboardHide(this.handleHide);
        ability.onUnregister(this.handleUnregister);
      }
      if (this.delegate === null) {
        const delegate: inputMethodEngine.ProxyKeyboardDelegate | null = inputMethodEngine.getProxyKeyboardDelegate();
        if (delegate === null) {
          throw new Error('ProxyKeyboardDelegate is unavailable.');
        }
        this.delegate = delegate;
        delegate.onKeyEvent(this.handleKeyEvent);
      }
      // 仅为普通文本编辑框启用自定义键盘。
      await inputMethodEngine.registerInAppProxyIme({
        inputPatternTypes: [inputMethodEngine.PATTERN_TEXT]
      });
      this.registered = true;
      // 注册完成时若页面已离开，须立即注销，避免残留注册。
      if (!this.active || generation !== this.generation) {
        await inputMethodEngine.unregisterInAppProxyIme();
        this.registered = false;
      }
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
      return Promise.reject<void>(err);
    } finally {
      this.registering = false;
    }
  }

  /**
   * 通过代理文本客户端在当前编辑框的光标位置插入文本。
   * @param text - 待插入的文本。
   * @returns Promise对象，无返回结果。
   */
  async insert(text: string): Promise<void> {
    const client: inputMethodEngine.ProxyTextInputClient | null = this.client;
    if (!this.active || client === null) { return; }
    try {
      await client.insertText(text);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
    }
  }

  /**
   * 通过代理文本客户端删除光标前的一个字符，实现退格操作。
   * @returns Promise对象，无返回结果。
   */
  async deleteBeforeCursor(): Promise<void> {
    const client: inputMethodEngine.ProxyTextInputClient | null = this.client;
    if (!this.active || client === null) { return; }
    try {
      await client.deleteForward(1);
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
    }
  }

  /**
   * 隐藏自定义键盘，再通过hideSelf通知框架和编辑框。
   * @returns Promise对象，无返回结果。
   */
  async hide(): Promise<void> {
    const controller: inputMethodEngine.ProxyKeyboardController | null = this.controller;
    if (!this.active || controller === null) { return; }
    this.updateVisible(false);
    try {
      await controller.hideSelf();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
    }
  }

  /**
   * 注销应用内代理输入法，并清理文本客户端和键盘控制器引用。
   * @returns Promise对象，无返回结果。注销失败时可捕获BusinessError。
   */
  async unregister(): Promise<void> {
    if (!this.registered) { return; }
    this.registered = false;
    this.client = null;
    this.controller = null;
    try {
      await inputMethodEngine.unregisterInAppProxyIme();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
      return Promise.reject<void>(err);
    }
  }

  /**
   * 释放会话，注销代理、退订全部输入法回调并清理引用。
   * 通过disposed标记避免重复释放。
   * @returns Promise对象，无返回结果。
   */
  async dispose(): Promise<void> {
    if (this.disposed) { return; }
    this.disposed = true;
    this.active = false;
    this.generation++;
    this.registered = false;
    this.client = null;
    this.controller = null;
    try {
      await inputMethodEngine.unregisterInAppProxyIme();
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', err.code, err.message);
    } finally {
      const ability: inputMethodEngine.ProxyInputMethodAbility | null = this.ability;
      const delegate: inputMethodEngine.ProxyKeyboardDelegate | null = this.delegate;
      try {
        if (ability !== null) {
          ability.offInputStart(this.handleInputStart);
          ability.offKeyboardShow(this.handleShow);
          ability.offKeyboardHide(this.handleHide);
          ability.offUnregister(this.handleUnregister);
        }
        if (delegate !== null) {
          delegate.offKeyEvent(this.handleKeyEvent);
        }
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        hilog.error(DOMAIN, TAG, 'Failed to remove proxy listeners. Code: %{public}d, message: %{public}s',
          err.code, err.message);
      }
      this.ability = null;
      this.delegate = null;
      this.updateVisible(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'InAppKeyboardSample: disposed');
    }
  }
}
// [End manage_agent_sessions]
