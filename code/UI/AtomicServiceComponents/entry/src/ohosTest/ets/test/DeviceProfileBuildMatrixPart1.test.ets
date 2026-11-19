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

export default function DeviceProfileBuildMatrixPart1Test(): void {
  describe('DeviceProfileBuildMatrixPart1', () => {

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0100
     * @tc.name      testBuildProfile0001
     * @tc.desc      Verify PHONE profile at 360x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0001 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('phone/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0001 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0200
     * @tc.name      testBuildProfile0002
     * @tc.desc      Verify PHONE profile at 360x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0002 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('phone/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0002 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0300
     * @tc.name      testBuildProfile0003
     * @tc.desc      Verify PHONE profile at 360x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0003 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('phone/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0003 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0400
     * @tc.name      testBuildProfile0004
     * @tc.desc      Verify PHONE profile at 600x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0004 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('phone/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0004 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0500
     * @tc.name      testBuildProfile0005
     * @tc.desc      Verify PHONE profile at 600x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0005 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('phone/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0005 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0600
     * @tc.name      testBuildProfile0006
     * @tc.desc      Verify PHONE profile at 600x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0006 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('phone/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0006 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0700
     * @tc.name      testBuildProfile0007
     * @tc.desc      Verify PHONE profile at 840x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0007 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0007 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0800
     * @tc.name      testBuildProfile0008
     * @tc.desc      Verify PHONE profile at 840x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0008 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0008 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_0900
     * @tc.name      testBuildProfile0009
     * @tc.desc      Verify PHONE profile at 840x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0009 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0009 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1000
     * @tc.name      testBuildProfile0010
     * @tc.desc      Verify PHONE profile at 1200x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0010 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0010 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1100
     * @tc.name      testBuildProfile0011
     * @tc.desc      Verify PHONE profile at 1200x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0011 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0011 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1200
     * @tc.name      testBuildProfile0012
     * @tc.desc      Verify PHONE profile at 1200x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0012 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.PHONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(640);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('phone/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0012 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1300
     * @tc.name      testBuildProfile0013
     * @tc.desc      Verify TABLET profile at 360x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0013 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('tablet/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0013 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1400
     * @tc.name      testBuildProfile0014
     * @tc.desc      Verify TABLET profile at 360x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0014 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('tablet/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0014 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1500
     * @tc.name      testBuildProfile0015
     * @tc.desc      Verify TABLET profile at 360x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0015 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('tablet/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0015 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1600
     * @tc.name      testBuildProfile0016
     * @tc.desc      Verify TABLET profile at 600x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0016 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('tablet/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0016 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1700
     * @tc.name      testBuildProfile0017
     * @tc.desc      Verify TABLET profile at 600x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0017 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('tablet/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0017 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1800
     * @tc.name      testBuildProfile0018
     * @tc.desc      Verify TABLET profile at 600x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0018 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('tablet/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0018 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_1900
     * @tc.name      testBuildProfile0019
     * @tc.desc      Verify TABLET profile at 840x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0019 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0019 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2000
     * @tc.name      testBuildProfile0020
     * @tc.desc      Verify TABLET profile at 840x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0020 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0020 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2100
     * @tc.name      testBuildProfile0021
     * @tc.desc      Verify TABLET profile at 840x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0021 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0021 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2200
     * @tc.name      testBuildProfile0022
     * @tc.desc      Verify TABLET profile at 1200x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0022 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0022 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2300
     * @tc.name      testBuildProfile0023
     * @tc.desc      Verify TABLET profile at 1200x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0023 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0023 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2400
     * @tc.name      testBuildProfile0024
     * @tc.desc      Verify TABLET profile at 1200x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0024 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TABLET, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(840);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('tablet/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0024 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2500
     * @tc.name      testBuildProfile0025
     * @tc.desc      Verify TWO_IN_ONE profile at 360x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0025 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('2in1/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0025 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2600
     * @tc.name      testBuildProfile0026
     * @tc.desc      Verify TWO_IN_ONE profile at 360x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0026 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('2in1/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0026 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2700
     * @tc.name      testBuildProfile0027
     * @tc.desc      Verify TWO_IN_ONE profile at 360x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0027 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('2in1/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0027 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2800
     * @tc.name      testBuildProfile0028
     * @tc.desc      Verify TWO_IN_ONE profile at 600x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0028 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('2in1/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0028 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_2900
     * @tc.name      testBuildProfile0029
     * @tc.desc      Verify TWO_IN_ONE profile at 600x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0029 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('2in1/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0029 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3000
     * @tc.name      testBuildProfile0030
     * @tc.desc      Verify TWO_IN_ONE profile at 600x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0030 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('2in1/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0030 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3100
     * @tc.name      testBuildProfile0031
     * @tc.desc      Verify TWO_IN_ONE profile at 840x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0031 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0031 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3200
     * @tc.name      testBuildProfile0032
     * @tc.desc      Verify TWO_IN_ONE profile at 840x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0032 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0032 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3300
     * @tc.name      testBuildProfile0033
     * @tc.desc      Verify TWO_IN_ONE profile at 840x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0033 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0033 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3400
     * @tc.name      testBuildProfile0034
     * @tc.desc      Verify TWO_IN_ONE profile at 1200x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0034 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0034 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3500
     * @tc.name      testBuildProfile0035
     * @tc.desc      Verify TWO_IN_ONE profile at 1200x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0035 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0035 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3600
     * @tc.name      testBuildProfile0036
     * @tc.desc      Verify TWO_IN_ONE profile at 1200x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0036 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.TWO_IN_ONE, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(3);
      expect(profile.pageMaxWidth).assertEqual(1200);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(true);
      expect(profile.pickerSupported).assertEqual(true);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('2in1/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0036 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3700
     * @tc.name      testBuildProfile0037
     * @tc.desc      Verify DEFAULT profile at 360x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0037 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('default/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0037 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3800
     * @tc.name      testBuildProfile0038
     * @tc.desc      Verify DEFAULT profile at 360x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0038 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('default/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0038 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_3900
     * @tc.name      testBuildProfile0039
     * @tc.desc      Verify DEFAULT profile at 360x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0039 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(360, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.SM);
      expect(profile.columns).assertEqual(1);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(360);
      expect(profile.describe()).assertContain('default/sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0039 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP1_4000
     * @tc.name      testBuildProfile0040
     * @tc.desc      Verify DEFAULT profile at 600x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0040 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('default/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0040 end');
    })

  })
}
