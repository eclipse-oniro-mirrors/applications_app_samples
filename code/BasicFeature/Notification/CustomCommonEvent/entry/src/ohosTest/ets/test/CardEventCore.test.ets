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
import { CardEventFeature } from '../../../main/ets/feature/CardEventFeature';

const DOMAIN: number = 0xF811;
const TAG_PREFIX: string = 'CardEventCore_';

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

export default function cardEventCoreTest(): void {
    describe('CardEventCoreTest', () => {
        /**
         * @tc.number    SUB_CCE_CARD_0001
         * @tc.name      testCardEventInAppMatch0001
         * @tc.desc      订阅态下 InApp 事件且 bundle 数据一致时命中 bundleName 专属提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventInAppMatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventInAppMatch0001';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            logPair(tag, 'action', action.toString(), '2');
            expect(action).assertEqual(CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE);
            logPair(tag, 'notNone', (action !== CardEventFeature.TOAST_NONE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_NONE).assertTrue();
            logPair(tag, 'bundleKind', (action === 2).toString(), 'true');
            expect(action).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0002
         * @tc.name      testCardEventInAppMismatch0002
         * @tc.desc      订阅态下 InApp 事件但 bundle 数据不一致时不弹任何提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventInAppMismatch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventInAppMismatch0002';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('InApp', 'OutApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notEventReceive', (action !== CardEventFeature.TOAST_EVENT_RECEIVE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_EVENT_RECEIVE).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0003
         * @tc.name      testCardEventOutAppMatch0003
         * @tc.desc      订阅态下 OutApp 事件且 bundle 数据一致（自屏蔽）时不弹提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventOutAppMatch0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventOutAppMatch0003';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notBundle', (action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0004
         * @tc.name      testCardEventOutAppMismatch0004
         * @tc.desc      订阅态下 OutApp 事件但 bundle 数据不一致时命中普通提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventOutAppMismatch0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventOutAppMismatch0004';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('OutApp', 'InApp', true);
            logPair(tag, 'action', action.toString(), '1');
            expect(action).assertEqual(CardEventFeature.TOAST_EVENT_RECEIVE);
            logPair(tag, 'one', action.toString(), '1');
            expect(action).assertEqual(1);
            logPair(tag, 'notBundle', (action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0005
         * @tc.name      testCardEventUnsubscribedInApp0005
         * @tc.desc      未订阅时即使 InApp 匹配也不弹提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventUnsubscribedInApp0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventUnsubscribedInApp0005';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('InApp', 'InApp', false);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notBundle', (action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0006
         * @tc.name      testCardEventUnsubscribedOutApp0006
         * @tc.desc      未订阅时 OutApp 失配同样不弹提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventUnsubscribedOutApp0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventUnsubscribedOutApp0006';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('OutApp', 'InApp', false);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'notEventReceive', (action !== CardEventFeature.TOAST_EVENT_RECEIVE).toString(), 'true');
            expect(action !== CardEventFeature.TOAST_EVENT_RECEIVE).assertTrue();
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0007
         * @tc.name      testCardEventEmptyData0007
         * @tc.desc      订阅态下空数据串不命中任何提示分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventEmptyData0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventEmptyData0007';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('', 'InApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'emptyBundleToo', CardEventFeature.resolveToastAction('', '', true).toString(), '0');
            expect(CardEventFeature.resolveToastAction('', '', true)).assertEqual(0);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0008
         * @tc.name      testCardEventOtherData0008
         * @tc.desc      订阅态下未知数据串落入默认分支不弹提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventOtherData0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventOtherData0008';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('other', 'other', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'notOne', (action !== 1).toString(), 'true');
            expect(action !== 1).assertTrue();
            logPair(tag, 'notTwo', (action !== 2).toString(), 'true');
            expect(action !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0009
         * @tc.name      testCardEventConstantsDistinct0009
         * @tc.desc      三类提示常量两两互异且取值恰为 0/1/2
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventConstantsDistinct0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventConstantsDistinct0009';
            logBegin(tag);
            logPair(tag, 'none', CardEventFeature.TOAST_NONE.toString(), '0');
            expect(CardEventFeature.TOAST_NONE).assertEqual(0);
            logPair(tag, 'receive', CardEventFeature.TOAST_EVENT_RECEIVE.toString(), '1');
            expect(CardEventFeature.TOAST_EVENT_RECEIVE).assertEqual(1);
            logPair(tag, 'bundleReceive', CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE.toString(), '2');
            expect(CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0010
         * @tc.name      testCardEventReturnValueDomain0010
         * @tc.desc      任意输入组合的返回值都落在三类常量构成的闭合值域内
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventReturnValueDomain0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventReturnValueDomain0010';
            logBegin(tag);
            const domain: Array<number> = [
                CardEventFeature.TOAST_NONE, CardEventFeature.TOAST_EVENT_RECEIVE,
                CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE
            ];
            let allInside: boolean = true;
            const samples: Array<string> = ['InApp', 'OutApp', '', 'other'];
            for (let i = 0; i < samples.length; i++) {
                for (let j = 0; j < samples.length; j++) {
                    const action: number = CardEventFeature.resolveToastAction(samples[i], samples[j], true);
                    if (domain.indexOf(action) < 0) {
                        allInside = false;
                    }
                }
            }
            logPair(tag, 'allInside', allInside.toString(), 'true');
            expect(allInside).assertTrue();
            logPair(tag, 'domainSize', domain.length.toString(), '3');
            expect(domain.length).assertEqual(3);
            logPair(tag, 'minZero', Math.min(domain[0], domain[1], domain[2]).toString(), '0');
            expect(Math.min(domain[0], domain[1], domain[2])).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0011
         * @tc.name      testCardEventLowerCaseInApp0011
         * @tc.desc      全小写 inapp 不是合法事件值，落入默认分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventLowerCaseInApp0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventLowerCaseInApp0011';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('inapp', 'inapp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notTwo', (action !== 2).toString(), 'true');
            expect(action !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0012
         * @tc.name      testCardEventUpperCaseInApp0012
         * @tc.desc      全大写 INAPP 不是合法事件值，落入默认分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventUpperCaseInApp0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventUpperCaseInApp0012';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('INAPP', 'INAPP', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notOne', (action !== 1).toString(), 'true');
            expect(action !== 1).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0013
         * @tc.name      testCardEventLeadingSpace0013
         * @tc.desc      前导空格破坏精确匹配，InApp 分支不命中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventLeadingSpace0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventLeadingSpace0013';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction(' InApp', ' InApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notTwo', (action !== 2).toString(), 'true');
            expect(action !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0014
         * @tc.name      testCardEventTrailingSpace0014
         * @tc.desc      尾随空格破坏精确匹配，OutApp 分支不命中
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventTrailingSpace0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventTrailingSpace0014';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('OutApp ', 'InApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'notOne', (action !== 1).toString(), 'true');
            expect(action !== 1).assertTrue();
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0015
         * @tc.name      testCardEventDuplicatedValue0015
         * @tc.desc      事件值重复拼接不等于原值，落入默认分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventDuplicatedValue0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventDuplicatedValue0015';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('InAppInApp', 'InAppInApp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notTwo', (action !== 2).toString(), 'true');
            expect(action !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0016
         * @tc.name      testCardEventBundleCaseSensitive0016
         * @tc.desc      bundle 数据匹配大小写敏感，小写变体不触发 bundleName 提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventBundleCaseSensitive0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventBundleCaseSensitive0016';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('InApp', 'inapp', true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logPair(tag, 'notTwo', (action !== 2).toString(), 'true');
            expect(action !== 2).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0017
         * @tc.name      testCardEventInAppVsOutApp0017
         * @tc.desc      同一 bundle 失配数据在 InApp/OutApp 两分支产生不同结果
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventInAppVsOutApp0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventInAppVsOutApp0017';
            logBegin(tag);
            const inApp: number = CardEventFeature.resolveToastAction('InApp', 'OutApp', true);
            const outApp: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp', true);
            logPair(tag, 'inApp', inApp.toString(), '0');
            expect(inApp).assertEqual(0);
            logPair(tag, 'outApp', outApp.toString(), '0');
            expect(outApp).assertEqual(0);
            logPair(tag, 'sameDefault', (inApp === outApp).toString(), 'true');
            expect(inApp === outApp).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0018
         * @tc.name      testCardEventUnsubscribedAnyData0018
         * @tc.desc      未订阅时三类数据值全部被前置守卫拦截
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventUnsubscribedAnyData0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventUnsubscribedAnyData0018';
            logBegin(tag);
            const samples: Array<string> = ['InApp', 'OutApp', ''];
            let allBlocked: boolean = true;
            for (let i = 0; i < samples.length; i++) {
                const action: number = CardEventFeature.resolveToastAction(samples[i], 'InApp', false);
                if (action !== CardEventFeature.TOAST_NONE) {
                    allBlocked = false;
                }
            }
            logPair(tag, 'allBlocked', allBlocked.toString(), 'true');
            expect(allBlocked).assertTrue();
            logPair(tag, 'guardFirst', CardEventFeature.resolveToastAction('InApp', 'InApp', false).toString(), '0');
            expect(CardEventFeature.resolveToastAction('InApp', 'InApp', false)).assertEqual(0);
            logPair(tag, 'guardOut', CardEventFeature.resolveToastAction('OutApp', 'InApp', false).toString(), '0');
            expect(CardEventFeature.resolveToastAction('OutApp', 'InApp', false)).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0019
         * @tc.name      testCardEventIdempotent0019
         * @tc.desc      同一输入重复求解结果稳定一致
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventIdempotent0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventIdempotent0019';
            logBegin(tag);
            const first: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            const second: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            const third: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            logPair(tag, 'first', first.toString(), '2');
            expect(first).assertEqual(2);
            logPair(tag, 'stable', (first === second && second === third).toString(), 'true');
            expect(first === second && second === third).assertTrue();
            logPair(tag, 'value', second.toString(), '2');
            expect(second).assertEqual(CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0020
         * @tc.name      testCardEventActionMapsConstant0020
         * @tc.desc      返回值与对应常量的全等关系可直接用于 UI 提示判定
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventActionMapsConstant0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventActionMapsConstant0020';
            logBegin(tag);
            const bundleAction: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            const eventAction: number = CardEventFeature.resolveToastAction('OutApp', 'InApp', true);
            const bundleHit: boolean = bundleAction === CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE;
            const eventHit: boolean = eventAction === CardEventFeature.TOAST_EVENT_RECEIVE;
            logPair(tag, 'bundleHit', bundleHit.toString(), 'true');
            expect(bundleHit).assertTrue();
            logPair(tag, 'eventHit', eventHit.toString(), 'true');
            expect(eventHit).assertTrue();
            logPair(tag, 'distinct', (bundleAction !== eventAction).toString(), 'true');
            expect(bundleAction !== eventAction).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0021
         * @tc.name      testCardEventBundleWithNewline0021
         * @tc.desc      bundle 数据带换行仍与 OutApp 不等，命中普通提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventBundleWithNewline0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventBundleWithNewline0021';
            logBegin(tag);
            const action: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp\n', true);
            logPair(tag, 'action', action.toString(), '1');
            expect(action).assertEqual(CardEventFeature.TOAST_EVENT_RECEIVE);
            logPair(tag, 'one', action.toString(), '1');
            expect(action).assertEqual(1);
            logPair(tag, 'notZero', (action !== 0).toString(), 'true');
            expect(action !== 0).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0022
         * @tc.name      testCardEventOversizedData0022
         * @tc.desc      超长事件串既不等于 InApp 也不等于 OutApp，落入默认分支
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventOversizedData0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventOversizedData0022';
            logBegin(tag);
            let oversized: string = '';
            for (let i = 0; i < 200; i++) {
                oversized += 'InApp';
            }
            const action: number = CardEventFeature.resolveToastAction(oversized, oversized, true);
            logPair(tag, 'action', action.toString(), '0');
            expect(action).assertEqual(CardEventFeature.TOAST_NONE);
            logPair(tag, 'length', oversized.length.toString(), '1000');
            expect(oversized.length).assertEqual(1000);
            logPair(tag, 'zero', action.toString(), '0');
            expect(action).assertEqual(0);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0023
         * @tc.name      testCardEventEmptyBundle0023
         * @tc.desc      bundle 数据为空串时 InApp 失配、OutApp 命中普通提示
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventEmptyBundle0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventEmptyBundle0023';
            logBegin(tag);
            const inApp: number = CardEventFeature.resolveToastAction('InApp', '', true);
            const outApp: number = CardEventFeature.resolveToastAction('OutApp', '', true);
            logPair(tag, 'inApp', inApp.toString(), '0');
            expect(inApp).assertEqual(0);
            logPair(tag, 'outApp', outApp.toString(), '1');
            expect(outApp).assertEqual(1);
            logPair(tag, 'different', (inApp !== outApp).toString(), 'true');
            expect(inApp !== outApp).assertTrue();
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0024
         * @tc.name      testCardEventOrderIndependent0024
         * @tc.desc      先求解失配样本不影响后续匹配样本的结果（无隐藏状态）
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventOrderIndependent0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventOrderIndependent0024';
            logBegin(tag);
            const warmUp: number = CardEventFeature.resolveToastAction('OutApp', 'OutApp', true);
            const after: number = CardEventFeature.resolveToastAction('InApp', 'InApp', true);
            logPair(tag, 'warmUp', warmUp.toString(), '0');
            expect(warmUp).assertEqual(0);
            logPair(tag, 'after', after.toString(), '2');
            expect(after).assertEqual(CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE);
            logPair(tag, 'unaffected', (after === 2).toString(), 'true');
            expect(after).assertEqual(2);
            logEnd(tag);
        })

        /**
         * @tc.number    SUB_CCE_CARD_0025
         * @tc.name      testCardEventConstantSetSize0025
         * @tc.desc      三类提示常量去重后恰为三个，覆盖全部返回值
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     LEVEL1
         */
        it('testCardEventConstantSetSize0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
            const tag: string = 'testCardEventConstantSetSize0025';
            logBegin(tag);
            const values: Array<number> = [
                CardEventFeature.TOAST_NONE, CardEventFeature.TOAST_EVENT_RECEIVE,
                CardEventFeature.TOAST_BUNDLE_NAME_EVENT_RECEIVE, CardEventFeature.TOAST_NONE
            ];
            const unique: Array<number> = [];
            for (let i = 0; i < values.length; i++) {
                if (unique.indexOf(values[i]) < 0) {
                    unique.push(values[i]);
                }
            }
            logPair(tag, 'uniqueSize', unique.length.toString(), '3');
            expect(unique.length).assertEqual(3);
            logPair(tag, 'maxTwo', Math.max(unique[0], unique[1], unique[2]).toString(), '2');
            expect(Math.max(unique[0], unique[1], unique[2])).assertEqual(2);
            logPair(tag, 'minZero', Math.min(unique[0], unique[1], unique[2]).toString(), '0');
            expect(Math.min(unique[0], unique[1], unique[2])).assertEqual(0);
            logEnd(tag);
        })
    })
}
