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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';

export default class OpenHarmonyTestRunner implements TestRunner {
    onPrepare(): void {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
    }

    // 屏幕熄灭时被测窗口会退到后台，无障碍树为空，导致所有 findComponent 落空；
    // 因此执行用例前先点亮屏幕并置为常亮，避免长时间回归中途息屏。
    private async ensureScreenOn(delegator: abilityDelegatorRegistry.AbilityDelegator): Promise<void> {
        try {
            const wakeResult = await delegator.executeShellCommand('power-shell wakeup');
            hilog.info(DOMAIN, TAG, 'power-shell wakeup: %{public}s', wakeResult.stdResult.trim());
        } catch (e) {
            hilog.warn(DOMAIN, TAG, 'power-shell wakeup failed: %{public}s', JSON.stringify(e));
        }
        try {
            const modeResult = await delegator.executeShellCommand('power-shell setmode 602');
            hilog.info(DOMAIN, TAG, 'power-shell setmode: %{public}s', modeResult.stdResult.trim());
        } catch (e) {
            hilog.warn(DOMAIN, TAG, 'power-shell setmode failed: %{public}s', JSON.stringify(e));
        }
    }

    async onRun(): Promise<void> {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
        const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        await this.ensureScreenOn(abilityDelegator);
        const testAbilityName = `${abilityDelegatorArguments.bundleName}.TestAbility`;
        await abilityDelegator.addAbilityMonitor({
            abilityName: testAbilityName,
            onAbilityCreate: (): void => {
                hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
            }
        });
        let cmd = `aa start -d 0 -a TestAbility -b ${abilityDelegatorArguments.bundleName}`;
        const debug = abilityDelegatorArguments.parameters['-D'];
        if (debug === 'true') {
            cmd += ' -D';
        }
        hilog.info(DOMAIN, TAG, 'cmd: %{public}s', cmd);
        const result = await abilityDelegator.executeShellCommand(cmd);
        hilog.info(DOMAIN, TAG, 'executeShellCommand stdResult: %{public}s, exitCode: %{public}d',
            result.stdResult, result.exitCode);
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }
}
