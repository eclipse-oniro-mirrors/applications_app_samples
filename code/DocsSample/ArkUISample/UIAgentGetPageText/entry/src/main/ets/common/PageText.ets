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

// [Start ui_page_text_parse]
export interface PageTextItem {
  // Native node id; this is different from the ArkTS component's .id('sampleText').
  id: number;
  // [x, y, width, height] in physical pixels, relative to the target window.
  rect: number[];
  content: string;
}

export interface PageTextResult {
  schemaVersion: number;
  texts: PageTextItem[];
}

export function parsePageText(json: string): PageTextResult {
  const result = JSON.parse(json) as PageTextResult;
  if (result.schemaVersion !== 1 || !Array.isArray(result.texts)) {
    throw new Error('Unsupported page text schema');
  }
  return result;
}
// [End ui_page_text_parse]
