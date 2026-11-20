/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { TestRunner } from '@kit.TestKit';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AppAccountManager]';

function translateParamsToString(parameters: Record<string, string>): string {
    const keySet: Set<string> = new Set<string>([
        '-s class', '-s notClass', '-s suite', '-s it',
        '-s level', '-s testType', '-s size', '-s timeout',
        '-s dryRun'
    ])
    let targetParams: string = ''
    const keys: string[] = Object.keys(parameters)
    keys.forEach((key: string) => {
        if (keySet.has(key)) {
            targetParams = `${targetParams} ${key} ${parameters[key]}`
        }
    })
    return targetParams.trim()
}

function onAbilityCreateCallback(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
}

function addAbilityMonitorCallback(err: BusinessError): void {
    hilog.info(DOMAIN, TAG, 'addAbilityMonitorCallback : %{public}s', JSON.stringify(err) ?? '');
}

export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare(): void {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner OnPrepare ');
    }

    async onRun(): Promise<void> {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun run');
        const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
            AbilityDelegatorRegistry.getArguments()
        const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
            AbilityDelegatorRegistry.getAbilityDelegator()
        const testAbilityName: string = abilityDelegatorArguments.bundleName + '.TestAbility'
        const lMonitor: AbilityDelegatorRegistry.AbilityMonitor = {
            abilityName: testAbilityName,
            onAbilityCreate: onAbilityCreateCallback
        };
        abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback)
        let cmd: string = 'a' + 'a start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName
        cmd += ' ' + translateParamsToString(abilityDelegatorArguments.parameters)
        const debug: string = abilityDelegatorArguments.parameters['-D']
        if (debug === 'true') {
            cmd += ' -D'
        }
        hilog.info(DOMAIN, TAG, 'cmd : %{public}s', cmd);
        abilityDelegator.executeShellCommand(cmd,
            (err: BusinessError, d: AbilityDelegatorRegistry.ShellCmdResult) => {
                hilog.info(DOMAIN, TAG, 'executeShellCommand : err : %{public}s', JSON.stringify(err) ?? '');
                hilog.info(DOMAIN, TAG, 'executeShellCommand : data : %{public}s', d.stdResult ?? '');
                hilog.info(DOMAIN, TAG, 'executeShellCommand : data : %{public}s', d.exitCode ?? '');
            })
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }
}
