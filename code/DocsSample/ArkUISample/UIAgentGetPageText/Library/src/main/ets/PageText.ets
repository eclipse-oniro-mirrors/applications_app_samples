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

import type { UIContext } from '@kit.ArkUI';
import { getPageText } from 'libpagetext.so';

// [Start ui_page_text_parse]
export interface PageTextItem {
  // 原生节点 ID；它与 ArkTS 组件的 .id('sampleText') 不同。
  id: number;
  // 相对于目标窗口的物理像素坐标 [x, y, width, height]。
  rect: number[];
  content: string;
}

export interface PageTextResult {
  schemaVersion: number;
  texts: PageTextItem[];
}

/** 解析原生页面文本 API 返回的带版本 JSON。 */
export function parsePageText(json: string): PageTextResult {
  const result: PageTextResult = JSON.parse(json) as PageTextResult;
  if (result.schemaVersion !== 1 || !Array.isArray(result.texts)) {
    throw new Error('Unsupported page text schema');
  }
  return result;
}
// [End ui_page_text_parse]

export interface PageTextSnapshot {
  json: string;
  textCount: number;
}

/** 在目标 UI 线程上同步采集，然后再显示结果。 */
export function collectPageText(context: UIContext): PageTextSnapshot {
  const json: string = getPageText(context);
  const result: PageTextResult = parsePageText(json);
  return { json: json, textCount: result.texts.length };
}
