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
import UIAbility from '@ohos.app.ability.UIAbility'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Hypium } from '@ohos/hypium'
import testsuite from '../test/List.test'
import Window from '@ohos.window'
import Want from '@ohos.app.ability.Want'
import AbilityConstant from '@ohos.app.ability.AbilityConstant'
import { TestContextHolder } from './TestContextHolder'

const DOMAIN: number = 0xF811
const TAG: string = '[Sample_AppAccountManager]'

export default class TestAbility extends UIAbility {
    private testStarted: boolean = false;

    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onCreate');
        hilog.info(DOMAIN, TAG, '%{public}s', 'want param:' + JSON.stringify(want) ?? '');
        hilog.info(DOMAIN, TAG, '%{public}s', 'launchParam:' + JSON.stringify(launchParam) ?? '');
        TestContextHolder.setContext(this.context);
    }

    onDestroy(): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onDestroy');
    }

    onWindowStageCreate(windowStage: Window.WindowStage): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageCreate');
        windowStage.loadContent('testability/pages/Index', (err, data) => {
            if (err.code) {
                hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.ERROR);
                hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s',
                    JSON.stringify(err) ?? '');
                return;
            }
            hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
            hilog.info(DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s',
                JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy(): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onWindowStageDestroy');
    }

    onForeground(): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onForeground');
        if (this.testStarted) {
            return;
        }
        this.testStarted = true;
        let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator
        abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator()
        let abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs
        abilityDelegatorArguments = AbilityDelegatorRegistry.getArguments()
        // 用例规模较大时，延后到当前 AbilityTransaction 之后再注册，避免 LIFECYCLE_TIMEOUT
        setTimeout(() => {
            hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
            hilog.info(DOMAIN, TAG, '%{public}s', 'start run testcase!!!');
            Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)
        }, 300);
    }

    onBackground(): void {
        hilog.isLoggable(DOMAIN, TAG, hilog.LogLevel.INFO);
        hilog.info(DOMAIN, TAG, '%{public}s', 'TestAbility onBackground');
    }
}
