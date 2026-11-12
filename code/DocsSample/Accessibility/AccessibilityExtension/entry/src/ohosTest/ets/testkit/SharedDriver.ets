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

import { Want, common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON, On } from '@kit.TestKit';
import { expect } from '@ohos/hypium';
import { localizeText, parseTrailingNumber } from './LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const COMPONENT_WAIT_TIMEOUT = 10000;
const TEXT_WAIT_TIMEOUT = 12000;
const UI_IDLE_TIME = 300;
const UI_IDLE_TIMEOUT = 3000;
// Component.scrollSearch/scrollToTop 每屏滑动速度固定低、单次耗时可观测到 3s 以上；
// 页面内查找统一改用 Driver.swipe（单次约 0.2s），每滑一屏查一次可见树。
const SCROLL_SWIPE_SPEED = 8000;
const SCROLL_SWIPE_MARGIN = 100;
// 一次性回顶速度（px/s，范围 200-40000），数值越大动画越短
const SCROLL_TOP_SPEED = 40000;
// 主页内容约 6 屏：先一次性回顶，再从顶部向下逐屏扫描 6 屏（覆盖整页）。
// 滑动次数直接决定“组件不存在”类断言的耗时，不要盲目放大。
const SCROLL_TOP_SWIPES = 6;
const SCROLL_DOWN_SWIPES = 6;
// 页面可视区高度低于该值时判定为软键盘弹起（全屏约 1136px，键盘弹起时只剩约 586px）
const KEYBOARD_HEIGHT_THRESHOLD = 900;
// 主页计数器组件 ID，用于读取点击次数真实数值
const COUNTER_ID: string = 'counterText';
// 连续多次拉起应用时 delegator.startAbility 偶发失败（全量回归中出现过成批 startAbility failed.
// 集中在连续多次 startApp 的套件），而同一时刻 shell 侧 aa start 稳定成功，
// 因此启动失败后先短暂等待重试，仍失败再退化为 aa start 兜底。
const START_RETRY_TIMES = 2;
const START_RETRY_INTERVAL = 1000;

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;
let testUIAbilityContext: common.UIAbilityContext | undefined = undefined;

export function setTestContext(context: common.UIAbilityContext): void {
    testUIAbilityContext = context;
}

export function getTestContext(): common.UIAbilityContext {
    if (testUIAbilityContext !== undefined) {
        return testUIAbilityContext;
    }
    const appContext = delegator.getAppContext();
    return appContext as common.UIAbilityContext;
}

export function getDriver(): Driver {
    if (driver === undefined) {
        driver = Driver.create();
    }
    return driver;
}

// aa start 兜底：与 delegator.startAbility 走同一套 AAMS 启动流程，但通过 shell 进程发起，
// 可绕过 delegator 侧偶发的 IPC 抖动。只有命令回显 start ability successfully 才视为成功。
async function startAbilityByShell(bundleName: string, abilityName: string): Promise<boolean> {
    const command: string = `aa start -a ${abilityName} -b ${bundleName}`;
    try {
        const result = await delegator.executeShellCommand(command);
        const output: string = result.stdResult.trim();
        hilog.info(DOMAIN, TAG, 'UI step: %{public}s -> exitCode=%{public}d, output=%{public}s', command,
            result.exitCode, output);
        return result.exitCode === 0 && output.includes('start ability successfully');
    } catch (e) {
        hilog.warn(DOMAIN, TAG, 'UI step: %{public}s failed: %{public}s', command, JSON.stringify(e));
        return false;
    }
}

export async function startAbility(bundleName: string, abilityName: string): Promise<void> {
    const want: Want = {
        bundleName: bundleName,
        abilityName: abilityName
    };
    let lastError: string = '';
    for (let i = 0; i <= START_RETRY_TIMES; i++) {
        try {
            await delegator.startAbility(want);
            return;
        } catch (e) {
            lastError = JSON.stringify(e);
            hilog.warn(DOMAIN, TAG, 'UI step: startAbility %{public}s attempt %{public}d failed: %{public}s',
                abilityName, i + 1, lastError);
            if (i < START_RETRY_TIMES) {
                await getDriver().delayMs(START_RETRY_INTERVAL);
            }
        }
    }
    if (await startAbilityByShell(bundleName, abilityName)) {
        hilog.info(DOMAIN, TAG, 'UI step: startAbility %{public}s recovered by aa start', abilityName);
        return;
    }
    throw new Error(`startAbility failed: ${bundleName}/${abilityName}, last error: ${lastError}`);
}

