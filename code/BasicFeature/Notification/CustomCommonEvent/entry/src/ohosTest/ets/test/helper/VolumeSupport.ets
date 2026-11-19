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
import mainFeature from '../../../../main/ets/feature/MainFeature';
import settingFeature from '../../../../main/ets/feature/SettingFeature';
import surveillanceEventsManager from '../../../../main/ets/module/SurveillanceEventsManager';
import { getTestContext } from './TestStorage';

const EVENTS: Array<string> = surveillanceEventsManager.surveillanceEvents;

/**
 * 按逗号分隔的五键取值构造 globalThis.settings，供扫描用例逐行注入。
 */
export function installStates(csv: string): void {
    const values: Array<string> = csv.split(',');
    const map: Map<string, number> = new Map();
    for (let index = 0; index < EVENTS.length; index++) {
        map.set(EVENTS[index], Number(values[index]));
    }
    globalThis.settings = map;
}

/**
 * 按逗号分隔的五键取值构造 globalThis.settings，'~' 表示该键缺失（不入表），
 * 用于键缺失语义的扫描用例。
 */
export function installStatesSparse(csv: string): void {
    const values: Array<string> = csv.split(',');
    const map: Map<string, number> = new Map();
    for (let index = 0; index < EVENTS.length; index++) {
        if (values[index] === '~') {
            continue;
        }
        map.set(EVENTS[index], Number(values[index]));
    }
    globalThis.settings = map;
}

/**
 * 走 MainFeature 的状态推演，返回有效事件串。
 */
export function validEvents(): string {
    const feature: mainFeature = new mainFeature();
    return feature.getCurrentValidEvents().join(',');
}

/**
 * 走 MainFeature 的状态推演，返回一次性事件串。
 */
export function onceEvents(): string {
    const feature: mainFeature = new mainFeature();
    return feature.getOnceEvents().join(',');
}

function settingOf(): settingFeature {
    const context: common.UIAbilityContext | undefined = getTestContext();
    return new settingFeature(context as common.UIAbilityContext);
}

let settingStateFeature: settingFeature | null = null;

/**
 * 惰性构造并初始化 SettingFeature，供 changeState 扫描用例在 beforeAll 中等待就绪。
 */
export async function prepareSettingFeature(): Promise<void> {
    if (settingStateFeature === null) {
        const feature: settingFeature = settingOf();
        await feature.init();
        settingStateFeature = feature;
    }
}

/**
 * 同步执行 changeState：更新 globalThis.settings 并发布设置事件（落盘异步进行）。
 */
export function changeStateOf(group: string, state: number): void {
    if (settingStateFeature !== null) {
        settingStateFeature.changeState(group, state);
    }
}

export function checkAlways(event: string): boolean {
    return settingOf().checkStateForAlways(event);
}

export function checkOnce(event: string): boolean {
    return settingOf().checkStateForOnce(event);
}

export function checkNever(event: string): boolean {
    return settingOf().checkStateForNever(event);
}

/**
 * '|' 分隔的紧凑串转数组，空串表示空数组；元素为空时用 '|' 相邻表达。
 */
export function arr(csv: string): Array<string> {
    return csv === '' ? [] : csv.split('|');
}

/**
 * '|' 分隔的紧凑串转数组，保留元素个数；空串表示空数组，单个 '~' 表示一个空串元素。
 */
export function arrExact(csv: string): Array<string> {
    if (csv === '') {
        return [];
    }
    if (csv === '~') {
        return [''];
    }
    return csv.split('|');
}

/**
 * ';' 分组、'|' 分隔的紧凑串转二维数组；空串表示无记录，单个 '~' 表示一条空记录。
 */
export function rows(csv: string): Array<Array<string>> {
    if (csv === '') {
        return [];
    }
    const groups: Array<string> = csv.split(';');
    const result: Array<Array<string>> = [];
    for (let index = 0; index < groups.length; index++) {
        const group: string = groups[index];
        result.push((group === '' || group === '~') ? [] : group.split('|'));
    }
    return result;
}

/**
 * 'k=v|k2=v2' 转 Record，只保留显式给出的键（缺失键即不存在）。
 */
export function paramMap(csv: string): Record<string, string> {
    const result: Record<string, string> = {};
    if (csv === '') {
        return result;
    }
    const pairs: Array<string> = csv.split('|');
    for (let index = 0; index < pairs.length; index++) {
        const pair: Array<string> = pairs[index].split('=');
        result[pair[0]] = pair.length > 1 ? pair[1] : '';
    }
    return result;
}
