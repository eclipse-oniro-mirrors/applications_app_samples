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

import { Component, Driver, ON, Rect, abilityDelegatorRegistry } from '@kit.TestKit';
import { display } from '@kit.ArkUI';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LayoutPolicy } from '../../../main/ets/model/LayoutPolicy';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

/** 被测应用的包名与入口 Ability，与 AppScope/app.json5、main/module.json5 一致。 */
export const APP_BUNDLE: string = 'ohos.samples.etsappaccountmanager';
export const APP_ABILITY: string = 'EntryAbility';

/** 页面跳转与渲染的等待窗口，单位毫秒。 */
export const SHORT_WAIT: number = 400;
export const COMPONENT_WAIT: number = 2000;

/** 控件未命中时的重试次数，每次重试前按一次返回键。 */
const COMPONENT_RETRY: number = 3;

/** 入口页三张应用卡片，id 由 BundleCatalog.idOf 拼装成「应用名 + App」。 */
export const ID_MUSIC: string = 'MusicApp';
export const ID_VIDEO: string = 'VideoApp';
export const ID_MAP: string = 'MapApp';

/** 登录面板。 */
export const ID_NAME: string = 'nameInput';
export const ID_PASSWORD: string = 'passwordInput';
export const ID_LOGIN: string = 'login';
export const ID_REGISTER: string = 'register';

/** 注册面板：五个输入框按 dataSet 顺序注册 id。 */
export const ID_COMPLETE: string = 'complete';

/** 账号面板。 */
export const ID_MODIFY: string = 'modify';
export const ID_APPLICATION: string = 'application';
export const ID_DELETE: string = 'delete';

/** 修改面板：四个输入框按 dataSet 顺序注册 id。 */
export const ID_MOD_COMPLETE: string = 'modComplete';

/** 返回按钮。 */
export const ID_BACK: string = 'back';

export function registerId(index: number): string {
    return 'Register' + index;
}

export function modifyId(index: number): string {
    return 'Modify' + index;
}

export function sleep(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, ms);
    });
}

/** 拉起被测应用；重复调用会把应用重新排到前台。 */
export async function startSampleApp(): Promise<void> {
    const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
    const want: Want = {
        bundleName: APP_BUNDLE,
        abilityName: APP_ABILITY
    };
    await delegator.startAbility(want);
    await sleep(SHORT_WAIT * 2);
}

/** 屏幕宽度换算成 vp，与 LayoutPolicy 接收的面积单位保持一致。 */
export function screenWidthVp(): number {
    const info: display.Display = display.getDefaultDisplaySync();
    return Math.round(info.width / info.densityPixels);
}

/** 本机是否走双栏布局，期望值只来自 main 的 LayoutPolicy。 */
export function expectWideLayout(): boolean {
    return LayoutPolicy.isWideLayout(screenWidthVp());
}

/**
 * 组件是否存在。findComponent 在未命中时会抛错，这里用 getBounds 复核一次，
 * 避免个别版本返回空对象被误判成存在。
 */
export async function existsId(driver: Driver, id: string): Promise<boolean> {
    try {
        const node: Component = await driver.findComponent(ON.id(id));
        await node.getBounds();
        return true;
    } catch (err) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'component %{public}s absent', id);
        return false;
    }
}

/** 等待组件出现，超时返回 false。 */
export async function waitId(driver: Driver, id: string, time: number): Promise<boolean> {
    try {
        await driver.waitForComponent(ON.id(id), time);
        return true;
    } catch (err) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'component %{public}s not ready in %{public}d ms', id, time);
        return false;
    }
}

/**
 * 按 id 取组件。未命中时先按一次返回键重试：输入过后软键盘会遮挡下方控件，
 * 收起键盘后同一控件即可命中；重试仍取不到才视为缺失。
 */
async function mustFind(driver: Driver, id: string): Promise<Component> {
    let attempt: number = 0;
    while (attempt < COMPONENT_RETRY) {
        const node: Component | null = await driver.findComponent(ON.id(id));
        if (node !== null) {
            return node;
        }
        hilog.info(LOG_DOMAIN, LOG_TAG, 'component %{public}s retry %{public}d after back', id, attempt + 1);
        await driver.pressBack();
        await sleep(SHORT_WAIT);
        attempt++;
    }
    throw new Error(`component ${id} not found`);
}

