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

export interface PropertySnapshot {
  hasGetter: boolean;
  hasSetter: boolean;
  enumerable: boolean;
  configurable: boolean;
}

// Reflective inspection stays in the TypeScript side of this mixed-language app.
export function inspectProperty(object: Object, key: string): PropertySnapshot {
  const descriptor = Object.getOwnPropertyDescriptor(object, key);
  if (!descriptor) {
    throw new Error('Property is missing: ' + key);
  }
  return {
    hasGetter: typeof descriptor.get === 'function',
    hasSetter: typeof descriptor.set === 'function',
    enumerable: descriptor.enumerable === true,
    configurable: descriptor.configurable === true
  };
}
