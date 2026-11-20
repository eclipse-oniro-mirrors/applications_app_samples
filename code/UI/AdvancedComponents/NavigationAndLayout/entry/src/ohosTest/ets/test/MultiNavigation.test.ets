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
import { clickId, existsId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function multiNavigationTest() {
  describe('MultiNavigationTest', () => {
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
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0100
     * @tc.name testNavigationAndLayoutMultiHome0001
     * @tc.desc Verify navigation and layout multi home behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiHome0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiHome0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await waitId('homeItem_1');
        expect(await existsId('homeItem_2')).assertTrue();
        expect(await existsId('homeOpenFull')).assertTrue();
        expect(await textOfId('multiActionText')).assertContain('push home');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0200
     * @tc.name testNavigationAndLayoutMultiDetail0002
     * @tc.desc Verify navigation and layout multi detail behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiDetail0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiDetail0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        expect(await textOfId('detailTitle')).assertEqual('Alpha item');
        expect(await textOfId('detailDescription')).assertContain('First item');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0300
     * @tc.name testNavigationAndLayoutMultiDetailBack0003
     * @tc.desc Verify navigation and layout multi detail back behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiDetailBack0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiDetailBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_2');
        await waitId('detailTitle');
        await clickId('detailBack');
        await waitId('homeItem_1');
        expect(await existsId('homeItem_1')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0400
     * @tc.name testNavigationAndLayoutMultiFull0004
     * @tc.desc Verify navigation and layout multi full behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiFull0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiFull0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeOpenFull');
        await waitId('fullPageTitle');
        await clickId('fullBack');
        await waitId('homeItem_1');
        expect(await existsId('homeItem_1')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0500
     * @tc.name testNavigationAndLayoutMultiPushPath0005
     * @tc.desc Verify navigation and layout multi push path behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiPushPath0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiPushPath0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homePushPath');
        await waitId('detailTitle');
        expect(await textOfId('detailTitle')).assertEqual('PushPath item');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0600
     * @tc.name testNavigationAndLayoutMultiPlaceholder0006
     * @tc.desc Verify navigation and layout multi placeholder behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiPlaceholder0006', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiPlaceholder0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('navPlaceholder');
        await waitId('multiActionText');
        expect(await textOfId('multiActionText')).assertContain('placeholder');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0700
     * @tc.name testNavigationAndLayoutMultiStackOps0007
     * @tc.desc Verify navigation and layout multi stack ops behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiStackOps0007', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiStackOps0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        await clickId('navPop');
        await waitId('homeItem_1');
        await clickId('homeItem_2');
        await waitId('detailTitle');
        await clickId('navRemove');
        await waitId('homeItem_1');
        expect(await textOfId('multiActionText')).assertContain('remove');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0800
     * @tc.name testNavigationAndLayoutMultiDeepStack0008
     * @tc.desc Verify navigation and layout multi deep stack behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiDeepStack0008', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiDeepStack0008', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        await clickId('detailPushNext');
        await waitId('detailTitle');
        expect(await textOfId('detailTitle')).assertEqual('Detail 2');
        await clickId('detailBack');
        await waitId('detailTitle');
        expect(await textOfId('detailTitle')).assertEqual('Alpha item');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATION_0900
     * @tc.name testNavigationAndLayoutMultiHomeStack0009
     * @tc.desc Verify navigation and layout multi home stack behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutMultiHomeStack0009', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutMultiHomeStack0009', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await clickId('homeItem_1');
        await waitId('detailTitle');
        await clickId('detailPushNext');
        await waitId('detailTitle');
        await clickId('navHome');
        await waitId('homeItem_1');
        expect(await textOfId('multiActionText')).assertContain('popToIndex');
      }, done);
    });
  });
}
