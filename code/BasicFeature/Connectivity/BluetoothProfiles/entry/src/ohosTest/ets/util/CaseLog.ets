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
 * 用例级日志：设备侧真实调用类用例（会真正调到 Bluetooth 接口的那些）在每个用例开始时打印 BEGIN、
 * 每个关键实参/实际返回值在其断言前打印 PARAM、用例走到结尾时打印 END。
 *
 * 失败时 hilog 里必然缺少对应的 END 行，再对照 PARAM 里打印的入参与实际值即可定位到具体哪一步，
 * 不必只靠 expect 的期望值/实际值回查。
 *
 * 过滤方式：hdc shell hilog -T BluetoothProfiles | findstr "\[Case\]"
 * 日志前缀、键名与状态名保持英文，与主工程 hilog 规范一致；PARAM 的值是该接口的真实返回值，
 * 可能是资源化后的中文文案，属定位必需，不带设备地址以外的敏感信息。
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { HILOG_DOMAIN, HILOG_TAG } from '../../../main/ets/common/AppConstants';

/** 单条参数日志最多保留的字符数，避免超长 message 或设备名把日志刷屏 */
const PARAM_MAX_CHARS: number = 160;

function abbreviate(value: string): string {
  if (value.length <= PARAM_MAX_CHARS) {
    return value;
  }
  return `${value.substring(0, PARAM_MAX_CHARS)}...(${value.length})`;
}

export class CaseLog {
  /** 用例开始时调用，标记后续 PARAM/END 行归属于哪条用例 */
  static begin(caseName: string): void {
    hilog.info(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Case][BEGIN] ${caseName}`);
  }

  /** 断言前打印关键参数：入参、接口返回码、实际状态或结果文案 */
  static param(caseName: string, key: string, value: string | number | boolean): void {
    const text: string = abbreviate(String(value));
    hilog.info(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Case][PARAM] ${caseName} ${key}=${text}`);
  }

  /** 用例正常走到结尾时调用；日志里缺这一行即说明中途抛异常或断言失败 */
  static end(caseName: string): void {
    hilog.info(HILOG_DOMAIN, HILOG_TAG, '%{public}s', `[Case][END] ${caseName}`);
  }
}
