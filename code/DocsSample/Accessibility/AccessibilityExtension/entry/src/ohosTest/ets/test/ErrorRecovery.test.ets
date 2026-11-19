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
    startApp, clickId, waitId, existsId, existsText, textOfId, counterValue,
    runCase, addLog
} from '../testkit/SharedDriver';
import { localizeText } from '../testkit/LocaleText';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const BUNDLE_NAME: string = 'com.samples.accessibilityextension';
const ABILITY_NAME: string = 'EntryAbility';

export default function errorRecoveryTest(): void {
    describe('ErrorRecoveryTest', () => {
        beforeAll(() => {
            addLog('ErrorRecoveryTest suite started');
        })

        beforeEach(() => {
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('ErrorRecoveryTest suite finished');
        })

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0100
         * @tc.name      testErrorRecovery0001
         * @tc.desc      Verify page recovers after empty string input.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0001', 0, (done: Function) => {
            runCase('testErrorRecovery0001', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0200
         * @tc.name      testErrorRecovery0002
         * @tc.desc      Verify page recovers after special character input.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0002', 0, (done: Function) => {
            runCase('testErrorRecovery0002', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('!@#');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：Text Input 标题仍存在
                let sectionExists: boolean = await existsText('Text Input');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0300
         * @tc.name      testErrorRecovery0003
         * @tc.desc      Verify page recovers after repeated empty inputs.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0003', 0, (done: Function) => {
            runCase('testErrorRecovery0003', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);
                let inputComp = await waitId('textInput');
                await inputComp.inputText('');
                await inputComp.inputText('');
                await inputComp.inputText('');

                // 断言1：输入框仍存在
                let inputExists: boolean = await existsId('textInput');
                expect(inputExists).assertTrue();

                // 断言2：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0400
         * @tc.name      testErrorRecovery0004
         * @tc.desc      Verify page unaffected after searching for non-existent ID.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0004', 0, (done: Function) => {
            runCase('testErrorRecovery0004', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 查找不存在的组件
                let fakeExists: boolean = await existsId('fakeComponent');

                // 断言1：不存在的组件返回 false
                expect(fakeExists).assertFalse();

                // 断言2：clickButton 仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0500
         * @tc.name      testErrorRecovery0005
         * @tc.desc      Verify page unaffected after searching for non-existent text.
         * @tc.size      SmallTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0005', 0, (done: Function) => {
            runCase('testErrorRecovery0005', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 查找不存在的文本
                let fakeExists: boolean = await existsText('fakeText');

                // 断言1：不存在的文本返回 false
                expect(fakeExists).assertFalse();

                // 断言2：Click Me 仍存在
                let clickMe: boolean = await existsText('Click Me');
                expect(clickMe).assertTrue();

                // 断言3：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0600
         * @tc.name      testErrorRecovery0006
         * @tc.desc      Verify all IDs locatable after error sequence.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0006', 0, (done: Function) => {
            runCase('testErrorRecovery0006', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 异常序列：查找不存在 + 空输入 + 特殊字符
                await existsId('fakeId');
                await existsText('fakeText');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('');
                await inputComp.inputText('!@#');

                // 断言1：clickButton 存在
                let btn: boolean = await existsId('clickButton');
                expect(btn).assertTrue();

                // 断言2：textInput 存在
                let input: boolean = await existsId('textInput');
                expect(input).assertTrue();

                // 断言3：counterText 存在
                let counter: boolean = await existsId('counterText');
                expect(counter).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0700
         * @tc.name      testErrorRecovery0007
         * @tc.desc      Verify counter still readable after error sequence.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0007', 0, (done: Function) => {
            runCase('testErrorRecovery0007', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 异常序列
                await existsId('fakeId');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('');
                await inputComp.inputText('!@#');

                // 断言1：计数器文本可读取
                let counterText: string = await textOfId('counterText');
                addLog('testErrorRecovery0007: counter=%{public}s', counterText);
                expect(counterText.includes(localizeText('Counter'))).assertTrue();

                // 断言2：Basic Interaction 标题存在
                let sectionExists: boolean = await existsText('Basic Interaction');
                expect(sectionExists).assertTrue();

                // 断言3：页面标题存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });

        /**
         * @tc.number    SUB_A11Y_EXT_ERRR_0800
         * @tc.name      testErrorRecovery0008
         * @tc.desc      Verify normal interaction resumes after error sequence.
         * @tc.size      MediumTest
         * @tc.type      Function
         * @tc.level     Level 2
         */
        it('testErrorRecovery0008', 0, (done: Function) => {
            runCase('testErrorRecovery0008', async (): Promise<void> => {
                await startApp(BUNDLE_NAME, ABILITY_NAME);

                // 异常序列
                await existsId('fakeId');
                let inputComp = await waitId('textInput');
                await inputComp.inputText('');
                await inputComp.inputText('!@#');

                // 恢复正常交互：点击按钮
                let counterBefore: number = await counterValue();
                await clickId('clickButton');

                // 断言1：点击后计数器 +1（应用未重建时沿用当前值，不做绝对断言）
                let counterAfter: number = await counterValue();
                addLog('testErrorRecovery0008: before=%{public}d after=%{public}d', counterBefore, counterAfter);
                expect(counterAfter).assertEqual(counterBefore + 1);

                // 断言2：按钮仍存在
                let btnExists: boolean = await existsId('clickButton');
                expect(btnExists).assertTrue();

                // 断言3：页面标题仍存在
                let titleExists: boolean = await existsText('Accessibility Sample');
                expect(titleExists).assertTrue();
            }, done);
        });
    });
}
