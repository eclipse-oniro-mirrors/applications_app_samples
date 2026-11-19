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
import mainFeature from '../../../main/ets/feature/MainFeature';
import surveillanceEventsManager from '../../../main/ets/module/SurveillanceEventsManager';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'MainFeatureCore_';
const EVENTS: Array<string> = surveillanceEventsManager.surveillanceEvents;
const WIFI: string = EVENTS[0];
const OFF: string = EVENTS[1];
const SCREEN_ON: string = EVENTS[2];
const LOCKED: string = EVENTS[3];
const UNLOCKED: string = EVENTS[4];

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

function installStates(states: Array<number>): void {
    const map: Map<string, number> = new Map();
    for (let index = 0; index < EVENTS.length; index++) {
        map.set(EVENTS[index], states[index]);
    }
    globalThis.settings = map;
}

function installStatesReversed(states: Array<number>): void {
    const map: Map<string, number> = new Map();
    for (let index = EVENTS.length - 1; index >= 0; index--) {
        map.set(EVENTS[index], states[index]);
    }
    globalThis.settings = map;
}

export default function mainFeatureCoreTest(): void {
    describe('MainFeatureCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_STATE_0001
         * @tc.name      testMainFeatureAllAlways0001
         * @tc.desc      五项事件全部常开时，有效事件为五项且一次性事件为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllAlways0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllAlways0001';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'onceCount', once.length.toString(), '0');
            expect(once.length).assertEqual(0);
            logPair(tag, 'validOrder', valid.join(','), EVENTS.join(','));
            expect(valid.join(',')).assertEqual(EVENTS.join(','));
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0002
         * @tc.name      testMainFeatureAllNever0002
         * @tc.desc      五项事件全部关闭时，有效事件与一次性事件均为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllNever0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllNever0002';
            logBegin(tag);
            installStates([2, 2, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validCount', valid.length.toString(), '0');
            expect(valid.length).assertEqual(0);
            logPair(tag, 'onceCount', once.length.toString(), '0');
            expect(once.length).assertEqual(0);
            logPair(tag, 'validJoined', valid.join(','), '');
            expect(valid.join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0003
         * @tc.name      testMainFeatureAllOnce0003
         * @tc.desc      五项事件全部仅一次时，一次性事件与有效事件同为五项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllOnce0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllOnce0003';
            logBegin(tag);
            installStates([1, 1, 1, 1, 1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'onceCount', once.length.toString(), '5');
            expect(once.length).assertEqual(5);
            logPair(tag, 'onceOrder', once.join(','), EVENTS.join(','));
            expect(once.join(',')).assertEqual(EVENTS.join(','));
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0004
         * @tc.name      testMainFeatureAllAlwaysOrder0004
         * @tc.desc      全部常开时有效事件首中尾位置与监听集合顺序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllAlwaysOrder0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllAlwaysOrder0004';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'head', valid[0], WIFI);
            expect(valid[0]).assertEqual(WIFI);
            logPair(tag, 'middle', valid[2], SCREEN_ON);
            expect(valid[2]).assertEqual(SCREEN_ON);
            logPair(tag, 'tail', valid[4], UNLOCKED);
            expect(valid[4]).assertEqual(UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0005
         * @tc.name      testMainFeatureAllOnceOrder0005
         * @tc.desc      全部仅一次时一次性事件首中尾位置与监听集合顺序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllOnceOrder0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllOnceOrder0005';
            logBegin(tag);
            installStates([1, 1, 1, 1, 1]);
            const feature: mainFeature = new mainFeature();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'head', once[0], WIFI);
            expect(once[0]).assertEqual(WIFI);
            logPair(tag, 'middle', once[2], SCREEN_ON);
            expect(once[2]).assertEqual(SCREEN_ON);
            logPair(tag, 'tail', once[4], UNLOCKED);
            expect(once[4]).assertEqual(UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0006
         * @tc.name      testMainFeatureAllNeverIdempotent0006
         * @tc.desc      全部关闭时重复刷新不会产生残留事件
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAllNeverIdempotent0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAllNeverIdempotent0006';
            logBegin(tag);
            installStates([2, 2, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            feature.refreshCurrentState();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validAfterRefresh', valid.length.toString(), '0');
            expect(valid.length).assertEqual(0);
            logPair(tag, 'onceAfterRefresh', once.length.toString(), '0');
            expect(once.length).assertEqual(0);
            logPair(tag, 'joined', valid.join(','), '');
            expect(valid.join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0007
         * @tc.name      testMainFeatureWifiAlways0007
         * @tc.desc      仅 WiFi 常开时只产生一个有效事件且不进入一次性列表
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureWifiAlways0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureWifiAlways0007';
            logBegin(tag);
            installStates([0, 2, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), WIFI);
            expect(valid.join(',')).assertEqual(WIFI);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0008
         * @tc.name      testMainFeatureScreenOffAlways0008
         * @tc.desc      仅熄屏常开时有效事件为熄屏且首位即该项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenOffAlways0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenOffAlways0008';
            logBegin(tag);
            installStates([2, 0, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), OFF);
            expect(valid.join(',')).assertEqual(OFF);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'head', valid[0], OFF);
            expect(valid[0]).assertEqual(OFF);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0009
         * @tc.name      testMainFeatureScreenOnAlways0009
         * @tc.desc      仅亮屏常开时有效事件为亮屏且一次性事件为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenOnAlways0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenOnAlways0009';
            logBegin(tag);
            installStates([2, 2, 0, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), SCREEN_ON);
            expect(valid.join(',')).assertEqual(SCREEN_ON);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0010
         * @tc.name      testMainFeatureScreenLockedAlways0010
         * @tc.desc      仅锁屏常开时有效事件为锁屏且不进入一次性列表
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenLockedAlways0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenLockedAlways0010';
            logBegin(tag);
            installStates([2, 2, 2, 0, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), LOCKED);
            expect(valid.join(',')).assertEqual(LOCKED);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'head', valid[0], LOCKED);
            expect(valid[0]).assertEqual(LOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0011
         * @tc.name      testMainFeatureScreenUnlockedAlways0011
         * @tc.desc      仅解锁常开时有效事件为解锁且一次性事件为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenUnlockedAlways0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenUnlockedAlways0011';
            logBegin(tag);
            installStates([2, 2, 2, 2, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), UNLOCKED);
            expect(valid.join(',')).assertEqual(UNLOCKED);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0012
         * @tc.name      testMainFeatureWifiOnce0012
         * @tc.desc      仅 WiFi 为一次性时同时进入有效列表与一次性列表
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureWifiOnce0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureWifiOnce0012';
            logBegin(tag);
            installStates([1, 2, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), WIFI);
            expect(valid.join(',')).assertEqual(WIFI);
            logPair(tag, 'onceOnly', once.join(','), WIFI);
            expect(once.join(',')).assertEqual(WIFI);
            logPair(tag, 'sameCount', valid.length.toString(), once.length.toString());
            expect(valid.length).assertEqual(once.length);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0013
         * @tc.name      testMainFeatureScreenOffOnce0013
         * @tc.desc      仅熄屏为一次性时两个列表均只含熄屏
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenOffOnce0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenOffOnce0013';
            logBegin(tag);
            installStates([2, 1, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), OFF);
            expect(valid.join(',')).assertEqual(OFF);
            logPair(tag, 'onceOnly', once.join(','), OFF);
            expect(once.join(',')).assertEqual(OFF);
            logPair(tag, 'onceCount', once.length.toString(), '1');
            expect(once.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0014
         * @tc.name      testMainFeatureScreenOnOnce0014
         * @tc.desc      仅亮屏为一次性时有效事件首位为亮屏且两列表等长
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenOnOnce0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenOnOnce0014';
            logBegin(tag);
            installStates([2, 2, 1, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), SCREEN_ON);
            expect(valid.join(',')).assertEqual(SCREEN_ON);
            logPair(tag, 'onceOnly', once.join(','), SCREEN_ON);
            expect(once.join(',')).assertEqual(SCREEN_ON);
            logPair(tag, 'head', valid[0], SCREEN_ON);
            expect(valid[0]).assertEqual(SCREEN_ON);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0015
         * @tc.name      testMainFeatureScreenLockedOnce0015
         * @tc.desc      仅锁屏为一次性时两个列表均只含锁屏
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenLockedOnce0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenLockedOnce0015';
            logBegin(tag);
            installStates([2, 2, 2, 1, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), LOCKED);
            expect(valid.join(',')).assertEqual(LOCKED);
            logPair(tag, 'onceOnly', once.join(','), LOCKED);
            expect(once.join(',')).assertEqual(LOCKED);
            logPair(tag, 'onceCount', once.length.toString(), '1');
            expect(once.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0016
         * @tc.name      testMainFeatureScreenUnlockedOnce0016
         * @tc.desc      仅解锁为一次性时有效事件首位为解锁且两列表等长
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureScreenUnlockedOnce0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureScreenUnlockedOnce0016';
            logBegin(tag);
            installStates([2, 2, 2, 2, 1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), UNLOCKED);
            expect(valid.join(',')).assertEqual(UNLOCKED);
            logPair(tag, 'onceOnly', once.join(','), UNLOCKED);
            expect(once.join(',')).assertEqual(UNLOCKED);
            logPair(tag, 'head', valid[0], UNLOCKED);
            expect(valid[0]).assertEqual(UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0017
         * @tc.name      testMainFeatureInvalidStateThree0017
         * @tc.desc      非法状态值 3 不属于任何分支，五项事件全部被忽略且刷新后仍为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureInvalidStateThree0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureInvalidStateThree0017';
            logBegin(tag);
            installStates([3, 3, 3, 3, 3]);
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            feature.refreshCurrentState();
            logPair(tag, 'validAfterRefresh', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0018
         * @tc.name      testMainFeatureAlternatingInvalid0018
         * @tc.desc      合法与非法状态交替时仅合法常开项进入有效列表，非法项不污染结果
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAlternatingInvalid0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAlternatingInvalid0018';
            logBegin(tag);
            installStates([0, 3, 0, 3, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const expected: string = WIFI + ',' + SCREEN_ON + ',' + UNLOCKED;
            logPair(tag, 'validOnlyLegal', valid.join(','), expected);
            expect(valid.join(',')).assertEqual(expected);
            logPair(tag, 'validCount', valid.length.toString(), '3');
            expect(valid.length).assertEqual(3);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0019
         * @tc.name      testMainFeatureTailInvalid0019
         * @tc.desc      尾部状态为负值或关闭时不影响中部一次性事件的登记
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureTailInvalid0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureTailInvalid0019';
            logBegin(tag);
            installStates([2, 2, 2, 1, -1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), LOCKED);
            expect(valid.join(',')).assertEqual(LOCKED);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'onceOnly', once.join(','), LOCKED);
            expect(once.join(',')).assertEqual(LOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0020
         * @tc.name      testMainFeatureEmptySettings0020
         * @tc.desc      全局状态表为空时全部事件缺省被忽略，刷新后仍为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureEmptySettings0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureEmptySettings0020';
            logBegin(tag);
            globalThis.settings = new Map<string, number>();
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            feature.refreshCurrentState();
            logPair(tag, 'validAfterRefresh', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0021
         * @tc.name      testMainFeatureAlwaysWithInvalid0021
         * @tc.desc      常开项与非法值共存时只保留常开项，非法值不进入任何列表
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureAlwaysWithInvalid0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureAlwaysWithInvalid0021';
            logBegin(tag);
            installStates([0, 3, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOnly', valid.join(','), WIFI);
            expect(valid.join(',')).assertEqual(WIFI);
            logPair(tag, 'validCount', valid.length.toString(), '1');
            expect(valid.length).assertEqual(1);
            logPair(tag, 'onceJoined', feature.getOnceEvents().join(','), '');
            expect(feature.getOnceEvents().join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0022
         * @tc.name      testMainFeatureOnceWithOutOfRange0022
         * @tc.desc      一次性项与越界值、负值共存时仅一次性项被登记
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureOnceWithOutOfRange0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureOnceWithOutOfRange0022';
            logBegin(tag);
            installStates([1, 2, 99, 2, -1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), WIFI);
            expect(valid.join(',')).assertEqual(WIFI);
            logPair(tag, 'onceCount', once.length.toString(), '1');
            expect(once.length).assertEqual(1);
            logPair(tag, 'onceHead', once[0], WIFI);
            expect(once[0]).assertEqual(WIFI);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0023
         * @tc.name      testMainFeatureMixedStates0023
         * @tc.desc      三种状态混合时有效列表按监听顺序合并常开与一次性，一次性列表只含一次性项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureMixedStates0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureMixedStates0023';
            logBegin(tag);
            installStates([0, 1, 2, 0, 1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            const expectedValid: string = WIFI + ',' + OFF + ',' + LOCKED + ',' + UNLOCKED;
            const expectedOnce: string = OFF + ',' + UNLOCKED;
            logPair(tag, 'validOrder', valid.join(','), expectedValid);
            expect(valid.join(',')).assertEqual(expectedValid);
            logPair(tag, 'onceOrder', once.join(','), expectedOnce);
            expect(once.join(',')).assertEqual(expectedOnce);
            logPair(tag, 'validCount', valid.length.toString(), '4');
            expect(valid.length).assertEqual(4);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0024
         * @tc.name      testMainFeatureHeadOnce0024
         * @tc.desc      前两项为一次性、后三项为常开时有效列表齐全且一次性列表仅两项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureHeadOnce0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureHeadOnce0024';
            logBegin(tag);
            installStates([1, 1, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '2');
            expect(feature.getOnceEvents().length).assertEqual(2);
            const expectedOnce: string = WIFI + ',' + OFF;
            logPair(tag, 'onceOrder', feature.getOnceEvents().join(','), expectedOnce);
            expect(feature.getOnceEvents().join(',')).assertEqual(expectedOnce);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0025
         * @tc.name      testMainFeatureTailOnce0025
         * @tc.desc      后两项为一次性、前三项为常开时一次性列表顺序与监听顺序一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureTailOnce0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureTailOnce0025';
            logBegin(tag);
            installStates([0, 0, 0, 1, 1]);
            const feature: mainFeature = new mainFeature();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            logPair(tag, 'onceHead', once[0], LOCKED);
            expect(once[0]).assertEqual(LOCKED);
            logPair(tag, 'onceTail', once[1], UNLOCKED);
            expect(once[1]).assertEqual(UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0026
         * @tc.name      testMainFeatureReversedAllAlways0026
         * @tc.desc      状态表插入顺序反转后有效列表仍按监听顺序输出，不受插入顺序影响
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureReversedAllAlways0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureReversedAllAlways0026';
            logBegin(tag);
            installStatesReversed([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validOrder', valid.join(','), EVENTS.join(','));
            expect(valid.join(',')).assertEqual(EVENTS.join(','));
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'head', valid[0], WIFI);
            expect(valid[0]).assertEqual(WIFI);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0027
         * @tc.name      testMainFeatureReversedAllOnce0027
         * @tc.desc      状态表插入顺序反转后一次性列表仍按监听顺序输出
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureReversedAllOnce0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureReversedAllOnce0027';
            logBegin(tag);
            installStatesReversed([1, 1, 1, 1, 1]);
            const feature: mainFeature = new mainFeature();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'onceOrder', once.join(','), EVENTS.join(','));
            expect(once.join(',')).assertEqual(EVENTS.join(','));
            logPair(tag, 'onceCount', once.length.toString(), '5');
            expect(once.length).assertEqual(5);
            logPair(tag, 'tail', once[4], UNLOCKED);
            expect(once[4]).assertEqual(UNLOCKED);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0028
         * @tc.name      testMainFeatureOnceSubsetOfValid0028
         * @tc.desc      全部一次性时一次性列表是有效列表的子集，五项全部包含
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureOnceSubsetOfValid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureOnceSubsetOfValid0028';
            logBegin(tag);
            installStates([1, 1, 1, 1, 1]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            let contained: number = 0;
            for (let index = 0; index < once.length; index++) {
                if (valid.indexOf(once[index]) >= 0) {
                    contained++;
                }
            }
            logPair(tag, 'contained', contained.toString(), '5');
            expect(contained).assertEqual(5);
            logPair(tag, 'onceCount', once.length.toString(), '5');
            expect(once.length).assertEqual(5);
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0029
         * @tc.name      testMainFeatureValidNoDuplicate0029
         * @tc.desc      全部常开时有效列表无重复项，去重后数量不变
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureValidNoDuplicate0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureValidNoDuplicate0029';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const unique: Set<string> = new Set<string>(valid);
            logPair(tag, 'uniqueSize', unique.size.toString(), '5');
            expect(unique.size).assertEqual(5);
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'sizeEquals', unique.size.toString(), valid.length.toString());
            expect(unique.size).assertEqual(valid.length);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0030
         * @tc.name      testMainFeatureValidMembership0030
         * @tc.desc      有效列表的每一项都必须来自监听集合，不允许出现非预期事件名
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureValidMembership0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureValidMembership0030';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            let members: number = 0;
            for (let index = 0; index < valid.length; index++) {
                if (EVENTS.indexOf(valid[index]) >= 0) {
                    members++;
                }
            }
            logPair(tag, 'members', members.toString(), valid.length.toString());
            expect(members).assertEqual(valid.length);
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'headMember', (valid[0] === WIFI).toString(), 'true');
            expect(valid[0]).assertEqual(WIFI);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0031
         * @tc.name      testMainFeatureRefreshIdempotent0031
         * @tc.desc      连续刷新两次后有效列表不累积，长度仍为五项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureRefreshIdempotent0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureRefreshIdempotent0031';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            feature.refreshCurrentState();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'validOrder', valid.join(','), EVENTS.join(','));
            expect(valid.join(',')).assertEqual(EVENTS.join(','));
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0032
         * @tc.name      testMainFeatureClearEvents0032
         * @tc.desc      清空后有效列表与一次性列表同时归零
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureClearEvents0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureClearEvents0032';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            feature.clearEvents();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logPair(tag, 'validJoined', feature.getCurrentValidEvents().join(','), '');
            expect(feature.getCurrentValidEvents().join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0033
         * @tc.name      testMainFeatureClearThenRefresh0033
         * @tc.desc      清空后重新刷新可完整恢复五项有效事件
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureClearThenRefresh0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureClearThenRefresh0033';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            feature.clearEvents();
            feature.refreshCurrentState();
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'validOrder', valid.join(','), EVENTS.join(','));
            expect(valid.join(',')).assertEqual(EVENTS.join(','));
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0034
         * @tc.name      testMainFeatureSwitchToNever0034
         * @tc.desc      由全常开切到全关闭后刷新，有效事件被清空为未选中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureSwitchToNever0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureSwitchToNever0034';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            installStates([2, 2, 2, 2, 2]);
            feature.refreshCurrentState();
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logPair(tag, 'validJoined', feature.getCurrentValidEvents().join(','), '');
            expect(feature.getCurrentValidEvents().join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0035
         * @tc.name      testMainFeatureSwitchToOnce0035
         * @tc.desc      由全关闭切到全一次性后刷新，两个列表同时恢复五项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureSwitchToOnce0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureSwitchToOnce0035';
            logBegin(tag);
            installStates([2, 2, 2, 2, 2]);
            const feature: mainFeature = new mainFeature();
            installStates([1, 1, 1, 1, 1]);
            feature.refreshCurrentState();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'onceCount', once.length.toString(), '5');
            expect(once.length).assertEqual(5);
            logPair(tag, 'onceHead', once[0], WIFI);
            expect(once[0]).assertEqual(WIFI);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0036
         * @tc.name      testMainFeatureRefreshFourTimes0036
         * @tc.desc      连续四次刷新不会造成列表重复累积
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureRefreshFourTimes0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureRefreshFourTimes0036';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            for (let round = 0; round < 3; round++) {
                feature.refreshCurrentState();
            }
            const valid: Array<string> = feature.getCurrentValidEvents();
            logPair(tag, 'validCount', valid.length.toString(), '5');
            expect(valid.length).assertEqual(5);
            logPair(tag, 'onceCount', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logPair(tag, 'validOrder', valid.join(','), EVENTS.join(','));
            expect(valid.join(',')).assertEqual(EVENTS.join(','));
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0037
         * @tc.name      testMainFeatureTwoInstancesIsolated0037
         * @tc.desc      两个实例各自持有快照，后建实例按新状态计算且不影响先建实例
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureTwoInstancesIsolated0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureTwoInstancesIsolated0037';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const first: mainFeature = new mainFeature();
            installStates([2, 2, 2, 2, 2]);
            const second: mainFeature = new mainFeature();
            logPair(tag, 'firstValid', first.getCurrentValidEvents().length.toString(), '5');
            expect(first.getCurrentValidEvents().length).assertEqual(5);
            logPair(tag, 'secondValid', second.getCurrentValidEvents().length.toString(), '0');
            expect(second.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'bothDiffers', first.getCurrentValidEvents().length.toString(),
                second.getCurrentValidEvents().length.toString());
            expect(first.getCurrentValidEvents().length === second.getCurrentValidEvents().length).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0038
         * @tc.name      testMainFeatureSnapshotUntilRefresh0038
         * @tc.desc      已建实例不自动跟随全局状态变化，必须显式刷新后才更新
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureSnapshotUntilRefresh0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureSnapshotUntilRefresh0038';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            installStates([2, 2, 2, 2, 2]);
            logPair(tag, 'beforeRefresh', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            feature.refreshCurrentState();
            logPair(tag, 'afterRefresh', feature.getCurrentValidEvents().length.toString(), '0');
            expect(feature.getCurrentValidEvents().length).assertEqual(0);
            logPair(tag, 'onceAfterRefresh', feature.getOnceEvents().length.toString(), '0');
            expect(feature.getOnceEvents().length).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0039
         * @tc.name      testMainFeatureOnceEmptyArray0039
         * @tc.desc      全部常开时一次性事件返回空数组而非未定义，调用方可安全遍历
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureOnceEmptyArray0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureOnceEmptyArray0039';
            logBegin(tag);
            installStates([0, 0, 0, 0, 0]);
            const feature: mainFeature = new mainFeature();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'onceCount', once.length.toString(), '0');
            expect(once.length).assertEqual(0);
            logPair(tag, 'deepEqualsEmpty', once.join(','), '');
            expect(once).assertDeepEquals([]);
            logPair(tag, 'validCount', feature.getCurrentValidEvents().length.toString(), '5');
            expect(feature.getCurrentValidEvents().length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0040
         * @tc.name      testMainFeatureSingleOnceKey0040
         * @tc.desc      仅亮屏一项为一次性时有效列表只含亮屏，且不污染公共监听集合
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainFeatureSingleOnceKey0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainFeatureSingleOnceKey0040';
            logBegin(tag);
            const map: Map<string, number> = new Map();
            map.set(SCREEN_ON, 1);
            globalThis.settings = map;
            const feature: mainFeature = new mainFeature();
            const valid: Array<string> = feature.getCurrentValidEvents();
            const once: Array<string> = feature.getOnceEvents();
            logPair(tag, 'validOnly', valid.join(','), SCREEN_ON);
            expect(valid.join(',')).assertEqual(SCREEN_ON);
            logPair(tag, 'onceOnly', once.join(','), SCREEN_ON);
            expect(once.join(',')).assertEqual(SCREEN_ON);
            logPair(tag, 'staticArrayIntact', EVENTS.length.toString(), '5');
            expect(EVENTS.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0041
         * @tc.name      testMainCompactEmptyInput0041
         * @tc.desc      空数组压缩后仍为空，不产生任何元素
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactEmptyInput0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactEmptyInput0041';
            logBegin(tag);
            const compacted: Array<string> = mainFeature.compactRecordedEvents([]);
            logPair(tag, 'length', compacted.length.toString(), '0');
            expect(compacted.length).assertEqual(0);
            logPair(tag, 'empty', (compacted.length === 0).toString(), 'true');
            expect(compacted.length === 0).assertTrue();
            logPair(tag, 'joinEmpty', compacted.join(','), '');
            expect(compacted.join(',')).assertEqual('');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0042
         * @tc.name      testMainCompactAllEmptyStrings0042
         * @tc.desc      全空串数组被全部过滤，结果为空
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactAllEmptyStrings0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactAllEmptyStrings0042';
            logBegin(tag);
            const compacted: Array<string> = mainFeature.compactRecordedEvents(['', '', '']);
            logPair(tag, 'length', compacted.length.toString(), '0');
            expect(compacted.length).assertEqual(0);
            logPair(tag, 'joinEmpty', compacted.join(','), '');
            expect(compacted.join(',')).assertEqual('');
            logPair(tag, 'notOne', (compacted.length !== 1).toString(), 'true');
            expect(compacted.length !== 1).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0043
         * @tc.name      testMainCompactMixedInput0043
         * @tc.desc      空串与非空串交替时仅保留非空串
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactMixedInput0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactMixedInput0043';
            logBegin(tag);
            const compacted: Array<string> = mainFeature.compactRecordedEvents(['', 'a', '']);
            logPair(tag, 'length', compacted.length.toString(), '1');
            expect(compacted.length).assertEqual(1);
            logPair(tag, 'onlyValid', compacted.join(','), 'a');
            expect(compacted.join(',')).assertEqual('a');
            logPair(tag, 'firstIsA', compacted[0], 'a');
            expect(compacted[0]).assertEqual('a');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0044
         * @tc.name      testMainCompactKeepsOrder0044
         * @tc.desc      全非空输入时元素顺序与原数组完全一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactKeepsOrder0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactKeepsOrder0044';
            logBegin(tag);
            const source: Array<string> = ['c', 'a', 'b'];
            const compacted: Array<string> = mainFeature.compactRecordedEvents(source);
            logPair(tag, 'joined', compacted.join(','), 'c,a,b');
            expect(compacted.join(',')).assertEqual('c,a,b');
            logPair(tag, 'first', compacted[0], 'c');
            expect(compacted[0]).assertEqual('c');
            logPair(tag, 'last', compacted[2], 'b');
            expect(compacted[2]).assertEqual('b');
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0045
         * @tc.name      testMainCompactKeepsDuplicates0045
         * @tc.desc      重复值不去重，全部保留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactKeepsDuplicates0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactKeepsDuplicates0045';
            logBegin(tag);
            const compacted: Array<string> = mainFeature.compactRecordedEvents(['a', 'a', 'a']);
            logPair(tag, 'length', compacted.length.toString(), '3');
            expect(compacted.length).assertEqual(3);
            logPair(tag, 'joined', compacted.join(','), 'a,a,a');
            expect(compacted.join(',')).assertEqual('a,a,a');
            logPair(tag, 'allSame', (compacted[0] === compacted[1] && compacted[1] === compacted[2]).toString(), 'true');
            expect(compacted[0] === compacted[1] && compacted[1] === compacted[2]).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0046
         * @tc.name      testMainCompactSingleElement0046
         * @tc.desc      单空串过滤为空，单非空串原样保留
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactSingleElement0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactSingleElement0046';
            logBegin(tag);
            const emptyOut: Array<string> = mainFeature.compactRecordedEvents(['']);
            const validOut: Array<string> = mainFeature.compactRecordedEvents(['x']);
            logPair(tag, 'emptyOut', emptyOut.length.toString(), '0');
            expect(emptyOut.length).assertEqual(0);
            logPair(tag, 'validOut', validOut.join(','), 'x');
            expect(validOut.join(',')).assertEqual('x');
            logPair(tag, 'validLength', validOut.length.toString(), '1');
            expect(validOut.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0047
         * @tc.name      testMainCompactInputUntouched0047
         * @tc.desc      压缩产生副本，原数组内容不被修改
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactInputUntouched0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactInputUntouched0047';
            logBegin(tag);
            const source: Array<string> = ['', 'keep', ''];
            const compacted: Array<string> = mainFeature.compactRecordedEvents(source);
            logPair(tag, 'sourceLength', source.length.toString(), '3');
            expect(source.length).assertEqual(3);
            logPair(tag, 'sourceJoined', source.join(','), ',keep,');
            expect(source.join(',')).assertEqual(',keep,');
            logPair(tag, 'compactedLength', compacted.length.toString(), '1');
            expect(compacted.length).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_STATE_0048
         * @tc.name      testMainCompactStateIndependent0048
         * @tc.desc      压缩结果只由输入决定，与全局设置表无关
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testMainCompactStateIndependent0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testMainCompactStateIndependent0048';
            logBegin(tag);
            installStates([2, 2, 2, 2, 2]);
            const compacted: Array<string> = mainFeature.compactRecordedEvents(['a', '']);
            logPair(tag, 'joined', compacted.join(','), 'a');
            expect(compacted.join(',')).assertEqual('a');
            logPair(tag, 'length', compacted.length.toString(), '1');
            expect(compacted.length).assertEqual(1);
            installStates([0, 0, 0, 0, 0]);
            const again: Array<string> = mainFeature.compactRecordedEvents(['a', '']);
            logPair(tag, 'again', again.join(','), 'a');
            expect(again.join(',')).assertEqual('a');
            logEnd(tag);
        })
    })
}
