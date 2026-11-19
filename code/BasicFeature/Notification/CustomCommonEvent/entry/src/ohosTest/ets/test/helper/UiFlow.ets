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

import { Driver, ON, Component, MatchPattern } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomCommonEvent]';
const POLL_MS: number = 200;
const SHORT_MS: number = 3000;
const LONG_MS: number = 15000;
const MAX_BACK_TIMES: number = 5;
const RECORD_SETTLE_MS: number = 800;

// 页面语义 id：全部取自 src/main/ets/pages；P9 C 档新增 5 个（historyRecordList / main* / aboutVersionText）
export const ID_LAUNCH: string = 'jumpToStart';
export const ID_HISTORY: string = 'jumpToHistory';
export const ID_SETTING: string = 'jumpToSetting';
export const ID_ABOUT: string = 'jumpToAbout';
export const ID_START: string = 'startMonitor';
export const ID_NEXT_DETAIL: string = 'nextDetail';
export const ID_COMMON_EVENT: string = 'jumpToCommonEvent';
export const ID_ONCE_TEXT: string = 'onceEventText';
export const ID_DETAIL_LIST: string = 'detailList';
export const ID_HISTORY_LIST: string = 'historyRecordList';
export const ID_MAIN_CURRENT_EVENT: string = 'mainCurrentEventText';
export const ID_MAIN_DURATION: string = 'mainDurationText';
export const ID_MAIN_EVENT_COUNT: string = 'mainEventCountText';
export const ID_ABOUT_VERSION: string = 'aboutVersionText';

// 界面文案：与 src/main/resources/base/element/string.json 的 base 取值逐字一致
export const TXT_CURRENT_LISTEN: string = '当前监听状态：';
export const TXT_TOTAL_TIME: string = '本次监控时长：';
export const TXT_TOTAL_INTERRUPT: string = '监控期间干扰次数：';
export const TXT_ONCE_TIPS: string = '如下事件仅在本次运行期生效:';
export const TXT_START_TIME: string = '开始于：';
export const TXT_END_TIME: string = '结束于：';
export const TXT_TOTAL_TIME_LABEL: string = '总耗时：';
export const TXT_TOTAL_INTERRUPT_LABEL: string = '干扰次数：';
export const TXT_SAMPLE_VERSION: string = 'version 0.0.1';
export const TXT_SAMPLE_DESC_PREFIX: string = '本示例用于演示公共事件的订阅和发布';
export const TXT_COMMON_EVENT_TITLE: string = '自定义事件定向订阅';
export const TXT_SUBSCRIBE: string = '订阅';
export const TXT_UNSUBSCRIBE: string = '取消订阅';
export const TXT_ENABLE_WIFI: string = '是否记录联网事件';
export const TXT_ENABLE_OFF: string = '是否记录灭屏事件';
export const TXT_ENABLE_ON: string = '是否记录亮屏事件';
export const TXT_ENABLE_LOCKED: string = '是否记录锁屏事件';
export const TXT_ENABLE_UNLOCKED: string = '是否记录解锁屏幕事件';
export const TXT_ALWAYS: string = '一直';
export const TXT_ONCE: string = '仅本次';
export const TXT_NEVER: string = '从不';
// convertTimeToFormatString 的输出恒为 HH:MM:SS（两位补零）
export const REGEX_HHMMSS: string = '\\d\\d:\\d\\d:\\d\\d';

/** 详情页记录列表的实测状态：列表项数量与容器可见性。 */
export interface DetailListState {
    itemCount: number;
    listShown: boolean;
}

export class UiFlow {
    private static instance: Driver | null = null;

    static driver(): Driver {
        if (UiFlow.instance === null) {
            UiFlow.instance = Driver.create();
        }
        return UiFlow.instance;
    }

    static async findId(id: string): Promise<Component | null> {
        return await UiFlow.driver().findComponent(ON.id(id));
    }

    static async findText(text: string): Promise<Component | null> {
        return await UiFlow.driver().findComponent(ON.text(text, MatchPattern.CONTAINS));
    }

    static async waitId(id: string, timeoutMs: number): Promise<Component | null> {
        const deadline: number = Date.now() + timeoutMs;
        while (Date.now() < deadline) {
            const found: Component | null = await UiFlow.driver().findComponent(ON.id(id));
            if (found !== null) {
                return found;
            }
            await UiFlow.driver().delayMs(POLL_MS);
        }
        return null;
    }

    static async waitIdGone(id: string, timeoutMs: number): Promise<boolean> {
        const deadline: number = Date.now() + timeoutMs;
        while (Date.now() < deadline) {
            const found: Component | null = await UiFlow.driver().findComponent(ON.id(id));
            if (found === null) {
                return true;
            }
            await UiFlow.driver().delayMs(POLL_MS);
        }
        return false;
    }

