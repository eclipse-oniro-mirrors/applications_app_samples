/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { util } from '@kit.ArkTS';

export const MAX_DISPLAY_LENGTH: number = 2000;

export function limitDisplayText(text: string): string {
  let end: number = Math.min(text.length, MAX_DISPLAY_LENGTH);
  if (end > 0 && end < text.length) {
    const previous: number = text.charCodeAt(end - 1);
    const next: number = text.charCodeAt(end);
    if (previous >= 0xD800 && previous <= 0xDBFF && next >= 0xDC00 && next <= 0xDFFF) {
      end--;
    }
  }
  return text.substring(0, end);
}

export function insertZeroWidthSpaces(text: string): string {
  const segments: string[] = [];
  let offset: number = 0;
  while (offset < text.length) {
    const first: number = text.charCodeAt(offset);
    const second: number = text.charCodeAt(offset + 1);
    const surrogatePair: boolean = first >= 0xD800 && first <= 0xDBFF && second >= 0xDC00 && second <= 0xDFFF;
    const lineBreakPair: boolean = first === 0x0D && second === 0x0A;
    const width: number = surrogatePair || lineBreakPair ? 2 : 1;
    segments.push(text.substring(offset, offset + width));
    offset += width;
  }
  return segments.join('\u200B');
}

export function decodeDisplayText(bytes: Uint8Array): string {
  if (bytes.length === 0) {
    return '';
  }
  const decoded: string = util.TextDecoder.create().decodeToString(bytes);
  return limitDisplayText(decoded);
}
