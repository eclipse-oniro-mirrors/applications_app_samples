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

/** 取字节序列，便于把期望值写成可读的十进制串 */
export function bytesOf(buffer: ArrayBuffer): number[] {
  const view = new Uint8Array(buffer);
  const values: number[] = [];
  for (let i = 0; i < view.length; i++) {
    values.push(view[i]);
  }
  return values;
}

export function bytesText(values: number[]): string {
  return values.join(',');
}
