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
    clickText, waitText, pressBack, runCase, addLog,
    existsId, getDriver, scrollToText, startApp
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const BUNDLE_NAME: string = 'com.samples.sendabledatastore';
const ABILITY_NAME: string = 'EntryAbility';
const INITIAL_RESULT: string = 'Ready.';

export default function advancedPagesUITest(): void {
    describe('AdvancedPagesUITest', () => {
        beforeAll(async () => {
            addLog('AdvancedPagesUITest suite started');
            await startApp(BUNDLE_NAME, ABILITY_NAME);
        })

        beforeEach(async () => {
            let attempts: number = 0;
            while (attempts < 10 && (await existsId('migration_page_title') || await existsId('backup_page_title') ||
                await existsId('encryption_page_title') || await existsId('distributed_page_title'))) {
                await pressBack();
                attempts++;
            }
            await getDriver().waitForIdle(300, 3000);
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('AdvancedPagesUITest suite finished');
        })



        /*
         * @tc.number: SUB_ADV_UI_0100
         * @tc.name: testAdvancedUI0001
         * @tc.desc: Navigate to Migration page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0001', 0, (done: Function) => {
            runCase('testAdvancedUI0001', async (): Promise<void> => {
                await clickText('Data Migration');
                const titleComp = await waitText('Data Migration Manager');
                const titleText: string = await titleComp.getText();
                addLog('testAdvancedUI0001: title=%{public}s', titleText);
                expect(titleText).assertEqual('Data Migration Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('migration_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_0200
         * @tc.name: testAdvancedUI0002
         * @tc.desc: Verify Migration page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0002', 0, (done: Function) => {
            runCase('testAdvancedUI0002', async (): Promise<void> => {
                await clickText('Data Migration');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testAdvancedUI0002: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_0300
         * @tc.name: testAdvancedUI0003
         * @tc.desc: Click Initialize at v1 on Migration page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0003', 0, (done: Function) => {
            runCase('testAdvancedUI0003', async (): Promise<void> => {
                await clickText('Data Migration');
                await clickText('Initialize at v1');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('migration_page_title');
                addLog('testAdvancedUI0003: page after init=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Migration Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('migration_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_0400
         * @tc.name: testAdvancedUI0004
         * @tc.desc: Click Current version on Migration page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0004', 0, (done: Function) => {
            runCase('testAdvancedUI0004', async (): Promise<void> => {
                await clickText('Data Migration');
                await clickText('Initialize at v1');
                await getDriver().waitForIdle(200, 3000);
                await clickText('Current version');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('migration_page_title');
                addLog('testAdvancedUI0004: page after version=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Migration Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('migration_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_0500
         * @tc.name: testAdvancedUI0005
         * @tc.desc: Click Statistics on Migration page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testAdvancedUI0005', 0, (done: Function) => {
            runCase('testAdvancedUI0005', async (): Promise<void> => {
                await clickText('Data Migration');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('migration_page_title');
                addLog('testAdvancedUI0005: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Migration Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('migration_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_0600
         * @tc.name: testAdvancedUI0006
         * @tc.desc: Navigate to Backup page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0006', 0, (done: Function) => {
            runCase('testAdvancedUI0006', async (): Promise<void> => {
                await clickText('Data Backup');
                const titleComp = await waitText('Data Backup Manager');
                const titleText: string = await titleComp.getText();
                addLog('testAdvancedUI0006: title=%{public}s', titleText);
                expect(titleText).assertEqual('Data Backup Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('backup_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_0700
         * @tc.name: testAdvancedUI0007
         * @tc.desc: Verify Backup page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0007', 0, (done: Function) => {
            runCase('testAdvancedUI0007', async (): Promise<void> => {
                await clickText('Data Backup');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testAdvancedUI0007: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_0800
         * @tc.name: testAdvancedUI0008
         * @tc.desc: Click Initialize on Backup page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0008', 0, (done: Function) => {
            runCase('testAdvancedUI0008', async (): Promise<void> => {
                await clickText('Data Backup');
                const initButtons = await waitText('Initialize');
                addLog('testAdvancedUI0008: found Initialize button');
                expect(initButtons).not().assertNull();
                await clickText('Initialize');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('backup_page_title');
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Backup Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('backup_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_0900
         * @tc.name: testAdvancedUI0009
         * @tc.desc: Click List backups on Backup page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testAdvancedUI0009', 0, (done: Function) => {
            runCase('testAdvancedUI0009', async (): Promise<void> => {
                await clickText('Data Backup');
                await scrollToText('List backups');
                await clickText('List backups');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('backup_page_title');
                addLog('testAdvancedUI0009: page after list=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Backup Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('backup_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1000
         * @tc.name: testAdvancedUI0010
         * @tc.desc: Click Statistics on Backup page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testAdvancedUI0010', 0, (done: Function) => {
            runCase('testAdvancedUI0010', async (): Promise<void> => {
                await clickText('Data Backup');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('backup_page_title');
                addLog('testAdvancedUI0010: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Backup Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('backup_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_1100
         * @tc.name: testAdvancedUI0011
         * @tc.desc: Navigate to Encryption page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0011', 0, (done: Function) => {
            runCase('testAdvancedUI0011', async (): Promise<void> => {
                await clickText('Data Encryption');
                const titleComp = await waitText('Data Encryption Manager');
                const titleText: string = await titleComp.getText();
                addLog('testAdvancedUI0011: title=%{public}s', titleText);
                expect(titleText).assertEqual('Data Encryption Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('encryption_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1200
         * @tc.name: testAdvancedUI0012
         * @tc.desc: Verify Encryption page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0012', 0, (done: Function) => {
            runCase('testAdvancedUI0012', async (): Promise<void> => {
                await clickText('Data Encryption');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testAdvancedUI0012: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_1300
         * @tc.name: testAdvancedUI0013
         * @tc.desc: Click Init AES-256 on Encryption page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0013', 0, (done: Function) => {
            runCase('testAdvancedUI0013', async (): Promise<void> => {
                await clickText('Data Encryption');
                await clickText('Init AES-256');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('encryption_page_title');
                addLog('testAdvancedUI0013: page after init=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Encryption Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('encryption_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1400
         * @tc.name: testAdvancedUI0014
         * @tc.desc: Click Generate key on Encryption page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0014', 0, (done: Function) => {
            runCase('testAdvancedUI0014', async (): Promise<void> => {
                await clickText('Data Encryption');
                await clickText('Init AES-256');
                await getDriver().waitForIdle(200, 3000);
                await clickText('Generate key');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('encryption_page_title');
                addLog('testAdvancedUI0014: page after genkey=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Encryption Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('encryption_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1500
         * @tc.name: testAdvancedUI0015
         * @tc.desc: Click Config on Encryption page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testAdvancedUI0015', 0, (done: Function) => {
            runCase('testAdvancedUI0015', async (): Promise<void> => {
                await clickText('Data Encryption');
                await scrollToText('Config');
                await clickText('Config');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('encryption_page_title');
                addLog('testAdvancedUI0015: page after config=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Data Encryption Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('encryption_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_1600
         * @tc.name: testAdvancedUI0016
         * @tc.desc: Navigate to Distributed page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0016', 0, (done: Function) => {
            runCase('testAdvancedUI0016', async (): Promise<void> => {
                await clickText('Distributed Data');
                const titleComp = await waitText('Distributed Data Manager');
                const titleText: string = await titleComp.getText();
                addLog('testAdvancedUI0016: title=%{public}s', titleText);
                expect(titleText).assertEqual('Distributed Data Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('distributed_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1700
         * @tc.name: testAdvancedUI0017
         * @tc.desc: Verify Distributed page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0017', 0, (done: Function) => {
            runCase('testAdvancedUI0017', async (): Promise<void> => {
                await clickText('Distributed Data');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testAdvancedUI0017: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_ADV_UI_1800
         * @tc.name: testAdvancedUI0018
         * @tc.desc: Click Initialize on Distributed page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0018', 0, (done: Function) => {
            runCase('testAdvancedUI0018', async (): Promise<void> => {
                await clickText('Distributed Data');
                const initComp = await waitText('Initialize');
                addLog('testAdvancedUI0018: found Initialize button');
                expect(initComp).not().assertNull();
                await clickText('Initialize');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('distributed_page_title');
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Distributed Data Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('distributed_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_1900
         * @tc.name: testAdvancedUI0019
         * @tc.desc: Click Put on Distributed page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testAdvancedUI0019', 0, (done: Function) => {
            runCase('testAdvancedUI0019', async (): Promise<void> => {
                await clickText('Distributed Data');
                await clickText('Initialize');
                await getDriver().waitForIdle(200, 3000);
                await clickText('Put');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('distributed_page_title');
                addLog('testAdvancedUI0019: page after put=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Distributed Data Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('distributed_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_ADV_UI_2000
         * @tc.name: testAdvancedUI0020
         * @tc.desc: Click Statistics on Distributed page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testAdvancedUI0020', 0, (done: Function) => {
            runCase('testAdvancedUI0020', async (): Promise<void> => {
                await clickText('Distributed Data');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('distributed_page_title');
                addLog('testAdvancedUI0020: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Distributed Data Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('distributed_page_title')).assertTrue();
                await pressBack();
            }, done);
        });
    });
}