    static async waitText(text: string, timeoutMs: number): Promise<Component | null> {
        const deadline: number = Date.now() + timeoutMs;
        while (Date.now() < deadline) {
            const found: Component | null = await UiFlow.driver().findComponent(ON.text(text, MatchPattern.CONTAINS));
            if (found !== null) {
                return found;
            }
            await UiFlow.driver().delayMs(POLL_MS);
        }
        return null;
    }

    static async waitTextRegex(pattern: string, timeoutMs: number): Promise<Component | null> {
        const deadline: number = Date.now() + timeoutMs;
        while (Date.now() < deadline) {
            const found: Component | null = await UiFlow.driver().findComponent(ON.text(pattern, MatchPattern.REG_EXP));
            if (found !== null) {
                return found;
            }
            await UiFlow.driver().delayMs(POLL_MS);
        }
        return null;
    }

    static async clickId(id: string): Promise<boolean> {
        const component: Component | null = await UiFlow.waitId(id, SHORT_MS);
        if (component === null) {
            return false;
        }
        await component.click();
        return true;
    }

    static async clickText(text: string): Promise<boolean> {
        const component: Component | null = await UiFlow.waitText(text, SHORT_MS);
        if (component === null) {
            return false;
        }
        await component.click();
        return true;
    }

    static async textOfId(id: string): Promise<string> {
        const component: Component | null = await UiFlow.waitId(id, SHORT_MS);
        if (component === null) {
            return '';
        }
        return await component.getText();
    }

    static async isCheckedId(id: string): Promise<boolean> {
        const component: Component | null = await UiFlow.waitId(id, SHORT_MS);
        if (component === null) {
            return false;
        }
        return await component.isChecked();
    }

    /** 同类型组件数量；无命中时 findComponents 返回 null，一律按 0 计。 */
    static async countByType(type: string): Promise<number> {
        const components: Array<Component> | null = await UiFlow.driver().findComponents(ON.type(type));
        return components === null ? 0 : components.length;
    }

    static async clickRadio(event: string, state: number): Promise<boolean> {
        return await UiFlow.clickId(event + state.toString());
    }

    static async back(): Promise<void> {
        await UiFlow.driver().pressBack();
        await UiFlow.driver().delayMs(POLL_MS);
    }

    /**
     * 拉起 LauncherAbility 并等待首页入口可点；应用已在前台时直接复用。
     */
    static async ensureLaunchPage(): Promise<boolean> {
        const exist: Component | null = await UiFlow.waitId(ID_LAUNCH, SHORT_MS);
        if (exist !== null) {
            return true;
        }
        const delegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
        const want: Want = {
            bundleName: 'com.samples.customcommonevent',
            abilityName: 'LauncherAbility'
        };
        await delegator.startAbility(want);
        const launched: Component | null = await UiFlow.waitId(ID_LAUNCH, LONG_MS);
        hilog.info(DOMAIN, TAG, 'launch page ready=%{public}s', (launched !== null).toString());
        return launched !== null;
    }

    /**
     * 结束残留监听会话（若正在监听），保证下一个用例从"未开始监控"状态起步。
     */
    static async stopMonitorIfRunning(): Promise<void> {
        const running: Component | null = await UiFlow.findText(TXT_CURRENT_LISTEN);
        if (running === null) {
            return;
        }
        await UiFlow.clickId(ID_START);
        await UiFlow.waitText(TXT_TOTAL_TIME, SHORT_MS);
    }

    /**
     * 把界面退回首页：沿途结束监听会话，最多按 MAX_BACK_TIMES 次返回键。
     */
    static async resetToLaunchPage(): Promise<boolean> {
        for (let attempt = 0; attempt < MAX_BACK_TIMES; attempt++) {
            const entry: Component | null = await UiFlow.findId(ID_LAUNCH);
            if (entry !== null) {
                return true;
            }
            if (await UiFlow.findId(ID_START) !== null) {
                await UiFlow.stopMonitorIfRunning();
            }
            await UiFlow.back();
        }
        return (await UiFlow.findId(ID_LAUNCH)) !== null;
    }

