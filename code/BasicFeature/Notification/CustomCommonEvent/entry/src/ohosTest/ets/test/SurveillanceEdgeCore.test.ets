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
import surveillanceEventsManager, { EventData } from '../../../main/ets/module/SurveillanceEventsManager';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'SurveillanceEdge_';
const KEY_WIFI: string = 'usual.event.wifi.POWER_STATE';
const KEY_OFF: string = 'usual.event.SCREEN_OFF';
const KEY_ON: string = 'usual.event.SCREEN_ON';
const KEY_LOCKED: string = 'usual.event.SCREEN_LOCKED';
const KEY_UNLOCKED: string = 'usual.event.SCREEN_UNLOCKED';
const ALL_KEYS: Array<string> = [KEY_WIFI, KEY_OFF, KEY_ON, KEY_LOCKED, KEY_UNLOCKED];

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

function installMap(values: Array<number | undefined>): void {
    const map: Map<string, number> = new Map<string, number>();
    for (let index = 0; index < ALL_KEYS.length; index++) {
        const value: number | undefined = values[index];
        if (value !== undefined) {
            map.set(ALL_KEYS[index], value);
        }
    }
    globalThis.settings = map;
}

export default function surveillanceEdgeCoreTest(): void {
    describe('SurveillanceEdgeCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_SURV_0001
         * @tc.name      testSurveillanceEmptyMapAllUndefined0001
         * @tc.desc      设置表为空时五个监控键的读数全部为 undefined
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceEmptyMapAllUndefined0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceEmptyMapAllUndefined0001';
            logBegin(tag);
            globalThis.settings = new Map<string, number>();
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            let allUndefined: boolean = true;
            for (let i = 0; i < ALL_KEYS.length; i++) {
                if (states[ALL_KEYS[i]] !== undefined) {
                    allUndefined = false;
                }
            }
            logPair(tag, 'allUndefined', allUndefined.toString(), 'true');
            expect(allUndefined).assertTrue();
            logPair(tag, 'wifiUndefined', (states[KEY_WIFI] === undefined).toString(), 'true');
            expect(states[KEY_WIFI] === undefined).assertTrue();
            logPair(tag, 'unlockedUndefined', (states[KEY_UNLOCKED] === undefined).toString(), 'true');
            expect(states[KEY_UNLOCKED] === undefined).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0002
         * @tc.name      testSurveillanceSingleKeyPresent0002
         * @tc.desc      仅写入 wifi 键时其余四键仍为 undefined
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceSingleKeyPresent0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceSingleKeyPresent0002';
            logBegin(tag);
            installMap([0, undefined, undefined, undefined, undefined]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', states[KEY_WIFI].toString(), '0');
            expect(states[KEY_WIFI]).assertEqual(0);
            logPair(tag, 'onUndefined', (states[KEY_ON] === undefined).toString(), 'true');
            expect(states[KEY_ON] === undefined).assertTrue();
            logPair(tag, 'lockedUndefined', (states[KEY_LOCKED] === undefined).toString(), 'true');
            expect(states[KEY_LOCKED] === undefined).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0003
         * @tc.name      testSurveillanceSingleKeyOff0003
         * @tc.desc      仅写入灭屏键时读数原样返回且互不影响
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceSingleKeyOff0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceSingleKeyOff0003';
            logBegin(tag);
            installMap([undefined, 1, undefined, undefined, undefined]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'off', states[KEY_OFF].toString(), '1');
            expect(states[KEY_OFF]).assertEqual(1);
            logPair(tag, 'wifiUndefined', (states[KEY_WIFI] === undefined).toString(), 'true');
            expect(states[KEY_WIFI] === undefined).assertTrue();
            logPair(tag, 'offOnce', (states[KEY_OFF] === 1).toString(), 'true');
            expect(states[KEY_OFF] === 1).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0004
         * @tc.name      testSurveillanceIllegalNegative0004
         * @tc.desc      非法负值不经过归一直接原样返回（读数器无过滤）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceIllegalNegative0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceIllegalNegative0004';
            logBegin(tag);
            installMap([-1, -1, -1, -1, -1]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', states[KEY_WIFI].toString(), '-1');
            expect(states[KEY_WIFI]).assertEqual(-1);
            logPair(tag, 'on', states[KEY_ON].toString(), '-1');
            expect(states[KEY_ON]).assertEqual(-1);
            logPair(tag, 'notNormalized', (states[KEY_WIFI] !== 2).toString(), 'true');
            expect(states[KEY_WIFI] !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0005
         * @tc.name      testSurveillanceIllegalLarge0005
         * @tc.desc      越界大值 99 同样原样返回，不截断不归一
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceIllegalLarge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceIllegalLarge0005';
            logBegin(tag);
            installMap([99, 99, 99, 99, 99]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'locked', states[KEY_LOCKED].toString(), '99');
            expect(states[KEY_LOCKED]).assertEqual(99);
            logPair(tag, 'unlocked', states[KEY_UNLOCKED].toString(), '99');
            expect(states[KEY_UNLOCKED]).assertEqual(99);
            logPair(tag, 'outsideDomain', (states[KEY_LOCKED] > 2).toString(), 'true');
            expect(states[KEY_LOCKED] > 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0006
         * @tc.name      testSurveillanceMixedValues0006
         * @tc.desc      合法、非法与缺失并存时各键独立读数互不串扰
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceMixedValues0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceMixedValues0006';
            logBegin(tag);
            installMap([0, 99, undefined, -1, 2]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'wifi', states[KEY_WIFI].toString(), '0');
            expect(states[KEY_WIFI]).assertEqual(0);
            logPair(tag, 'off', states[KEY_OFF].toString(), '99');
            expect(states[KEY_OFF]).assertEqual(99);
            logPair(tag, 'onUndefined', (states[KEY_ON] === undefined).toString(), 'true');
            expect(states[KEY_ON] === undefined).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0007
         * @tc.name      testSurveillanceKeysAlignEvents0007
         * @tc.desc      读数器的五个硬编码键与 surveillanceEvents 常量值一一对齐
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceKeysAlignEvents0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceKeysAlignEvents0007';
            logBegin(tag);
            const events: Array<string> = surveillanceEventsManager.surveillanceEvents;
            logPair(tag, 'wifiAlign', (ALL_KEYS[0] === events[0]).toString(), 'true');
            expect(ALL_KEYS[0]).assertEqual(events[0]);
            logPair(tag, 'unlockedAlign', (ALL_KEYS[4] === events[4]).toString(), 'true');
            expect(ALL_KEYS[4]).assertEqual(events[4]);
            logPair(tag, 'eventsSize', events.length.toString(), '5');
            expect(events.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0008
         * @tc.name      testSurveillanceStateFollowsMap0008
         * @tc.desc      更换设置表实例后读数随之变化（无缓存）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceStateFollowsMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceStateFollowsMap0008';
            logBegin(tag);
            installMap([0, 0, 0, 0, 0]);
            const before: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            installMap([2, 2, 2, 2, 2]);
            const after: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            logPair(tag, 'beforeWifi', before[KEY_WIFI].toString(), '0');
            expect(before[KEY_WIFI]).assertEqual(0);
            logPair(tag, 'afterWifi', after[KEY_WIFI].toString(), '2');
            expect(after[KEY_WIFI]).assertEqual(2);
            logPair(tag, 'changed', (before[KEY_WIFI] !== after[KEY_WIFI]).toString(), 'true');
            expect(before[KEY_WIFI] !== after[KEY_WIFI]).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0009
         * @tc.name      testSurveillanceAllAlways0009
         * @tc.desc      五键全为 ALWAYS(0) 时读数全部为 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceAllAlways0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceAllAlways0009';
            logBegin(tag);
            installMap([0, 0, 0, 0, 0]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            let allZero: boolean = true;
            for (let i = 0; i < ALL_KEYS.length; i++) {
                if (states[ALL_KEYS[i]] !== 0) {
                    allZero = false;
                }
            }
            logPair(tag, 'allZero', allZero.toString(), 'true');
            expect(allZero).assertTrue();
            logPair(tag, 'on', states[KEY_ON].toString(), '0');
            expect(states[KEY_ON]).assertEqual(0);
            logPair(tag, 'unlocked', states[KEY_UNLOCKED].toString(), '0');
            expect(states[KEY_UNLOCKED]).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0010
         * @tc.name      testSurveillanceAllNever0010
         * @tc.desc      五键全为 NEVER(2) 时读数全部为 2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceAllNever0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceAllNever0010';
            logBegin(tag);
            installMap([2, 2, 2, 2, 2]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            let allTwo: boolean = true;
            for (let i = 0; i < ALL_KEYS.length; i++) {
                if (states[ALL_KEYS[i]] !== 2) {
                    allTwo = false;
                }
            }
            logPair(tag, 'allTwo', allTwo.toString(), 'true');
            expect(allTwo).assertTrue();
            logPair(tag, 'off', states[KEY_OFF].toString(), '2');
            expect(states[KEY_OFF]).assertEqual(2);
            logPair(tag, 'locked', states[KEY_LOCKED].toString(), '2');
            expect(states[KEY_LOCKED]).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0011
         * @tc.name      testSurveillanceRepeatReadStable0011
         * @tc.desc      同一设置表下重复读取五键读数完全一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceRepeatReadStable0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceRepeatReadStable0011';
            logBegin(tag);
            installMap([0, 1, 2, 0, 1]);
            const first: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            const second: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            let allSame: boolean = true;
            for (let i = 0; i < ALL_KEYS.length; i++) {
                if (first[ALL_KEYS[i]] !== second[ALL_KEYS[i]]) {
                    allSame = false;
                }
            }
            logPair(tag, 'allSame', allSame.toString(), 'true');
            expect(allSame).assertTrue();
            logPair(tag, 'wifi', first[KEY_WIFI].toString(), '0');
            expect(first[KEY_WIFI]).assertEqual(0);
            logPair(tag, 'unlocked', second[KEY_UNLOCKED].toString(), '1');
            expect(second[KEY_UNLOCKED]).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SURV_0012
         * @tc.name      testSurveillanceStateShape0012
         * @tc.desc      读数对象恰含五个监控键属性，无多余键
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSurveillanceStateShape0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSurveillanceStateShape0012';
            logBegin(tag);
            installMap([0, 1, 2, 0, 1]);
            const states: EventData = surveillanceEventsManager.getSurveillanceEventStates();
            const keys: Array<string> = Object.keys(states);
            logPair(tag, 'keyCount', keys.length.toString(), '5');
            expect(keys.length).assertEqual(5);
            let allKnown: boolean = true;
            for (let i = 0; i < keys.length; i++) {
                if (ALL_KEYS.indexOf(keys[i]) < 0) {
                    allKnown = false;
                }
            }
            logPair(tag, 'allKnown', allKnown.toString(), 'true');
            expect(allKnown).assertTrue();
            logPair(tag, 'wifiKey', keys[0], KEY_WIFI);
            expect(keys[0]).assertEqual(KEY_WIFI);
            logEnd(tag);
        })
    })
}
