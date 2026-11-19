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
import common from '@ohos.app.ability.common';
import launchFeature from '../../../main/ets/feature/LaunchFeature';
import settingFeature from '../../../main/ets/feature/SettingFeature';
import mainFeature from '../../../main/ets/feature/MainFeature';
import consts from '../../../main/ets/module/Consts';
import surveillanceEventsManager from '../../../main/ets/module/SurveillanceEventsManager';
import { clearStore, getTestContext, putNumber } from './helper/TestStorage';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'LaunchFeatureCore_';
const MISSING: number = -1000;
const EVENT_KEYS: Array<string> = surveillanceEventsManager.surveillanceEvents;
const PREF_KEYS: Array<string> = [
    consts.DATA_BASE_KEY_WIFI_POWER_STATE,
    consts.DATA_BASE_KEY_SCREEN_OFF,
    consts.DATA_BASE_KEY_SCREEN_ON,
    consts.DATA_BASE_KEY_SCREEN_LOCKED,
    consts.DATA_BASE_KEY_SCREEN_UNLOCKED
];
const WIFI: string = EVENT_KEYS[0];
const OFF: string = EVENT_KEYS[1];
const SCREEN_ON: string = EVENT_KEYS[2];
const LOCKED: string = EVENT_KEYS[3];
const UNLOCKED: string = EVENT_KEYS[4];

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

function requireContext(): common.UIAbilityContext {
    const context: common.UIAbilityContext | undefined = getTestContext();
    if (context === undefined) {
        throw new Error('test ability context is not ready');
    }
    return context;
}

function readState(key: string): number {
    const value: number | undefined = globalThis.settings.get(key);
    return value === undefined ? MISSING : value;
}

function countValue(target: number): number {
    let matched: number = 0;
    for (let index = 0; index < EVENT_KEYS.length; index++) {
        if (readState(EVENT_KEYS[index]) === target) {
            matched++;
        }
    }
    return matched;
}

function snapshotStates(): string {
    const parts: Array<string> = [];
    for (let index = 0; index < PREF_KEYS.length; index++) {
        parts.push(readState(PREF_KEYS[index]).toString());
    }
    return parts.join(',');
}

function resetMemory(): void {
    globalThis.settings = new Map<string, number>();
}

async function runLaunch(): Promise<void> {
    const launcher: launchFeature = new launchFeature(requireContext());
    await launcher.init();
}

async function writeStates(values: Array<number>): Promise<void> {
    await clearStore();
    for (let index = 0; index < PREF_KEYS.length; index++) {
        await putNumber(PREF_KEYS[index], values[index]);
    }
}

