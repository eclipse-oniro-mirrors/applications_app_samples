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

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';

export async function waitForEntryForeground(timeoutMs: number = 10000): Promise<void> {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator();
  const deadline: number = Date.now() + timeoutMs;
  let observation: string = 'No foreground EntryAbility observed';
  while (Date.now() < deadline) {
    try {
      const ability: UIAbility = await delegator.getCurrentTopAbility();
      if (ability !== null && ability !== undefined && ability.context !== undefined &&
          ability.context.abilityInfo !== undefined) {
        const name: string = ability.context.abilityInfo.name;
        const bundle: string = ability.context.applicationInfo.name;
        const state: number = delegator.getAbilityState(ability);
        observation = bundle + '/' + name + ' state=' + state.toString();
        if (name === 'EntryAbility' && bundle === 'com.samples.applicationcontext' &&
            state === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND) {
          return;
        }
      }
    } catch (error) {
      const failure: Error = error as Error;
      observation = 'Foreground query rejected: ' + failure.message;
    }
    await new Promise<void>((resolve: () => void): void => {
      setTimeout((): void => {
        resolve();
      }, 50);
    });
  }
  throw new Error('EntryAbility foreground readiness timed out: ' + observation);
}
