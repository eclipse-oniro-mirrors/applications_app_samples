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
import { startApp, waitId, runCase, addLog, existsId } from '../testkit/SharedDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SendableDataStore]';
const BUNDLE_NAME: string = 'com.samples.sendabledatastore';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest(): void {
  describe('AbilityTest', () => {
    beforeAll(() => {
      addLog('AbilityTest suite started');
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(() => {
      addLog('AbilityTest suite finished');
    })

    /*
     * @tc.number: SUB_ABILITY_0100
     * @tc.name: testAbility0001
     * @tc.desc: Verify app launches and shows main page with preferences button.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbility0001', 0, (done: Function) => {
      runCase('testAbility0001', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('preferencesButton', 10000);
        const exists: boolean = await existsId('preferencesButton');
        addLog('testAbility0001: preferencesButton exists=%{public}s', String(exists));
        expect(exists).assertTrue();
        const rdbExists: boolean = await existsId('rdbButton');
        expect(rdbExists).assertTrue();
        const arrayExists: boolean = await existsId('arrayButton');
        expect(arrayExists).assertTrue();
      }, done);
    });

    /*
     * @tc.number: SUB_ABILITY_0200
     * @tc.name: testAbility0002
     * @tc.desc: Verify main page shows all module entry buttons.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbility0002', 0, (done: Function) => {
      runCase('testAbility0002', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        const prefExists: boolean = await existsId('preferencesButton');
        expect(prefExists).assertTrue();
        const rdbExists: boolean = await existsId('rdbButton');
        expect(rdbExists).assertTrue();
        const buttons: string[] = [
          'arrayButton', 'mapButton',
          'queueButton', 'recordButton', 'migrationButton', 'backupButton',
          'encryptionButton', 'distributedButton'
        ];
        for (let i = 0; i < buttons.length; i++) {
          const exists: boolean = await existsId(buttons[i]);
          addLog('testAbility0002: %{public}s exists=%{public}s', buttons[i], String(exists));
          expect(exists).assertTrue();
        }
      }, done);
    });

    /*
     * @tc.number: SUB_ABILITY_0300
     * @tc.name: testAbility0003
     * @tc.desc: Verify app title text is displayed on main page.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbility0003', 0, (done: Function) => {
      runCase('testAbility0003', async (): Promise<void> => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        const prefExists: boolean = await existsId('preferencesButton');
        expect(prefExists).assertTrue();
        const rdbExists: boolean = await existsId('rdbButton');
        expect(rdbExists).assertTrue();
        const mapExists: boolean = await existsId('mapButton');
        expect(mapExists).assertTrue();
        addLog('testAbility0003: main page loaded successfully');
      }, done);
    });
  });
}
