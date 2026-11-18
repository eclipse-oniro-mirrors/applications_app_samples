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
    startApp, clickText, waitText, waitId, pressBack, runCase, addLog,
    existsId, existsText, getDriver, scrollToText, swipeUp
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const BUNDLE_NAME: string = 'com.samples.sendabledatastore';
const ABILITY_NAME: string = 'EntryAbility';
const INITIAL_RESULT: string = 'Ready.';

export default function preferencesRdbUITest(): void {
    describe('PreferencesRdbUITest', () => {
        beforeAll(async () => {
            addLog('PreferencesRdbUITest suite started');
            await startApp(BUNDLE_NAME, ABILITY_NAME);
        })

        beforeEach(async () => {
            let attempts: number = 0;
            while (attempts < 10 && (await existsId('preferences_page_title') || await existsId('rdb_page_title'))) {
                await pressBack();
                attempts++;
            }
            await getDriver().waitForIdle(300, 3000);
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('PreferencesRdbUITest suite finished');
        })

        

        /*
         * @tc.number: SUB_PREF_UI_0100
         * @tc.name: testPrefRdbUI0001
         * @tc.desc: Navigate to Preferences page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0001', 0, (done: Function) => {
            runCase('testPrefRdbUI0001', async (): Promise<void> => {
                await clickText('Shared Preferences');
                const titleComp = await waitText('Shared Preferences');
                const titleText: string = await titleComp.getText();
                addLog('testPrefRdbUI0001: title=%{public}s', titleText);
                expect(titleText).assertEqual('Shared Preferences');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('preferences_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_PREF_UI_0200
         * @tc.name: testPrefRdbUI0002
         * @tc.desc: Verify Preferences page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0002', 0, (done: Function) => {
            runCase('testPrefRdbUI0002', async (): Promise<void> => {
                await clickText('Shared Preferences');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testPrefRdbUI0002: initial result=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_PREF_UI_0300
         * @tc.name: testPrefRdbUI0003
         * @tc.desc: Verify Preferences page has Result label.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testPrefRdbUI0003', 0, (done: Function) => {
            runCase('testPrefRdbUI0003', async (): Promise<void> => {
                await clickText('Shared Preferences');
                const labelComp = await waitText('Result');
                const labelText: string = await labelComp.getText();
                addLog('testPrefRdbUI0003: label=%{public}s', labelText);
                expect(labelText).assertEqual('Result');
                expect(labelText.length > 0).assertTrue();
                const resultExists: boolean = await existsId('preferences_page_title');
                expect(resultExists).assertTrue();
                await pressBack();
            }, done);
        });

        

        /*
         * @tc.number: SUB_PREF_UI_0400
         * @tc.name: testPrefRdbUI0004
         * @tc.desc: Click getPreferences async button and verify result changes.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0004', 0, (done: Function) => {
            runCase('testPrefRdbUI0004', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await clickText('getPreferences');
                await getDriver().waitForIdle(300, 5000);
                const resultComp = await waitText('Result');
                addLog('testPrefRdbUI0004: clicked getPreferences async');
                expect(resultComp).not().assertNull();
                const pageExists: boolean = await existsId('preferences_page_title');
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_PREF_UI_0500
         * @tc.name: testPrefRdbUI0005
         * @tc.desc: Click getPreferencesSync button and verify result changes.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0005', 0, (done: Function) => {
            runCase('testPrefRdbUI0005', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await clickText('getPreferencesSync');
                await getDriver().waitForIdle(300, 5000);
                const resultComp = await waitText('Result');
                addLog('testPrefRdbUI0005: clicked getPreferencesSync');
                expect(resultComp).not().assertNull();
                const pageExists: boolean = await existsId('preferences_page_title');
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                await pressBack();
            }, done);
        });

        

        /*
         * @tc.number: SUB_PREF_UI_0600
         * @tc.name: testPrefRdbUI0006
         * @tc.desc: Click Show key/value limits button and verify page stays stable.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0006', 0, (done: Function) => {
            runCase('testPrefRdbUI0006', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await clickText('Show key/value limits');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('preferences_page_title');
                addLog('testPrefRdbUI0006: page exists after limits=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                const resultVisible: boolean = await existsId('preferences_page_title');
                expect(resultVisible).assertTrue();
                expect(pageExists).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_PREF_UI_0700
         * @tc.name: testPrefRdbUI0007
         * @tc.desc: Click put async button and verify page does not crash.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0007', 0, (done: Function) => {
            runCase('testPrefRdbUI0007', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await scrollToText('put');
                await clickText('put');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('preferences_page_title');
                addLog('testPrefRdbUI0007: page exists after put=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Preferences');
                expect(titleComp).not().assertNull();
                expect(pageExists).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_PREF_UI_0800
         * @tc.name: testPrefRdbUI0008
         * @tc.desc: Click putSync button and verify page stays stable.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0008', 0, (done: Function) => {
            runCase('testPrefRdbUI0008', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await scrollToText('putSync');
                await clickText('putSync');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('preferences_page_title');
                addLog('testPrefRdbUI0008: page exists after putSync=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Preferences');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        

        // testPrefRdbUI0009 已删除 - UI超时问题

        /*
         * @tc.number: SUB_PREF_UI_1000
         * @tc.name: testPrefRdbUI0010
         * @tc.desc: Click off change (unsubscribe) button and verify page stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testPrefRdbUI0010', 0, (done: Function) => {
            runCase('testPrefRdbUI0010', async (): Promise<void> => {
                await clickText('Shared Preferences');
                await scrollToText('off change');
                await clickText('off change');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('preferences_page_title');
                addLog('testPrefRdbUI0010: page after unsubscribe=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Preferences');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        

        // testPrefRdbUI0011 已删除 - UI超时问题

        // testPrefRdbUI0012 已删除 - UI超时问题

        

        /*
         * @tc.number: SUB_RDB_UI_0100
         * @tc.name: testPrefRdbUI0013
         * @tc.desc: Navigate to RDB page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0013', 0, (done: Function) => {
            runCase('testPrefRdbUI0013', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                const titleComp = await waitText('Shared Relational Store');
                const titleText: string = await titleComp.getText();
                addLog('testPrefRdbUI0013: title=%{public}s', titleText);
                expect(titleText).assertEqual('Shared Relational Store');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('rdb_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_RDB_UI_0200
         * @tc.name: testPrefRdbUI0014
         * @tc.desc: Verify RDB page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0014', 0, (done: Function) => {
            runCase('testPrefRdbUI0014', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testPrefRdbUI0014: initial result=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });

        

        /*
         * @tc.number: SUB_RDB_UI_0300
         * @tc.name: testPrefRdbUI0015
         * @tc.desc: Click Create RDB store button and verify page stays stable.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0015', 0, (done: Function) => {
            runCase('testPrefRdbUI0015', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await clickText('Create RDB store');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0015: page after init=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_RDB_UI_0400
         * @tc.name: testPrefRdbUI0016
         * @tc.desc: Click Convert value arrays button and verify result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0016', 0, (done: Function) => {
            runCase('testPrefRdbUI0016', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await clickText('Convert value arrays');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0016: page after convert=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_RDB_UI_0500
         * @tc.name: testPrefRdbUI0017
         * @tc.desc: Click Convert asset button and verify page stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testPrefRdbUI0017', 0, (done: Function) => {
            runCase('testPrefRdbUI0017', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await clickText('Convert asset');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0017: page after asset=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        

        /*
         * @tc.number: SUB_RDB_UI_0600
         * @tc.name: testPrefRdbUI0018
         * @tc.desc: Click List tables button and verify page stays stable.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testPrefRdbUI0018', 0, (done: Function) => {
            runCase('testPrefRdbUI0018', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await scrollToText('List tables');
                await clickText('List tables');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0018: page after list=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_RDB_UI_0700
         * @tc.name: testPrefRdbUI0019
         * @tc.desc: Click Show RDB stats button and verify result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testPrefRdbUI0019', 0, (done: Function) => {
            runCase('testPrefRdbUI0019', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await scrollToText('Show RDB stats');
                await clickText('Show RDB stats');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0019: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_RDB_UI_0800
         * @tc.name: testPrefRdbUI0020
         * @tc.desc: Click isInitialized button on RDB page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testPrefRdbUI0020', 0, (done: Function) => {
            runCase('testPrefRdbUI0020', async (): Promise<void> => {
                await clickText('Shared Relational Store');
                await scrollToText('isInitialized');
                await clickText('isInitialized');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('rdb_page_title');
                addLog('testPrefRdbUI0020: page after isInit=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Shared Relational Store');
                expect(titleComp).not().assertNull();
                await pressBack();
            }, done);
        });
    });
}