/** 点击组件中心点，坐标一律取自组件自身。 */
export async function tapId(driver: Driver, id: string): Promise<void> {
    const node: Component = await mustFind(driver, id);
    await node.click();
    await sleep(SHORT_WAIT);
}

/**
 * 清空后输入，用于模拟用户填写表单。
 *
 * 不先点击组件：点击会拉起软键盘，键盘窗口遮挡下方控件后 findComponent 取不到它们，
 * 而 clearText / inputText 本身只要求组件可见；软键盘由后续 mustFind 的保底返回键收起。
 */
export async function typeId(driver: Driver, id: string, text: string): Promise<void> {
    const node: Component = await mustFind(driver, id);
    await node.clearText();
    if (text !== '') {
        await node.inputText(text);
    }
    await sleep(120);
}

/** 读取输入框内容。 */
export async function readId(driver: Driver, id: string): Promise<string> {
    const node: Component = await mustFind(driver, id);
    return await node.getText();
}

/** 读取按钮可用状态。 */
export async function enabledId(driver: Driver, id: string): Promise<boolean> {
    const node: Component = await mustFind(driver, id);
    return await node.isEnabled();
}

/** 读取控件纵坐标（px），用于判断两列还是单列排布。 */
export async function topOfId(driver: Driver, id: string): Promise<number> {
    const node: Component = await mustFind(driver, id);
    const rect: Rect = await node.getBounds();
    return rect.top;
}

/** 连按返回直到出现入口页的应用卡片，用于用例复位。 */
export async function backToEntrance(driver: Driver): Promise<void> {
    for (let i = 0; i < 5; i++) {
        if (await existsId(driver, ID_MUSIC)) {
            return;
        }
        await driver.pressBack();
        await sleep(SHORT_WAIT);
    }
    hilog.info(LOG_DOMAIN, LOG_TAG, 'reset to entrance finished with %{public}d attempts', 5);
}

/** 从入口页进入指定应用的登录页。 */
export async function enterLogin(driver: Driver, bundle: string): Promise<boolean> {
    const entered: boolean = await existsId(driver, bundle);
    if (entered) {
        await tapId(driver, bundle);
    }
    return await waitId(driver, ID_NAME, COMPONENT_WAIT);
}

/** 按候选文本集合判断任一是否存在，用于不挂 id 的弹窗按钮。 */
export async function existsFirstText(driver: Driver, labels: string[]): Promise<boolean> {
    for (let i = 0; i < labels.length; i++) {
        if (await existsText(driver, labels[i])) {
            return true;
        }
    }
    return false;
}

/** 按文本查找组件；文本候选来自 main 的 base / zh 两套资源。 */
export async function existsText(driver: Driver, text: string): Promise<boolean> {
    try {
        const node: Component = await driver.findComponent(ON.text(text));
        await node.getBounds();
        return true;
    } catch (err) {
        return false;
    }
}

async function tapFirstText(driver: Driver, labels: string[]): Promise<boolean> {
    for (let i = 0; i < labels.length; i++) {
        if (await existsText(driver, labels[i])) {
            const node: Component = await driver.findComponent(ON.text(labels[i]));
            await node.click();
            await sleep(SHORT_WAIT);
            return true;
        }
    }
    return false;
}

/** 弹窗确定按钮：AlertDialog 的 Button 不挂 id，只能按资源文本定位。 */
export async function confirmDialog(driver: Driver): Promise<boolean> {
    const labels: string[] = ['Confirm', '确认'];
    return await tapFirstText(driver, labels);
}

/** 弹窗关闭按钮，对校验失败类弹窗是唯一出口。 */
export async function closeDialog(driver: Driver): Promise<boolean> {
    const labels: string[] = ['Close', '关闭'];
    return await tapFirstText(driver, labels);
}

/** 弹窗取消按钮。 */
export async function cancelDialog(driver: Driver): Promise<boolean> {
    const labels: string[] = ['Cancel', '取消'];
    return await tapFirstText(driver, labels);
}

/** 弹窗取消按钮是否存在，用于确认前页面未跳转。 */
export async function existsCancelDialog(driver: Driver): Promise<boolean> {
    const labels: string[] = ['Cancel', '取消'];
    return await existsFirstText(driver, labels);
}
