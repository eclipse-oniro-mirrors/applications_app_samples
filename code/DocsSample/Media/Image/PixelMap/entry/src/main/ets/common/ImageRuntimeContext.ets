/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

// Resolve only when an operation executes; imports never require a UI call-chain context.
// Tests pass a real AbilityDelegator-derived test module Context; UI callers pass their actual host context.
export function resolveImageContext(runtimeContext?: Context): Context {
  if (runtimeContext) {
    return runtimeContext;
  }
  const currentContext: Context = getContext();
  if (!currentContext) {
    throw new Error('A real Ability context is required for image cache/resource operations');
  }
  return currentContext;
}
