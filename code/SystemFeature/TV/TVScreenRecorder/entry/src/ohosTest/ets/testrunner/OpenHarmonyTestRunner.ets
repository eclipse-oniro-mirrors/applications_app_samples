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

import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0x0000;

const TAG: string = 'TestRunner';

interface RunnerArgumentsLike {
    bundleName: string
}

interface AbilityMonitorLike {
    abilityName: string
    onAbilityCreate: () => Promise<void>
}

interface ShellCommandErrorLike {
    code?: number
    message?: string
}

interface ShellCommandResultLike {
    stdResult: string
    exitCode: number
}

async function onAbilityCreateCallback(): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: ShellCommandErrorLike): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s', 'addAbilityMonitorCallback: ' + JSON.stringify(err));
}

export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare(): void {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onPrepare');
    }

    async onRun(): Promise<void> {
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun begin');
        const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        const abilityDelegatorArguments = abilityDelegatorRegistry.getArguments() as RunnerArgumentsLike;
        const testAbilityName = abilityDelegatorArguments.bundleName + '.TestAbility';
        const lMonitor: AbilityMonitorLike = {
            abilityName: testAbilityName,
            onAbilityCreate: onAbilityCreateCallback,
        }
        abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);
        let cmd = 'aa start -d 0 -a TestAbility' + ' -b ' + abilityDelegatorArguments.bundleName;
        hilog.info(DOMAIN, TAG, '%{public}s', 'cmd: ' + cmd);
        abilityDelegator.executeShellCommand(cmd,
            (err: ShellCommandErrorLike, d: ShellCommandResultLike) => {
                hilog.info(DOMAIN, TAG, '%{public}s', 'executeShellCommand err: ' + JSON.stringify(err));
                hilog.info(DOMAIN, TAG, '%{public}s', 'executeShellCommand data: ' + d.stdResult);
                hilog.info(DOMAIN, TAG, '%{public}s', 'executeShellCommand exitCode: ' + d.exitCode);
            });
        hilog.info(DOMAIN, TAG, '%{public}s', 'OpenHarmonyTestRunner onRun end');
    }
}