export async function startApp(bundleName: string, abilityName: string): Promise<void> {
    await startAbility(bundleName, abilityName);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// 页面内容超出可视区域时组件不在无障碍树中，直接按 id/text 查找会落空；
// 先做一次可见树直查（命中即返回，避免每次断言都滚动整页），落空再借滚动容器搜索，
// 使断言与用例执行顺序、当前滚动位置解耦。
let scrollContainer: Component | undefined = undefined;

function isUsable(component: Component | undefined): boolean {
    return component !== undefined && component !== null;
}

async function findScrollContainer(): Promise<Component | undefined> {
    if (scrollContainer !== undefined) {
        return scrollContainer;
    }
    try {
        const found: Component = await getDriver().findComponent(ON.type('Scroll'));
        scrollContainer = isUsable(found) ? found : undefined;
        return scrollContainer;
    } catch (e) {
        return undefined;
    }
}

function resetScrollContainer(): void {
    scrollContainer = undefined;
}

async function findVisibleComponent(matcher: On): Promise<Component | undefined> {
    try {
        const component: Component = await getDriver().findComponent(matcher);
        return isUsable(component) ? component : undefined;
    } catch (e) {
        return undefined;
    }
}

// 滑动一屏：downward 为 true 时内容上移（向下翻），否则回到上方。
// 软键盘弹起或窗口尺寸变化会改变 Scroll 的可视区域，沿用旧 bounds 会让手势落到
// 被遮挡区域（如软键盘）而被吞掉，导致后续逐屏查找全部落空，因此每次滑动前重读 bounds。
async function swipeOnce(downward: boolean): Promise<boolean> {
    const scroll: Component | undefined = await findScrollContainer();
    if (scroll === undefined) {
        return false;
    }
    try {
        const bounds = await scroll.getBounds();
        const centerX: number = Math.round((bounds.left + bounds.right) / 2);
        const startY: number = downward ? bounds.bottom - SCROLL_SWIPE_MARGIN : bounds.top + SCROLL_SWIPE_MARGIN;
        const endY: number = downward ? bounds.top + SCROLL_SWIPE_MARGIN : bounds.bottom - SCROLL_SWIPE_MARGIN;
        await getDriver().swipe(centerX, startY, centerX, endY, SCROLL_SWIPE_SPEED);
        return true;
    } catch (e) {
        resetScrollContainer();
        return false;
    }
}

// 把页面恢复到顶部：优先用系统一次性回顶（不随页面屏数增长），失败再退化为多次高速 swipe。
export async function scrollToTop(): Promise<void> {
    const scroll: Component | undefined = await findScrollContainer();
    if (scroll !== undefined) {
        try {
            await scroll.scrollToTop(SCROLL_TOP_SPEED);
            await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
            return;
        } catch (e) {
            resetScrollContainer();
        }
    }
    for (let i = 0; i < SCROLL_TOP_SWIPES; i++) {
        const moved: boolean = await swipeOnce(false);
        if (!moved) {
            return;
        }
    }
}

// 软键盘弹起时页面可视区只剩半屏，且滑动手势起点会落入内层 List 被吞掉，
// 导致下半屏控件（滑块/复选框/Swiper）全部定位失败；此时用返回键收起键盘
// （返回键由输入法窗口消费，不会退出应用）。仅在判定为键盘弹起时触发，避免误退出页面。
async function dismissSoftKeyboardIfNeeded(): Promise<void> {
    const scroll: Component | undefined = await findScrollContainer();
    if (scroll === undefined) {
        return;
    }
    let height: number = 0;
    try {
        const bounds = await scroll.getBounds();
        height = bounds.bottom - bounds.top;
    } catch (e) {
        resetScrollContainer();
        return;
    }
    if (height >= KEYBOARD_HEIGHT_THRESHOLD) {
        return;
    }
    hilog.info(DOMAIN, TAG, 'UI step: soft keyboard shown (scroll height %{public}d), dismiss it', height);
    try {
        await getDriver().pressBack();
        await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    } catch (e) {
        hilog.warn(DOMAIN, TAG, '%{public}s', 'UI step: failed to dismiss soft keyboard');
    }
    // 键盘收起后可视区变大，缓存的滚动容器句柄与尺寸均需重新获取
    resetScrollContainer();
}

async function scrollSearchOrUndefined(matcher: On): Promise<Component | undefined> {
    const visible: Component | undefined = await findVisibleComponent(matcher);
    if (visible !== undefined) {
        return visible;
    }
    // 前序用例调用 inputText 后软键盘常驻，页面可视区被压到半屏且滑动手势易落入内层 List，
    // 导致下半屏控件全部搜不到；逐屏扫描前先收起键盘，恢复全屏可视区。
    await dismissSoftKeyboardIfNeeded();
    // 页面约 2-6 屏：先快速回顶，再从顶部向下逐屏扫描，保证一次覆盖整页，
    // 也避免“目标在当前滚动位置上方”时反向搜索的高开销。
    await scrollToTop();
    for (let i = 0; i <= SCROLL_DOWN_SWIPES; i++) {
        const found: Component | undefined = await findVisibleComponent(matcher);
        if (found !== undefined) {
            return found;
        }
        if (i === SCROLL_DOWN_SWIPES) {
            break;
        }
        const moved: boolean = await swipeOnce(true);
        if (!moved) {
            break;
        }
    }
    return undefined;
}

export async function waitId(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
    const found: Component | undefined = await scrollSearchOrUndefined(ON.id(id));
    if (found !== undefined && found !== null) {
        return found;
    }
    const component: Component = await getDriver().waitForComponent(ON.id(id), timeout);
    if (component === null || component === undefined) {
        throw new Error(`Component with id '${id}' not found within ${timeout}ms`);
    }
    return component;
}

export async function waitText(text: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
    const expected: string = localizeText(text);
    const found: Component | undefined = await scrollSearchOrUndefined(ON.text(expected));
    if (found !== undefined && found !== null) {
        return found;
    }
    const component: Component = await getDriver().waitForComponent(ON.text(expected), timeout);
    if (component === null || component === undefined) {
        throw new Error(`Component with text '${expected}' not found within ${timeout}ms`);
    }
    return component;
}

export async function waitDescription(text: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
    const expected: string = localizeText(text);
    const found: Component | undefined = await scrollSearchOrUndefined(ON.description(expected));
    if (found !== undefined && found !== null) {
        return found;
    }
    const component: Component = await getDriver().waitForComponent(ON.description(expected), timeout);
    if (component === null || component === undefined) {
        throw new Error(`Component with description '${expected}' not found within ${timeout}ms`);
    }
    return component;
}

export async function clickId(id: string): Promise<void> {
    hilog.info(DOMAIN, TAG, 'UI step: wait for id %{public}s', id);
    const component: Component = await waitId(id, 10000);
    hilog.info(DOMAIN, TAG, 'UI step: clicking id %{public}s', id);
    await component.click();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'UI step: clicked id %{public}s', id);
}

