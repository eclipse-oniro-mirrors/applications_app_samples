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
import settingFeature from '../../../main/ets/feature/SettingFeature';
import launchFeature from '../../../main/ets/feature/LaunchFeature';
import surveillanceEventsManager from '../../../main/ets/module/SurveillanceEventsManager';
import consts from '../../../main/ets/module/Consts';
import { clearStore, getTestContext } from './helper/TestStorage';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'SettingFeatureCore_';
const EVENTS: Array<string> = surveillanceEventsManager.surveillanceEvents;
const WIFI: string = EVENTS[0];
const SCREEN_OFF: string = EVENTS[1];
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

function installSettings(states: Array<number>): void {
    const map: Map<string, number> = new Map();
    for (let index = 0; index < EVENTS.length; index++) {
        map.set(EVENTS[index], states[index]);
    }
    globalThis.settings = map;
}

function requireContext(): common.UIAbilityContext {
    const context: common.UIAbilityContext | undefined = getTestContext();
    if (context === undefined) {
        throw new Error('test ability context is not ready');
    }
    return context;
}

async function createSettingFeature(): Promise<settingFeature> {
    const feature: settingFeature = new settingFeature(requireContext());
    await feature.init();
    return feature;
}

async function restoreFromStore(): Promise<void> {
    // changeState 的落盘是 put→flush 异步链，回读前留出有界等待，避免读写竞态
    await new Promise<void>((resolve) => {
        setTimeout(() => {
            resolve();
        }, 150);
    });
    const launcher: launchFeature = new launchFeature(requireContext());
    await launcher.init();
}

