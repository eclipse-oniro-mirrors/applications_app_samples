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
import UIAbility from '@ohos.app.ability.UIAbility';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import hilog from '@ohos.hilog';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';
import window from '@ohos.window';
import Want from '@ohos.app.ability.Want';
import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import i18n from '@ohos.i18n';

export default class TestAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onCreate');
        let wantText: string = '';
        let launchParamText: string = '';
        try {
            wantText = JSON.stringify(want) ?? '';
        } catch (error) {
            wantText = '';
        }
        try {
            launchParamText = JSON.stringify(launchParam) ?? '';
        } catch (error) {
            launchParamText = '';
        }
        hilog.info(0x0000, 'testTag', '%{public}s', 'want param:' + wantText);
        hilog.info(0x0000, 'testTag', '%{public}s', 'launchParam:' + launchParamText);
        const abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator =
            AbilityDelegatorRegistry.getAbilityDelegator();
        const abilityDelegatorArguments: AbilityDelegatorRegistry.AbilityDelegatorArgs =
            AbilityDelegatorRegistry.getArguments();
        // The contract suites assert the English shipped literals rendered by
        // the UI and resolved from the base resource qualifier. Pin the test
        // process to en-US so a zh_CN device does not fail every text check.
        try {
            i18n.System.setAppPreferredLanguage('en-US');
        } catch (error) {
            hilog.warn(0x0000, 'testTag', 'setAppPreferredLanguage failed: %{public}s', JSON.stringify(error) ?? '');
        }
        const appWant: Want = {
            bundleName: 'com.sample.demonstration',
            moduleName: 'entry',
            abilityName: 'EntryAbility'
        };
        abilityDelegator.startAbility(appWant, (err, data) => {
            hilog.info(0x0000, 'testTag', 'start app ability : err : %{public}s', JSON.stringify(err) ?? '');
            hilog.info(0x0000, 'testTag', 'start app ability : data : %{public}s', JSON.stringify(data) ?? '');
            // EntryAbility.onWindowStageCreate and the first ArkUI render are
            // asynchronous; start Hypium after the window has had time to attach.
            setTimeout(() => {
                hilog.info(0x0000, 'testTag', '%{public}s', 'start run testcase!!!');
                Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite);
            }, 3500);
        });
    }

    onDestroy() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onDestroy');
    }

    onWindowStageCreate(windowStage: window.WindowStage) {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageCreate');
        windowStage.loadContent('testability/pages/Index', (err, data) => {
            if (err.code) {
                hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s',
                JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onWindowStageDestroy');
    }

    onForeground() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onForeground');
    }

    onBackground() {
        hilog.info(0x0000, 'testTag', '%{public}s', 'TestAbility onBackground');
    }
}
