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

export default function DeviceProfileGridMatrixCombinedPart1Test(): void {
  describe('DevProf1', () => {
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_0100
     * @tc.name      testProfileGrid0001
     * @tc.desc      Verify PHONE profile at 320x240 density 3. Plus Verify PHONE profile at 320x500 density 2. Plus Verify PHONE profile at 320x900 density 1. Plus Verify PHONE profile at 320x1400 density 2. Plus Verify PHONE profile at 320x2000 density 2. Plus Verify PHONE profile at 400x240 density 1.5. Plus Verify PHONE profile at 400x500 density 1. Plus Verify PHONE profile at 400x900 density 3. Plus Verify PHONE profile at 400x1400 density 1. Plus Verify PHONE profile at 400x2000 density 1. Plus Verify PHONE profile at 599x240 density 2. Plus Verify PHONE profile at 599x500 density 1.5. Plus Verify PHONE profile at 599x900 density 1. Plus Verify PHONE profile at 599x1400 density 2. Plus Verify PHONE profile at 599x2000 density 2. Plus Verify PHONE profile at 601x240 density 2. Plus Verify PHONE profile at 601x500 density 1.5. Plus Verify PHONE profile at 601x900 density 1. Plus Verify PHONE profile at 601x1400 density 2. Plus Verify PHONE profile at 601x2000 density 2. Plus Verify PHONE profile at 700x240 density 1.5. Plus Verify PHONE profile at 700x500 density 1. Plus Verify PHONE profile at 700x900 density 3. Plus Verify PHONE profile at 700x1400 density 1. Plus Verify PHONE profile at 700x2000 density 1. Plus Verify PHONE profile at 800x240 density 1. Plus Verify PHONE profile at 800x500 density 3. Plus Verify PHONE profile at 800x900 density 1.5. Plus Verify PHONE profile at 800x1400 density 3. Plus Verify PHONE profile at 800x2000 density 3. Plus Verify PHONE profile at 839x240 density 1.5. Plus Verify PHONE profile at 839x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0001 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 240, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 500, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 240, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 500, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 900, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 1400, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 2000, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0001 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3300
     * @tc.name      testProfileGrid0033
     * @tc.desc      Verify PHONE profile at 839x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0033 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0033 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3400
     * @tc.name      testProfileGrid0034
     * @tc.desc      Verify PHONE profile at 839x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0034 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0034 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3500
     * @tc.name      testProfileGrid0035
     * @tc.desc      Verify PHONE profile at 839x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0035 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0035 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3600
     * @tc.name      testProfileGrid0036
     * @tc.desc      Verify PHONE profile at 841x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0036 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0036 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3700
     * @tc.name      testProfileGrid0037
     * @tc.desc      Verify PHONE profile at 841x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0037 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0037 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3800
     * @tc.name      testProfileGrid0038
     * @tc.desc      Verify PHONE profile at 841x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0038 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0038 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_3900
     * @tc.name      testProfileGrid0039
     * @tc.desc      Verify PHONE profile at 841x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0039 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0039 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP1_4000
     * @tc.name      testProfileGrid0040
     * @tc.desc      Verify PHONE profile at 841x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0040 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0040 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4100
     * @tc.name      testProfileGrid0041
     * @tc.desc      Verify PHONE profile at 1000x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0041 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0041 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4200
     * @tc.name      testProfileGrid0042
     * @tc.desc      Verify PHONE profile at 1000x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0042 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0042 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4300
     * @tc.name      testProfileGrid0043
     * @tc.desc      Verify PHONE profile at 1000x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0043 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0043 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4400
     * @tc.name      testProfileGrid0044
     * @tc.desc      Verify PHONE profile at 1000x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0044 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0044 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4500
     * @tc.name      testProfileGrid0045
     * @tc.desc      Verify PHONE profile at 1000x2000 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0045 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 2000, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0045 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4600
     * @tc.name      testProfileGrid0046
     * @tc.desc      Verify PHONE profile at 1440x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0046 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0046 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4700
     * @tc.name      testProfileGrid0047
     * @tc.desc      Verify PHONE profile at 1440x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0047 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0047 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4800
     * @tc.name      testProfileGrid0048
     * @tc.desc      Verify PHONE profile at 1440x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0048 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0048 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_4900
     * @tc.name      testProfileGrid0049
     * @tc.desc      Verify PHONE profile at 1440x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0049 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0049 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5000
     * @tc.name      testProfileGrid0050
     * @tc.desc      Verify PHONE profile at 1440x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0050 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.PHONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0050 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5100
     * @tc.name      testProfileGrid0051
     * @tc.desc      Verify TABLET profile at 320x240 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0051 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 240, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0051 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5200
     * @tc.name      testProfileGrid0052
     * @tc.desc      Verify TABLET profile at 320x500 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0052 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 500, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0052 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5300
     * @tc.name      testProfileGrid0053
     * @tc.desc      Verify TABLET profile at 320x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0053 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0053 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5400
     * @tc.name      testProfileGrid0054
     * @tc.desc      Verify TABLET profile at 320x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0054 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0054 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5500
     * @tc.name      testProfileGrid0055
     * @tc.desc      Verify TABLET profile at 320x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0055 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0055 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5600
     * @tc.name      testProfileGrid0056
     * @tc.desc      Verify TABLET profile at 400x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0056 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0056 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5700
     * @tc.name      testProfileGrid0057
     * @tc.desc      Verify TABLET profile at 400x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0057 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0057 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5800
     * @tc.name      testProfileGrid0058
     * @tc.desc      Verify TABLET profile at 400x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0058 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0058 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_5900
     * @tc.name      testProfileGrid0059
     * @tc.desc      Verify TABLET profile at 400x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0059 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0059 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6000
     * @tc.name      testProfileGrid0060
     * @tc.desc      Verify TABLET profile at 400x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0060 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0060 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6100
     * @tc.name      testProfileGrid0061
     * @tc.desc      Verify TABLET profile at 599x240 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0061 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0061 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6200
     * @tc.name      testProfileGrid0062
     * @tc.desc      Verify TABLET profile at 599x500 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0062 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0062 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6300
     * @tc.name      testProfileGrid0063
     * @tc.desc      Verify TABLET profile at 599x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0063 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0063 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6400
     * @tc.name      testProfileGrid0064
     * @tc.desc      Verify TABLET profile at 599x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0064 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0064 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6500
     * @tc.name      testProfileGrid0065
     * @tc.desc      Verify TABLET profile at 599x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0065 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0065 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6600
     * @tc.name      testProfileGrid0066
     * @tc.desc      Verify TABLET profile at 601x240 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0066 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0066 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6700
     * @tc.name      testProfileGrid0067
     * @tc.desc      Verify TABLET profile at 601x500 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0067 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0067 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6800
     * @tc.name      testProfileGrid0068
     * @tc.desc      Verify TABLET profile at 601x900 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0068 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0068 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_6900
     * @tc.name      testProfileGrid0069
     * @tc.desc      Verify TABLET profile at 601x1400 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0069 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0069 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_7000
     * @tc.name      testProfileGrid0070
     * @tc.desc      Verify TABLET profile at 601x2000 density 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0070 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0070 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_7100
     * @tc.name      testProfileGrid0071
     * @tc.desc      Verify TABLET profile at 700x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0071 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0071 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP2_7200
     * @tc.name      testProfileGrid0072
     * @tc.desc      Verify TABLET profile at 700x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0072 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TABLET);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0072 end');
    })

  })
}
