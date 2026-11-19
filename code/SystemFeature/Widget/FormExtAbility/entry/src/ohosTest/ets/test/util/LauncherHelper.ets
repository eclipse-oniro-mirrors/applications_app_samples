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

import { abilityDelegatorRegistry } from '@kit.TestKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
export const SAMPLE_LAUNCHER_BUNDLE: string = 'ohos.samples.launcher';

export async function isSampleLauncherInstalled(): Promise<boolean> {
  try {
    const result: abilityDelegatorRegistry.ShellCmdResult = await abilityDelegatorRegistry.getAbilityDelegator()
      .executeShellCommand(`bm dump -n ${SAMPLE_LAUNCHER_BUNDLE}`);
    return JSON.stringify(result).indexOf(SAMPLE_LAUNCHER_BUNDLE) >= 0;
  } catch (err) {
    hilog.info(DOMAIN, TAG, `check sample launcher failed: ${JSON.stringify(err)}`);
    return false;
  }
}