    static async openMonitor(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_LAUNCH)) {
            return false;
        }
        return (await UiFlow.waitId(ID_START, LONG_MS)) !== null;
    }

    static async startMonitor(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_START)) {
            return false;
        }
        return (await UiFlow.waitText(TXT_CURRENT_LISTEN, LONG_MS)) !== null;
    }

    static async stopMonitor(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_START)) {
            return false;
        }
        return (await UiFlow.waitText(TXT_TOTAL_TIME, LONG_MS)) !== null;
    }

    /**
     * 结束监控后历史记录由后台 put→flush 链写入，读历史页前留出有界等待。
     */
    static async settleForRecordPersist(): Promise<void> {
        await UiFlow.driver().delayMs(1200);
    }

    static async openHistory(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_HISTORY)) {
            return false;
        }
        return await UiFlow.waitIdGone(ID_HISTORY, LONG_MS);
    }

    static async openSetting(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_SETTING)) {
            return false;
        }
        return (await UiFlow.waitId(ID_COMMON_EVENT, LONG_MS)) !== null;
    }

    static async openAbout(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_ABOUT)) {
            return false;
        }
        return await UiFlow.waitIdGone(ID_ABOUT, LONG_MS);
    }

    /**
     * 设置页订阅入口：点击后由 LaunchFeature 拉起外部 CardEvent 示例（外应用未安装时无可见变化），
     * 本应用自身不切页，因此只校验入口可点击，不用页面标题做成功标记。
     */
    static async clickSubscribeEntry(): Promise<boolean> {
        return await UiFlow.clickId(ID_COMMON_EVENT);
    }

    /** 订阅入口按钮文案（资源 app.string.SubscribeEvent）。 */
    static async subscribeEntryText(): Promise<string> {
        return await UiFlow.textOfId(ID_COMMON_EVENT);
    }

    /**
     * 详情页列表状态：记录列表仅由监控期间收到的系统事件填充，无事件时 List 无子项、
     * 高度为 0 不进组件树（detailList 定位不到）；有记录时容器与列表项同时可见。
     */
    static async detailListState(): Promise<DetailListState> {
        const itemCount: number = await UiFlow.countByType('ListItem');
        const listShown: boolean = (await UiFlow.findId(ID_DETAIL_LIST)) !== null;
        const state: DetailListState = { itemCount: itemCount, listShown: listShown };
        return state;
    }

    static async openDetail(): Promise<boolean> {
        if (!await UiFlow.clickId(ID_NEXT_DETAIL)) {
            return false;
        }
        return (await UiFlow.waitId(ID_ONCE_TEXT, LONG_MS)) !== null;
    }

    /** 历史页列表容器（空列表同样命中）是否就位。 */
    static async historyListReady(): Promise<boolean> {
        return (await UiFlow.waitId(ID_HISTORY_LIST, SHORT_MS)) !== null;
    }

    /** 历史页列表项数量。 */
    static async historyItemCount(): Promise<number> {
        return await UiFlow.countByType('ListItem');
    }

    /**
     * 确保历史页至少有一条记录：应用只保留十条记录，结束监听恰好触发滚动清理时历史会被清空，
     * 此时回首页补一轮监控会话再读；调用方应已停在历史页。
     */
    static async ensureHistoryRecord(): Promise<number> {
        await UiFlow.driver().delayMs(RECORD_SETTLE_MS);
        const first: number = await UiFlow.historyItemCount();
        if (first > 0) {
            return first;
        }
        hilog.info(DOMAIN, TAG, 'history empty, retry one session');
        await UiFlow.back();
        const entryBack: boolean = (await UiFlow.waitId(ID_HISTORY, LONG_MS)) !== null;
        if (!entryBack) {
            return 0;
        }
        const monitorOpened: boolean = await UiFlow.openMonitor();
        const started: boolean = monitorOpened && await UiFlow.startMonitor();
        if (!started) {
            return 0;
        }
        await UiFlow.stopMonitor();
        await UiFlow.settleForRecordPersist();
        const home: boolean = await UiFlow.resetToLaunchPage();
        const reopened: boolean = home && await UiFlow.openHistory();
        if (!reopened) {
            return 0;
        }
        await UiFlow.driver().delayMs(RECORD_SETTLE_MS);
        return await UiFlow.historyItemCount();
    }

    /** 按 id 读当前监听事件文案（未开始监听时为空串）。 */
    static async currentEventText(): Promise<string> {
        return await UiFlow.textOfId(ID_MAIN_CURRENT_EVENT);
    }

    /** 按 id 读本次监控时长文案。 */
    static async durationText(): Promise<string> {
        return await UiFlow.textOfId(ID_MAIN_DURATION);
    }

    /** 按 id 读监控期间干扰次数文案。 */
    static async eventCountText(): Promise<string> {
        return await UiFlow.textOfId(ID_MAIN_EVENT_COUNT);
    }

    /** 按 id 读关于页版本号文案。 */
    static async aboutVersionText(): Promise<string> {
        return await UiFlow.textOfId(ID_ABOUT_VERSION);
    }

    /** 按 id 取文本后做正则匹配（禁止正则字面量，统一 new RegExp）。 */
    static async textMatchesRegex(id: string, pattern: string): Promise<boolean> {
        const text: string = await UiFlow.textOfId(id);
        return new RegExp(pattern).test(text);
    }
}
