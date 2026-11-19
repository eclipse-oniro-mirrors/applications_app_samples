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

const TAG: string = 'UIExtensionTestRunner';
const DOMAIN: number = 0x0000;
const TEST_ABILITY_NAME: string = 'TestAbility';

var abilityDelegator = undefined;
var abilityDelegatorArguments = undefined;

function logInfo(message: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function logError(message: string): void {
    hilog.error(DOMAIN, TAG, '%{public}s', message);
}

async function onAbilityCreateCallback() {
    logInfo('onAbilityCreateCallback');
}

async function addAbilityMonitorCallback(err: any) {
    logInfo('addAbilityMonitorCallback : ' + JSON.stringify(err) ?? '');
}

function buildWant(bundleName: string): any {
    const want = {
        bundleName: bundleName,
        abilityName: TEST_ABILITY_NAME
    };
    return want;
}

function buildMonitor(): any {
    const monitor = {
        abilityName: TEST_ABILITY_NAME,
        onAbilityCreate: onAbilityCreateCallback
    };
    return monitor;
}

export default class OpenHarmonyTestRunner implements TestRunner {
    constructor() {
    }

    onPrepare() {
        logInfo('OpenHarmonyTestRunner onPrepare');
    }

    async onRun() {
        logInfo('OpenHarmonyTestRunner onRun start');
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments();
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        const bundleName: string = abilityDelegatorArguments.bundleName;
        logInfo('test bundle: ' + bundleName);

        const lMonitor = buildMonitor();
        abilityDelegator.addAbilityMonitor(lMonitor, addAbilityMonitorCallback);

        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        const want = buildWant(bundleName);
        abilityDelegator.startAbility(want, (err: any, data: any) => {
            logInfo('startAbility error: ' + JSON.stringify(err) ?? '');
            logInfo('startAbility data: ' + JSON.stringify(data) ?? '');
        });
        logInfo('OpenHarmonyTestRunner onRun end');
    }
}
