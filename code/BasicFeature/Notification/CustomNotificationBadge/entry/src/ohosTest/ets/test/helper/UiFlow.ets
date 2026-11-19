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

// 页面层辅助：只用语义 id 定位，不写死坐标；等待一律"轮询 + 上限"。
// 被测控件 id 由 P0 可测性改造补齐：titleBar / tabBar0 / tabBar1 / notificationList /
// notificationGroup<N> / publishBasic / publishLongText / publishPicture / publishMultiLine。
import { Driver, ON, Component, abilityDelegatorRegistry } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomNotificationBadge]';
const BUNDLE: string = 'com.samples.customnotificationbadge';
const ABILITY: string = 'EntryAbility';
const HOME_ID: string = 'titleBar';
const MESSAGE_TAB_ID: string = 'tabBar0';
const PUBLISH_TAB_ID: string = 'tabBar1';
const POLL_INTERVAL_MS: number = 300;
const LAUNCH_WAIT_MS: number = 1500;
const SETTLE_MS: number = 300;

export function log(message: string): void {
    hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export function delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => {
        setTimeout(() => {
            resolve();
        }, ms);
    });
}

// findComponent 找不到时返回 null 而不抛错，判断存在性必须走 assertComponentExist。
export async function existsById(driver: Driver, id: string): Promise<boolean> {
    try {
        await driver.assertComponentExist(ON.id(id));
        return true;
    } catch (err) {
        return false;
    }
}

export async function existsByText(driver: Driver, text: string): Promise<boolean> {
    try {
        await driver.assertComponentExist(ON.text(text));
        return true;
    } catch (err) {
        return false;
    }
}

export async function waitForId(driver: Driver, id: string, attempts: number): Promise<boolean> {
    for (let i = 0; i < attempts; i++) {
        if (await existsById(driver, id)) {
            return true;
        }
        await delay(POLL_INTERVAL_MS);
    }
    return false;
}

export async function findById(driver: Driver, id: string): Promise<Component | null> {
    if (!await waitForId(driver, id, 10)) {
        return null;
    }
    return await driver.findComponent(ON.id(id));
}

export async function textOf(driver: Driver, id: string): Promise<string> {
    const component: Component | null = await findById(driver, id);
    if (component === null) {
        return '';
    }
    return await component.getText();
}

// 有副作用的操作只在这里执行一次，调用方把返回值存 const 后再喂给断言。
export async function tap(driver: Driver, id: string): Promise<boolean> {
    const component: Component | null = await findById(driver, id);
    if (component === null) {
        return false;
    }
    await component.click();
    await delay(SETTLE_MS);
    return true;
}

export async function unlockIfNeeded(driver: Driver): Promise<void> {
    if (await existsByText(driver, 'Swipe up to unlock') || await existsByText(driver, '向上滑动解锁')) {
        await driver.swipe(360, 1100, 360, 300, 600);
        await delay(1000);
        log('lock screen unlocked');
    }
}

export async function dismissDialogs(driver: Driver): Promise<void> {
    const texts: string[] = ['Allow', 'Allow all', 'Always allow', 'While using the app', 'Only this time',
        '允许', '始终允许'];
    for (let round = 0; round < 3; round++) {
        let clicked: boolean = false;
        for (let i = 0; i < texts.length; i++) {
            if (await existsByText(driver, texts[i])) {
                const button: Component | null = await driver.findComponent(ON.text(texts[i]));
                if (button !== null) {
                    await button.click();
                    await delay(SETTLE_MS + 100);
                    clicked = true;
                    break;
                }
            }
        }
        if (!clicked) {
            return;
        }
    }
}

export async function switchToMessageTab(driver: Driver): Promise<boolean> {
    if (!await tap(driver, MESSAGE_TAB_ID)) {
        return false;
    }
    return await waitForId(driver, MESSAGE_TAB_ID, 10);
}

export async function switchToPublishTab(driver: Driver): Promise<boolean> {
    if (!await tap(driver, PUBLISH_TAB_ID)) {
        return false;
    }
    await dismissDialogs(driver);
    return await waitForId(driver, 'publishBasic', 10);
}

// 每例开头/结尾都回到同一入口（消息列表页），保证用例间零依赖。
export async function ensureMessageHome(driver: Driver): Promise<boolean> {
    for (let i = 0; i < 4; i++) {
        if (await existsById(driver, 'notificationList')) {
            return true;
        }
        if (await existsById(driver, MESSAGE_TAB_ID)) {
            await tap(driver, MESSAGE_TAB_ID);
        }
        await delay(600);
    }
    return await existsById(driver, 'notificationList');
}

export async function launchApp(): Promise<boolean> {
    const driver: Driver = Driver.create();
    await unlockIfNeeded(driver);
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    for (let i = 0; i < 5; i++) {
        const want: Want = { bundleName: BUNDLE, abilityName: ABILITY };
        await delegator.startAbility(want);
        await delay(LAUNCH_WAIT_MS);
        await dismissDialogs(driver);
        if (await waitForId(driver, HOME_ID, 4)) {
            await switchToMessageTab(driver);
            return true;
        }
        log(`launchApp retry ${i}`);
    }
    return false;
}
