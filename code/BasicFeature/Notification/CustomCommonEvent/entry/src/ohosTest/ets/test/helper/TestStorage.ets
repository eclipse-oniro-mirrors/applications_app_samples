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

import common from '@ohos.app.ability.common';
import dataPreferences from '@ohos.data.preferences';
import { hilog } from '@kit.PerformanceAnalysisKit';
import consts from '../../../../main/ets/module/Consts';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomCommonEvent]';
const CONTEXT_KEY: string = 'testAbilityContext';

/**
 * 取 TestAbility.onCreate 暴露的 UIAbilityContext；未就绪时返回 undefined。
 */
export function getTestContext(): common.UIAbilityContext | undefined {
    return AppStorage.get<common.UIAbilityContext>(CONTEXT_KEY);
}

async function openPreferences(): Promise<dataPreferences.Preferences | null> {
    const context: common.UIAbilityContext | undefined = getTestContext();
    if (context === undefined) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'test ability context is not ready');
        return null;
    }
    try {
        const pref: dataPreferences.Preferences = await dataPreferences.getPreferences(context, consts.DATA_BASE_NAME);
        return pref;
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'getPreferences failed %{public}s', JSON.stringify(error));
        return null;
    }
}

/**
 * 清空被测模块共用的 preferences，保证用例间零依赖。
 */
export async function clearStore(): Promise<void> {
    const pref: dataPreferences.Preferences | null = await openPreferences();
    if (pref === null) {
        return;
    }
    await pref.clear();
    await pref.flush();
}

export async function putNumber(key: string, value: number): Promise<boolean> {
    const pref: dataPreferences.Preferences | null = await openPreferences();
    if (pref === null) {
        return false;
    }
    await pref.put(key, value);
    await pref.flush();
    return true;
}

export async function putStringArray(key: string, value: Array<string>): Promise<boolean> {
    const pref: dataPreferences.Preferences | null = await openPreferences();
    if (pref === null) {
        return false;
    }
    await pref.put(key, value);
    await pref.flush();
    return true;
}