export async function clickText(text: string): Promise<void> {
    const expected: string = localizeText(text);
    hilog.info(DOMAIN, TAG, 'UI step: wait for text %{public}s', expected);
    const component: Component = await waitText(text);
    hilog.info(DOMAIN, TAG, 'UI step: clicking text %{public}s', expected);
    await component.click();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'UI step: clicked text %{public}s', expected);
}

export async function textOfId(id: string): Promise<string> {
    const component: Component = await waitId(id);
    return component.getText();
}

export async function textOfText(text: string): Promise<string> {
    const component: Component = await waitText(text);
    return component.getText();
}

export async function existsId(id: string): Promise<boolean> {
    const found: Component | undefined = await scrollSearchOrUndefined(ON.id(id));
    return found !== undefined && found !== null;
}

export async function existsText(text: string): Promise<boolean> {
    const found: Component | undefined = await scrollSearchOrUndefined(ON.text(localizeText(text)));
    return found !== undefined && found !== null;
}

export async function existsDescription(text: string): Promise<boolean> {
    const found: Component | undefined = await scrollSearchOrUndefined(ON.description(localizeText(text)));
    return found !== undefined && found !== null;
}

export async function assertDescriptionExists(testName: string, expected: string): Promise<void> {
    const localized: string = localizeText(expected);
    hilog.info(DOMAIN, TAG, '%{public}s expects description: %{public}s', testName, localized);
    const found: Component | undefined = await scrollSearchOrUndefined(ON.description(localized));
    expect(found !== undefined).assertTrue();
}

