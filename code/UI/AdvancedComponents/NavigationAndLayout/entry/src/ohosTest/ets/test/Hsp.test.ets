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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import {
  clickId,
  existsId,
  pressBack,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitIdContains
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function hspTest() {
  describe('HspNavigationTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_NAVIGATION_HSP_0100
     * @tc.name testNavigationAndLayoutHspPage0001
     * @tc.desc Verify navigation and layout hsp page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspPage0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await waitId('hspTitle');
        expect(await existsId('pushHspButton')).assertTrue();
        expect(await existsId('pushLocalButton')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0200
     * @tc.name testNavigationAndLayoutHspLocalFallback0002
     * @tc.desc Verify navigation and layout hsp local fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspLocalFallback0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspLocalFallback0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await clickId('pushLocalButton');
        await waitId('localFallbackTitle');
        expect(await textOfId('localFallbackTitle')).assertEqual('Local fallback page');
        expect(await textOfId('hspStackText')).assertContain('LocalFallback');
        await clickId('localFallbackBack');
        await waitId('hspTitle');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0300
     * @tc.name testNavigationAndLayoutHspPush0003
     * @tc.desc Verify navigation and layout hsp push behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspPush0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspPush0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await clickId('pushHspButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0400
     * @tc.name testNavigationAndLayoutHspPushByName0004
     * @tc.desc Verify navigation and layout hsp push by name behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspPushByName0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspPushByName0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspByNameButton');
        await clickId('pushHspByNameButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0500
     * @tc.name testNavigationAndLayoutHspReplace0005
     * @tc.desc Verify navigation and layout hsp replace behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspReplace0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspReplace0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('replaceHspButton');
        await clickId('replaceHspButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0600
     * @tc.name testNavigationAndLayoutHspDestination0006
     * @tc.desc Verify navigation and layout hsp destination behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspDestination0006', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspDestination0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspDestinationButton');
        await clickId('pushHspDestinationButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0700
     * @tc.name testNavigationAndLayoutHspDestinationByName0007
     * @tc.desc Verify navigation and layout hsp destination by name behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspDestinationByName0007', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspDestinationByName0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspDestinationByNameButton');
        await clickId('pushHspDestinationByNameButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0800
     * @tc.name testNavigationAndLayoutHspReplaceByName0008
     * @tc.desc Verify navigation and layout hsp replace by name behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspReplaceByName0008', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspReplaceByName0008', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('replaceHspByNameButton');
        await clickId('replaceHspByNameButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_0900
     * @tc.name testNavigationAndLayoutHspOptionsPush0009
     * @tc.desc Verify navigation and layout hsp options push behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspOptionsPush0009', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspOptionsPush0009', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspOptionsButton');
        await clickId('pushHspOptionsButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_1000
     * @tc.name testNavigationAndLayoutHspOptionsReplace0010
     * @tc.desc Verify navigation and layout hsp options replace behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspOptionsReplace0010', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspOptionsReplace0010', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('replaceHspOptionsButton');
        await clickId('replaceHspOptionsButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_1100
     * @tc.name testNavigationAndLayoutHspByNameOnPop0011
     * @tc.desc Verify navigation and layout hsp by name on pop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspByNameOnPop0011', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspByNameOnPop0011', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspByNameOnPopButton');
        await clickId('pushHspByNameOnPopButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        } else {
          await pressBack();
          await waitId('hspTitle');
          await waitIdContains('hspMessage', 'onPop');
        }
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_HSP_1200
     * @tc.name testNavigationAndLayoutHspDestByNameOnPop0012
     * @tc.desc Verify navigation and layout hsp dest by name on pop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutHspDestByNameOnPop0012', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutHspDestByNameOnPop0012', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await scrollToId('pushHspDestByNameOnPopButton');
        await clickId('pushHspDestByNameOnPopButton');
        await waitId('hspMessage');
        await waitIdContains('hspMessage', 'HSP');
        if (await existsId('localFallbackTitle')) {
          await pressBack();
          await waitId('hspTitle');
        } else {
          await pressBack();
          await waitId('hspTitle');
          await waitIdContains('hspMessage', 'onPop');
        }
      }, done);
    });
  });
}
