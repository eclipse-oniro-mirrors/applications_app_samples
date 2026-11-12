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

import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';

const DOMAIN = 0xFF00;
const TAG = '[Sample_SendableColorSpace]';
const FORMAT = '%{public}s';

export default class EntryAbility extends UIAbility {
    onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
        hilog.info(DOMAIN, TAG, 'Ability onCreate');
    }

    onDestroy(): void {
        hilog.info(DOMAIN, TAG, 'Ability onDestroy');
    }

    onWindowStageCreate(windowStage: window.WindowStage): void {
        hilog.info(DOMAIN, TAG, 'Ability onWindowStageCreate');
        windowStage.loadContent('pages/Index', (err, data) => {
            if (err.code) {
                hilog.error(DOMAIN, TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
                return;
            }
            hilog.info(DOMAIN, TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
        });
    }

    onWindowStageDestroy(): void {
        hilog.info(DOMAIN, TAG, 'Ability onWindowStageDestroy');
    }

    onForeground(): void {
        hilog.info(DOMAIN, TAG, 'Ability onForeground');
    }

    onBackground(): void {
        hilog.info(DOMAIN, TAG, 'Ability onBackground');
    }
}
