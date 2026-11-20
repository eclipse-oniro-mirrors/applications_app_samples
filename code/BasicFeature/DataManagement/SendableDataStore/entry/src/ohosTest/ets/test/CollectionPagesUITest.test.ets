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

export default function collectionPagesUITest(): void {
    describe('CollectionPagesUITest', () => {
        beforeAll(async () => {
            addLog('CollectionPagesUITest suite started');
            await startApp(BUNDLE_NAME, ABILITY_NAME);
        })

        beforeEach(async () => {
            let attempts: number = 0;
            while (attempts < 10 && (await existsId('array_page_title') || await existsId('map_page_title') ||
                await existsId('queue_page_title') || await existsId('record_page_title'))) {
                await pressBack();
                attempts++;
            }
            await getDriver().waitForIdle(300, 3000);
        })

        afterEach(() => {
        })

        afterAll(() => {
            addLog('CollectionPagesUITest suite finished');
        })



        /*
         * @tc.number: SUB_COLL_UI_0100
         * @tc.name: testCollectionUI0001
         * @tc.desc: Navigate to Array page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0001', 0, (done: Function) => {
            runCase('testCollectionUI0001', async (): Promise<void> => {
                await clickText('Sendable Array');
                const titleComp = await waitText('Sendable Array Manager');
                const titleText: string = await titleComp.getText();
                addLog('testCollectionUI0001: title=%{public}s', titleText);
                expect(titleText).assertEqual('Sendable Array Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('array_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_0200
         * @tc.name: testCollectionUI0002
         * @tc.desc: Verify Array page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0002', 0, (done: Function) => {
            runCase('testCollectionUI0002', async (): Promise<void> => {
                await clickText('Sendable Array');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testCollectionUI0002: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_0300
         * @tc.name: testCollectionUI0003
         * @tc.desc: Click Create Number[10] on Array page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0003', 0, (done: Function) => {
            runCase('testCollectionUI0003', async (): Promise<void> => {
                await clickText('Sendable Array');
                await clickText('Create Number[10]');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('array_page_title');
                addLog('testCollectionUI0003: page after create=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Array Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('array_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_0400
         * @tc.name: testCollectionUI0004
         * @tc.desc: Click Statistics on Array page and verify result.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0004', 0, (done: Function) => {
            runCase('testCollectionUI0004', async (): Promise<void> => {
                await clickText('Sendable Array');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('array_page_title');
                addLog('testCollectionUI0004: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Array Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('array_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_0500
         * @tc.name: testCollectionUI0005
         * @tc.desc: Click To JSON on Array page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0005', 0, (done: Function) => {
            runCase('testCollectionUI0005', async (): Promise<void> => {
                await clickText('Sendable Array');
                await scrollToText('To JSON');
                await clickText('To JSON');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('array_page_title');
                addLog('testCollectionUI0005: page after json=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Array Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('array_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_0600
         * @tc.name: testCollectionUI0006
         * @tc.desc: Navigate to Map page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0006', 0, (done: Function) => {
            runCase('testCollectionUI0006', async (): Promise<void> => {
                await clickText('Sendable Map');
                const titleComp = await waitText('Sendable Map Manager');
                const titleText: string = await titleComp.getText();
                addLog('testCollectionUI0006: title=%{public}s', titleText);
                expect(titleText).assertEqual('Sendable Map Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('map_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_0700
         * @tc.name: testCollectionUI0007
         * @tc.desc: Verify Map page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0007', 0, (done: Function) => {
            runCase('testCollectionUI0007', async (): Promise<void> => {
                await clickText('Sendable Map');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testCollectionUI0007: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_0800
         * @tc.name: testCollectionUI0008
         * @tc.desc: Click Initialize map(64) and verify page stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0008', 0, (done: Function) => {
            runCase('testCollectionUI0008', async (): Promise<void> => {
                await clickText('Sendable Map');
                await clickText('Initialize map(64)');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('map_page_title');
                addLog('testCollectionUI0008: page after init=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Map Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('map_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_0900
         * @tc.name: testCollectionUI0009
         * @tc.desc: Click Put string on Map page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0009', 0, (done: Function) => {
            runCase('testCollectionUI0009', async (): Promise<void> => {
                await clickText('Sendable Map');
                await clickText('Initialize map(64)');
                await getDriver().waitForIdle(200, 3000);
                await clickText('Put string');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('map_page_title');
                addLog('testCollectionUI0009: page after put=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Map Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('map_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1000
         * @tc.name: testCollectionUI0010
         * @tc.desc: Click All keys on Map page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0010', 0, (done: Function) => {
            runCase('testCollectionUI0010', async (): Promise<void> => {
                await clickText('Sendable Map');
                await scrollToText('All keys');
                await clickText('All keys');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('map_page_title');
                addLog('testCollectionUI0010: page after keys=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Map Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('map_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_1100
         * @tc.name: testCollectionUI0011
         * @tc.desc: Navigate to Queue page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0011', 0, (done: Function) => {
            runCase('testCollectionUI0011', async (): Promise<void> => {
                await clickText('Sendable Queue');
                const titleComp = await waitText('Sendable Queue Manager');
                const titleText: string = await titleComp.getText();
                addLog('testCollectionUI0011: title=%{public}s', titleText);
                expect(titleText).assertEqual('Sendable Queue Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('queue_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1200
         * @tc.name: testCollectionUI0012
         * @tc.desc: Verify Queue page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0012', 0, (done: Function) => {
            runCase('testCollectionUI0012', async (): Promise<void> => {
                await clickText('Sendable Queue');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testCollectionUI0012: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_1300
         * @tc.name: testCollectionUI0013
         * @tc.desc: Click Init FIFO on Queue page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0013', 0, (done: Function) => {
            runCase('testCollectionUI0013', async (): Promise<void> => {
                await clickText('Sendable Queue');
                await clickText('Init FIFO');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('queue_page_title');
                addLog('testCollectionUI0013: page after fifo=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Queue Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('queue_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1400
         * @tc.name: testCollectionUI0014
         * @tc.desc: Click Init Priority on Queue page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0014', 0, (done: Function) => {
            runCase('testCollectionUI0014', async (): Promise<void> => {
                await clickText('Sendable Queue');
                await clickText('Init Priority');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('queue_page_title');
                addLog('testCollectionUI0014: page after priority=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Queue Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('queue_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1500
         * @tc.name: testCollectionUI0015
         * @tc.desc: Click Statistics on Queue page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0015', 0, (done: Function) => {
            runCase('testCollectionUI0015', async (): Promise<void> => {
                await clickText('Sendable Queue');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('queue_page_title');
                addLog('testCollectionUI0015: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Queue Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('queue_page_title')).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_1600
         * @tc.name: testCollectionUI0016
         * @tc.desc: Navigate to Record page and verify title text.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0016', 0, (done: Function) => {
            runCase('testCollectionUI0016', async (): Promise<void> => {
                await clickText('Sendable Record');
                const titleComp = await waitText('Sendable Record Manager');
                const titleText: string = await titleComp.getText();
                addLog('testCollectionUI0016: title=%{public}s', titleText);
                expect(titleText).assertEqual('Sendable Record Manager');
                expect(titleText.length > 0).assertTrue();
                expect(await existsId('record_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1700
         * @tc.name: testCollectionUI0017
         * @tc.desc: Verify Record page shows initial result area.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0017', 0, (done: Function) => {
            runCase('testCollectionUI0017', async (): Promise<void> => {
                await clickText('Sendable Record');
                const resultComp = await waitText(INITIAL_RESULT);
                const resultText: string = await resultComp.getText();
                addLog('testCollectionUI0017: initial=%{public}s', resultText);
                expect(resultText).assertEqual(INITIAL_RESULT);
                expect(resultText.indexOf('error') < 0).assertTrue();
                expect(resultText.length > 0).assertTrue();
                await pressBack();
            }, done);
        });



        /*
         * @tc.number: SUB_COLL_UI_1800
         * @tc.name: testCollectionUI0018
         * @tc.desc: Click Create UserProfile on Record page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 0
         */
        it('testCollectionUI0018', 0, (done: Function) => {
            runCase('testCollectionUI0018', async (): Promise<void> => {
                await clickText('Sendable Record');
                await clickText('Create UserProfile');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('record_page_title');
                addLog('testCollectionUI0018: page after create=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Record Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('record_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_1900
         * @tc.name: testCollectionUI0019
         * @tc.desc: Click To JSON on Record page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0019', 0, (done: Function) => {
            runCase('testCollectionUI0019', async (): Promise<void> => {
                await clickText('Sendable Record');
                await scrollToText('To JSON');
                await clickText('To JSON');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('record_page_title');
                addLog('testCollectionUI0019: page after json=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Record Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('record_page_title')).assertTrue();
                await pressBack();
            }, done);
        });

        /*
         * @tc.number: SUB_COLL_UI_2000
         * @tc.name: testCollectionUI0020
         * @tc.desc: Click Statistics on Record page and verify stability.
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testCollectionUI0020', 0, (done: Function) => {
            runCase('testCollectionUI0020', async (): Promise<void> => {
                await clickText('Sendable Record');
                await scrollToText('Statistics');
                await clickText('Statistics');
                await getDriver().waitForIdle(300, 5000);
                const pageExists: boolean = await existsId('record_page_title');
                addLog('testCollectionUI0020: page after stats=%{public}s', String(pageExists));
                expect(pageExists).assertTrue();
                expect(pageExists).assertTrue();
                const titleComp = await waitText('Sendable Record Manager');
                expect(titleComp).not().assertNull();
                expect(await existsId('record_page_title')).assertTrue();
                await pressBack();
            }, done);
        });
    });
}
