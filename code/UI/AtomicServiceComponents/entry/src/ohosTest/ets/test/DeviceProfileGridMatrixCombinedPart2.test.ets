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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { delayTick } from './shared/AsyncYield';
import { DeviceForm, Breakpoint, DisplaySnapshot, buildLayoutProfile } from '../../../main/ets/model/DeviceProfile';

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF816;
const TAG: string = '[Sample_AtomicService]';

export default function DeviceProfileGridMatrixCombinedPart2Test(): void {
  describe('DevProf2', () => {
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_7300
     * @tc.name      testProfileGrid0073
     * @tc.desc      Verify TABLET profile at 700x900 density 3. Plus Verify TABLET profile at 700x1400 density 1. Plus Verify TABLET profile at 700x2000 density 1. Plus Verify TABLET profile at 800x240 density 1. Plus Verify TABLET profile at 800x500 density 3. Plus Verify TABLET profile at 800x900 density 1.5. Plus Verify TABLET profile at 800x1400 density 3. Plus Verify TABLET profile at 800x2000 density 3. Plus Verify TABLET profile at 839x240 density 1.5. Plus Verify TABLET profile at 839x500 density 1. Plus Verify TABLET profile at 839x900 density 3. Plus Verify TABLET profile at 839x1400 density 1. Plus Verify TABLET profile at 839x2000 density 1. Plus Verify TABLET profile at 841x240 density 1.5. Plus Verify TABLET profile at 841x500 density 1. Plus Verify TABLET profile at 841x900 density 3. Plus Verify TABLET profile at 841x1400 density 1. Plus Verify TABLET profile at 841x2000 density 1. Plus Verify TABLET profile at 1000x240 density 1.5. Plus Verify TABLET profile at 1000x500 density 1. Plus Verify TABLET profile at 1000x900 density 3. Plus Verify TABLET profile at 1000x1400 density 1. Plus Verify TABLET profile at 1000x2000 density 1.5. Plus Verify TABLET profile at 1440x240 density 1.5. Plus Verify TABLET profile at 1440x500 density 1. Plus Verify TABLET profile at 1440x900 density 3. Plus Verify TABLET profile at 1440x1400 density 1. Plus Verify TABLET profile at 1440x2000 density 1. Plus Verify TWO_IN_ONE profile at 320x240 density 3. Plus Verify TWO_IN_ONE profile at 320x500 density 2. Plus Verify TWO_IN_ONE profile at 320x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0073 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 240, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 500, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 900, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 1400, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 2000, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 2000, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 240, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 500, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0073 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10400
     * @tc.name      testProfileGrid0104
     * @tc.desc      Verify TWO_IN_ONE profile at 320x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0104 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0104 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10500
     * @tc.name      testProfileGrid0105
     * @tc.desc      Verify TWO_IN_ONE profile at 320x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0105 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0105 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10600
     * @tc.name      testProfileGrid0106
     * @tc.desc      Verify TWO_IN_ONE profile at 400x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0106 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0106 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10700
     * @tc.name      testProfileGrid0107
     * @tc.desc      Verify TWO_IN_ONE profile at 400x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0107 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0107 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10800
     * @tc.name      testProfileGrid0108
     * @tc.desc      Verify TWO_IN_ONE profile at 400x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0108 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0108 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_10900
     * @tc.name      testProfileGrid0109
     * @tc.desc      Verify TWO_IN_ONE profile at 400x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0109 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0109 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11000
     * @tc.name      testProfileGrid0110
     * @tc.desc      Verify TWO_IN_ONE profile at 400x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0110 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0110 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11100
     * @tc.name      testProfileGrid0111
     * @tc.desc      Verify TWO_IN_ONE profile at 599x240 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0111 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0111 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11200
     * @tc.name      testProfileGrid0112
     * @tc.desc      Verify TWO_IN_ONE profile at 599x500 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0112 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0112 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11300
     * @tc.name      testProfileGrid0113
     * @tc.desc      Verify TWO_IN_ONE profile at 599x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0113 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0113 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11400
     * @tc.name      testProfileGrid0114
     * @tc.desc      Verify TWO_IN_ONE profile at 599x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0114 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0114 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11500
     * @tc.name      testProfileGrid0115
     * @tc.desc      Verify TWO_IN_ONE profile at 599x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0115 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0115 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11600
     * @tc.name      testProfileGrid0116
     * @tc.desc      Verify TWO_IN_ONE profile at 601x240 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0116 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0116 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11700
     * @tc.name      testProfileGrid0117
     * @tc.desc      Verify TWO_IN_ONE profile at 601x500 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0117 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0117 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11800
     * @tc.name      testProfileGrid0118
     * @tc.desc      Verify TWO_IN_ONE profile at 601x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0118 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0118 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_11900
     * @tc.name      testProfileGrid0119
     * @tc.desc      Verify TWO_IN_ONE profile at 601x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0119 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0119 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP3_12000
     * @tc.name      testProfileGrid0120
     * @tc.desc      Verify TWO_IN_ONE profile at 601x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0120 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0120 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12100
     * @tc.name      testProfileGrid0121
     * @tc.desc      Verify TWO_IN_ONE profile at 700x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0121 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0121 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12200
     * @tc.name      testProfileGrid0122
     * @tc.desc      Verify TWO_IN_ONE profile at 700x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0122 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0122 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12300
     * @tc.name      testProfileGrid0123
     * @tc.desc      Verify TWO_IN_ONE profile at 700x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0123 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0123 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12400
     * @tc.name      testProfileGrid0124
     * @tc.desc      Verify TWO_IN_ONE profile at 700x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0124 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0124 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12500
     * @tc.name      testProfileGrid0125
     * @tc.desc      Verify TWO_IN_ONE profile at 700x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0125 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0125 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12600
     * @tc.name      testProfileGrid0126
     * @tc.desc      Verify TWO_IN_ONE profile at 800x240 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0126 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 240, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0126 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12700
     * @tc.name      testProfileGrid0127
     * @tc.desc      Verify TWO_IN_ONE profile at 800x500 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0127 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 500, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0127 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12800
     * @tc.name      testProfileGrid0128
     * @tc.desc      Verify TWO_IN_ONE profile at 800x900 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0128 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 900, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0128 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_12900
     * @tc.name      testProfileGrid0129
     * @tc.desc      Verify TWO_IN_ONE profile at 800x1400 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0129 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 1400, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0129 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13000
     * @tc.name      testProfileGrid0130
     * @tc.desc      Verify TWO_IN_ONE profile at 800x2000 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0130 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 2000, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0130 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13100
     * @tc.name      testProfileGrid0131
     * @tc.desc      Verify TWO_IN_ONE profile at 839x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0131 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0131 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13200
     * @tc.name      testProfileGrid0132
     * @tc.desc      Verify TWO_IN_ONE profile at 839x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0132 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0132 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13300
     * @tc.name      testProfileGrid0133
     * @tc.desc      Verify TWO_IN_ONE profile at 839x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0133 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0133 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13400
     * @tc.name      testProfileGrid0134
     * @tc.desc      Verify TWO_IN_ONE profile at 839x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0134 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0134 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13500
     * @tc.name      testProfileGrid0135
     * @tc.desc      Verify TWO_IN_ONE profile at 839x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0135 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0135 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13600
     * @tc.name      testProfileGrid0136
     * @tc.desc      Verify TWO_IN_ONE profile at 841x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0136 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0136 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13700
     * @tc.name      testProfileGrid0137
     * @tc.desc      Verify TWO_IN_ONE profile at 841x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0137 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0137 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13800
     * @tc.name      testProfileGrid0138
     * @tc.desc      Verify TWO_IN_ONE profile at 841x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0138 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0138 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_13900
     * @tc.name      testProfileGrid0139
     * @tc.desc      Verify TWO_IN_ONE profile at 841x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0139 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0139 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14000
     * @tc.name      testProfileGrid0140
     * @tc.desc      Verify TWO_IN_ONE profile at 841x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0140 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0140 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14100
     * @tc.name      testProfileGrid0141
     * @tc.desc      Verify TWO_IN_ONE profile at 1000x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0141 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0141 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14200
     * @tc.name      testProfileGrid0142
     * @tc.desc      Verify TWO_IN_ONE profile at 1000x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0142 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0142 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14300
     * @tc.name      testProfileGrid0143
     * @tc.desc      Verify TWO_IN_ONE profile at 1000x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0143 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0143 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14400
     * @tc.name      testProfileGrid0144
     * @tc.desc      Verify TWO_IN_ONE profile at 1000x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0144 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0144 end');
    })

  })
}
