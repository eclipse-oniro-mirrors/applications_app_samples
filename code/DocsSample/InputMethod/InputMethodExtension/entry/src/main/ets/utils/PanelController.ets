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
 * 输入法面板控制器：只在 InputMethodExtensionAbility 进程里使用。
 *
 * 面板的创建顺序来自官方开发指导：getInputMethodAbility().createPanel(ctx, info)
 * → panel.resize(宽, 高) → panel.setUiContent('页面路径')。面板页必须注册在
 * main_pages.json 里，否则 setUiContent 会失败。
 *
 * 这里不在 onCreate 就建面板：面板应当等到 inputStart（编辑框真的绑上来）再建，
 * 否则会留下一个没有输入目标的空面板。onCreate 只登记事件，onDestroy 负责销毁。
 */

import { common } from '@kit.AbilityKit';
import { display } from '@kit.ArkUI';
import { inputMethodEngine } from '@kit.IMEKit';
import { API_TIMEOUT_MS } from '../common/AppConstants';
import { text } from '../common/L10n';
import { ApiStatus, CallOutcome, failedOutcome, okOutcome } from '../model/CallOutcome';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';
import { isTimeoutError, timeoutText, withTimeout } from './AsyncUtil';
import { Logger } from './Logger';

/** 日志来源标识；面板状态文本进界面，这里只标识日志来源 */
const SOURCE: string = 'Panel';
const API_NAME: string = 'createPanel';
/** 面板页的路径：与 main_pages.json 里登记的 src 一致，不带 .ets 后缀 */
export const KEYBOARD_PAGE_PATH: string = 'inputmethodextensionability/pages/KeyboardPage';
const PANEL_HEIGHT_RATIO: number = 0.42;
const PANEL_MIN_HEIGHT: number = 240;
const PANEL_FALLBACK_WIDTH: number = 720;
const PANEL_FALLBACK_HEIGHT: number = 360;

export class PanelController {
  private panel: inputMethodEngine.Panel | undefined = undefined;
  /** 空串表示"尚未创建面板"：初始值在资源管理器绑定前就写死，只能在读取时再取文案 */
  private status: string = '';

  hasPanel(): boolean {
    return this.panel !== undefined;
  }

  statusText(): string {
    return this.status === '' ? text('panel_status_none') : this.status;
  }

  /**
   * 创建面板并挂载键盘页。重复调用复用已有面板，避免同一输入法进程里出现两个固定面板。
   */
  async ensurePanel(context: common.BaseContext): Promise<CallOutcome> {
    if (this.panel !== undefined) {
      Logger.info(SOURCE, 'Reuse', 'panel exists, skip createPanel');
      return okOutcome(API_NAME, text('panel_summary_reuse'), this.statusText(), 0);
    }
    const start = Date.now();
    let step: string = 'createPanel';
    try {
      const ability = inputMethodEngine.getInputMethodAbility();
      const info: inputMethodEngine.PanelInfo = {
        type: inputMethodEngine.PanelType.SOFT_KEYBOARD,
        flag: inputMethodEngine.PanelFlag.FLG_FIXED
      };
      const panel = await withTimeout(ability.createPanel(context, info), API_TIMEOUT_MS);
      step = 'resize';
      const size = panelSize();
      await withTimeout(panel.resize(size.width, size.height), API_TIMEOUT_MS);
      step = 'setUiContent';
      await withTimeout(panel.setUiContent(KEYBOARD_PAGE_PATH), API_TIMEOUT_MS);
      this.panel = panel;
      this.status = text('panel_status_mounted', KEYBOARD_PAGE_PATH, size.width, size.height);
      Logger.info(SOURCE, 'Success', this.status);
      return okOutcome(API_NAME, text('panel_summary_created', size.width, size.height),
        text('panel_detail_created', KEYBOARD_PAGE_PATH), Date.now() - start);
    } catch (err) {
      const outcome = this.failureOutcome(step, err, start);
      Logger.error(SOURCE, step, outcome.describe());
      return outcome;
    }
  }

  /** 销毁面板：只清自己创建的那个，重复调用安全 */
  async destroyPanel(): Promise<void> {
    const current = this.panel;
    if (current === undefined) {
      return;
    }
    this.panel = undefined;
    try {
      const ability = inputMethodEngine.getInputMethodAbility();
      await ability.destroyPanel(current);
      this.status = text('panel_status_destroyed');
      Logger.info(SOURCE, 'Destroy', this.status);
    } catch (err) {
      this.status = text('panel_status_destroy_failed');
      Logger.error(SOURCE, 'destroyPanel', `${messageOfThrown(err)}`);
    }
  }

  private failureOutcome(step: string, err: Object, start: number): CallOutcome {
    if (isTimeoutError(err)) {
      return failedOutcome(`${API_NAME}·${step}`, ApiStatus.EMPTY_RESULT, -3, timeoutText(API_TIMEOUT_MS),
        text('panel_detail_timeout'), Date.now() - start);
    }
    const code = codeOfThrown(err);
    return failedOutcome(`${API_NAME}·${step}`, ApiStatus.INTERNAL, code, messageOfThrown(err),
      text('panel_detail_register_hint'), Date.now() - start);
  }
}

class PanelSize {
  public width: number;
  public height: number;

  constructor(width: number, height: number) {
    this.width = width;
    this.height = height;
  }
}

/** 固定面板的尺寸：宽度铺满屏幕，高度按比例取，保证键盘区可用但不占满整屏 */
function panelSize(): PanelSize {
  try {
    const info = display.getDefaultDisplaySync();
    const height = Math.max(PANEL_MIN_HEIGHT, Math.round(info.height * PANEL_HEIGHT_RATIO));
    return new PanelSize(info.width, height);
  } catch (err) {
    // 取不到屏幕信息时给一个保守尺寸：宁可面板偏窄，也不要因为建面板失败而让键盘不可见
    Logger.warn(SOURCE, 'panelSize', `read screen size failed, use default size: ${err}`);
    return new PanelSize(PANEL_FALLBACK_WIDTH, PANEL_FALLBACK_HEIGHT);
  }
}

/** 扩展进程内共享一个控制器：Ability 与键盘页读同一份状态 */
export const panelController: PanelController = new PanelController();
