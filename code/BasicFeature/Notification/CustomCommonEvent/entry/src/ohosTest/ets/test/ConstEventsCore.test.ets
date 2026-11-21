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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { commonEventManager } from '@kit.BasicServicesKit';
import consts from '../../../main/ets/module/Consts';
import surveillanceEventsManager, { EventData } from '../../../main/ets/module/SurveillanceEventsManager';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'ConstEventsCore_';
const EVENTS: Array<string> = surveillanceEventsManager.surveillanceEvents;

function logBegin(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case begin');
}

function logEnd(tag: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, '%{public}s', 'case end');
}

function logPair(tag: string, label: string, actual: string, expected: string): void {
    hilog.info(DOMAIN, TAG_PREFIX + tag, 'label=%{public}s actual=%{public}s expected=%{public}s',
        label, actual, expected);
}

function installSettings(states: Array<number>): void {
    const map: Map<string, number> = new Map();
    for (let index = 0; index < EVENTS.length; index++) {
        map.set(EVENTS[index], states[index]);
    }
    globalThis.settings = map;
}

export default function constEventsCoreTest(): void {
    describe('ConstEventsCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_CONST_0001
         * @tc.name      testConstsDataBaseName0001
         * @tc.desc      数据库名称为约定的 nothing_pre，且与记录键命名空间区分
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsDataBaseName0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsDataBaseName0001';
            logBegin(tag);
            const actual: string = consts.DATA_BASE_NAME;
            logPair(tag, 'DATA_BASE_NAME', actual, 'nothing_pre');
            expect(actual).assertEqual('nothing_pre');
            logPair(tag, 'notEmpty', actual.length.toString(), '>0');
            expect(actual.length > 0).assertTrue();
            logPair(tag, 'differsFromRecordKey', actual, consts.DATA_BASE_KEY_TOTAL_TIMES);
            expect(actual === consts.DATA_BASE_KEY_TOTAL_TIMES).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0002
         * @tc.name      testConstsRecordKeys0002
         * @tc.desc      总次数与开始时间两个记录键的字面值固定且互不相同
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsRecordKeys0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsRecordKeys0002';
            logBegin(tag);
            const totalTimes: string = consts.DATA_BASE_KEY_TOTAL_TIMES;
            const startTime: string = consts.DATA_BASE_KEY_START_TIME;
            logPair(tag, 'totalTimes', totalTimes, 'totalTimes');
            expect(totalTimes).assertEqual('totalTimes');
            logPair(tag, 'startTime', startTime, 'startTime');
            expect(startTime).assertEqual('startTime');
            logPair(tag, 'distinct', totalTimes, startTime);
            expect(totalTimes === startTime).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0003
         * @tc.name      testConstsStateKeys0003
         * @tc.desc      onceCall 与 neverCall 两个状态记录键的字面值固定且互不相同
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsStateKeys0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsStateKeys0003';
            logBegin(tag);
            const onceKey: string = consts.DATA_BASE_KEY_ONCE_EVENTS;
            const neverKey: string = consts.DATA_BASE_KEY_NEVER_EVENTS;
            logPair(tag, 'onceKey', onceKey, 'onceCall');
            expect(onceKey).assertEqual('onceCall');
            logPair(tag, 'neverKey', neverKey, 'neverCall');
            expect(neverKey).assertEqual('neverCall');
            logPair(tag, 'distinct', onceKey, neverKey);
            expect(onceKey === neverKey).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0004
         * @tc.name      testConstsEnableState0004
         * @tc.desc      三种事件使能状态的取值分别为 0、1、2，与持久化取值约定一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEnableState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEnableState0004';
            logBegin(tag);
            logPair(tag, 'always', consts.ENABLE_STATE_ALWAYS.toString(), '0');
            expect(consts.ENABLE_STATE_ALWAYS).assertEqual(0);
            logPair(tag, 'once', consts.ENABLE_STATE_ONCE.toString(), '1');
            expect(consts.ENABLE_STATE_ONCE).assertEqual(1);
            logPair(tag, 'never', consts.ENABLE_STATE_NEVER.toString(), '2');
            expect(consts.ENABLE_STATE_NEVER).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0005
         * @tc.name      testConstsEnableStateOrder0005
         * @tc.desc      三种使能状态严格递增，可作为区间判定的有序枚举
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEnableStateOrder0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEnableStateOrder0005';
            logBegin(tag);
            logPair(tag, 'alwaysLtOnce', consts.ENABLE_STATE_ALWAYS.toString(), '<' + consts.ENABLE_STATE_ONCE.toString());
            expect(consts.ENABLE_STATE_ALWAYS < consts.ENABLE_STATE_ONCE).assertTrue();
            logPair(tag, 'onceLtNever', consts.ENABLE_STATE_ONCE.toString(), '<' + consts.ENABLE_STATE_NEVER.toString());
            expect(consts.ENABLE_STATE_ONCE < consts.ENABLE_STATE_NEVER).assertTrue();
            logPair(tag, 'alwaysLtNever', consts.ENABLE_STATE_ALWAYS.toString(), '<' + consts.ENABLE_STATE_NEVER.toString());
            expect(consts.ENABLE_STATE_ALWAYS < consts.ENABLE_STATE_NEVER).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0006
         * @tc.name      testConstsMaxRecordNum0006
         * @tc.desc      历史上限为 10 条，且该值落在使能状态值域之外，两者不会互相误判
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsMaxRecordNum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsMaxRecordNum0006';
            logBegin(tag);
            logPair(tag, 'MAX_RECORD_NUM', consts.MAX_RECORD_NUM.toString(), '10');
            expect(consts.MAX_RECORD_NUM).assertEqual(10);
            logPair(tag, 'positive', consts.MAX_RECORD_NUM.toString(), '>0');
            expect(consts.MAX_RECORD_NUM > 0).assertTrue();
            logPair(tag, 'outOfStateRange', consts.MAX_RECORD_NUM.toString(), '>' + consts.ENABLE_STATE_NEVER.toString());
            expect(consts.MAX_RECORD_NUM > consts.ENABLE_STATE_NEVER).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0007
         * @tc.name      testConstsFinishMeditationEvent0007
         * @tc.desc      自定义结束事件名固定为 finish_meditation，与设置更新事件区分
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsFinishMeditationEvent0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsFinishMeditationEvent0007';
            logBegin(tag);
            const actual: string = consts.COMMON_EVENT_FINISH_MEDITATION;
            logPair(tag, 'finishEvent', actual, 'finish_meditation');
            expect(actual).assertEqual('finish_meditation');
            logPair(tag, 'containsTopic', actual, 'meditation');
            expect(actual.indexOf('meditation') >= 0).assertTrue();
            logPair(tag, 'differsFromSettingUpdate', actual, consts.COMMON_EVENT_SETTING_UPDATE);
            expect(actual === consts.COMMON_EVENT_SETTING_UPDATE).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0008
         * @tc.name      testConstsSettingUpdateEvent0008
         * @tc.desc      设置更新事件名固定为 setting_update，命名归属设置域
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsSettingUpdateEvent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsSettingUpdateEvent0008';
            logBegin(tag);
            const actual: string = consts.COMMON_EVENT_SETTING_UPDATE;
            logPair(tag, 'settingUpdateEvent', actual, 'setting_update');
            expect(actual).assertEqual('setting_update');
            logPair(tag, 'startsWithSetting', actual.substring(0, 7), 'setting');
            expect(actual.substring(0, 7)).assertEqual('setting');
            logPair(tag, 'notEmpty', actual.length.toString(), '>0');
            expect(actual.length > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0009
         * @tc.name      testConstsWifiKey0009
         * @tc.desc      WiFi 状态键与系统公共事件常量对齐，字面值为 usual.event.wifi.POWER_STATE
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsWifiKey0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsWifiKey0009';
            logBegin(tag);
            const actual: string = consts.DATA_BASE_KEY_WIFI_POWER_STATE;
            logPair(tag, 'wifiKey', actual, 'usual.event.wifi.POWER_STATE');
            expect(actual).assertEqual('usual.event.wifi.POWER_STATE');
            logPair(tag, 'equalsSupportConst', actual, commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE);
            expect(actual).assertEqual(commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE);
            logPair(tag, 'differsFromScreenOff', actual, consts.DATA_BASE_KEY_SCREEN_OFF);
            expect(actual === consts.DATA_BASE_KEY_SCREEN_OFF).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0010
         * @tc.name      testConstsScreenOffOnKey0010
         * @tc.desc      熄屏与亮屏键与系统常量对齐，两者字面值不同
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsScreenOffOnKey0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsScreenOffOnKey0010';
            logBegin(tag);
            const offKey: string = consts.DATA_BASE_KEY_SCREEN_OFF;
            const onKey: string = consts.DATA_BASE_KEY_SCREEN_ON;
            logPair(tag, 'offKey', offKey, 'usual.event.SCREEN_OFF');
            expect(offKey).assertEqual('usual.event.SCREEN_OFF');
            logPair(tag, 'onKey', onKey, 'usual.event.SCREEN_ON');
            expect(onKey).assertEqual('usual.event.SCREEN_ON');
            logPair(tag, 'equalsSupportConst', onKey, commonEventManager.Support.COMMON_EVENT_SCREEN_ON);
            expect(onKey).assertEqual(commonEventManager.Support.COMMON_EVENT_SCREEN_ON);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0011
         * @tc.name      testConstsScreenLockedUnlockedKey0011
         * @tc.desc      锁屏与解锁键与系统常量对齐，且与熄屏亮屏键区分
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsScreenLockedUnlockedKey0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsScreenLockedUnlockedKey0011';
            logBegin(tag);
            const lockedKey: string = consts.DATA_BASE_KEY_SCREEN_LOCKED;
            const unlockedKey: string = consts.DATA_BASE_KEY_SCREEN_UNLOCKED;
            logPair(tag, 'lockedKey', lockedKey, 'usual.event.SCREEN_LOCKED');
            expect(lockedKey).assertEqual('usual.event.SCREEN_LOCKED');
            logPair(tag, 'unlockedKey', unlockedKey, commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED);
            expect(unlockedKey).assertEqual(commonEventManager.Support.COMMON_EVENT_SCREEN_UNLOCKED);
            logPair(tag, 'differsFromScreenOn', unlockedKey, consts.DATA_BASE_KEY_SCREEN_ON);
            expect(unlockedKey === consts.DATA_BASE_KEY_SCREEN_ON).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0012
         * @tc.name      testConstsSurveillanceEventsSize0012
         * @tc.desc      监听事件集合固定为五项，是状态读写的唯一定义来源
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsSurveillanceEventsSize0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsSurveillanceEventsSize0012';
            logBegin(tag);
            logPair(tag, 'size', EVENTS.length.toString(), '5');
            expect(EVENTS.length).assertEqual(5);
            logPair(tag, 'positive', EVENTS.length.toString(), '>0');
            expect(EVENTS.length > 0).assertTrue();
            logPair(tag, 'lastIndexExists', EVENTS[EVENTS.length - 1], 'usual.event.SCREEN_UNLOCKED');
            expect(EVENTS[EVENTS.length - 1]).assertEqual('usual.event.SCREEN_UNLOCKED');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0013
         * @tc.name      testConstsSurveillanceEventsOrderHeader0013
         * @tc.desc      监听集合前三项依次为 WiFi、熄屏、亮屏，顺序决定状态遍历顺序
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsSurveillanceEventsOrderHeader0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsSurveillanceEventsOrderHeader0013';
            logBegin(tag);
            logPair(tag, 'first', EVENTS[0], consts.DATA_BASE_KEY_WIFI_POWER_STATE);
            expect(EVENTS[0]).assertEqual(consts.DATA_BASE_KEY_WIFI_POWER_STATE);
            logPair(tag, 'second', EVENTS[1], consts.DATA_BASE_KEY_SCREEN_OFF);
            expect(EVENTS[1]).assertEqual(consts.DATA_BASE_KEY_SCREEN_OFF);
            logPair(tag, 'third', EVENTS[2], consts.DATA_BASE_KEY_SCREEN_ON);
            expect(EVENTS[2]).assertEqual(consts.DATA_BASE_KEY_SCREEN_ON);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0014
         * @tc.name      testConstsSurveillanceEventsOrderTail0014
         * @tc.desc      监听集合后两项依次为锁屏与解锁，尾部顺序不可交换
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsSurveillanceEventsOrderTail0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsSurveillanceEventsOrderTail0014';
            logBegin(tag);
            logPair(tag, 'fourth', EVENTS[3], consts.DATA_BASE_KEY_SCREEN_LOCKED);
            expect(EVENTS[3]).assertEqual(consts.DATA_BASE_KEY_SCREEN_LOCKED);
            logPair(tag, 'fifth', EVENTS[4], consts.DATA_BASE_KEY_SCREEN_UNLOCKED);
            expect(EVENTS[4]).assertEqual(consts.DATA_BASE_KEY_SCREEN_UNLOCKED);
            logPair(tag, 'tailDiffers', EVENTS[3], EVENTS[4]);
            expect(EVENTS[3] === EVENTS[4]).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0015
         * @tc.name      testConstsEventsMatchConstKeys0015
         * @tc.desc      监听集合逐项与 Consts 的五个事件键一一对应，两处定义不得漂移
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEventsMatchConstKeys0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEventsMatchConstKeys0015';
            logBegin(tag);
            const keys: Array<string> = [
                consts.DATA_BASE_KEY_WIFI_POWER_STATE,
                consts.DATA_BASE_KEY_SCREEN_OFF,
                consts.DATA_BASE_KEY_SCREEN_ON,
                consts.DATA_BASE_KEY_SCREEN_LOCKED,
                consts.DATA_BASE_KEY_SCREEN_UNLOCKED
            ];
            let matched: number = 0;
            for (let index = 0; index < keys.length; index++) {
                if (EVENTS[index] === keys[index]) {
                    matched++;
                }
            }
            logPair(tag, 'matched', matched.toString(), keys.length.toString());
            expect(matched).assertEqual(keys.length);
            logPair(tag, 'keyCount', keys.length.toString(), '5');
            expect(keys.length).assertEqual(5);
            logPair(tag, 'firstMatched', EVENTS[0], keys[0]);
            expect(EVENTS[0]).assertEqual(keys[0]);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0016
         * @tc.name      testConstsSurveillanceEventsUnique0016
         * @tc.desc      监听集合内无重复事件名，去重后数量不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsSurveillanceEventsUnique0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsSurveillanceEventsUnique0016';
            logBegin(tag);
            const unique: Set<string> = new Set<string>(EVENTS);
            logPair(tag, 'uniqueSize', unique.size.toString(), EVENTS.length.toString());
            expect(unique.size).assertEqual(EVENTS.length);
            logPair(tag, 'size', EVENTS.length.toString(), '5');
            expect(EVENTS.length).assertEqual(5);
            logPair(tag, 'headTailDiffers', EVENTS[0], EVENTS[4]);
            expect(EVENTS[0] === EVENTS[4]).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0017
         * @tc.name      testConstsEventStatesAllAlways0017
         * @tc.desc      全部事件置为常开时，状态映射五个键均返回 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEventStatesAllAlways0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEventStatesAllAlways0017';
            logBegin(tag);
            installSettings([0, 0, 0, 0, 0]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', states['usual.event.wifi.POWER_STATE'].toString(), '0');
            expect(states['usual.event.wifi.POWER_STATE']).assertEqual(0);
            logPair(tag, 'screenOn', states['usual.event.SCREEN_ON'].toString(), '0');
            expect(states['usual.event.SCREEN_ON']).assertEqual(0);
            logPair(tag, 'screenUnlocked', states['usual.event.SCREEN_UNLOCKED'].toString(), '0');
            expect(states['usual.event.SCREEN_UNLOCKED']).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0018
         * @tc.name      testConstsEventStatesMixed0018
         * @tc.desc      混合状态映射逐键回读一致：WiFi 为 once、亮屏为 never、其余常开
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEventStatesMixed0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEventStatesMixed0018';
            logBegin(tag);
            installSettings([1, 0, 2, 0, 0]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', states['usual.event.wifi.POWER_STATE'].toString(), '1');
            expect(states['usual.event.wifi.POWER_STATE']).assertEqual(1);
            logPair(tag, 'screenOn', states['usual.event.SCREEN_ON'].toString(), '2');
            expect(states['usual.event.SCREEN_ON']).assertEqual(2);
            logPair(tag, 'onLargerThanOff', states['usual.event.SCREEN_ON'].toString(),
                states['usual.event.SCREEN_OFF'].toString());
            expect(states['usual.event.SCREEN_ON']).assertLarger(states['usual.event.SCREEN_OFF']);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0019
         * @tc.name      testConstsEventStatesRefresh0019
         * @tc.desc      状态映射不缓存：设置变化后再次读取立即反映新值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEventStatesRefresh0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEventStatesRefresh0019';
            logBegin(tag);
            installSettings([0, 0, 0, 0, 0]);
            const before: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'beforeLocked', before['usual.event.SCREEN_LOCKED'].toString(), '0');
            expect(before['usual.event.SCREEN_LOCKED']).assertEqual(0);
            installSettings([2, 2, 2, 2, 2]);
            const after: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'afterLocked', after['usual.event.SCREEN_LOCKED'].toString(), '2');
            expect(after['usual.event.SCREEN_LOCKED']).assertEqual(2);
            logPair(tag, 'changed', before['usual.event.SCREEN_LOCKED'].toString(),
                after['usual.event.SCREEN_LOCKED'].toString());
            expect(before['usual.event.SCREEN_LOCKED'] === after['usual.event.SCREEN_LOCKED']).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0020
         * @tc.name      testConstsEventStatesEmptySettings0020
         * @tc.desc      全局状态表为空时五个键均为未定义，调用方需按缺省常开兜底
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstsEventStatesEmptySettings0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstsEventStatesEmptySettings0020';
            logBegin(tag);
            globalThis.settings = new Map<string, number>();
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', 'undefined-expected', 'undefined');
            expect(states['usual.event.wifi.POWER_STATE']).assertUndefined();
            logPair(tag, 'screenLocked', 'undefined-expected', 'undefined');
            expect(states['usual.event.SCREEN_LOCKED']).assertUndefined();
            logPair(tag, 'screenUnlocked', 'undefined-expected', 'undefined');
            expect(states['usual.event.SCREEN_UNLOCKED']).assertUndefined();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0021
         * @tc.name      testConstDataBaseName0021
         * @tc.desc      持久化库名常量为 nothing_pre，与样例固定值全等
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstDataBaseName0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstDataBaseName0021';
            logBegin(tag);
            logPair(tag, 'name', consts.DATA_BASE_NAME, 'nothing_pre');
            expect(consts.DATA_BASE_NAME).assertEqual('nothing_pre');
            logPair(tag, 'length', consts.DATA_BASE_NAME.length.toString(), '11');
            expect(consts.DATA_BASE_NAME.length).assertEqual(11);
            logPair(tag, 'endsWithPre', (consts.DATA_BASE_NAME.endsWith('_pre')).toString(), 'true');
            expect(consts.DATA_BASE_NAME.endsWith('_pre')).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0022
         * @tc.name      testConstDataBaseTimeKeys0022
         * @tc.desc      总次数与开始时间两个持久化键名与样例固定值全等
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstDataBaseTimeKeys0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstDataBaseTimeKeys0022';
            logBegin(tag);
            logPair(tag, 'totalTimes', consts.DATA_BASE_KEY_TOTAL_TIMES, 'totalTimes');
            expect(consts.DATA_BASE_KEY_TOTAL_TIMES).assertEqual('totalTimes');
            logPair(tag, 'startTime', consts.DATA_BASE_KEY_START_TIME, 'startTime');
            expect(consts.DATA_BASE_KEY_START_TIME).assertEqual('startTime');
            logPair(tag, 'distinct', (consts.DATA_BASE_KEY_TOTAL_TIMES !== consts.DATA_BASE_KEY_START_TIME).toString(), 'true');
            expect(consts.DATA_BASE_KEY_TOTAL_TIMES !== consts.DATA_BASE_KEY_START_TIME).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0023
         * @tc.name      testConstDataBaseOnceNeverKeys0023
         * @tc.desc      一次性与从不两个持久化键名与样例固定值全等
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstDataBaseOnceNeverKeys0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstDataBaseOnceNeverKeys0023';
            logBegin(tag);
            logPair(tag, 'once', consts.DATA_BASE_KEY_ONCE_EVENTS, 'onceCall');
            expect(consts.DATA_BASE_KEY_ONCE_EVENTS).assertEqual('onceCall');
            logPair(tag, 'never', consts.DATA_BASE_KEY_NEVER_EVENTS, 'neverCall');
            expect(consts.DATA_BASE_KEY_NEVER_EVENTS).assertEqual('neverCall');
            logPair(tag, 'distinct', (consts.DATA_BASE_KEY_ONCE_EVENTS !== consts.DATA_BASE_KEY_NEVER_EVENTS).toString(), 'true');
            expect(consts.DATA_BASE_KEY_ONCE_EVENTS !== consts.DATA_BASE_KEY_NEVER_EVENTS).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0024
         * @tc.name      testConstMaxRecordNum0024
         * @tc.desc      历史记录上限常量恰为 10
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstMaxRecordNum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstMaxRecordNum0024';
            logBegin(tag);
            logPair(tag, 'value', consts.MAX_RECORD_NUM.toString(), '10');
            expect(consts.MAX_RECORD_NUM).assertEqual(10);
            logPair(tag, 'overNine', (consts.MAX_RECORD_NUM > 9).toString(), 'true');
            expect(consts.MAX_RECORD_NUM > 9).assertTrue();
            logPair(tag, 'underEleven', (consts.MAX_RECORD_NUM < 11).toString(), 'true');
            expect(consts.MAX_RECORD_NUM < 11).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0025
         * @tc.name      testConstEnableStates0025
         * @tc.desc      事件开关三态常量恰为 0/1/2 且互异
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstEnableStates0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstEnableStates0025';
            logBegin(tag);
            logPair(tag, 'always', consts.ENABLE_STATE_ALWAYS.toString(), '0');
            expect(consts.ENABLE_STATE_ALWAYS).assertEqual(0);
            logPair(tag, 'once', consts.ENABLE_STATE_ONCE.toString(), '1');
            expect(consts.ENABLE_STATE_ONCE).assertEqual(1);
            logPair(tag, 'never', consts.ENABLE_STATE_NEVER.toString(), '2');
            expect(consts.ENABLE_STATE_NEVER).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0026
         * @tc.name      testConstFinishMeditation0026
         * @tc.desc      冥想结束自定义事件常量为 finish_meditation
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstFinishMeditation0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstFinishMeditation0026';
            logBegin(tag);
            logPair(tag, 'value', consts.COMMON_EVENT_FINISH_MEDITATION, 'finish_meditation');
            expect(consts.COMMON_EVENT_FINISH_MEDITATION).assertEqual('finish_meditation');
            logPair(tag, 'length', consts.COMMON_EVENT_FINISH_MEDITATION.length.toString(), '17');
            expect(consts.COMMON_EVENT_FINISH_MEDITATION.length).assertEqual(17);
            logPair(tag, 'underscores', (consts.COMMON_EVENT_FINISH_MEDITATION.indexOf('_') > 0).toString(), 'true');
            expect(consts.COMMON_EVENT_FINISH_MEDITATION.indexOf('_') > 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0027
         * @tc.name      testConstSettingUpdate0027
         * @tc.desc      设置更新自定义事件常量为 setting_update
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstSettingUpdate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstSettingUpdate0027';
            logBegin(tag);
            logPair(tag, 'value', consts.COMMON_EVENT_SETTING_UPDATE, 'setting_update');
            expect(consts.COMMON_EVENT_SETTING_UPDATE).assertEqual('setting_update');
            logPair(tag, 'length', consts.COMMON_EVENT_SETTING_UPDATE.length.toString(), '14');
            expect(consts.COMMON_EVENT_SETTING_UPDATE.length).assertEqual(14);
            logPair(tag, 'distinctFromMeditation',
                (consts.COMMON_EVENT_SETTING_UPDATE !== consts.COMMON_EVENT_FINISH_MEDITATION).toString(), 'true');
            expect(consts.COMMON_EVENT_SETTING_UPDATE !== consts.COMMON_EVENT_FINISH_MEDITATION).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0028
         * @tc.name      testConstWifiKeyMatchesSupport0028
         * @tc.desc      wifi 开关持久化键与系统事件常量值逐字对齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstWifiKeyMatchesSupport0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstWifiKeyMatchesSupport0028';
            logBegin(tag);
            const support: string = commonEventManager.Support.COMMON_EVENT_WIFI_POWER_STATE;
            logPair(tag, 'key', consts.DATA_BASE_KEY_WIFI_POWER_STATE, 'usual.event.wifi.POWER_STATE');
            expect(consts.DATA_BASE_KEY_WIFI_POWER_STATE).assertEqual('usual.event.wifi.POWER_STATE');
            logPair(tag, 'support', consts.DATA_BASE_KEY_WIFI_POWER_STATE, support);
            expect(consts.DATA_BASE_KEY_WIFI_POWER_STATE).assertEqual(support);
            logPair(tag, 'sameRef', (consts.DATA_BASE_KEY_WIFI_POWER_STATE === support).toString(), 'true');
            expect(consts.DATA_BASE_KEY_WIFI_POWER_STATE === support).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0029
         * @tc.name      testConstScreenOffOnKeys0029
         * @tc.desc      灭屏与亮屏两个持久化键与系统事件常量值对齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstScreenOffOnKeys0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstScreenOffOnKeys0029';
            logBegin(tag);
            logPair(tag, 'off', consts.DATA_BASE_KEY_SCREEN_OFF, 'usual.event.SCREEN_OFF');
            expect(consts.DATA_BASE_KEY_SCREEN_OFF).assertEqual('usual.event.SCREEN_OFF');
            logPair(tag, 'on', consts.DATA_BASE_KEY_SCREEN_ON, 'usual.event.SCREEN_ON');
            expect(consts.DATA_BASE_KEY_SCREEN_ON).assertEqual('usual.event.SCREEN_ON');
            logPair(tag, 'offSupport', consts.DATA_BASE_KEY_SCREEN_OFF,
                commonEventManager.Support.COMMON_EVENT_SCREEN_OFF);
            expect(consts.DATA_BASE_KEY_SCREEN_OFF).assertEqual(commonEventManager.Support.COMMON_EVENT_SCREEN_OFF);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0030
         * @tc.name      testConstScreenLockKeys0030
         * @tc.desc      锁屏与解锁两个持久化键与系统事件常量值对齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstScreenLockKeys0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstScreenLockKeys0030';
            logBegin(tag);
            logPair(tag, 'locked', consts.DATA_BASE_KEY_SCREEN_LOCKED, 'usual.event.SCREEN_LOCKED');
            expect(consts.DATA_BASE_KEY_SCREEN_LOCKED).assertEqual('usual.event.SCREEN_LOCKED');
            logPair(tag, 'unlocked', consts.DATA_BASE_KEY_SCREEN_UNLOCKED, 'usual.event.SCREEN_UNLOCKED');
            expect(consts.DATA_BASE_KEY_SCREEN_UNLOCKED).assertEqual('usual.event.SCREEN_UNLOCKED');
            logPair(tag, 'lockedSupport', consts.DATA_BASE_KEY_SCREEN_LOCKED,
                commonEventManager.Support.COMMON_EVENT_SCREEN_LOCKED);
            expect(consts.DATA_BASE_KEY_SCREEN_LOCKED).assertEqual(commonEventManager.Support.COMMON_EVENT_SCREEN_LOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0031
         * @tc.name      testConstKeysAlignEvents0031
         * @tc.desc      五个监控持久化键与 surveillanceEvents 事件表逐项对齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstKeysAlignEvents0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstKeysAlignEvents0031';
            logBegin(tag);
            const events: Array<string> = surveillanceEventsManager.surveillanceEvents;
            logPair(tag, 'first', consts.DATA_BASE_KEY_WIFI_POWER_STATE, events[0]);
            expect(consts.DATA_BASE_KEY_WIFI_POWER_STATE).assertEqual(events[0]);
            logPair(tag, 'last', consts.DATA_BASE_KEY_SCREEN_UNLOCKED, events[4]);
            expect(consts.DATA_BASE_KEY_SCREEN_UNLOCKED).assertEqual(events[4]);
            logPair(tag, 'size', events.length.toString(), '5');
            expect(events.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CONST_0032
         * @tc.name      testConstSurveillanceKeyPrefix0032
         * @tc.desc      五个监控键统一携带 usual.event. 前缀
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testConstSurveillanceKeyPrefix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testConstSurveillanceKeyPrefix0032';
            logBegin(tag);
            const keys: Array<string> = [
                consts.DATA_BASE_KEY_WIFI_POWER_STATE, consts.DATA_BASE_KEY_SCREEN_OFF,
                consts.DATA_BASE_KEY_SCREEN_ON, consts.DATA_BASE_KEY_SCREEN_LOCKED,
                consts.DATA_BASE_KEY_SCREEN_UNLOCKED
            ];
            let allPrefixed: boolean = true;
            for (let i = 0; i < keys.length; i++) {
                if (keys[i].indexOf('usual.event.') !== 0) {
                    allPrefixed = false;
                }
            }
            logPair(tag, 'allPrefixed', allPrefixed.toString(), 'true');
            expect(allPrefixed).assertTrue();
            logPair(tag, 'unlockedPrefix', keys[4].substring(0, 12), 'usual.event.');
            expect(keys[4].substring(0, 12)).assertEqual('usual.event.');
            logPair(tag, 'wifiTail', keys[0].substring(12), 'wifi.POWER_STATE');
            expect(keys[0].substring(12)).assertEqual('wifi.POWER_STATE');
            logEnd(tag);
        })
    })
}
