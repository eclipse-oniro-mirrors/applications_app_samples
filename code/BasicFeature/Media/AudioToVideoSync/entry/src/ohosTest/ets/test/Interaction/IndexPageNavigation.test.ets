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
import { TestType, Size, Level } from '@ohos/hypium';

import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, Component, ON } from '@kit.TestKit';
import { delay, paceTurn } from '../Shared/TestPace';
import {
  APP_TITLE,
  PLAY_TEXT,
  SPEED_TEXTS,
  findTextOrNull,
  openApp
} from '../Shared/UiSession';
import { hilog } from '@kit.PerformanceAnalysisKit';

async function titleText(target: Driver): Promise<string> {
  const found: Component | null = await findTextOrNull(target, APP_TITLE);
  expect(found !== null).assertTrue();
  return (found as Component).getText();
}


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Interaction_IndexPageNavigation]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function indexPageNavigationTest() {
  describe('indexPageNavigationTest', () => {
    let target: Driver;

    beforeAll(async () => {
      await delay(1500);
      target = await openApp();
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      try {
        await target.pressBack();
      } catch (error) {
        console.info('indexPageNavigationTest teardown skipped');
      }
    });

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0100
     * @tc.name      testIndexNavigation0001
     * @tc.desc      Verify the app title is visible after the initial launch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0001');
      expect(await titleText(target)).assertEqual(APP_TITLE);
    
      logEnd('testIndexNavigation0001');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0200
     * @tc.name      testIndexNavigation0002
     * @tc.desc      Verify three consecutive launches all land on the same page
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0002');
      for (let i = 0; i < 3; i++) {
        const current: Driver = await openApp();
        expect(await titleText(current)).assertEqual(APP_TITLE);
      }
    
      logEnd('testIndexNavigation0002');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0300
     * @tc.name      testIndexNavigation0003
     * @tc.desc      Verify the page is recoverable after a back press followed by a relaunch
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0003');
      try {
        await target.pressBack();
      } catch (error) {
        console.info('back on first page');
      }
      await delay(600);
      const reopened: Driver = await openApp();
      expect(await titleText(reopened)).assertEqual(APP_TITLE);
    
      logEnd('testIndexNavigation0003');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0400
     * @tc.name      testIndexNavigation0004
     * @tc.desc      Verify reopening the page restores the initial play button state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0004');
      const reopened: Driver = await openApp();
      const play: Component | null = await findTextOrNull(reopened, PLAY_TEXT);
      expect(play !== null).assertTrue();
      expect(await (play as Component).isEnabled()).assertTrue();
      for (let i = 0; i < SPEED_TEXTS.length; i++) {
        const speed: Component | null = await findTextOrNull(reopened, SPEED_TEXTS[i]);
        expect(speed !== null).assertTrue();
        expect(await (speed as Component).isEnabled()).assertFalse();
      }
    
      logEnd('testIndexNavigation0004');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0500
     * @tc.name      testIndexNavigation0005
     * @tc.desc      Verify five consecutive launches do not leave the page in a broken state
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0005');
      for (let i = 0; i < 5; i++) {
        const current: Driver = await openApp();
        const title: Component | null = await findTextOrNull(current, APP_TITLE);
        const play: Component | null = await findTextOrNull(current, PLAY_TEXT);
        expect(title !== null).assertTrue();
        expect(play !== null).assertTrue();
      }
    
      logEnd('testIndexNavigation0005');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0600
     * @tc.name      testIndexNavigation0006
     * @tc.desc      Verify entering the play picker and dismissing it keeps the page recoverable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0006');
      const current: Driver = await openApp();
      const play: Component | null = await findTextOrNull(current, PLAY_TEXT);
      expect(play !== null).assertTrue();
      await (play as Component).click();
      await current.delayMs(1500);
      try {
        await current.pressBack();
      } catch (error) {
        console.info('picker back skipped');
      }
      await current.delayMs(800);
      const reopened: Driver = await openApp();
      expect(await titleText(reopened)).assertEqual(APP_TITLE);
    
      logEnd('testIndexNavigation0006');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0700
     * @tc.name      testIndexNavigation0007
     * @tc.desc      Verify reopening returns the same driver instance so the session is not recreated
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0007');
      const first: Driver = await openApp();
      const second: Driver = await openApp();
      expect(first === second).assertTrue();
      expect(await titleText(second)).assertEqual(APP_TITLE);
    
      logEnd('testIndexNavigation0007');
    })

    /**
     * @tc.number    SUB_AVS_INTERACTION_NAV_0800
     * @tc.name      testIndexNavigation0008
     * @tc.desc      Verify the title remains exactly one node after repeated relaunches
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIndexNavigation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      logBegin('testIndexNavigation0008');
      const current: Driver = await openApp();
      const titles: Component[] = await current.findComponents(ON.text(APP_TITLE));
      expect(titles.length).assertEqual(1);
      expect(await titles[0].getText()).assertEqual(APP_TITLE);
    
      logEnd('testIndexNavigation0008');
    })
  });
}
