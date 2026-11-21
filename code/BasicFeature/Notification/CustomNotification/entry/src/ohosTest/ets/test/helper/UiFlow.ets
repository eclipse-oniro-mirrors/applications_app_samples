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

// UI 流程 helper：只通过 ON.id() 与 ON.text() 定位，不使用固定坐标。
// 所有等待均为"轮询 + 上限"，不用长 sleep；存在性判断走 findComponent + null 检查，
// 因为 findComponent 找不到时返回 null 而不抛异常。
import { Driver, ON, Component, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getString } from '../../util/ResourceUtil';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotification]';
const BUNDLE_NAME: string = 'ohos.samples.customnotification';
const ABILITY_NAME: string = 'MainAbility';
const DEFAULT_TIMEOUT_MS: number = 5000;
const POLL_INTERVAL_MS: number = 200;
const TAB_MESSAGE_ID: string = 'tabBar0';
const TAB_PUBLISH_ID: string = 'tabBar1';
const ALLOW_TEXTS: string[] = ['允许', 'Allow'];
// 消息页分组行按内容类型槽位编号命名（0~6，与 ContentType 枚举一致）
const GROUP_ID_PREFIX: string = 'notificationGroup';
const GROUP_SLOT_COUNT: number = 7;
const SNAPSHOT_SETTLE_MS: number = 600;
// 进入发布页会触发通知授权请求，系统弹窗在切页后延迟出现并全屏遮挡
const ENABLE_DIALOG_WINDOW_MS: number = 1600;
let enableDialogHandled: boolean = false;

export async function existsId(driver: Driver, id: string): Promise<boolean> {
    try {
        let component: Component | null = await driver.findComponent(ON.id(id));
        return component !== null;
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'findComponent by id failed: %{public}s', id);
        return false;
    }
}

export async function existsText(driver: Driver, text: string): Promise<boolean> {
    try {
        let component: Component | null = await driver.findComponent(ON.text(text));
        return component !== null;
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'findComponent by text failed: %{public}s', text);
        return false;
    }
}

export async function tapId(driver: Driver, id: string): Promise<boolean> {
    try {
        let component: Component | null = await driver.findComponent(ON.id(id));
        if (component === null) {
            hilog.error(DOMAIN, TAG, 'tapId not found: %{public}s', id);
            return false;
        }
        await component.click();
        await driver.delayMs(POLL_INTERVAL_MS);
        return true;
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'tapId failed: %{public}s', id);
        return false;
    }
}

export async function tapText(driver: Driver, text: string): Promise<boolean> {
    try {
        let component: Component | null = await driver.findComponent(ON.text(text));
        if (component === null) {
            return false;
        }
        await component.click();
        await driver.delayMs(POLL_INTERVAL_MS);
        return true;
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'tapText failed: %{public}s', text);
        return false;
    }
}

export async function waitForId(driver: Driver, id: string, timeoutMs?: number): Promise<boolean> {
    let limit: number = timeoutMs === undefined ? DEFAULT_TIMEOUT_MS : timeoutMs as number;
    let waited: number = 0;
    while (waited < limit) {
        if (await existsId(driver, id)) {
            return true;
        }
        await driver.delayMs(POLL_INTERVAL_MS);
        waited += POLL_INTERVAL_MS;
    }
    return false;
}

export async function dismissDialogs(driver: Driver): Promise<void> {
    for (let i: number = 0; i < ALLOW_TEXTS.length; i++) {
        if (await existsText(driver, ALLOW_TEXTS[i])) {
            await tapText(driver, ALLOW_TEXTS[i]);
        }
    }
    let allowButton: string = getString($r('app.string.allow_button'));
    if (allowButton.length > 0 && await existsText(driver, allowButton)) {
        await tapText(driver, allowButton);
    }
}

// 授权弹窗不是点击后立即出现，需在有限窗口内轮询关闭；同一进程只需处理一次
async function dismissEnableDialogOnce(driver: Driver): Promise<void> {
    if (enableDialogHandled) {
        return;
    }
    enableDialogHandled = true;
    let waited: number = 0;
    while (waited < ENABLE_DIALOG_WINDOW_MS) {
        await driver.delayMs(POLL_INTERVAL_MS);
        waited += POLL_INTERVAL_MS;
        await dismissDialogs(driver);
    }
}