export default function settingFeatureCoreTest(): void {
    describe('SettingFeatureCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_SETTING_0001
         * @tc.name      testSettingCheckAlways0001
         * @tc.desc      状态值为常开时只有常开判定成立，另外两项判定为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckAlways0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckAlways0001';
            logBegin(tag);
            installSettings([0, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'true');
            expect(feature.checkStateForAlways(WIFI)).assertTrue();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'false');
            expect(feature.checkStateForOnce(WIFI)).assertFalse();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0002
         * @tc.name      testSettingCheckOnce0002
         * @tc.desc      状态值为仅一次时只有仅一次判定成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckOnce0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckOnce0002';
            logBegin(tag);
            installSettings([1, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'true');
            expect(feature.checkStateForOnce(WIFI)).assertTrue();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0003
         * @tc.name      testSettingCheckNever0003
         * @tc.desc      状态值为关闭时只有关闭判定成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckNever0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckNever0003';
            logBegin(tag);
            installSettings([2, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'true');
            expect(feature.checkStateForNever(WIFI)).assertTrue();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'false');
            expect(feature.checkStateForOnce(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0004
         * @tc.name      testSettingCheckAbsent0004
         * @tc.desc      状态表中缺少该事件时三项判定都为假，界面不会误选中任何一项
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckAbsent0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckAbsent0004';
            logBegin(tag);
            globalThis.settings = new Map<string, number>();
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'false');
            expect(feature.checkStateForOnce(WIFI)).assertFalse();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0005
         * @tc.name      testSettingCheckInvalidState0005
         * @tc.desc      越界状态值 3 不对应任何单选项，三项判定都为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckInvalidState0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckInvalidState0005';
            logBegin(tag);
            installSettings([3, 3, 3, 3, 3]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'false');
            expect(feature.checkStateForOnce(WIFI)).assertFalse();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0006
         * @tc.name      testSettingCheckFiveEvents0006
         * @tc.desc      五项事件各自状态与对应单选项判定一一吻合
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckFiveEvents0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckFiveEvents0006';
            logBegin(tag);
            installSettings([0, 1, 2, 0, 1]);
            const feature: settingFeature = await createSettingFeature();
            let matched: number = 0;
            if (feature.checkStateForAlways(WIFI)) {
                matched++;
            }
            if (feature.checkStateForOnce(SCREEN_OFF)) {
                matched++;
            }
            if (feature.checkStateForNever(SCREEN_ON)) {
                matched++;
            }
            if (feature.checkStateForAlways(LOCKED)) {
                matched++;
            }
            if (feature.checkStateForOnce(UNLOCKED)) {
                matched++;
            }
            logPair(tag, 'matched', matched.toString(), '5');
            expect(matched).assertEqual(5);
            logPair(tag, 'neverOnOff', feature.checkStateForNever(SCREEN_OFF).toString(), 'false');
            expect(feature.checkStateForNever(SCREEN_OFF)).assertFalse();
            logPair(tag, 'alwaysOnOn', feature.checkStateForAlways(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForAlways(SCREEN_ON)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0007
         * @tc.name      testSettingCheckScreenOff0007
         * @tc.desc      熄屏为仅一次、WiFi 为常开时两组判定互不串扰
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckScreenOff0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckScreenOff0007';
            logBegin(tag);
            installSettings([0, 1, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'alwaysWifi', feature.checkStateForAlways(WIFI).toString(), 'true');
            expect(feature.checkStateForAlways(WIFI)).assertTrue();
            logPair(tag, 'onceOff', feature.checkStateForOnce(SCREEN_OFF).toString(), 'true');
            expect(feature.checkStateForOnce(SCREEN_OFF)).assertTrue();
            logPair(tag, 'neverOff', feature.checkStateForNever(SCREEN_OFF).toString(), 'false');
            expect(feature.checkStateForNever(SCREEN_OFF)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0008
         * @tc.name      testSettingCheckScreenOn0008
         * @tc.desc      亮屏为关闭状态时只有关闭判定成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckScreenOn0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckScreenOn0008';
            logBegin(tag);
            installSettings([0, 0, 2, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'neverOn', feature.checkStateForNever(SCREEN_ON).toString(), 'true');
            expect(feature.checkStateForNever(SCREEN_ON)).assertTrue();
            logPair(tag, 'alwaysOn', feature.checkStateForAlways(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForAlways(SCREEN_ON)).assertFalse();
            logPair(tag, 'onceOn', feature.checkStateForOnce(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForOnce(SCREEN_ON)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0009
         * @tc.name      testSettingCheckLocked0009
         * @tc.desc      锁屏为常开状态时常开判定成立且关闭判定为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckLocked0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckLocked0009';
            logBegin(tag);
            installSettings([2, 2, 2, 0, 2]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'alwaysLocked', feature.checkStateForAlways(LOCKED).toString(), 'true');
            expect(feature.checkStateForAlways(LOCKED)).assertTrue();
            logPair(tag, 'neverLocked', feature.checkStateForNever(LOCKED).toString(), 'false');
            expect(feature.checkStateForNever(LOCKED)).assertFalse();
            logPair(tag, 'onceLocked', feature.checkStateForOnce(LOCKED).toString(), 'false');
            expect(feature.checkStateForOnce(LOCKED)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0010
         * @tc.name      testSettingCheckUnlocked0010
         * @tc.desc      解锁为仅一次时仅一次判定成立，常开与关闭判定都为假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCheckUnlocked0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCheckUnlocked0010';
            logBegin(tag);
            installSettings([2, 2, 2, 2, 1]);
            const feature: settingFeature = await createSettingFeature();
            logPair(tag, 'onceUnlocked', feature.checkStateForOnce(UNLOCKED).toString(), 'true');
            expect(feature.checkStateForOnce(UNLOCKED)).assertTrue();
            logPair(tag, 'alwaysUnlocked', feature.checkStateForAlways(UNLOCKED).toString(), 'false');
            expect(feature.checkStateForAlways(UNLOCKED)).assertFalse();
            logPair(tag, 'neverUnlocked', feature.checkStateForNever(UNLOCKED).toString(), 'false');
            expect(feature.checkStateForNever(UNLOCKED)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0011
         * @tc.name      testSettingChangeToOnce0011
         * @tc.desc      切到仅一次后全局状态立即变为 1，常开判定随之失效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeToOnce0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeToOnce0011';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToOnce(WIFI);
            logPair(tag, 'settingsValue', globalThis.settings.get(WIFI).toString(), '1');
            expect(globalThis.settings.get(WIFI)).assertEqual(1);
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'true');
            expect(feature.checkStateForOnce(WIFI)).assertTrue();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0012
         * @tc.name      testSettingChangeToNever0012
         * @tc.desc      切到关闭后全局状态变为 2，仅一次判定失效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeToNever0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeToNever0012';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToNever(SCREEN_ON);
            logPair(tag, 'settingsValue', globalThis.settings.get(SCREEN_ON).toString(), '2');
            expect(globalThis.settings.get(SCREEN_ON)).assertEqual(2);
            logPair(tag, 'never', feature.checkStateForNever(SCREEN_ON).toString(), 'true');
            expect(feature.checkStateForNever(SCREEN_ON)).assertTrue();
            logPair(tag, 'once', feature.checkStateForOnce(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForOnce(SCREEN_ON)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0013
         * @tc.name      testSettingChangeToAlways0013
         * @tc.desc      切到常开后全局状态变为 0，关闭判定失效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeToAlways0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeToAlways0013';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToAlways(LOCKED);
            logPair(tag, 'settingsValue', globalThis.settings.get(LOCKED).toString(), '0');
            expect(globalThis.settings.get(LOCKED)).assertEqual(0);
            logPair(tag, 'always', feature.checkStateForAlways(LOCKED).toString(), 'true');
            expect(feature.checkStateForAlways(LOCKED)).assertTrue();
            logPair(tag, 'never', feature.checkStateForNever(LOCKED).toString(), 'false');
            expect(feature.checkStateForNever(LOCKED)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0014
         * @tc.name      testSettingChangeChain0014
         * @tc.desc      同一事件连续切三次后只剩最后一次状态生效
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeChain0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeChain0014';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToOnce(WIFI);
            feature.changeStateToNever(WIFI);
            feature.changeStateToAlways(WIFI);
            logPair(tag, 'settingsValue', globalThis.settings.get(WIFI).toString(), '0');
            expect(globalThis.settings.get(WIFI)).assertEqual(0);
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'true');
            expect(feature.checkStateForAlways(WIFI)).assertTrue();
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'false');
            expect(feature.checkStateForOnce(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0015
         * @tc.name      testSettingChangeInvalidThree0015
         * @tc.desc      越界值 3 写入前被归一为 NEVER(2)，三个单选项中仅 never 成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeInvalidThree0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeInvalidThree0015';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState(WIFI, 3);
            logPair(tag, 'settingsValue', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'true');
            expect(feature.checkStateForNever(WIFI)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0016
         * @tc.name      testSettingChangeOutOfRange0016
         * @tc.desc      远越界值 99 归一为 NEVER(2)，不污染其它事件的状态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeOutOfRange0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeOutOfRange0016';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState(SCREEN_OFF, 99);
            logPair(tag, 'settingsValue', globalThis.settings.get(SCREEN_OFF).toString(), '2');
            expect(globalThis.settings.get(SCREEN_OFF)).assertEqual(2);
            logPair(tag, 'once', feature.checkStateForOnce(SCREEN_OFF).toString(), 'false');
            expect(feature.checkStateForOnce(SCREEN_OFF)).assertFalse();
            logPair(tag, 'alwaysOther', feature.checkStateForAlways(WIFI).toString(), 'true');
            expect(feature.checkStateForAlways(WIFI)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0017
         * @tc.name      testSettingChangeIsolation0017
         * @tc.desc      修改单个事件不波及其它事件的状态值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeIsolation0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeIsolation0017';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToAlways(UNLOCKED);
            logPair(tag, 'unlocked', globalThis.settings.get(UNLOCKED).toString(), '0');
            expect(globalThis.settings.get(UNLOCKED)).assertEqual(0);
            logPair(tag, 'wifiUntouched', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logPair(tag, 'lockedUntouched', globalThis.settings.get(LOCKED).toString(), '2');
            expect(globalThis.settings.get(LOCKED)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0018
         * @tc.name      testSettingChangeAllOnce0018
         * @tc.desc      五项事件依次切到仅一次，逐项判定全部成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeAllOnce0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeAllOnce0018';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            for (let index = 0; index < EVENTS.length; index++) {
                feature.changeStateToOnce(EVENTS[index]);
            }
            let onceCount: number = 0;
            for (let index = 0; index < EVENTS.length; index++) {
                if (feature.checkStateForOnce(EVENTS[index])) {
                    onceCount++;
                }
            }
            logPair(tag, 'onceCount', onceCount.toString(), '5');
            expect(onceCount).assertEqual(5);
            logPair(tag, 'wifiValue', globalThis.settings.get(WIFI).toString(), '1');
            expect(globalThis.settings.get(WIFI)).assertEqual(1);
            logPair(tag, 'alwaysUnlocked', feature.checkStateForAlways(UNLOCKED).toString(), 'false');
            expect(feature.checkStateForAlways(UNLOCKED)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0019
         * @tc.name      testSettingPersistOnce0019
         * @tc.desc      切到仅一次后落盘，重新从存储恢复得到 1
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingPersistOnce0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingPersistOnce0019';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToOnce(WIFI);
            await restoreFromStore();
            logPair(tag, 'restoredWifi', globalThis.settings.get(WIFI).toString(), '1');
            expect(globalThis.settings.get(WIFI)).assertEqual(1);
            logPair(tag, 'restoredOff', globalThis.settings.get(SCREEN_OFF).toString(), '0');
            expect(globalThis.settings.get(SCREEN_OFF)).assertEqual(0);
            logPair(tag, 'checkOnce', feature.checkStateForOnce(WIFI).toString(), 'true');
            expect(feature.checkStateForOnce(WIFI)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0020
         * @tc.name      testSettingPersistNever0020
         * @tc.desc      切到关闭后落盘，重新从存储恢复得到 2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingPersistNever0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingPersistNever0020';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToNever(SCREEN_OFF);
            await restoreFromStore();
            logPair(tag, 'restoredOff', globalThis.settings.get(SCREEN_OFF).toString(), '2');
            expect(globalThis.settings.get(SCREEN_OFF)).assertEqual(2);
            logPair(tag, 'restoredOn', globalThis.settings.get(SCREEN_ON).toString(), '0');
            expect(globalThis.settings.get(SCREEN_ON)).assertEqual(0);
            logPair(tag, 'checkNever', feature.checkStateForNever(SCREEN_OFF).toString(), 'true');
            expect(feature.checkStateForNever(SCREEN_OFF)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0021
         * @tc.name      testSettingPersistThreeGroups0021
         * @tc.desc      三种状态分别写入不同事件，恢复后逐项保持原值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingPersistThreeGroups0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingPersistThreeGroups0021';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToAlways(WIFI);
            feature.changeStateToOnce(SCREEN_OFF);
            feature.changeStateToNever(SCREEN_ON);
            await restoreFromStore();
            logPair(tag, 'wifi', globalThis.settings.get(WIFI).toString(), '0');
            expect(globalThis.settings.get(WIFI)).assertEqual(0);
            logPair(tag, 'off', globalThis.settings.get(SCREEN_OFF).toString(), '1');
            expect(globalThis.settings.get(SCREEN_OFF)).assertEqual(1);
            logPair(tag, 'on', globalThis.settings.get(SCREEN_ON).toString(), '2');
            expect(globalThis.settings.get(SCREEN_ON)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0022
         * @tc.name      testSettingPersistLastWrite0022
         * @tc.desc      同一事件连续写两次，落盘后以最后一次为准
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingPersistLastWrite0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingPersistLastWrite0022';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToOnce(LOCKED);
            feature.changeStateToNever(LOCKED);
            await restoreFromStore();
            logPair(tag, 'restoredLocked', globalThis.settings.get(LOCKED).toString(), '2');
            expect(globalThis.settings.get(LOCKED)).assertEqual(2);
            logPair(tag, 'notOnce', globalThis.settings.get(LOCKED).toString(), '1');
            expect(globalThis.settings.get(LOCKED) === 1).assertFalse();
            logPair(tag, 'checkNever', feature.checkStateForNever(LOCKED).toString(), 'true');
            expect(feature.checkStateForNever(LOCKED)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0023
         * @tc.name      testSettingPersistInvalidValue0023
         * @tc.desc      越界值落盘前被归一为 NEVER(2)，恢复后仍为 2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingPersistInvalidValue0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingPersistInvalidValue0023';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState(WIFI, 3);
            await restoreFromStore();
            logPair(tag, 'restoredWifi', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logPair(tag, 'checkAlways', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logPair(tag, 'checkNever', feature.checkStateForNever(WIFI).toString(), 'true');
            expect(feature.checkStateForNever(WIFI)).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0024
         * @tc.name      testSettingRestoreOverwritesMemory0024
         * @tc.desc      存储中的值覆盖内存里的旧状态，未被写入的事件回落为 0
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingRestoreOverwritesMemory0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingRestoreOverwritesMemory0024';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            await restoreFromStore();
            logPair(tag, 'restoredWifi', globalThis.settings.get(WIFI).toString(), '0');
            expect(globalThis.settings.get(WIFI)).assertEqual(0);
            logPair(tag, 'restoredUnlocked', globalThis.settings.get(UNLOCKED).toString(), '0');
            expect(globalThis.settings.get(UNLOCKED)).assertEqual(0);
            logPair(tag, 'noLongerTwo', (globalThis.settings.get(WIFI) === 2).toString(), 'false');
            expect(globalThis.settings.get(WIFI) === 2).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0025
         * @tc.name      testSettingRepeatSameValue0025
         * @tc.desc      重复写入同一状态值结果稳定，判定仍只有一项成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingRepeatSameValue0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingRepeatSameValue0025';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToOnce(WIFI);
            feature.changeStateToOnce(WIFI);
            logPair(tag, 'settingsValue', globalThis.settings.get(WIFI).toString(), '1');
            expect(globalThis.settings.get(WIFI)).assertEqual(1);
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'true');
            expect(feature.checkStateForOnce(WIFI)).assertTrue();
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'false');
            expect(feature.checkStateForNever(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0026
         * @tc.name      testSettingCyclicStates0026
         * @tc.desc      状态值 0→1→2→0 循环一圈后回到常开
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingCyclicStates0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingCyclicStates0026';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToAlways(SCREEN_ON);
            feature.changeStateToOnce(SCREEN_ON);
            feature.changeStateToNever(SCREEN_ON);
            feature.changeStateToAlways(SCREEN_ON);
            logPair(tag, 'settingsValue', globalThis.settings.get(SCREEN_ON).toString(), '0');
            expect(globalThis.settings.get(SCREEN_ON)).assertEqual(0);
            logPair(tag, 'always', feature.checkStateForAlways(SCREEN_ON).toString(), 'true');
            expect(feature.checkStateForAlways(SCREEN_ON)).assertTrue();
            logPair(tag, 'once', feature.checkStateForOnce(SCREEN_ON).toString(), 'false');
            expect(feature.checkStateForOnce(SCREEN_ON)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0027
         * @tc.name      testSettingUnknownGroup0027
         * @tc.desc      非监听集合内的自定义事件也能写入状态，但不改变受管事件集合
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingUnknownGroup0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingUnknownGroup0027';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState('unknown_event', 1);
            logPair(tag, 'unknownValue', globalThis.settings.get('unknown_event').toString(), '1');
            expect(globalThis.settings.get('unknown_event')).assertEqual(1);
            logPair(tag, 'checkOnce', feature.checkStateForOnce('unknown_event').toString(), 'true');
            expect(feature.checkStateForOnce('unknown_event')).assertTrue();
            logPair(tag, 'managedSize', EVENTS.length.toString(), '5');
            expect(EVENTS.length).assertEqual(5);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0028
         * @tc.name      testSettingEmptyGroup0028
         * @tc.desc      空字符串作为事件名时按普通键写入，判定逻辑与常规键一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingEmptyGroup0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingEmptyGroup0028';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState('', 0);
            logPair(tag, 'emptyKeyValue', globalThis.settings.get('').toString(), '0');
            expect(globalThis.settings.get('')).assertEqual(0);
            logPair(tag, 'checkAlways', feature.checkStateForAlways('').toString(), 'true');
            expect(feature.checkStateForAlways('')).assertTrue();
            logPair(tag, 'wifiUntouched', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0029
         * @tc.name      testSettingAllNever0029
         * @tc.desc      五项事件全部关闭时关闭判定全真、常开判定全假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingAllNever0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingAllNever0029';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            for (let index = 0; index < EVENTS.length; index++) {
                feature.changeStateToNever(EVENTS[index]);
            }
            let neverCount: number = 0;
            let alwaysCount: number = 0;
            for (let index = 0; index < EVENTS.length; index++) {
                if (feature.checkStateForNever(EVENTS[index])) {
                    neverCount++;
                }
                if (feature.checkStateForAlways(EVENTS[index])) {
                    alwaysCount++;
                }
            }
            logPair(tag, 'neverCount', neverCount.toString(), '5');
            expect(neverCount).assertEqual(5);
            logPair(tag, 'alwaysCount', alwaysCount.toString(), '0');
            expect(alwaysCount).assertEqual(0);
            logPair(tag, 'unlockedValue', globalThis.settings.get(UNLOCKED).toString(), '2');
            expect(globalThis.settings.get(UNLOCKED)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0030
         * @tc.name      testSettingAllAlways0030
         * @tc.desc      五项事件全部常开时常开判定全真、仅一次判定全假
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingAllAlways0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingAllAlways0030';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            for (let index = 0; index < EVENTS.length; index++) {
                feature.changeStateToAlways(EVENTS[index]);
            }
            let alwaysCount: number = 0;
            let onceCount: number = 0;
            for (let index = 0; index < EVENTS.length; index++) {
                if (feature.checkStateForAlways(EVENTS[index])) {
                    alwaysCount++;
                }
                if (feature.checkStateForOnce(EVENTS[index])) {
                    onceCount++;
                }
            }
            logPair(tag, 'alwaysCount', alwaysCount.toString(), '5');
            expect(alwaysCount).assertEqual(5);
            logPair(tag, 'onceCount', onceCount.toString(), '0');
            expect(onceCount).assertEqual(0);
            logPair(tag, 'lockedValue', globalThis.settings.get(LOCKED).toString(), '0');
            expect(globalThis.settings.get(LOCKED)).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0031
         * @tc.name      testSettingNormalizeThreeStates0031
         * @tc.desc      三态合法值 0/1/2 原样放行，归一后值与输入逐项相等
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeThreeStates0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeThreeStates0031';
            logBegin(tag);
            logPair(tag, 'always', settingFeature.normalizeState(0).toString(), '0');
            expect(settingFeature.normalizeState(0)).assertEqual(0);
            logPair(tag, 'once', settingFeature.normalizeState(1).toString(), '1');
            expect(settingFeature.normalizeState(1)).assertEqual(1);
            logPair(tag, 'never', settingFeature.normalizeState(2).toString(), '2');
            expect(settingFeature.normalizeState(2)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0032
         * @tc.name      testSettingNormalizeOutOfRange0032
         * @tc.desc      越界值 3/4/99 统一回落为 NEVER(2)，无任何越界值被放行
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeOutOfRange0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeOutOfRange0032';
            logBegin(tag);
            const fallbackThree: number = settingFeature.normalizeState(3);
            logPair(tag, 'three', fallbackThree.toString(), '2');
            expect(fallbackThree).assertEqual(2);
            const sameAsFour: boolean = fallbackThree === settingFeature.normalizeState(4);
            logPair(tag, 'threeEqualsFour', sameAsFour.toString(), 'true');
            expect(sameAsFour).assertTrue();
            const notAlways: boolean = settingFeature.normalizeState(99) !== 0;
            logPair(tag, 'ninetyNineNotAlways', notAlways.toString(), 'true');
            expect(notAlways).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0033
         * @tc.name      testSettingNormalizeNegative0033
         * @tc.desc      负值 -1/-100 回落为 NEVER(2)，且不把合法的 0 误判为非法
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeNegative0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeNegative0033';
            logBegin(tag);
            logPair(tag, 'minusOne', settingFeature.normalizeState(-1).toString(), '2');
            expect(settingFeature.normalizeState(-1)).assertEqual(2);
            logPair(tag, 'minusHundred', settingFeature.normalizeState(-100).toString(), '2');
            expect(settingFeature.normalizeState(-100)).assertEqual(2);
            logPair(tag, 'zeroKept', settingFeature.normalizeState(0).toString(), '0');
            expect(settingFeature.normalizeState(0)).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0034
         * @tc.name      testSettingNormalizeFraction0034
         * @tc.desc      小数一律回落为 NEVER(2)，仅整值 1 被识为 ONCE；2.5 与 2 同归 NEVER 但输入不等值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeFraction0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeFraction0034';
            logBegin(tag);
            logPair(tag, 'half', settingFeature.normalizeState(0.5).toString(), '2');
            expect(settingFeature.normalizeState(0.5)).assertEqual(2);
            logPair(tag, 'oneAndHalf', settingFeature.normalizeState(1.5).toString(), '2');
            expect(settingFeature.normalizeState(1.5)).assertEqual(2);
            logPair(tag, 'twoAndHalf', settingFeature.normalizeState(2.5).toString(), '2');
            expect(settingFeature.normalizeState(2.5)).assertEqual(2);
            logPair(tag, 'integralOne', settingFeature.normalizeState(1).toString(), '1');
            expect(settingFeature.normalizeState(1)).assertEqual(1);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0035
         * @tc.name      testSettingChangeStateValidKept0035
         * @tc.desc      写入合法值 ONCE(1) 不被归一，内存态与两个判定同步成立
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingChangeStateValidKept0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingChangeStateValidKept0035';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState(WIFI, 1);
            logPair(tag, 'wifiValue', globalThis.settings.get(WIFI).toString(), '1');
            expect(globalThis.settings.get(WIFI)).assertEqual(1);
            logPair(tag, 'once', feature.checkStateForOnce(WIFI).toString(), 'true');
            expect(feature.checkStateForOnce(WIFI)).assertTrue();
            logPair(tag, 'always', feature.checkStateForAlways(WIFI).toString(), 'false');
            expect(feature.checkStateForAlways(WIFI)).assertFalse();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0036
         * @tc.name      testSettingShortcutMethods0036
         * @tc.desc      三个便捷方法分别落 0/1/2，归一不改变它们的语义
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingShortcutMethods0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingShortcutMethods0036';
            logBegin(tag);
            await clearStore();
            installSettings([2, 2, 2, 2, 2]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeStateToAlways(SCREEN_OFF);
            feature.changeStateToOnce(SCREEN_ON);
            feature.changeStateToNever(LOCKED);
            logPair(tag, 'offAfterAlways', globalThis.settings.get(SCREEN_OFF).toString(), '0');
            expect(globalThis.settings.get(SCREEN_OFF)).assertEqual(0);
            logPair(tag, 'onAfterOnce', globalThis.settings.get(SCREEN_ON).toString(), '1');
            expect(globalThis.settings.get(SCREEN_ON)).assertEqual(1);
            logPair(tag, 'lockedAfterNever', globalThis.settings.get(LOCKED).toString(), '2');
            expect(globalThis.settings.get(LOCKED)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0037
         * @tc.name      testSettingNormalizeIdempotent0037
         * @tc.desc      归一幂等：对归一结果再归一值不变，非法输入永远不会在二次归一后变回合态
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeIdempotent0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeIdempotent0037';
            logBegin(tag);
            const inputs: Array<number> = [0, 1, 2, 3, -1, 0.5];
            let unstable: number = 0;
            let illegalLeaked: number = 0;
            for (let index = 0; index < inputs.length; index++) {
                const once: number = settingFeature.normalizeState(inputs[index]);
                const twice: number = settingFeature.normalizeState(once);
                if (once !== twice) {
                    unstable++;
                }
                if (once < 0 || once > 2) {
                    illegalLeaked++;
                }
            }
            logPair(tag, 'unstable', unstable.toString(), '0');
            expect(unstable).assertEqual(0);
            logPair(tag, 'illegalLeaked', illegalLeaked.toString(), '0');
            expect(illegalLeaked).assertEqual(0);
            logPair(tag, 'inputCount', inputs.length.toString(), '6');
            expect(inputs.length).assertEqual(6);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0038
         * @tc.name      testSettingRepeatedInvalidWrite0038
         * @tc.desc      连续写入三次（含两次越界）后内存态与落盘均为最后一次的归一结果 NEVER(2)
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingRepeatedInvalidWrite0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingRepeatedInvalidWrite0038';
            logBegin(tag);
            await clearStore();
            installSettings([0, 0, 0, 0, 0]);
            const feature: settingFeature = await createSettingFeature();
            feature.changeState(WIFI, 3);
            feature.changeState(WIFI, 0);
            feature.changeState(WIFI, 3);
            logPair(tag, 'wifiValue', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logPair(tag, 'never', feature.checkStateForNever(WIFI).toString(), 'true');
            expect(feature.checkStateForNever(WIFI)).assertTrue();
            await restoreFromStore();
            logPair(tag, 'restoredWifi', globalThis.settings.get(WIFI).toString(), '2');
            expect(globalThis.settings.get(WIFI)).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0039
         * @tc.name      testSettingNormalizeNegative0039
         * @tc.desc      负数状态归一为 NEVER，两个负值样本结果一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeNegative0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeNegative0039';
            logBegin(tag);
            const minusOne: number = settingFeature.normalizeState(-1);
            const minusNinetyNine: number = settingFeature.normalizeState(-99);
            logPair(tag, 'minusOne', minusOne.toString(), '2');
            expect(minusOne).assertEqual(2);
            logPair(tag, 'minusNinetyNine', minusNinetyNine.toString(), '2');
            expect(minusNinetyNine).assertEqual(2);
            logPair(tag, 'sameNever', (minusOne === minusNinetyNine).toString(), 'true');
            expect(minusOne === minusNinetyNine).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0040
         * @tc.name      testSettingNormalizePositiveIllegal0040
         * @tc.desc      越界正整数 3 与 99 均归一为 NEVER
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizePositiveIllegal0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizePositiveIllegal0040';
            logBegin(tag);
            const three: number = settingFeature.normalizeState(3);
            const ninetyNine: number = settingFeature.normalizeState(99);
            logPair(tag, 'three', three.toString(), '2');
            expect(three).assertEqual(2);
            logPair(tag, 'ninetyNine', ninetyNine.toString(), '2');
            expect(ninetyNine).assertEqual(2);
            logPair(tag, 'sameNever', (three === ninetyNine).toString(), 'true');
            expect(three === ninetyNine).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0041
         * @tc.name      testSettingNormalizeSafeInteger0041
         * @tc.desc      安全整数上限远离合法域，归一为 NEVER
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeSafeInteger0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeSafeInteger0041';
            logBegin(tag);
            const bigValue: number = 9007199254740991;
            const normalized: number = settingFeature.normalizeState(bigValue);
            logPair(tag, 'normalized', normalized.toString(), '2');
            expect(normalized).assertEqual(2);
            logPair(tag, 'never', (normalized === consts.ENABLE_STATE_NEVER).toString(), 'true');
            expect(normalized).assertEqual(consts.ENABLE_STATE_NEVER);
            logPair(tag, 'notAlways', (normalized !== consts.ENABLE_STATE_ALWAYS).toString(), 'true');
            expect(normalized !== consts.ENABLE_STATE_ALWAYS).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0042
         * @tc.name      testSettingNormalizeNegativeZero0042
         * @tc.desc      负零与零全等，归一后保持 ALWAYS
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeNegativeZero0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeNegativeZero0042';
            logBegin(tag);
            const negativeZero: number = -0;
            const normalized: number = settingFeature.normalizeState(negativeZero);
            logPair(tag, 'normalized', normalized.toString(), '0');
            expect(normalized).assertEqual(0);
            logPair(tag, 'always', (normalized === consts.ENABLE_STATE_ALWAYS).toString(), 'true');
            expect(normalized).assertEqual(consts.ENABLE_STATE_ALWAYS);
            logPair(tag, 'equalsZero', (negativeZero === 0).toString(), 'true');
            expect(negativeZero === 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0043
         * @tc.name      testSettingNormalizeFraction0043
         * @tc.desc      小数 0.5 不属于合法域归一为 NEVER，整数 1.0 保持 ONCE
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeFraction0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeFraction0043';
            logBegin(tag);
            const half: number = settingFeature.normalizeState(0.5);
            const onePointZero: number = settingFeature.normalizeState(1.0);
            logPair(tag, 'half', half.toString(), '2');
            expect(half).assertEqual(2);
            logPair(tag, 'onePointZero', onePointZero.toString(), '1');
            expect(onePointZero).assertEqual(1);
            logPair(tag, 'different', (half !== onePointZero).toString(), 'true');
            expect(half !== onePointZero).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_SETTING_0044
         * @tc.name      testSettingNormalizeIdempotent0044
         * @tc.desc      归一结果再归一保持不变（NEVER 是闭合不动点）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testSettingNormalizeIdempotent0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testSettingNormalizeIdempotent0044';
            logBegin(tag);
            const once: number = settingFeature.normalizeState(99);
            const twice: number = settingFeature.normalizeState(once);
            logPair(tag, 'once', once.toString(), '2');
            expect(once).assertEqual(2);
            logPair(tag, 'twice', twice.toString(), '2');
            expect(twice).assertEqual(2);
            logPair(tag, 'fixedPoint', (once === twice).toString(), 'true');
            expect(once === twice).assertTrue();
            logEnd(tag);
        })
    })
}
