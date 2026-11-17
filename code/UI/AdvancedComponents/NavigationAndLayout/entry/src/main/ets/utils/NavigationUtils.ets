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

import { MultiNavPathStack, SplitPolicy } from '@kit.ArkUI';

/** Provides Navigation Utils helpers for the sample. */
export class NavigationUtils {
  static policyName(policy: SplitPolicy): string {
    switch (policy) {
      case SplitPolicy.HOME_PAGE:
        return 'HOME_PAGE';
      case SplitPolicy.DETAIL_PAGE:
        return 'DETAIL_PAGE';
      case SplitPolicy.FULL_PAGE:
        return 'FULL_PAGE';
      default:
        return 'UNKNOWN';
    }
  }

  static stackSummary(stack: MultiNavPathStack): string {
    const names = stack.getAllPathName();
    return names.length === 0 ? '(empty)' : names.join(' > ');
  }

  static pathSummary(names: string[]): string {
    return names.length === 0 ? '(empty)' : names.join(' > ');
  }
}
