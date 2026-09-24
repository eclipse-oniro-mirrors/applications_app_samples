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

import { bundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

let bundleFlags = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_HAP_MODULE |
  bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_ABILITY;

export interface BundleInfo {
  bundleName: string,
  abilityName: string
}

export function getBundleInfo(): BundleInfo | undefined {
  try {
    let data: bundleManager.BundleInfo = bundleManager.getBundleInfoForSelfSync(bundleFlags);
    hilog.info(0x0000, 'testTag', 'getBundleInfoForSelf successfully. Data: %{public}s', JSON.stringify(data));
    return {
      bundleName: data.hapModulesInfo[0].abilitiesInfo[0].bundleName,
      abilityName: data.hapModulesInfo[0].abilitiesInfo[0].name
    };
  } catch (err) {
    let message = (err as BusinessError).message;
    hilog.error(0x0000, 'testTag', 'getBundleInfoForSelf failed: %{public}s', message);
  }
  return undefined;
}
