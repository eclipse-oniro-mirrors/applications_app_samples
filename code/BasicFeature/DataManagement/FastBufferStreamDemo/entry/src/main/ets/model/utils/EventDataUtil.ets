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

import { emitter } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';

const UTF8_DECODER: util.TextDecoder = new util.TextDecoder('utf-8');

/** 将字节块解码为 UTF-8 字符串 */
export function decodeUtf8(value: Uint8Array): string {
  return UTF8_DECODER.decodeToString(value);
}

/** 从流事件的 data 中安全取出 Error（替代不安全的 as Error） */
export function eventDataToError(data: emitter.EventData): Error {
  const value: Object | undefined = data.data;
  if (value instanceof Error) {
    return value;
  }
  return new Error(typeof value === 'string' ? value : 'Unknown error');
}

/** 从流事件的 data 中安全取出字符串（替代不安全的 as Object as string） */
export function eventDataToText(data: emitter.EventData): string {
  const value: Object | undefined = data.data;
  if (typeof value === 'string') {
    return value;
  }
  if (value instanceof Uint8Array) {
    return UTF8_DECODER.decodeToString(value);
  }
  return '';
}