export default function launchFeatureCoreTest(): void {
    describe('LaunchFeatureCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_LAUNCH_0001
         * @tc.name      testLaunchEmptyStore0001
         * @tc.desc      存储全空时五个状态键都回落为 0，且只写入这五个键
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchEmptyStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchEmptyStore0001';
            logBegin(tag);
            await clearStore();
            resetMemory();
            await runLaunch();
            logPair(tag, 'size', globalThis.settings.size.toString(), '5');
            expect(globalThis.settings.size).assertEqual(5);
            logPair(tag, 'wifi', readState(WIFI).toString(), '0');
            expect(readState(WIFI)).assertEqual(0);
            logPair(tag, 'unlocked', readState(UNLOCKED).toString(), '0');
            expect(readState(UNLOCKED)).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0002
         * @tc.name      testLaunchAllOnce0002
         * @tc.desc      存储中五项都为 1 时内存状态五项全部为 1
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchAllOnce0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchAllOnce0002';
            logBegin(tag);
            await writeStates([1, 1, 1, 1, 1]);
            resetMemory();
            await runLaunch();
            logPair(tag, 'wifi', readState(WIFI).toString(), '1');
            expect(readState(WIFI)).assertEqual(1);
            logPair(tag, 'screenOn', readState(SCREEN_ON).toString(), '1');
            expect(readState(SCREEN_ON)).assertEqual(1);
            logPair(tag, 'onceCount', countValue(1).toString(), '5');
            expect(countValue(1)).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0003
         * @tc.name      testLaunchAllNever0003
         * @tc.desc      存储中五项都为 2 时内存状态五项全部为 2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchAllNever0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchAllNever0003';
            logBegin(tag);
            await writeStates([2, 2, 2, 2, 2]);
            resetMemory();
            await runLaunch();
            logPair(tag, 'snapshot', snapshotStates(), '2,2,2,2,2');
            expect(snapshotStates()).assertEqual('2,2,2,2,2');
            logPair(tag, 'neverCount', countValue(2).toString(), '5');
            expect(countValue(2)).assertEqual(5);
            logPair(tag, 'unlocked', readState(UNLOCKED).toString(), '2');
            expect(readState(UNLOCKED)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0004
         * @tc.name      testLaunchSingleKey0004
         * @tc.desc      只写入 WiFi 键时该项恢复为 1，其余未写入项仍为 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchSingleKey0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchSingleKey0004';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 1);
            resetMemory();
            await runLaunch();
            logPair(tag, 'wifi', readState(WIFI).toString(), '1');
            expect(readState(WIFI)).assertEqual(1);
            logPair(tag, 'locked', readState(LOCKED).toString(), '0');
            expect(readState(LOCKED)).assertEqual(0);
            logPair(tag, 'snapshot', snapshotStates(), '1,0,0,0,0');
            expect(snapshotStates()).assertEqual('1,0,0,0,0');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0005
         * @tc.name      testLaunchMixedStates0005
         * @tc.desc      五项混合状态按各自存储值逐项恢复，互不串扰
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchMixedStates0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchMixedStates0005';
            logBegin(tag);
            await writeStates([1, 0, 2, 1, 2]);
            resetMemory();
            await runLaunch();
            logPair(tag, 'snapshot', snapshotStates(), '1,0,2,1,2');
            expect(snapshotStates()).assertEqual('1,0,2,1,2');
            logPair(tag, 'off', readState(OFF).toString(), '0');
            expect(readState(OFF)).assertEqual(0);
            logPair(tag, 'screenOn', readState(SCREEN_ON).toString(), '2');
            expect(readState(SCREEN_ON)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0006
         * @tc.name      testLaunchOverwriteMemory0006
         * @tc.desc      恢复结果覆盖内存里的旧状态，未落盘的旧值不会残留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchOverwriteMemory0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchOverwriteMemory0006';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 1);
            globalThis.settings = new Map<string, number>();
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                globalThis.settings.set(EVENT_KEYS[index], 2);
            }
            await runLaunch();
            logPair(tag, 'wifi', readState(WIFI).toString(), '1');
            expect(readState(WIFI)).assertEqual(1);
            logPair(tag, 'locked', readState(LOCKED).toString(), '0');
            expect(readState(LOCKED)).assertEqual(0);
            logPair(tag, 'oldValueGone', (readState(LOCKED) === 2).toString(), 'false');
            expect(readState(LOCKED) === 2).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0007
         * @tc.name      testLaunchInvalidThree0007
         * @tc.desc      越界值 3 被原样读入，不进入常开或仅一次分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchInvalidThree0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchInvalidThree0007';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 3);
            resetMemory();
            await runLaunch();
            logPair(tag, 'wifi', readState(WIFI).toString(), '3');
            expect(readState(WIFI)).assertEqual(3);
            logPair(tag, 'otherZeroCount', countValue(0).toString(), '4');
            expect(countValue(0)).assertEqual(4);
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '4');
            expect(feature.getCurrentValidEvents().length).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0008
         * @tc.name      testLaunchInvalidNinetyNine0008
         * @tc.desc      非预期的大值 99 同样原样读入，读取链路不做取值校验
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchInvalidNinetyNine0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchInvalidNinetyNine0008';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_SCREEN_ON, 99);
            resetMemory();
            await runLaunch();
            logPair(tag, 'screenOn', readState(SCREEN_ON).toString(), '99');
            expect(readState(SCREEN_ON)).assertEqual(99);
            logPair(tag, 'aboveNever', (readState(SCREEN_ON) > 2).toString(), 'true');
            expect(readState(SCREEN_ON)).assertLarger(2);
            logPair(tag, 'ninetyNineCount', countValue(99).toString(), '1');
            expect(countValue(99)).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0009
         * @tc.name      testLaunchNegativeValue0009
         * @tc.desc      负值 -1 被原样读入，不会被归一化到 0 或 2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchNegativeValue0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchNegativeValue0009';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_SCREEN_UNLOCKED, -1);
            resetMemory();
            await runLaunch();
            logPair(tag, 'unlocked', readState(UNLOCKED).toString(), '-1');
            expect(readState(UNLOCKED)).assertEqual(-1);
            logPair(tag, 'belowZero', (readState(UNLOCKED) < 0).toString(), 'true');
            expect(readState(UNLOCKED)).assertLess(0);
            logPair(tag, 'zeroCount', countValue(0).toString(), '4');
            expect(countValue(0)).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0010
         * @tc.name      testLaunchRepeatedInit0010
         * @tc.desc      同一存储内容连续恢复两次得到相同状态，恢复过程不写入新值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchRepeatedInit0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchRepeatedInit0010';
            logBegin(tag);
            await writeStates([0, 1, 2, 1, 0]);
            resetMemory();
            await runLaunch();
            const first: string = snapshotStates();
            await runLaunch();
            const second: string = snapshotStates();
            logPair(tag, 'first', first, '0,1,2,1,0');
            expect(first).assertEqual('0,1,2,1,0');
            logPair(tag, 'sameAfterSecond', (first === second).toString(), 'true');
            expect(second).assertEqual(first);
            logPair(tag, 'size', globalThis.settings.size.toString(), '5');
            expect(globalThis.settings.size).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0011
         * @tc.name      testLaunchKeyMapping0011
         * @tc.desc      落盘键名与监听的五个系统事件名逐字一致，恢复后五键齐备
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchKeyMapping0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchKeyMapping0011';
            logBegin(tag);
            await writeStates([0, 0, 0, 0, 0]);
            resetMemory();
            await runLaunch();
            logPair(tag, 'prefKeys', PREF_KEYS.join(','), EVENT_KEYS.join(','));
            expect(PREF_KEYS.join(',')).assertEqual(EVENT_KEYS.join(','));
            let present: number = 0;
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                if (globalThis.settings.has(EVENT_KEYS[index])) {
                    present++;
                }
            }
            logPair(tag, 'present', present.toString(), '5');
            expect(present).assertEqual(5);
            logPair(tag, 'wifiKey', PREF_KEYS[0], 'usual.event.wifi.POWER_STATE');
            expect(PREF_KEYS[0]).assertEqual('usual.event.wifi.POWER_STATE');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0012
         * @tc.name      testLaunchKeepExtraKey0012
         * @tc.desc      恢复只覆盖自身五个键，内存中已有的其它键保持原值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchKeepExtraKey0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchKeepExtraKey0012';
            logBegin(tag);
            await writeStates([1, 1, 1, 1, 1]);
            resetMemory();
            globalThis.settings.set('extra_key', 7);
            await runLaunch();
            logPair(tag, 'size', globalThis.settings.size.toString(), '6');
            expect(globalThis.settings.size).assertEqual(6);
            logPair(tag, 'extra', readState('extra_key').toString(), '7');
            expect(readState('extra_key')).assertEqual(7);
            logPair(tag, 'wifi', readState(WIFI).toString(), '1');
            expect(readState(WIFI)).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0013
         * @tc.name      testLaunchNoKeyGrowth0013
         * @tc.desc      重复恢复不会让内存状态表增长，键数量稳定为五
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchNoKeyGrowth0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchNoKeyGrowth0013';
            logBegin(tag);
            await writeStates([2, 2, 2, 2, 2]);
            resetMemory();
            await runLaunch();
            const sizeAfterFirst: number = globalThis.settings.size;
            await runLaunch();
            const sizeAfterSecond: number = globalThis.settings.size;
            logPair(tag, 'sizeAfterFirst', sizeAfterFirst.toString(), '5');
            expect(sizeAfterFirst).assertEqual(5);
            logPair(tag, 'sizeAfterSecond', sizeAfterSecond.toString(), '5');
            expect(sizeAfterSecond).assertEqual(5);
            logPair(tag, 'noGrowth', (sizeAfterSecond === sizeAfterFirst).toString(), 'true');
            expect(sizeAfterSecond).assertEqual(sizeAfterFirst);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0014
         * @tc.name      testLaunchLargeValue0014
         * @tc.desc      三位数存储值 1000 被原样读入，不按状态枚举做归一
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchLargeValue0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchLargeValue0014';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_SCREEN_LOCKED, 1000);
            resetMemory();
            await runLaunch();
            logPair(tag, 'locked', readState(LOCKED).toString(), '1000');
            expect(readState(LOCKED)).assertEqual(1000);
            logPair(tag, 'aboveThousand', (readState(LOCKED) >= 1000).toString(), 'true');
            expect(readState(LOCKED)).assertLarger(999);
            logPair(tag, 'otherZero', readState(WIFI).toString(), '0');
            expect(readState(WIFI)).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0015
         * @tc.name      testLaunchFloatValue0015
         * @tc.desc      浮点存储值 1.5 被原样读入，不截断为整数
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchFloatValue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchFloatValue0015';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_SCREEN_OFF, 1.5);
            resetMemory();
            await runLaunch();
            logPair(tag, 'off', readState(OFF).toString(), '1.5');
            expect(readState(OFF)).assertEqual(1.5);
            logPair(tag, 'betweenOneTwo', (readState(OFF) > 1 && readState(OFF) < 2).toString(), 'true');
            expect(readState(OFF)).assertLarger(1);
            logPair(tag, 'belowTwo', (readState(OFF) < 2).toString(), 'true');
            expect(readState(OFF)).assertLess(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0016
         * @tc.name      testLaunchExplicitZero0016
         * @tc.desc      显式写入 0 与完全不写入的结果一致，缺省值同为 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchExplicitZero0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchExplicitZero0016';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 0);
            resetMemory();
            await runLaunch();
            logPair(tag, 'snapshot', snapshotStates(), '0,0,0,0,0');
            expect(snapshotStates()).assertEqual('0,0,0,0,0');
            logPair(tag, 'zeroCount', countValue(0).toString(), '5');
            expect(countValue(0)).assertEqual(5);
            logPair(tag, 'wifiPresent', globalThis.settings.has(WIFI).toString(), 'true');
            expect(globalThis.settings.has(WIFI)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0017
         * @tc.name      testLaunchTwoKeys0017
         * @tc.desc      只写入前两项时前两项恢复为 1，后三项保持 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchTwoKeys0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchTwoKeys0017';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 1);
            await putNumber(consts.DATA_BASE_KEY_SCREEN_OFF, 1);
            resetMemory();
            await runLaunch();
            logPair(tag, 'snapshot', snapshotStates(), '1,1,0,0,0');
            expect(snapshotStates()).assertEqual('1,1,0,0,0');
            logPair(tag, 'onceCount', countValue(1).toString(), '2');
            expect(countValue(1)).assertEqual(2);
            logPair(tag, 'zeroCount', countValue(0).toString(), '3');
            expect(countValue(0)).assertEqual(3);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0018
         * @tc.name      testLaunchWithMainAllAlways0018
         * @tc.desc      恢复得到全 0 后主界面有效事件为五项且一次性事件为零项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithMainAllAlways0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithMainAllAlways0018';
            logBegin(tag);
            await writeStates([0, 0, 0, 0, 0]);
            resetMemory();
            await runLaunch();
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logPair(tag, 'validOrder', feature.getCurrentValidEvents().join(','), EVENT_KEYS.join(','));
            expect(feature.getCurrentValidEvents().join(',')).assertEqual(EVENT_KEYS.join(','));
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0019
         * @tc.name      testLaunchWithMainAllOnce0019
         * @tc.desc      恢复得到全 1 后有效事件与一次性事件都为五项且顺序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithMainAllOnce0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithMainAllOnce0019';
            logBegin(tag);
            await writeStates([1, 1, 1, 1, 1]);
            resetMemory();
            await runLaunch();
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '5');
            expect(feature.getOnceEvents().length).assertEqual(5);
            logPair(tag, 'onceOrder', feature.getOnceEvents().join(','), EVENT_KEYS.join(','));
            expect(feature.getOnceEvents().join(',')).assertEqual(EVENT_KEYS.join(','));
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0020
         * @tc.name      testLaunchWithMainAllNever0020
         * @tc.desc      恢复得到全 2 后有效事件与一次性事件都为空，界面无可用事件
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithMainAllNever0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithMainAllNever0020';
            logBegin(tag);
            await writeStates([2, 2, 2, 2, 2]);
            resetMemory();
            await runLaunch();
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logPair(tag, 'validJson', JSON.stringify(feature.getCurrentValidEvents()), '[]');
            expect(JSON.stringify(feature.getCurrentValidEvents())).assertEqual('[]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0021
         * @tc.name      testLaunchWithMainMixed0021
         * @tc.desc      混合状态恢复后有效事件四项、一次性事件两项，与状态推演一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithMainMixed0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithMainMixed0021';
            logBegin(tag);
            await writeStates([0, 1, 2, 0, 1]);
            resetMemory();
            await runLaunch();
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '4');
            expect(feature.getCurrentValidEvents().length).assertEqual(4);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '2');
            expect(feature.getOnceEvents().length).assertEqual(2);
            logPair(tag, 'onceKeys', feature.getOnceEvents().join(','), OFF + ',' + UNLOCKED);
            expect(feature.getOnceEvents().join(',')).assertEqual(OFF + ',' + UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0022
         * @tc.name      testLaunchWithSettingAllAlways0022
         * @tc.desc      恢复得到全 0 后设置页三项判定中常开判定五项全真
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithSettingAllAlways0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithSettingAllAlways0022';
            logBegin(tag);
            await writeStates([0, 0, 0, 0, 0]);
            resetMemory();
            await runLaunch();
            const feature: settingFeature = new settingFeature(requireContext());
            let alwaysCount: number = 0;
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                if (feature.checkStateForAlways(EVENT_KEYS[index])) {
                    alwaysCount++;
                }
            }
            logPair(tag, 'alwaysCount', alwaysCount.toString(), '5');
            expect(alwaysCount).assertEqual(5);
            logPair(tag, 'wifiAlways', feature.checkStateForAlways(WIFI).toString(), 'true');
            expect(feature.checkStateForAlways(WIFI)).assertTrue();
            logPair(tag, 'wifiNever', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0023
         * @tc.name      testLaunchWithSettingAllOnce0023
         * @tc.desc      恢复得到全 1 后设置页仅一次判定五项全真、常开判定五项全假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithSettingAllOnce0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithSettingAllOnce0023';
            logBegin(tag);
            await writeStates([1, 1, 1, 1, 1]);
            resetMemory();
            await runLaunch();
            const feature: settingFeature = new settingFeature(requireContext());
            let onceCount: number = 0;
            let alwaysCount: number = 0;
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                if (feature.checkStateForOnce(EVENT_KEYS[index])) {
                    onceCount++;
                }
                if (feature.checkStateForAlways(EVENT_KEYS[index])) {
                    alwaysCount++;
                }
            }
            logPair(tag, 'onceCount', onceCount.toString(), '5');
            expect(onceCount).assertEqual(5);
            logPair(tag, 'alwaysCount', alwaysCount.toString(), '0');
            expect(alwaysCount).assertEqual(0);
            logPair(tag, 'lockedOnce', feature.checkStateForOnce(LOCKED).toString(), 'true');
            expect(feature.checkStateForOnce(LOCKED)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0024
         * @tc.name      testLaunchWithSettingAllNever0024
         * @tc.desc      恢复得到全 2 后设置页关闭判定五项全真、常开判定五项全假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithSettingAllNever0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithSettingAllNever0024';
            logBegin(tag);
            await writeStates([2, 2, 2, 2, 2]);
            resetMemory();
            await runLaunch();
            const feature: settingFeature = new settingFeature(requireContext());
            let neverCount: number = 0;
            let alwaysCount: number = 0;
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                if (feature.checkStateForNever(EVENT_KEYS[index])) {
                    neverCount++;
                }
                if (feature.checkStateForAlways(EVENT_KEYS[index])) {
                    alwaysCount++;
                }
            }
            logPair(tag, 'neverCount', neverCount.toString(), '5');
            expect(neverCount).assertEqual(5);
            logPair(tag, 'alwaysCount', alwaysCount.toString(), '0');
            expect(alwaysCount).assertEqual(0);
            logPair(tag, 'onceOn', feature.checkStateForOnce(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForOnce(SCREEN_ON)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0025
         * @tc.name      testLaunchWithSettingInvalid0025
         * @tc.desc      恢复得到越界值 3 后设置页三项判定都不成立，界面不会误选中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchWithSettingInvalid0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchWithSettingInvalid0025';
            logBegin(tag);
            await writeStates([3, 3, 3, 3, 3]);
            resetMemory();
            await runLaunch();
            const feature: settingFeature = new settingFeature(requireContext());
            let matched: number = 0;
            for (let index = 0; index < EVENT_KEYS.length; index++) {
                if (feature.checkStateForAlways(EVENT_KEYS[index])) {
                    matched++;
                }
                if (feature.checkStateForOnce(EVENT_KEYS[index])) {
                    matched++;
                }
                if (feature.checkStateForNever(EVENT_KEYS[index])) {
                    matched++;
                }
            }
            logPair(tag, 'matched', matched.toString(), '0');
            expect(matched).assertEqual(0);
            logPair(tag, 'wifiAlways', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'storageValue', readState(WIFI).toString(), '3');
            expect(readState(WIFI)).assertEqual(3);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0026
         * @tc.name      testLaunchCrossWrite0026
         * @tc.desc      两次写入不同值后分别恢复，后一次恢复结果覆盖前一次
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchCrossWrite0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchCrossWrite0026';
            logBegin(tag);
            await clearStore();
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 1);
            resetMemory();
            await runLaunch();
            const firstValue: number = readState(WIFI);
            await putNumber(consts.DATA_BASE_KEY_WIFI_POWER_STATE, 2);
            await runLaunch();
            const secondValue: number = readState(WIFI);
            logPair(tag, 'firstValue', firstValue.toString(), '1');
            expect(firstValue).assertEqual(1);
            logPair(tag, 'secondValue', secondValue.toString(), '2');
            expect(secondValue).assertEqual(2);
            logPair(tag, 'changed', (secondValue !== firstValue).toString(), 'true');
            expect(secondValue - firstValue).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0027
         * @tc.name      testLaunchBuildDetailIgnoresExtraKeys0027
         * @tc.desc      参数表携带非约定键时组装仍固定为四字段，多余键不进入记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchBuildDetailIgnoresExtraKeys0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchBuildDetailIgnoresExtraKeys0027';
            logBegin(tag);
            const params: Record<string, string> = {
                'startTime': 'st',
                'endTime': 'et',
                'totalTime': 'tt',
                'totalEvents': 'te',
                'extraA': 'x',
                'extraB': 'y'
            };
            const detail: Array<string> = launchFeature.buildDetail(params);
            logPair(tag, 'fieldCount', detail.length.toString(), '4');
            expect(detail.length).assertEqual(4);
            logPair(tag, 'json', JSON.stringify(detail), '["st","et","tt","te"]');
            expect(JSON.stringify(detail)).assertEqual('["st","et","tt","te"]');
            logPair(tag, 'extraAbsent', (JSON.stringify(detail).indexOf('extra') < 0).toString(), 'true');
            expect(JSON.stringify(detail).indexOf('extra')).assertEqual(-1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0028
         * @tc.name      testLaunchBuildDetailVerbatimValues0028
         * @tc.desc      含空格、冒号与中文的业务值原样进入四槽，不做转义或裁剪
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchBuildDetailVerbatimValues0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchBuildDetailVerbatimValues0028';
            logBegin(tag);
            const params: Record<string, string> = {
                'startTime': '2026-11-18 09:00:00',
                'endTime': '结束',
                'totalTime': '01:02:03',
                'totalEvents': '中文事件'
            };
            const detail: Array<string> = launchFeature.buildDetail(params);
            logPair(tag, 'startTime', detail[0], '2026-11-18 09:00:00');
            expect(detail[0]).assertEqual('2026-11-18 09:00:00');
            logPair(tag, 'endTime', detail[1], '结束');
            expect(detail[1]).assertEqual('结束');
            logPair(tag, 'totalTime', detail[2], '01:02:03');
            expect(detail[2]).assertEqual('01:02:03');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0029
         * @tc.name      testLaunchTrimPicksEleventhOnly0029
         * @tc.desc      12 条记录裁剪后仅保留第 11 条，前后邻位均被丢弃
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchTrimPicksEleventhOnly0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchTrimPicksEleventhOnly0029';
            logBegin(tag);
            const records: Array<string> = ['r01', 'r02', 'r03', 'r04', 'r05', 'r06', 'r07', 'r08', 'r09', 'r10', 'r11', 'r12'];
            const trimmed: Array<string> = launchFeature.trimRecords(records);
            logPair(tag, 'count', trimmed.length.toString(), '1');
            expect(trimmed.length).assertEqual(1);
            logPair(tag, 'picked', trimmed[0], 'r11');
            expect(trimmed[0]).assertEqual('r11');
            logPair(tag, 'json', JSON.stringify(trimmed), '["r11"]');
            expect(JSON.stringify(trimmed)).assertEqual('["r11"]');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0030
         * @tc.name      testLaunchTrimBoundaryPair0030
         * @tc.desc      恰 10 条时裁剪为空，恰 11 条时裁剪出首条第 11 条记录
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchTrimBoundaryPair0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchTrimBoundaryPair0030';
            logBegin(tag);
            const ten: Array<string> = ['a01', 'a02', 'a03', 'a04', 'a05', 'a06', 'a07', 'a08', 'a09', 'a10'];
            const eleven: Array<string> = ['a01', 'a02', 'a03', 'a04', 'a05', 'a06', 'a07', 'a08', 'a09', 'a10', 'a11'];
            logPair(tag, 'tenCount', launchFeature.trimRecords(ten).length.toString(), '0');
            expect(launchFeature.trimRecords(ten).length).assertEqual(0);
            logPair(tag, 'elevenCount', launchFeature.trimRecords(eleven).length.toString(), '1');
            expect(launchFeature.trimRecords(eleven).length).assertEqual(1);
            logPair(tag, 'elevenHead', launchFeature.trimRecords(eleven)[0], 'a11');
            expect(launchFeature.trimRecords(eleven)[0]).assertEqual('a11');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0031
         * @tc.name      testLaunchTrimNotMutateInput0031
         * @tc.desc      裁剪不修改入参：调用后记录列表长度与序列化结果与调用前一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchTrimNotMutateInput0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchTrimNotMutateInput0031';
            logBegin(tag);
            const records: Array<string> = ['b01', 'b02', 'b03', 'b04', 'b05', 'b06', 'b07', 'b08', 'b09', 'b10', 'b11', 'b12'];
            const before: string = JSON.stringify(records);
            const trimmed: Array<string> = launchFeature.trimRecords(records);
            logPair(tag, 'recordsStable', (JSON.stringify(records) === before).toString(), 'true');
            expect(JSON.stringify(records)).assertEqual(before);
            logPair(tag, 'lengthStable', records.length.toString(), '12');
            expect(records.length).assertEqual(12);
            logPair(tag, 'trimmedCount', trimmed.length.toString(), '1');
            expect(trimmed.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0032
         * @tc.name      testLaunchLimitMatchesConst0032
         * @tc.desc      阈值判定与 MAX_RECORD_NUM 常量对齐：常量处为真、常量减一为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchLimitMatchesConst0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchLimitMatchesConst0032';
            logBegin(tag);
            logPair(tag, 'constValue', consts.MAX_RECORD_NUM.toString(), '10');
            expect(consts.MAX_RECORD_NUM).assertEqual(10);
            logPair(tag, 'atLimit', launchFeature.reachedRecordLimit(consts.MAX_RECORD_NUM).toString(), 'true');
            expect(launchFeature.reachedRecordLimit(consts.MAX_RECORD_NUM)).assertTrue();
            logPair(tag, 'belowLimit', launchFeature.reachedRecordLimit(consts.MAX_RECORD_NUM - 1).toString(), 'false');
            expect(launchFeature.reachedRecordLimit(consts.MAX_RECORD_NUM - 1)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0033
         * @tc.name      testLaunchLimitEvictionPair0033
         * @tc.desc      达到上限时裁剪满 11 条列表恰好得到第 11 条，阈值与裁剪的淘汰契约配对生效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchLimitEvictionPair0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchLimitEvictionPair0033';
            logBegin(tag);
            const records: Array<string> = ['c01', 'c02', 'c03', 'c04', 'c05', 'c06', 'c07', 'c08', 'c09', 'c10', 'c11'];
            const reached: boolean = launchFeature.reachedRecordLimit(records.length - 1);
            const trimmed: Array<string> = launchFeature.trimRecords(records);
            logPair(tag, 'reached', reached.toString(), 'true');
            expect(reached).assertTrue();
            logPair(tag, 'trimmedCount', trimmed.length.toString(), '1');
            expect(trimmed.length).assertEqual(1);
            logPair(tag, 'trimmedHead', trimmed[0], 'c11');
            expect(trimmed[0]).assertEqual('c11');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_LAUNCH_0034
         * @tc.name      testLaunchLimitSafeInteger0034
         * @tc.desc      安全整数上下限的阈值判定：正上限为真、负下限为假，不因数值极值抛异常
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testLaunchLimitSafeInteger0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testLaunchLimitSafeInteger0034';
            logBegin(tag);
            const maxSafe: number = 9007199254740991;
            const minSafe: number = -9007199254740991;
            logPair(tag, 'maxSafe', launchFeature.reachedRecordLimit(maxSafe).toString(), 'true');
            expect(launchFeature.reachedRecordLimit(maxSafe)).assertTrue();
            logPair(tag, 'minSafe', launchFeature.reachedRecordLimit(minSafe).toString(), 'false');
            expect(launchFeature.reachedRecordLimit(minSafe)).assertFalse();
            logPair(tag, 'farAboveLimit', (maxSafe > consts.MAX_RECORD_NUM).toString(), 'true');
            expect(maxSafe > consts.MAX_RECORD_NUM).assertTrue();
            logEnd(tag);
        })
    })
}
