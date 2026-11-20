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

const LENGTH_UNITS: string[] = ['vp', 'fp', 'lpx', 'px'];

// 将 Area 上报的 Length 转换为 vp 数值，RenderNode.frame 使用 vp。
export function toVp(value: Length): number {
  if (typeof value === 'number') {
    return value;
  }
  if (typeof value === 'string') {
    // 部分版本会带单位后缀（如 '144vp'），直接 Number 会得到 NaN 并把画布静默缩成 0 尺寸。
    const text: string = value.trim();
    let numberText: string = text;
    for (let index = 0; index < LENGTH_UNITS.length; index++) {
      const unit: string = LENGTH_UNITS[index];
      if (text.endsWith(unit)) {
        numberText = text.substring(0, text.length - unit.length);
        break;
      }
    }
    const parsed: number = Number(numberText);
    return Number.isNaN(parsed) ? 0 : parsed;
  }
  return 0;
}
