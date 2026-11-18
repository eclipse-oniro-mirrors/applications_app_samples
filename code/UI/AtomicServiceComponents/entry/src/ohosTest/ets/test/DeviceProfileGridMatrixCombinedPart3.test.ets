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

export default function DeviceProfileGridMatrixCombinedPart3Test(): void {
  describe('DevProf3', () => {
    /**
     * @tc.number    SUB_ATOMIC_DPGP4_14500
     * @tc.name      testProfileGrid0145
     * @tc.desc      Verify TWO_IN_ONE profile at 1000x2000 density 1.5. Plus Verify TWO_IN_ONE profile at 1440x240 density 1.5. Plus Verify TWO_IN_ONE profile at 1440x500 density 1. Plus Verify TWO_IN_ONE profile at 1440x900 density 3. Plus Verify TWO_IN_ONE profile at 1440x1400 density 1. Plus Verify TWO_IN_ONE profile at 1440x2000 density 1. Plus Verify DEFAULT profile at 320x240 density 3. Plus Verify DEFAULT profile at 320x500 density 2. Plus Verify DEFAULT profile at 320x900 density 1. Plus Verify DEFAULT profile at 320x1400 density 2. Plus Verify DEFAULT profile at 320x2000 density 2. Plus Verify DEFAULT profile at 400x240 density 1.5. Plus Verify DEFAULT profile at 400x500 density 1. Plus Verify DEFAULT profile at 400x900 density 3. Plus Verify DEFAULT profile at 400x1400 density 1. Plus Verify DEFAULT profile at 400x2000 density 1. Plus Verify DEFAULT profile at 599x240 density 2. Plus Verify DEFAULT profile at 599x500 density 1.5. Plus Verify DEFAULT profile at 599x900 density 1. Plus Verify DEFAULT profile at 599x1400 density 2. Plus Verify DEFAULT profile at 599x2000 density 2. Plus Verify DEFAULT profile at 601x240 density 2. Plus Verify DEFAULT profile at 601x500 density 1.5. Plus Verify DEFAULT profile at 601x900 density 1. Plus Verify DEFAULT profile at 601x1400 density 2. Plus Verify DEFAULT profile at 601x2000 density 2. Plus Verify DEFAULT profile at 700x240 density 1.5. Plus Verify DEFAULT profile at 700x500 density 1. Plus Verify DEFAULT profile at 700x900 density 3. Plus Verify DEFAULT profile at 700x1400 density 1. Plus Verify DEFAULT profile at 700x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0145 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 2000, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.form).assertEqual(DeviceForm.TWO_IN_ONE);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 240, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 500, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(320, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(320);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(400, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(400);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(599, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.widthVp).assertEqual(599);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 240, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 500, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 900, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 1400, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(601, 2000, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(601);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      {
      const snapshot: DisplaySnapshot = new DisplaySnapshot(700, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(700);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0145 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_17600
     * @tc.name      testProfileGrid0176
     * @tc.desc      Verify DEFAULT profile at 800x240 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0176 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 240, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0176 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_17700
     * @tc.name      testProfileGrid0177
     * @tc.desc      Verify DEFAULT profile at 800x500 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0177 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 500, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0177 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_17800
     * @tc.name      testProfileGrid0178
     * @tc.desc      Verify DEFAULT profile at 800x900 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0178 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 900, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0178 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_17900
     * @tc.name      testProfileGrid0179
     * @tc.desc      Verify DEFAULT profile at 800x1400 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0179 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 1400, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0179 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18000
     * @tc.name      testProfileGrid0180
     * @tc.desc      Verify DEFAULT profile at 800x2000 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0180 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(800, 2000, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(800);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0180 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18100
     * @tc.name      testProfileGrid0181
     * @tc.desc      Verify DEFAULT profile at 839x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0181 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0181 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18200
     * @tc.name      testProfileGrid0182
     * @tc.desc      Verify DEFAULT profile at 839x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0182 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0182 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18300
     * @tc.name      testProfileGrid0183
     * @tc.desc      Verify DEFAULT profile at 839x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0183 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0183 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18400
     * @tc.name      testProfileGrid0184
     * @tc.desc      Verify DEFAULT profile at 839x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0184 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0184 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18500
     * @tc.name      testProfileGrid0185
     * @tc.desc      Verify DEFAULT profile at 839x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0185 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(839, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(839);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0185 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18600
     * @tc.name      testProfileGrid0186
     * @tc.desc      Verify DEFAULT profile at 841x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0186 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0186 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18700
     * @tc.name      testProfileGrid0187
     * @tc.desc      Verify DEFAULT profile at 841x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0187 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0187 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18800
     * @tc.name      testProfileGrid0188
     * @tc.desc      Verify DEFAULT profile at 841x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0188 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0188 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_18900
     * @tc.name      testProfileGrid0189
     * @tc.desc      Verify DEFAULT profile at 841x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0189 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0189 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19000
     * @tc.name      testProfileGrid0190
     * @tc.desc      Verify DEFAULT profile at 841x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0190 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(841, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(841);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0190 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19100
     * @tc.name      testProfileGrid0191
     * @tc.desc      Verify DEFAULT profile at 1000x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0191 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0191 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19200
     * @tc.name      testProfileGrid0192
     * @tc.desc      Verify DEFAULT profile at 1000x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0192 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0192 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19300
     * @tc.name      testProfileGrid0193
     * @tc.desc      Verify DEFAULT profile at 1000x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0193 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0193 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19400
     * @tc.name      testProfileGrid0194
     * @tc.desc      Verify DEFAULT profile at 1000x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0194 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0194 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19500
     * @tc.name      testProfileGrid0195
     * @tc.desc      Verify DEFAULT profile at 1000x2000 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0195 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1000, 2000, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1000);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0195 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19600
     * @tc.name      testProfileGrid0196
     * @tc.desc      Verify DEFAULT profile at 1440x240 density 1.5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0196 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 240, 1.5);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(240);
      expect(profile.density).assertEqual(1.5);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0196 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19700
     * @tc.name      testProfileGrid0197
     * @tc.desc      Verify DEFAULT profile at 1440x500 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0197 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 500, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(500);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0197 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19800
     * @tc.name      testProfileGrid0198
     * @tc.desc      Verify DEFAULT profile at 1440x900 density 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0198 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 900, 3);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(900);
      expect(profile.density).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(495);
      expect(profile.tabsHeight).assertEqual(450);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0198 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_19900
     * @tc.name      testProfileGrid0199
     * @tc.desc      Verify DEFAULT profile at 1440x1400 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0199 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 1400, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(1400);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0199 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP5_20000
     * @tc.name      testProfileGrid0200
     * @tc.desc      Verify DEFAULT profile at 1440x2000 density 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testProfileGrid0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0200 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1440, 2000, 1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.form).assertEqual(DeviceForm.DEFAULT);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.widthVp).assertEqual(1440);
      expect(profile.heightVp).assertEqual(2000);
      expect(profile.density).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testProfileGrid0200 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP6_20100
     * @tc.name      testSnapshotDefault0201
     * @tc.desc      Verify zero snapshot defaults for PHONE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSnapshotDefault0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0201 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(0, 0, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.heightVp).assertEqual(780);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0201 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP6_20200
     * @tc.name      testSnapshotDefault0202
     * @tc.desc      Verify zero snapshot defaults for TABLET.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSnapshotDefault0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0202 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(0, 0, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.heightVp).assertEqual(780);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0202 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP6_20300
     * @tc.name      testSnapshotDefault0203
     * @tc.desc      Verify zero snapshot defaults for TWO_IN_ONE.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSnapshotDefault0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0203 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(0, 0, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.heightVp).assertEqual(780);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0203 end');
    })
    /**
     * @tc.number    SUB_ATOMIC_DPGP6_20400
     * @tc.name      testSnapshotDefault0204
     * @tc.desc      Verify zero snapshot defaults for DEFAULT.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testSnapshotDefault0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0204 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(0, 0, 0);
      expect(snapshot.widthVp).assertEqual(360);
      expect(snapshot.heightVp).assertEqual(780);
      expect(snapshot.density).assertEqual(1);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.heightVp).assertEqual(780);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSnapshotDefault0204 end');
    })

  })
}