export async function launchApp(): Promise<Driver> {
    let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    let want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
    };
    try {
        await delegator.startAbility(want);
    } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s', 'startAbility failed, continue to locate window');
    }
    let driver: Driver = Driver.create();
    await dismissDialogs(driver);
    await waitForId(driver, TAB_MESSAGE_ID, DEFAULT_TIMEOUT_MS);
    return driver;
}

export async function switchToPublishTab(driver: Driver): Promise<boolean> {
    if (await existsId(driver, 'publishBasic')) {
        await dismissEnableDialogOnce(driver);
        return true;
    }
    await tapId(driver, TAB_PUBLISH_ID);
    if (await waitForId(driver, 'publishBasic', DEFAULT_TIMEOUT_MS)) {
        await dismissEnableDialogOnce(driver);
        return true;
    }
    // 授权弹窗可能遮挡到超时：关闭后重新切一次页签
    await dismissDialogs(driver);
    await tapId(driver, TAB_PUBLISH_ID);
    let entered: boolean = await waitForId(driver, 'publishBasic', DEFAULT_TIMEOUT_MS);
    if (entered) {
        await dismissEnableDialogOnce(driver);
    }
    return entered;
}

export async function switchToMessageTab(driver: Driver): Promise<boolean> {
    await tapId(driver, TAB_MESSAGE_ID);
    return await waitForId(driver, TAB_MESSAGE_ID, DEFAULT_TIMEOUT_MS);
}

// 读取 Toggle 的界面勾选状态。main 与测试用例不在同一进程，
// notificationUtil 的开关字段各进程独立，只能通过界面上报的勾选状态观测。
export async function isCheckedId(driver: Driver, id: string): Promise<boolean> {
    try {
        let component: Component | null = await driver.findComponent(ON.id(id));
        if (component === null) {
            hilog.error(DOMAIN, TAG, 'isCheckedId not found: %{public}s', id);
            return false;
        }
        return await component.isChecked();
    } catch (error) {
        hilog.error(DOMAIN, TAG, 'isCheckedId failed: %{public}s', id);
        return false;
    }
}

export async function waitChecked(driver: Driver, id: string, expected: boolean,
    timeoutMs?: number): Promise<boolean> {
    let limit: number = timeoutMs === undefined ? DEFAULT_TIMEOUT_MS : timeoutMs as number;
    let waited: number = 0;
    while (waited < limit) {
        let checked: boolean = await isCheckedId(driver, id);
        if (checked === expected) {
            return true;
        }
        await driver.delayMs(POLL_INTERVAL_MS);
        waited += POLL_INTERVAL_MS;
    }
    return false;
}

// 把开关置为目标状态：已一致则直接返回，否则点击后等待界面状态跟上
export async function setChecked(driver: Driver, id: string, on: boolean): Promise<boolean> {
    if (await isCheckedId(driver, id) === on) {
        return true;
    }
    if (!await tapId(driver, id)) {
        return false;
    }
    return await waitChecked(driver, id, on);
}

export async function countGroups(driver: Driver): Promise<number> {
    let count: number = 0;
    for (let i: number = 0; i < GROUP_SLOT_COUNT; i++) {
        if (await existsId(driver, GROUP_ID_PREFIX + i)) {
            count += 1;
        }
    }
    return count;
}

// 消息页只在组件重建时取一次分组快照，切页是唯一刷新手段：
// 未观察到期望状态则回发布页重切，最多 attempts 次。
export async function refreshMessageTabAndCheck(driver: Driver, groupIndex: number, present: boolean,
    attempts: number = 3): Promise<boolean> {
    let id: string = GROUP_ID_PREFIX + groupIndex;
    for (let i: number = 0; i < attempts; i++) {
        await driver.delayMs(SNAPSHOT_SETTLE_MS);
        await switchToMessageTab(driver);
        let found: boolean = await waitForId(driver, id, 1000);
        if (found === present) {
            return true;
        }
        await switchToPublishTab(driver);
    }
    return false;
}

export function messageTabLabel(): string {
    return getString($r('app.string.mainAbility_label_list'));
}

export function publishTabLabel(): string {
    return getString($r('app.string.mainAbility_label'));
}
