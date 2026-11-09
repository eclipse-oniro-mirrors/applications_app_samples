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
 * 在 UIAbility 里调用 createPanel 的负向实测。
 *
 * d.ts 写明：createPanel 只能由 InputMethodExtensionAbility 里的输入法应用调用，
 * 否则抛 12800004 - not an input method application。本示例的演示页都跑在 UIAbility 进程，
 * 所以这里是一个**真实的失败点**：页面展示它，用例断言它，README 也只写实测到的码。
 * 若某台设备真的返回了面板（说明进程身份被当成输入法），这里立刻销毁并如实报告"意外成功"，
 * 不把成功改写成失败，也不留下一个无人控制的空面板。
 */

import { common } from '@kit.AbilityKit';
import { inputMethodEngine } from '@kit.IMEKit';
import { API_TIMEOUT_MS } from '../common/AppConstants';
import { text } from '../common/StringResource';
import { ApiStatus, CallOutcome, classifyErrorCode, failedOutcome, okOutcome } from '../model/CallOutcome';
import { codeOfThrown, messageOfThrown } from './ErrorUtil';
import { isTimeoutError, timeoutText, withTimeout } from './AsyncUtil';

const API_NAME: string = 'createPanel';

/** 默认的负向实测：软键盘 + 固定面板，与面板演示页的按钮一致 */
export async function probeCreatePanel(context: common.BaseContext): Promise<CallOutcome> {
  return probePanelInfo(context, inputMethodEngine.PanelType.SOFT_KEYBOARD,
    inputMethodEngine.PanelFlag.FLG_FIXED, text('probe_label_soft_fixed'));
}

/**
 * 指定面板类型与状态做一次 createPanel。label 只用于结果文案，
 * 让不同组合的用例在报告里能区分开。
 */
export async function probePanelInfo(context: common.BaseContext, type: inputMethodEngine.PanelType,
                                    flag: inputMethodEngine.PanelFlag, label: string): Promise<CallOutcome> {
  const start = Date.now();
  const info: inputMethodEngine.PanelInfo = {
    type: type,
    flag: flag
  };
  try {
    const ability = inputMethodEngine.getInputMethodAbility();
    const panel = await withTimeout(ability.createPanel(context, info), API_TIMEOUT_MS);
    let destroyed: boolean = false;
    try {
      await ability.destroyPanel(panel);
      destroyed = true;
    } catch (err) {
      destroyed = false;
    }
    return okOutcome(API_NAME, text('probe_summary_unexpected', label),
      text('probe_detail_unexpected',
        destroyed ? text('probe_destroyed_ok') : text('probe_destroyed_failed')),
      Date.now() - start);
  } catch (err) {
    if (isTimeoutError(err)) {
      return failedOutcome(API_NAME, ApiStatus.EMPTY_RESULT, -3, timeoutText(API_TIMEOUT_MS),
        text('probe_detail_timeout'), Date.now() - start);
    }
    const code = codeOfThrown(err);
    const status = classifyErrorCode(code);
    return failedOutcome(API_NAME, status, code, text('probe_summary_labelled', label, messageOfThrown(err)),
      statusHintText(status), Date.now() - start);
  }
}

function statusHintText(status: ApiStatus): string {
  if (status === ApiStatus.INPUT_METHOD) {
    return text('probe_hint_expected');
  }
  if (status === ApiStatus.UNSUPPORTED) {
    return text('probe_hint_unsupported');
  }
  return text('probe_hint_unknown');
}
