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
  startApp, clickId, waitId, pressBack, runCase, addLog, existsId,
  navigateToPreferencesHome, navigateToRdbHome, navigateToArrayHome,
  navigateToMapHome, navigateToQueueHome, navigateToRecordHome,
  navigateToMigrationHome, navigateToBackupHome, navigateToEncryptionHome,
  navigateToDistributedHome, resetToIndex
} from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const BUNDLE_NAME: string = 'com.samples.sendabledatastore';
const ABILITY_NAME: string = 'EntryAbility';

export default function indexAndNavigationTest(): void {
  describe('IndexAndNavigationTest', () => {
    beforeAll(async () => {
      addLog('IndexAndNavigationTest suite started');
      await startApp(BUNDLE_NAME, ABILITY_NAME);
    })

    beforeEach(async () => {
      await resetToIndex();
    })

    afterEach(() => {
    })

    afterAll(() => {
      addLog('IndexAndNavigationTest suite finished');
    })



    /*
     * @tc.number: SUB_NAVIGATION_0100
     * @tc.name: testNavigation0001
     * @tc.desc: Verify navigation to SendablePreferences home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0001', 0, (done: Function) => {
      runCase('testNavigation0001', async (): Promise<void> => {
        await navigateToPreferencesHome();
        const exists: boolean = await existsId('preferences_page_title');
        addLog('testNavigation0001: preferences_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0200
     * @tc.name: testNavigation0002
     * @tc.desc: Verify navigation to SendableRelationalStore home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0002', 0, (done: Function) => {
      runCase('testNavigation0002', async (): Promise<void> => {
        await navigateToRdbHome();
        const exists: boolean = await existsId('rdb_page_title');
        addLog('testNavigation0002: rdb_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0300
     * @tc.name: testNavigation0003
     * @tc.desc: Verify navigation to SendableArray home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0003', 0, (done: Function) => {
      runCase('testNavigation0003', async (): Promise<void> => {
        await navigateToArrayHome();
        const exists: boolean = await existsId('array_page_title');
        addLog('testNavigation0003: array_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0400
     * @tc.name: testNavigation0004
     * @tc.desc: Verify navigation to SendableMap home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0004', 0, (done: Function) => {
      runCase('testNavigation0004', async (): Promise<void> => {
        await navigateToMapHome();
        const exists: boolean = await existsId('map_page_title');
        addLog('testNavigation0004: map_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0500
     * @tc.name: testNavigation0005
     * @tc.desc: Verify navigation to SendableQueue home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0005', 0, (done: Function) => {
      runCase('testNavigation0005', async (): Promise<void> => {
        await navigateToQueueHome();
        const exists: boolean = await existsId('queue_page_title');
        addLog('testNavigation0005: queue_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0600
     * @tc.name: testNavigation0006
     * @tc.desc: Verify navigation to SendableRecord home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0006', 0, (done: Function) => {
      runCase('testNavigation0006', async (): Promise<void> => {
        await navigateToRecordHome();
        const exists: boolean = await existsId('record_page_title');
        addLog('testNavigation0006: record_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0700
     * @tc.name: testNavigation0007
     * @tc.desc: Verify navigation to DataMigration home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0007', 0, (done: Function) => {
      runCase('testNavigation0007', async (): Promise<void> => {
        await navigateToMigrationHome();
        const exists: boolean = await existsId('migration_page_title');
        addLog('testNavigation0007: migration_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0800
     * @tc.name: testNavigation0008
     * @tc.desc: Verify navigation to DataBackup home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0008', 0, (done: Function) => {
      runCase('testNavigation0008', async (): Promise<void> => {
        await navigateToBackupHome();
        const exists: boolean = await existsId('backup_page_title');
        addLog('testNavigation0008: backup_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_0900
     * @tc.name: testNavigation0009
     * @tc.desc: Verify navigation to DataEncryption home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0009', 0, (done: Function) => {
      runCase('testNavigation0009', async (): Promise<void> => {
        await navigateToEncryptionHome();
        const exists: boolean = await existsId('encryption_page_title');
        addLog('testNavigation0009: encryption_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_NAVIGATION_1000
     * @tc.name: testNavigation0010
     * @tc.desc: Verify navigation to DistributedData home page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testNavigation0010', 0, (done: Function) => {
      runCase('testNavigation0010', async (): Promise<void> => {
        await navigateToDistributedHome();
        const exists: boolean = await existsId('distributed_page_title');
        addLog('testNavigation0010: distributed_page_title=%{public}s', String(exists));
        expect(exists).assertTrue();
        const mainGone: boolean = await existsId('preferencesButton');
        expect(mainGone).assertFalse();
        await pressBack();
        const mainBack: boolean = await existsId('preferencesButton');
        expect(mainBack).assertTrue();
      }, done);
    });
  });
}
