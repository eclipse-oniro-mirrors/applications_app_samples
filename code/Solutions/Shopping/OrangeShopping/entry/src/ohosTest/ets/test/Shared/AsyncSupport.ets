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
 * Exception observation helpers. They only report whether the action threw;
 * every assertion stays inside the calling test case.
 */
export function throwsSync(action: () => void): boolean {
  try {
    action();
    return false;
  } catch (error) {
    return true;
  }
}

/** Awaits the action, so a promise that rejects late is not counted as success. */
export async function throwsAsync(action: () => Promise<void>): Promise<boolean> {
  try {
    await action();
    return false;
  } catch (error) {
    return true;
  }
}