export async function hintOfId(id: string): Promise<string> {
    const component: Component = await waitId(id);
    return component.getHint();
}

// 计数器真实数值；用例以“操作前后的数值变化”作为断言基准，避免依赖用例执行顺序。
// 计数器位于页面顶部，前序用例可能已把页面滚到下方，直接反向搜索代价很高，先回顶再读。
export async function counterValue(): Promise<number> {
    let component: Component | undefined = await findVisibleComponent(ON.id(COUNTER_ID));
    if (component === undefined) {
        await scrollToTop();
        component = await findVisibleComponent(ON.id(COUNTER_ID));
    }
    if (component === undefined) {
        component = await waitId(COUNTER_ID);
    }
    return parseTrailingNumber(await component.getText());
}

export async function assertTextExists(testName: string, expected: string): Promise<void> {
    const localized: string = localizeText(expected);
    hilog.info(DOMAIN, TAG, '%{public}s expects text: %{public}s', testName, localized);
    const found: Component | undefined = await scrollSearchOrUndefined(ON.text(localized));
    expect(found !== undefined).assertTrue();
}

export async function assertIdText(testName: string, id: string, expected: string): Promise<void> {
    const localized: string = localizeText(expected);
    hilog.info(DOMAIN, TAG, '%{public}s expects id %{public}s text: %{public}s', testName, id, localized);
    const actual: string = await textOfId(id);
    if (actual !== localized) {
        throw new Error(`Expected text '${localized}' but got '${actual}' for id ${id}`);
    }
}

export async function pressBack(): Promise<void> {
    await getDriver().pressBack();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToId(id: string): Promise<void> {
    const visible: Component | undefined = await findVisibleComponent(ON.id(id));
    if (visible === undefined) {
        await scrollSearchOrUndefined(ON.id(id));
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function scrollToText(expected: string): Promise<void> {
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    const visible: Component | undefined = await findVisibleComponent(ON.text(localizeText(expected)));
    if (visible === undefined) {
        await scrollSearchOrUndefined(ON.text(localizeText(expected)));
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s begin', name);
    let failure: string = '';
    try {
        await action();
    } catch (error) {
        const err = error as Error;
        failure = err.message === undefined ? String(error) : err.message;
        hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', name, failure);
    } finally {
        try {
            await getDriver().waitForIdle(100, 1000);
        } catch (_e) {
            // Ignore idle wait errors in cleanup
        }
        hilog.info(DOMAIN, TAG, '%{public}s end', name);
        done();
    }
    // done() 已结束用例，普通异常（非断言异常）不会被 Hypium 统计为失败；
    // 统一转成断言失败，否则失败会被误报为 Pass。
    if (failure.length > 0) {
        expect(`[${name}] ${failure}`).assertEqual('');
    }
}

export async function addLog(format: string, ...args: Array<string | number | boolean>): Promise<void> {
    hilog.info(DOMAIN, TAG, format, ...args);
}

export async function waitIdContains(id: string, expected: string,
    timeout: number = TEXT_WAIT_TIMEOUT): Promise<void> {
    const start: number = Date.now();
    while (Date.now() - start < timeout) {
        const content: string = await textOfId(id);
        if (content.includes(localizeText(expected))) {
            return;
        }
        await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    }
    throw new Error(`${id} does not contain ${expected}`);
}
