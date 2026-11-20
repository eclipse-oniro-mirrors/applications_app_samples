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

import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

const TAG: string = 'UIExtensionTestRunner';
const DOMAIN: number = 0x0000;
const TEST_ABILITY_NAME: string = 'TestAbility';

function logInfo(message: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function logError(message: string): void {
    hilog.error(DOMAIN, TAG, '%{public}s', message);
}

function onAbilityCreateCallback(): void {
    logInfo('onAbilityCreateCallback');
}

function addAbilityMonitorCallback(err: BusinessError): void {
    if (err) {
        logError('addAbilityMonitorCallback: code=' + err.code + ' message=' + err.message);
        return;
    }
    logInfo('addAbilityMonitorCallback: success');
}

function buildWant(bundleName: string): Want {
    const want: Want = {
        bundleName: bundleName,
        abilityName: TEST_ABILITY_NAME
    };
    return want;
}

export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare(): void {
        logInfo('OpenHarmonyTestRunner onPrepare');
    }

    async onRun(): Promise<void> {
        logInfo('OpenHarmonyTestRunner onRun start');
        const args = AbilityDelegatorRegistry.getArguments();
        const delegator = AbilityDelegatorRegistry.getAbilityDelegator();
        const bundleName: string = args.bundleName;
        logInfo('test bundle: ' + bundleName);

        delegator.addAbilityMonitor({
            abilityName: TEST_ABILITY_NAME,
            onAbilityCreate: onAbilityCreateCallback
        }, addAbilityMonitorCallback);

        const want: Want = buildWant(bundleName);
        delegator.startAbility(want, (err: BusinessError) => {
            if (err) {
                logError('startAbility error: code=' + err.code + ' message=' + err.message);
                return;
            }
            logInfo('startAbility success');
        });
        logInfo('OpenHarmonyTestRunner onRun end');
    }
}
