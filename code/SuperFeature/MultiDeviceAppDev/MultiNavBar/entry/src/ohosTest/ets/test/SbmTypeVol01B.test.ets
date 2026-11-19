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

// @volume rule=input-value basis=main-frozen cases=37
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SideBarMode } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sbmTypeVol01BTest() {
  describe('MultiNavBarSbmTypeVol01B', () => {

    /**
     * @tc.name   testSbmTypeVol010039
     * @tc.number SUB_MNB_SBM_0459
     * @tc.desc   SideBarMode<number>(39/538) probed with 'list' returns 39
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010039 begin');
      const result: number | undefined = new SideBarMode<number>(39, 538).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('39'));
      expect(String(result)).assertEqual('39');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(39, 538).GetValue('tabs')), String('538'));
      expect(String(new SideBarMode<number>(39, 538).GetValue('tabs'))).assertEqual('538');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(39, 538).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(39, 538).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(39, 538).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(39, 538).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(39, 538).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(39, 538).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010039 end');
    });

    /**
     * @tc.name   testSbmTypeVol010040
     * @tc.number SUB_MNB_SBM_0460
     * @tc.desc   SideBarMode<number>(40/539) probed with 'tabs' returns 539
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010040 begin');
      const result: number | undefined = new SideBarMode<number>(40, 539).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('539'));
      expect(String(result)).assertEqual('539');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(40, 539).GetValue('list')), String('40'));
      expect(String(new SideBarMode<number>(40, 539).GetValue('list'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(40, 539).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(40, 539).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(40, 539).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(40, 539).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(40, 539).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(40, 539).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010040 end');
    });

    /**
     * @tc.name   testSbmTypeVol010041
     * @tc.number SUB_MNB_SBM_0461
     * @tc.desc   SideBarMode<number>(41/540) probed with 'list' returns 41
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010041 begin');
      const result: number | undefined = new SideBarMode<number>(41, 540).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('41'));
      expect(String(result)).assertEqual('41');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(41, 540).GetValue('tabs')), String('540'));
      expect(String(new SideBarMode<number>(41, 540).GetValue('tabs'))).assertEqual('540');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(41, 540).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(41, 540).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(41, 540).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(41, 540).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(41, 540).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(41, 540).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010041 end');
    });

    /**
     * @tc.name   testSbmTypeVol010042
     * @tc.number SUB_MNB_SBM_0462
     * @tc.desc   SideBarMode<number>(42/541) probed with 'tabs' returns 541
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010042 begin');
      const result: number | undefined = new SideBarMode<number>(42, 541).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('541'));
      expect(String(result)).assertEqual('541');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(42, 541).GetValue('list')), String('42'));
      expect(String(new SideBarMode<number>(42, 541).GetValue('list'))).assertEqual('42');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(42, 541).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(42, 541).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(42, 541).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(42, 541).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(42, 541).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(42, 541).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010042 end');
    });

    /**
     * @tc.name   testSbmTypeVol010043
     * @tc.number SUB_MNB_SBM_0463
     * @tc.desc   SideBarMode<number>(43/542) probed with 'list' returns 43
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010043 begin');
      const result: number | undefined = new SideBarMode<number>(43, 542).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('43'));
      expect(String(result)).assertEqual('43');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(43, 542).GetValue('tabs')), String('542'));
      expect(String(new SideBarMode<number>(43, 542).GetValue('tabs'))).assertEqual('542');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(43, 542).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(43, 542).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(43, 542).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(43, 542).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(43, 542).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(43, 542).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010043 end');
    });

    /**
     * @tc.name   testSbmTypeVol010044
     * @tc.number SUB_MNB_SBM_0464
     * @tc.desc   SideBarMode<number>(44/543) probed with 'tabs' returns 543
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010044 begin');
      const result: number | undefined = new SideBarMode<number>(44, 543).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('543'));
      expect(String(result)).assertEqual('543');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(44, 543).GetValue('list')), String('44'));
      expect(String(new SideBarMode<number>(44, 543).GetValue('list'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(44, 543).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(44, 543).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(44, 543).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(44, 543).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(44, 543).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(44, 543).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010044 end');
    });

    /**
     * @tc.name   testSbmTypeVol010045
     * @tc.number SUB_MNB_SBM_0465
     * @tc.desc   SideBarMode<number>(45/544) probed with 'list' returns 45
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010045 begin');
      const result: number | undefined = new SideBarMode<number>(45, 544).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('45'));
      expect(String(result)).assertEqual('45');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(45, 544).GetValue('tabs')), String('544'));
      expect(String(new SideBarMode<number>(45, 544).GetValue('tabs'))).assertEqual('544');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(45, 544).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(45, 544).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(45, 544).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(45, 544).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(45, 544).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(45, 544).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010045 end');
    });

    /**
     * @tc.name   testSbmTypeVol010046
     * @tc.number SUB_MNB_SBM_0466
     * @tc.desc   SideBarMode<number>(46/545) probed with 'tabs' returns 545
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010046 begin');
      const result: number | undefined = new SideBarMode<number>(46, 545).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('545'));
      expect(String(result)).assertEqual('545');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(46, 545).GetValue('list')), String('46'));
      expect(String(new SideBarMode<number>(46, 545).GetValue('list'))).assertEqual('46');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(46, 545).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(46, 545).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(46, 545).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(46, 545).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(46, 545).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(46, 545).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010046 end');
    });

    /**
     * @tc.name   testSbmTypeVol010047
     * @tc.number SUB_MNB_SBM_0467
     * @tc.desc   SideBarMode<number>(47/546) probed with 'list' returns 47
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010047 begin');
      const result: number | undefined = new SideBarMode<number>(47, 546).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('47'));
      expect(String(result)).assertEqual('47');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(47, 546).GetValue('tabs')), String('546'));
      expect(String(new SideBarMode<number>(47, 546).GetValue('tabs'))).assertEqual('546');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(47, 546).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(47, 546).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(47, 546).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(47, 546).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(47, 546).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(47, 546).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010047 end');
    });

    /**
     * @tc.name   testSbmTypeVol010048
     * @tc.number SUB_MNB_SBM_0468
     * @tc.desc   SideBarMode<number>(48/547) probed with 'tabs' returns 547
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010048 begin');
      const result: number | undefined = new SideBarMode<number>(48, 547).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('547'));
      expect(String(result)).assertEqual('547');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(48, 547).GetValue('list')), String('48'));
      expect(String(new SideBarMode<number>(48, 547).GetValue('list'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(48, 547).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(48, 547).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(48, 547).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(48, 547).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(48, 547).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(48, 547).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010048 end');
    });

    /**
     * @tc.name   testSbmTypeVol010049
     * @tc.number SUB_MNB_SBM_0469
     * @tc.desc   SideBarMode<number>(49/548) probed with 'list' returns 49
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010049 begin');
      const result: number | undefined = new SideBarMode<number>(49, 548).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('49'));
      expect(String(result)).assertEqual('49');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(49, 548).GetValue('tabs')), String('548'));
      expect(String(new SideBarMode<number>(49, 548).GetValue('tabs'))).assertEqual('548');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(49, 548).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(49, 548).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(49, 548).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(49, 548).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(49, 548).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(49, 548).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010049 end');
    });

    /**
     * @tc.name   testSbmTypeVol010050
     * @tc.number SUB_MNB_SBM_0470
     * @tc.desc   SideBarMode<number>(50/549) probed with 'tabs' returns 549
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010050 begin');
      const result: number | undefined = new SideBarMode<number>(50, 549).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('549'));
      expect(String(result)).assertEqual('549');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(50, 549).GetValue('list')), String('50'));
      expect(String(new SideBarMode<number>(50, 549).GetValue('list'))).assertEqual('50');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(50, 549).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(50, 549).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(50, 549).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(50, 549).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(50, 549).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(50, 549).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010050 end');
    });

    /**
     * @tc.name   testSbmTypeVol010051
     * @tc.number SUB_MNB_SBM_0471
     * @tc.desc   SideBarMode<number>(51/550) probed with 'list' returns 51
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010051 begin');
      const result: number | undefined = new SideBarMode<number>(51, 550).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('51'));
      expect(String(result)).assertEqual('51');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(51, 550).GetValue('tabs')), String('550'));
      expect(String(new SideBarMode<number>(51, 550).GetValue('tabs'))).assertEqual('550');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(51, 550).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(51, 550).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(51, 550).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(51, 550).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(51, 550).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(51, 550).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010051 end');
    });

    /**
     * @tc.name   testSbmTypeVol010052
     * @tc.number SUB_MNB_SBM_0472
     * @tc.desc   SideBarMode<number>(52/551) probed with 'tabs' returns 551
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010052 begin');
      const result: number | undefined = new SideBarMode<number>(52, 551).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('551'));
      expect(String(result)).assertEqual('551');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(52, 551).GetValue('list')), String('52'));
      expect(String(new SideBarMode<number>(52, 551).GetValue('list'))).assertEqual('52');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(52, 551).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(52, 551).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(52, 551).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(52, 551).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(52, 551).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(52, 551).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010052 end');
    });

    /**
     * @tc.name   testSbmTypeVol010053
     * @tc.number SUB_MNB_SBM_0473
     * @tc.desc   SideBarMode<number>(53/552) probed with 'list' returns 53
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010053 begin');
      const result: number | undefined = new SideBarMode<number>(53, 552).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('53'));
      expect(String(result)).assertEqual('53');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(53, 552).GetValue('tabs')), String('552'));
      expect(String(new SideBarMode<number>(53, 552).GetValue('tabs'))).assertEqual('552');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(53, 552).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(53, 552).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(53, 552).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(53, 552).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(53, 552).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(53, 552).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010053 end');
    });

    /**
     * @tc.name   testSbmTypeVol010054
     * @tc.number SUB_MNB_SBM_0474
     * @tc.desc   SideBarMode<number>(54/553) probed with 'tabs' returns 553
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010054 begin');
      const result: number | undefined = new SideBarMode<number>(54, 553).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('553'));
      expect(String(result)).assertEqual('553');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(54, 553).GetValue('list')), String('54'));
      expect(String(new SideBarMode<number>(54, 553).GetValue('list'))).assertEqual('54');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(54, 553).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(54, 553).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(54, 553).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(54, 553).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(54, 553).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(54, 553).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010054 end');
    });

    /**
     * @tc.name   testSbmTypeVol010055
     * @tc.number SUB_MNB_SBM_0475
     * @tc.desc   SideBarMode<number>(55/554) probed with 'list' returns 55
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010055 begin');
      const result: number | undefined = new SideBarMode<number>(55, 554).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('55'));
      expect(String(result)).assertEqual('55');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(55, 554).GetValue('tabs')), String('554'));
      expect(String(new SideBarMode<number>(55, 554).GetValue('tabs'))).assertEqual('554');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(55, 554).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(55, 554).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(55, 554).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(55, 554).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(55, 554).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(55, 554).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010055 end');
    });

    /**
     * @tc.name   testSbmTypeVol010056
     * @tc.number SUB_MNB_SBM_0476
     * @tc.desc   SideBarMode<number>(56/555) probed with 'tabs' returns 555
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010056 begin');
      const result: number | undefined = new SideBarMode<number>(56, 555).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('555'));
      expect(String(result)).assertEqual('555');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(56, 555).GetValue('list')), String('56'));
      expect(String(new SideBarMode<number>(56, 555).GetValue('list'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(56, 555).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(56, 555).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(56, 555).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(56, 555).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(56, 555).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(56, 555).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010056 end');
    });

    /**
     * @tc.name   testSbmTypeVol010057
     * @tc.number SUB_MNB_SBM_0477
     * @tc.desc   SideBarMode<number>(57/556) probed with 'list' returns 57
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010057 begin');
      const result: number | undefined = new SideBarMode<number>(57, 556).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('57'));
      expect(String(result)).assertEqual('57');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(57, 556).GetValue('tabs')), String('556'));
      expect(String(new SideBarMode<number>(57, 556).GetValue('tabs'))).assertEqual('556');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(57, 556).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(57, 556).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(57, 556).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(57, 556).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(57, 556).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(57, 556).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010057 end');
    });

    /**
     * @tc.name   testSbmTypeVol010058
     * @tc.number SUB_MNB_SBM_0478
     * @tc.desc   SideBarMode<number>(58/557) probed with 'tabs' returns 557
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010058 begin');
      const result: number | undefined = new SideBarMode<number>(58, 557).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('557'));
      expect(String(result)).assertEqual('557');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(58, 557).GetValue('list')), String('58'));
      expect(String(new SideBarMode<number>(58, 557).GetValue('list'))).assertEqual('58');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(58, 557).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(58, 557).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(58, 557).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(58, 557).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(58, 557).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(58, 557).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010058 end');
    });

    /**
     * @tc.name   testSbmTypeVol010059
     * @tc.number SUB_MNB_SBM_0479
     * @tc.desc   SideBarMode<number>(59/558) probed with 'list' returns 59
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010059 begin');
      const result: number | undefined = new SideBarMode<number>(59, 558).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('59'));
      expect(String(result)).assertEqual('59');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(59, 558).GetValue('tabs')), String('558'));
      expect(String(new SideBarMode<number>(59, 558).GetValue('tabs'))).assertEqual('558');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(59, 558).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(59, 558).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(59, 558).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(59, 558).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(59, 558).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(59, 558).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010059 end');
    });

    /**
     * @tc.name   testSbmTypeVol010060
     * @tc.number SUB_MNB_SBM_0480
     * @tc.desc   SideBarMode<number>(60/559) probed with 'tabs' returns 559
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010060 begin');
      const result: number | undefined = new SideBarMode<number>(60, 559).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('559'));
      expect(String(result)).assertEqual('559');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(60, 559).GetValue('list')), String('60'));
      expect(String(new SideBarMode<number>(60, 559).GetValue('list'))).assertEqual('60');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(60, 559).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(60, 559).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(60, 559).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(60, 559).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(60, 559).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(60, 559).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010060 end');
    });

    /**
     * @tc.name   testSbmTypeVol010061
     * @tc.number SUB_MNB_SBM_0481
     * @tc.desc   SideBarMode<number>(61/560) probed with 'list' returns 61
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010061 begin');
      const result: number | undefined = new SideBarMode<number>(61, 560).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('61'));
      expect(String(result)).assertEqual('61');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(61, 560).GetValue('tabs')), String('560'));
      expect(String(new SideBarMode<number>(61, 560).GetValue('tabs'))).assertEqual('560');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(61, 560).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(61, 560).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(61, 560).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(61, 560).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(61, 560).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(61, 560).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010061 end');
    });

    /**
     * @tc.name   testSbmTypeVol010062
     * @tc.number SUB_MNB_SBM_0482
     * @tc.desc   SideBarMode<number>(62/561) probed with 'tabs' returns 561
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010062 begin');
      const result: number | undefined = new SideBarMode<number>(62, 561).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('561'));
      expect(String(result)).assertEqual('561');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(62, 561).GetValue('list')), String('62'));
      expect(String(new SideBarMode<number>(62, 561).GetValue('list'))).assertEqual('62');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(62, 561).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(62, 561).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(62, 561).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(62, 561).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(62, 561).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(62, 561).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010062 end');
    });

    /**
     * @tc.name   testSbmTypeVol010063
     * @tc.number SUB_MNB_SBM_0483
     * @tc.desc   SideBarMode<number>(63/562) probed with 'list' returns 63
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010063 begin');
      const result: number | undefined = new SideBarMode<number>(63, 562).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('63'));
      expect(String(result)).assertEqual('63');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(63, 562).GetValue('tabs')), String('562'));
      expect(String(new SideBarMode<number>(63, 562).GetValue('tabs'))).assertEqual('562');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(63, 562).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(63, 562).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(63, 562).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(63, 562).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(63, 562).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(63, 562).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010063 end');
    });

    /**
     * @tc.name   testSbmTypeVol010064
     * @tc.number SUB_MNB_SBM_0484
     * @tc.desc   SideBarMode<number>(64/563) probed with 'tabs' returns 563
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010064 begin');
      const result: number | undefined = new SideBarMode<number>(64, 563).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('563'));
      expect(String(result)).assertEqual('563');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(64, 563).GetValue('list')), String('64'));
      expect(String(new SideBarMode<number>(64, 563).GetValue('list'))).assertEqual('64');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(64, 563).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(64, 563).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(64, 563).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(64, 563).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(64, 563).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(64, 563).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010064 end');
    });

    /**
     * @tc.name   testSbmTypeVol010065
     * @tc.number SUB_MNB_SBM_0485
     * @tc.desc   SideBarMode<number>(65/564) probed with 'list' returns 65
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010065 begin');
      const result: number | undefined = new SideBarMode<number>(65, 564).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('65'));
      expect(String(result)).assertEqual('65');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(65, 564).GetValue('tabs')), String('564'));
      expect(String(new SideBarMode<number>(65, 564).GetValue('tabs'))).assertEqual('564');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(65, 564).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(65, 564).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(65, 564).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(65, 564).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(65, 564).GetValue(' tab')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(65, 564).GetValue(' tab')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010065 end');
    });

    /**
     * @tc.name   testSbmTypeVol010066
     * @tc.number SUB_MNB_SBM_0486
     * @tc.desc   SideBarMode<number>(66/565) probed with 'tabs' returns 565
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010066 begin');
      const result: number | undefined = new SideBarMode<number>(66, 565).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('565'));
      expect(String(result)).assertEqual('565');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(66, 565).GetValue('list')), String('66'));
      expect(String(new SideBarMode<number>(66, 565).GetValue('list'))).assertEqual('66');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(66, 565).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(66, 565).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(66, 565).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(66, 565).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(66, 565).GetValue('vertical')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(66, 565).GetValue('vertical')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010066 end');
    });

    /**
     * @tc.name   testSbmTypeVol010067
     * @tc.number SUB_MNB_SBM_0487
     * @tc.desc   SideBarMode<number>(67/566) probed with 'list' returns 67
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010067 begin');
      const result: number | undefined = new SideBarMode<number>(67, 566).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('67'));
      expect(String(result)).assertEqual('67');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(67, 566).GetValue('tabs')), String('566'));
      expect(String(new SideBarMode<number>(67, 566).GetValue('tabs'))).assertEqual('566');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(67, 566).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(67, 566).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(67, 566).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(67, 566).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(67, 566).GetValue('0')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(67, 566).GetValue('0')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010067 end');
    });

    /**
     * @tc.name   testSbmTypeVol010068
     * @tc.number SUB_MNB_SBM_0488
     * @tc.desc   SideBarMode<number>(68/567) probed with 'tabs' returns 567
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010068 begin');
      const result: number | undefined = new SideBarMode<number>(68, 567).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('567'));
      expect(String(result)).assertEqual('567');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(68, 567).GetValue('list')), String('68'));
      expect(String(new SideBarMode<number>(68, 567).GetValue('list'))).assertEqual('68');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(68, 567).GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<number>(68, 567).GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(68, 567).GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<number>(68, 567).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(68, 567).GetValue('listtabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(68, 567).GetValue('listtabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010068 end');
    });

    /**
     * @tc.name   testSbmTypeVol010069
     * @tc.number SUB_MNB_SBM_0489
     * @tc.desc   SideBarMode<number>(69/568) probed with 'list' returns 69
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010069 begin');
      const result: number | undefined = new SideBarMode<number>(69, 568).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('69'));
      expect(String(result)).assertEqual('69');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(69, 568).GetValue('tabs')), String('568'));
      expect(String(new SideBarMode<number>(69, 568).GetValue('tabs'))).assertEqual('568');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(69, 568).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(69, 568).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(69, 568).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(69, 568).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(69, 568).GetValue('LIST')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(69, 568).GetValue('LIST')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010069 end');
    });

    /**
     * @tc.name   testSbmTypeVol010070
     * @tc.number SUB_MNB_SBM_0490
     * @tc.desc   SideBarMode<number>(70/569) probed with 'tabs' returns 569
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010070 begin');
      const result: number | undefined = new SideBarMode<number>(70, 569).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('569'));
      expect(String(result)).assertEqual('569');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(70, 569).GetValue('list')), String('70'));
      expect(String(new SideBarMode<number>(70, 569).GetValue('list'))).assertEqual('70');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(70, 569).GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<number>(70, 569).GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(70, 569).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(70, 569).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(70, 569).GetValue('lists')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(70, 569).GetValue('lists')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010070 end');
    });

    /**
     * @tc.name   testSbmTypeVol010071
     * @tc.number SUB_MNB_SBM_0491
     * @tc.desc   SideBarMode<number>(71/570) probed with 'list' returns 71
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010071 begin');
      const result: number | undefined = new SideBarMode<number>(71, 570).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('71'));
      expect(String(result)).assertEqual('71');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(71, 570).GetValue('tabs')), String('570'));
      expect(String(new SideBarMode<number>(71, 570).GetValue('tabs'))).assertEqual('570');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(71, 570).GetValue('')), String('undefined'));
      expect(String(new SideBarMode<number>(71, 570).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(71, 570).GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<number>(71, 570).GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(71, 570).GetValue('')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(71, 570).GetValue('')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010071 end');
    });

    /**
     * @tc.name   testSbmTypeVol010072
     * @tc.number SUB_MNB_SBM_0492
     * @tc.desc   SideBarMode<number>(72/571) probed with 'tabs' returns 571
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010072 begin');
      const result: number | undefined = new SideBarMode<number>(72, 571).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('571'));
      expect(String(result)).assertEqual('571');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(72, 571).GetValue('list')), String('72'));
      expect(String(new SideBarMode<number>(72, 571).GetValue('list'))).assertEqual('72');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(72, 571).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(72, 571).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(72, 571).GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<number>(72, 571).GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(72, 571).GetValue('List')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(72, 571).GetValue('List')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010072 end');
    });

    /**
     * @tc.name   testSbmTypeVol010073
     * @tc.number SUB_MNB_SBM_0493
     * @tc.desc   SideBarMode<number>(73/572) probed with 'list' returns 73
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010073 begin');
      const result: number | undefined = new SideBarMode<number>(73, 572).GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('73'));
      expect(String(result)).assertEqual('73');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(73, 572).GetValue('tabs')), String('572'));
      expect(String(new SideBarMode<number>(73, 572).GetValue('tabs'))).assertEqual('572');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(73, 572).GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<number>(73, 572).GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(73, 572).GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<number>(73, 572).GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(73, 572).GetValue('TABS')) === String(result)), String('false'));
      expect(String(String(new SideBarMode<number>(73, 572).GetValue('TABS')) === String(result))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010073 end');
    });

    /**
     * @tc.name   testSbmTypeVol010074
     * @tc.number SUB_MNB_SBM_0494
     * @tc.desc   SideBarMode<number>(74/573) probed with 'tabs' returns 573
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010074 begin');
      const result: number | undefined = new SideBarMode<number>(74, 573).GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('573'));
      expect(String(result)).assertEqual('573');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(74, 573).GetValue('list')), String('74'));
      expect(String(new SideBarMode<number>(74, 573).GetValue('list'))).assertEqual('74');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(74, 573).GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<number>(74, 573).GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<number>(74, 573).GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<number>(74, 573).GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<number>(74, 573).GetValue('tabs ')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<number>(74, 573).GetValue('tabs ')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010074 end');
    });

    /**
     * @tc.name   testSbmTypeVol010075
     * @tc.number SUB_MNB_SBM_0495
     * @tc.desc   Anchor: a zero slot is a real value, list must not collapse to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010075 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s tabs=%{public}s', String(sut.GetValue('list')),
        String(sut.GetValue('tabs')));
      expect(sut.GetValue('list')).assertEqual(0);
      expect(sut.GetValue('tabs')).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'\'))');
      expect(String(sut.GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol010075 end');
    });
  });
}
