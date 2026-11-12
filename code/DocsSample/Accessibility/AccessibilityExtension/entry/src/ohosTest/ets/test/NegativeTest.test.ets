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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import {
    startApp, existsId, existsText, waitId,
    runCase, addLog
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function negativeTest(): void {
    describe('NegativeTest', () => {
        beforeAll(() => {
            addLog('NegativeTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('NegativeTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0100
         * @tc.name      testNegative0001
         * @tc.desc      Verify non-existent component ID returns false via existsId.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0001', 0, (done: Function) => {
            runCase('testNegative0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：不存在的组件 ID 返回 false
                let notExists: boolean = await existsId('nonExistentComponent');
                addLog('testNegative0001: nonExistentComponent exists=%{public}s', String(notExists));
                expect(notExists).assertFalse();

                // 断言2：另一个不存在的 ID 也返回 false
                let notExists2: boolean = await existsId('fake-button-id');
                expect(notExists2).assertFalse();

                // 断言3：真实 ID 仍可定位（对比验证）
                let realExists: boolean = await existsId('clickButton');
                expect(realExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0200
         * @tc.name      testNegative0002
         * @tc.desc      Verify non-existent text returns false via existsText.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0002', 0, (done: Function) => {
            runCase('testNegative0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：不存在的文本返回 false
                let notExists: boolean = await existsText('This Text Does Not Exist');
                addLog('testNegative0002: fake text exists=%{public}s', String(notExists));
                expect(notExists).assertFalse();

                // 断言2：另一个不存在的文本也返回 false
                let notExists2: boolean = await existsText('Fake Button Label');
                expect(notExists2).assertFalse();

                // 断言3：真实文本仍可定位（对比验证）
                let realExists: boolean = await existsText('Click Me');
                expect(realExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0300
         * @tc.name      testNegative0003
         * @tc.desc      Verify a non-existent ID cannot be located and waitId throws.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0003', 0, (done: Function) => {
            runCase('testNegative0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：不存在的 ID 不可定位
                let missingIdExists: boolean = await existsId('missingComponentId');
                addLog('testNegative0003: missing ID exists=%{public}s', String(missingIdExists));
                expect(missingIdExists).assertFalse();

                // 断言2：waitId 对不存在的 ID 抛出异常
                let threwError: boolean = false;
                try {
                    await waitId('missingComponentId', 1000);
                } catch (e) {
                    threwError = true;
                }
                expect(threwError).assertTrue();

                // 断言3：页面标题仍存在，证明页面未受影响
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0400
         * @tc.name      testNegative0004
         * @tc.desc      Verify case-mismatched text cannot be located.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0004', 0, (done: Function) => {
            runCase('testNegative0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：大小写不匹配文本不可定位
                let caseMismatch: boolean = await existsText('click me');
                addLog('testNegative0004: "click me" exists=%{public}s', String(caseMismatch));
                expect(caseMismatch).assertFalse();

                // 断言2：全大写也不匹配
                let allCaps: boolean = await existsText('CLICK ME');
                expect(allCaps).assertFalse();

                // 断言3：正确大小写可定位（对比验证）
                let correctCase: boolean = await existsText('Click Me');
                expect(correctCase).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0500
         * @tc.name      testNegative0005
         * @tc.desc      Verify partial text match cannot be located via existsText.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0005', 0, (done: Function) => {
            runCase('testNegative0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：部分文本不可定位
                let partialExists: boolean = await existsText('Click');
                addLog('testNegative0005: partial "Click" exists=%{public}s', String(partialExists));
                expect(partialExists).assertFalse();

                // 断言2：带空格的子串也不可定位
                let subStrExists: boolean = await existsText('Accessibility');
                expect(subStrExists).assertFalse();

                // 断言3：完整文本可定位（对比验证）
                let fullTextExists: boolean = await existsText('Accessibility Sample');
                expect(fullTextExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0600
         * @tc.name      testNegative0006
         * @tc.desc      Verify out-of-range list item IDs cannot be located.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0006', 0, (done: Function) => {
            runCase('testNegative0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：超出范围的列表项 ID 不可定位
                let item5Exists: boolean = await existsId('listItem_5');
                addLog('testNegative0006: listItem_5 exists=%{public}s', String(item5Exists));
                expect(item5Exists).assertFalse();

                // 断言2：负数索引 ID 不可定位
                let itemNegExists: boolean = await existsId('listItem_-1');
                expect(itemNegExists).assertFalse();

                // 断言3：有效范围内的列表项 ID 可定位（对比验证）
                let item0Exists: boolean = await existsId('listItem_0');
                expect(item0Exists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_NEG_0700
         * @tc.name      testNegative0007
         * @tc.desc      Verify special character ID cannot be located.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 3
         */
        it('testNegative0007', 0, (done: Function) => {
            runCase('testNegative0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 断言1：特殊字符 ID 不可定位
                let specialIdExists: boolean = await existsId('!@#$%');
                addLog('testNegative0007: special ID exists=%{public}s', String(specialIdExists));
                expect(specialIdExists).assertFalse();

                // 断言2：中文 ID 不可定位
                let chineseIdExists: boolean = await existsId('按钮');
                expect(chineseIdExists).assertFalse();

                // 断言3：真实英文 ID 仍可定位（对比验证）
                let realIdExists: boolean = await existsId('clickButton');
                expect(realIdExists).assertTrue();
            }, done);
        });
    });
}
