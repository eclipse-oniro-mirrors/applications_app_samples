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

export default function DeviceProfileBuildMatrixPart2Test(): void {
  describe('DeviceProfileBuildMatrixPart2', () => {

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4100
     * @tc.name      testBuildProfile0041
     * @tc.desc      Verify DEFAULT profile at 600x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0041 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('default/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0041 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4200
     * @tc.name      testBuildProfile0042
     * @tc.desc      Verify DEFAULT profile at 600x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0042 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(600, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.MD);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(600);
      expect(profile.describe()).assertContain('default/md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0042 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4300
     * @tc.name      testBuildProfile0043
     * @tc.desc      Verify DEFAULT profile at 840x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0043 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0043 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4400
     * @tc.name      testBuildProfile0044
     * @tc.desc      Verify DEFAULT profile at 840x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0044 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0044 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4500
     * @tc.name      testBuildProfile0045
     * @tc.desc      Verify DEFAULT profile at 840x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0045 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(840, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(840);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0045 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4600
     * @tc.name      testBuildProfile0046
     * @tc.desc      Verify DEFAULT profile at 1200x200vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0046 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 200, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(320);
      expect(profile.tabsHeight).assertEqual(300);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0046 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4700
     * @tc.name      testBuildProfile0047
     * @tc.desc      Verify DEFAULT profile at 1200x780vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0047 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 780, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(429);
      expect(profile.tabsHeight).assertEqual(390);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0047 end');
    })

    /**
     * @tc.number    SUB_ATOMIC_DPBP2_4800
     * @tc.name      testBuildProfile0048
     * @tc.desc      Verify DEFAULT profile at 1200x1600vp.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBuildProfile0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0048 begin');
      await delayTick();
      const snapshot: DisplaySnapshot = new DisplaySnapshot(1200, 1600, 2);
      const profile = buildLayoutProfile(DeviceForm.DEFAULT, snapshot);
      expect(profile.breakpoint).assertEqual(Breakpoint.LG);
      expect(profile.columns).assertEqual(2);
      expect(profile.pageMaxWidth).assertEqual(960);
      expect(profile.webHeight).assertEqual(640);
      expect(profile.tabsHeight).assertEqual(520);
      expect(profile.navSplitDefault).assertEqual(false);
      expect(profile.pickerSupported).assertEqual(false);
      expect(profile.widthVp).assertEqual(1200);
      expect(profile.describe()).assertContain('default/lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBuildProfile0048 end');
    })

  })
}
