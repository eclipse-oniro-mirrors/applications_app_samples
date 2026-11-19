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

export default function sbmTypeVol02BTest() {
  describe('MultiNavBarSbmTypeVol02B', () => {

    /**
     * @tc.name   testSbmTypeVol020039
     * @tc.number SUB_MNB_SBM_0534
     * @tc.desc   SideBarMode<string> pair #13 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020039 begin');
      const result: string | undefined = new SideBarMode<string>('grid', 'stack').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('stack'));
      expect(String(result)).assertEqual('stack');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue('list')), String('grid'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue('list'))).assertEqual('grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('grid', 'stack').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('grid', 'stack').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020039 end');
    });

    /**
     * @tc.name   testSbmTypeVol020040
     * @tc.number SUB_MNB_SBM_0535
     * @tc.desc   SideBarMode<string> pair #14 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020040 begin');
      const result: string | undefined = new SideBarMode<string>('row', 'column').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('row'));
      expect(String(result)).assertEqual('row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue('tabs')), String('column'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue('tabs'))).assertEqual('column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('row', 'column').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('row', 'column').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020040 end');
    });

    /**
     * @tc.name   testSbmTypeVol020041
     * @tc.number SUB_MNB_SBM_0536
     * @tc.desc   SideBarMode<string> pair #15 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020041 begin');
      const result: string | undefined = new SideBarMode<string>('primary', 'secondary').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('secondary'));
      expect(String(result)).assertEqual('secondary');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('list')), String('primary'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue('list'))).assertEqual('primary');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('primary', 'secondary').GetValue('list')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('primary', 'secondary').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020041 end');
    });

    /**
     * @tc.name   testSbmTypeVol020042
     * @tc.number SUB_MNB_SBM_0537
     * @tc.desc   SideBarMode<string> pair #16 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020042 begin');
      const result: string | undefined = new SideBarMode<string>('a', 'b').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(String(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('tabs')), String('b'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('tabs'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('a', 'b').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('a', 'b').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020042 end');
    });

    /**
     * @tc.name   testSbmTypeVol020043
     * @tc.number SUB_MNB_SBM_0538
     * @tc.desc   SideBarMode<string> pair #17 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020043 begin');
      const result: string | undefined = new SideBarMode<string>('0', '1').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('list')), String('0'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('list'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('0', '1').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('0', '1').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020043 end');
    });

    /**
     * @tc.name   testSbmTypeVol020044
     * @tc.number SUB_MNB_SBM_0539
     * @tc.desc   SideBarMode<string> pair #18 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020044 begin');
      const result: string | undefined = new SideBarMode<string>('true', 'false').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue('tabs')), String('false'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue('tabs'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('true', 'false').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('true', 'false').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020044 end');
    });

    /**
     * @tc.name   testSbmTypeVol020045
     * @tc.number SUB_MNB_SBM_0540
     * @tc.desc   SideBarMode<string> pair #19 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020045 begin');
      const result: string | undefined = new SideBarMode<string>('on', 'off').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('off'));
      expect(String(result)).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue('list')), String('on'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue('list'))).assertEqual('on');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('on', 'off').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('on', 'off').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020045 end');
    });

    /**
     * @tc.name   testSbmTypeVol020046
     * @tc.number SUB_MNB_SBM_0541
     * @tc.desc   SideBarMode<string> pair #20 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020046 begin');
      const result: string | undefined = new SideBarMode<string>('x', 'y').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x'));
      expect(String(result)).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('tabs')), String('y'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue('tabs'))).assertEqual('y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('x', 'y').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('x', 'y').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020046 end');
    });

    /**
     * @tc.name   testSbmTypeVol020047
     * @tc.number SUB_MNB_SBM_0542
     * @tc.desc   SideBarMode<string> pair #21 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020047 begin');
      const result: string | undefined = new SideBarMode<string>('first', 'last').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('last'));
      expect(String(result)).assertEqual('last');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('list')), String('first'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('list'))).assertEqual('first');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('first', 'last').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('first', 'last').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020047 end');
    });

    /**
     * @tc.name   testSbmTypeVol020048
     * @tc.number SUB_MNB_SBM_0543
     * @tc.desc   SideBarMode<string> pair #22 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020048 begin');
      const result: string | undefined = new SideBarMode<string>('begin', 'end').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('begin'));
      expect(String(result)).assertEqual('begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('tabs')), String('end'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('tabs'))).assertEqual('end');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('begin', 'end').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('begin', 'end').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020048 end');
    });

    /**
     * @tc.name   testSbmTypeVol020049
     * @tc.number SUB_MNB_SBM_0544
     * @tc.desc   SideBarMode<string> pair #23 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020049 begin');
      const result: string | undefined = new SideBarMode<string>('north', 'south').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('south'));
      expect(String(result)).assertEqual('south');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue('list')), String('north'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue('list'))).assertEqual('north');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('north', 'south').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('north', 'south').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020049 end');
    });

    /**
     * @tc.name   testSbmTypeVol020050
     * @tc.number SUB_MNB_SBM_0545
     * @tc.desc   SideBarMode<string> pair #24 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020050 begin');
      const result: string | undefined = new SideBarMode<string>('open', 'close').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('open'));
      expect(String(result)).assertEqual('open');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue('tabs')), String('close'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue('tabs'))).assertEqual('close');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('open', 'close').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('open', 'close').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020050 end');
    });

    /**
     * @tc.name   testSbmTypeVol020051
     * @tc.number SUB_MNB_SBM_0546
     * @tc.desc   SideBarMode<string> pair #0 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020051 begin');
      const result: string | undefined =
        new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('FlexAlign.Center'));
      expect(String(result)).assertEqual('FlexAlign.Center');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('tabs')),
        String('FlexAlign.Start'));
      expect(
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('tabs'))
      ).assertEqual('FlexAlign.Start');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('')), String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue(''))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('vertical')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('vertical'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(
          String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('tabs')) === String(result)
        ),
        String('false'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(
        String(
          String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('tabs')) === String(result)
        )
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020051 end');
    });

    /**
     * @tc.name   testSbmTypeVol020052
     * @tc.number SUB_MNB_SBM_0547
     * @tc.desc   SideBarMode<string> pair #1 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020052 begin');
      const result: string | undefined = new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('Axis.Vertical'));
      expect(String(result)).assertEqual('Axis.Vertical');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list')),
        String('Axis.Horizontal'));
      expect(
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list'))
      ).assertEqual('Axis.Horizontal');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('List')), String('undefined'));
      expect(
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('List'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('LIST')), String('undefined'));
      expect(
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('LIST'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020052 end');
    });

    /**
     * @tc.name   testSbmTypeVol020053
     * @tc.number SUB_MNB_SBM_0548
     * @tc.desc   SideBarMode<string> pair #2 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020053 begin');
      const result: string | undefined =
        new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('TextAlign.Center'));
      expect(String(result)).assertEqual('TextAlign.Center');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('tabs')),
        String('TextAlign.Start'));
      expect(
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('tabs'))
      ).assertEqual('TextAlign.Start');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('TABS')), String('undefined'));
      expect(
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('TABS'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('List')), String('undefined'));
      expect(
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('List'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(
          String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('tabs')) === String(result)
        ),
        String('false'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(
        String(
          String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('tabs')) === String(result)
        )
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020053 end');
    });

    /**
     * @tc.name   testSbmTypeVol020054
     * @tc.number SUB_MNB_SBM_0549
     * @tc.desc   SideBarMode<string> pair #3 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020054 begin');
      const result: string | undefined =
        new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result),
        String('FlexDirection.Row'));
      expect(String(result)).assertEqual('FlexDirection.Row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('list')),
        String('FlexDirection.Column'));
      expect(
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('list'))
      ).assertEqual('FlexDirection.Column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('tabs ')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('tabs '))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue(' tab')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue(' tab'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(
          String(
            new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('list')
          ) === String(result)
        ),
        String('false'));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check value');
      expect(
        String(
          String(
            new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('list')
          ) === String(result)
        )
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020054 end');
    });

    /**
     * @tc.name   testSbmTypeVol020055
     * @tc.number SUB_MNB_SBM_0550
     * @tc.desc   SideBarMode<string> pair #4 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020055 begin');
      const result: string | undefined = new SideBarMode<string>('', 'tabs').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue('tabs')), String('tabs'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue('tabs'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('', 'tabs').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('', 'tabs').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020055 end');
    });

    /**
     * @tc.name   testSbmTypeVol020056
     * @tc.number SUB_MNB_SBM_0551
     * @tc.desc   SideBarMode<string> pair #5 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020056 begin');
      const result: string | undefined = new SideBarMode<string>('list', '').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('list')), String('list'));
      expect(String(new SideBarMode<string>('list', '').GetValue('list'))).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('list', '').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('list', '').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('list', '').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('list', '').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020056 end');
    });

    /**
     * @tc.name   testSbmTypeVol020057
     * @tc.number SUB_MNB_SBM_0552
     * @tc.desc   SideBarMode<string> pair #6 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020057 begin');
      const result: string | undefined = new SideBarMode<string>('#0a59f7', '#182431').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#0a59f7'));
      expect(String(result)).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')), String('#182431'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs'))).assertEqual('#182431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020057 end');
    });

    /**
     * @tc.name   testSbmTypeVol020058
     * @tc.number SUB_MNB_SBM_0553
     * @tc.desc   SideBarMode<string> pair #7 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020058 begin');
      const result: string | undefined = new SideBarMode<string>('100%', '').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('list')), String('100%'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('list'))).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('100%', '').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('100%', '').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020058 end');
    });

    /**
     * @tc.name   testSbmTypeVol020059
     * @tc.number SUB_MNB_SBM_0554
     * @tc.desc   SideBarMode<string> pair #8 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020059 begin');
      const result: string | undefined = new SideBarMode<string>('left', 'right').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('left'));
      expect(String(result)).assertEqual('left');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue('tabs')), String('right'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue('tabs'))).assertEqual('right');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('left', 'right').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('left', 'right').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020059 end');
    });

    /**
     * @tc.name   testSbmTypeVol020060
     * @tc.number SUB_MNB_SBM_0555
     * @tc.desc   SideBarMode<string> pair #9 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020060 begin');
      const result: string | undefined = new SideBarMode<string>('top', 'bottom').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('bottom'));
      expect(String(result)).assertEqual('bottom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue('list')), String('top'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue('list'))).assertEqual('top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('top', 'bottom').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('top', 'bottom').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020060 end');
    });

    /**
     * @tc.name   testSbmTypeVol020061
     * @tc.number SUB_MNB_SBM_0556
     * @tc.desc   SideBarMode<string> pair #10 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020061 begin');
      const result: string | undefined = new SideBarMode<string>('compact', 'wide').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('compact'));
      expect(String(result)).assertEqual('compact');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')), String('wide'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs'))).assertEqual('wide');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020061 end');
    });

    /**
     * @tc.name   testSbmTypeVol020062
     * @tc.number SUB_MNB_SBM_0557
     * @tc.desc   SideBarMode<string> pair #11 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020062 begin');
      const result: string | undefined = new SideBarMode<string>('sm', 'lg').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lg'));
      expect(String(result)).assertEqual('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('list')), String('sm'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('list'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('sm', 'lg').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('sm', 'lg').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020062 end');
    });

    /**
     * @tc.name   testSbmTypeVol020063
     * @tc.number SUB_MNB_SBM_0558
     * @tc.desc   SideBarMode<string> pair #12 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020063 begin');
      const result: string | undefined = new SideBarMode<string>('list', 'tabs').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('list'));
      expect(String(result)).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')), String('tabs'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020063 end');
    });

    /**
     * @tc.name   testSbmTypeVol020064
     * @tc.number SUB_MNB_SBM_0559
     * @tc.desc   SideBarMode<string> pair #13 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020064 begin');
      const result: string | undefined = new SideBarMode<string>('grid', 'stack').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('stack'));
      expect(String(result)).assertEqual('stack');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue('list')), String('grid'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue('list'))).assertEqual('grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('grid', 'stack').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('grid', 'stack').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('grid', 'stack').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('grid', 'stack').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020064 end');
    });

    /**
     * @tc.name   testSbmTypeVol020065
     * @tc.number SUB_MNB_SBM_0560
     * @tc.desc   SideBarMode<string> pair #14 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020065 begin');
      const result: string | undefined = new SideBarMode<string>('row', 'column').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('row'));
      expect(String(result)).assertEqual('row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue('tabs')), String('column'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue('tabs'))).assertEqual('column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('row', 'column').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('row', 'column').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('row', 'column').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('row', 'column').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020065 end');
    });

    /**
     * @tc.name   testSbmTypeVol020066
     * @tc.number SUB_MNB_SBM_0561
     * @tc.desc   SideBarMode<string> pair #15 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020066 begin');
      const result: string | undefined = new SideBarMode<string>('primary', 'secondary').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('secondary'));
      expect(String(result)).assertEqual('secondary');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('list')), String('primary'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue('list'))).assertEqual('primary');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('primary', 'secondary').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('primary', 'secondary').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('primary', 'secondary').GetValue('list')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('primary', 'secondary').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020066 end');
    });

    /**
     * @tc.name   testSbmTypeVol020067
     * @tc.number SUB_MNB_SBM_0562
     * @tc.desc   SideBarMode<string> pair #16 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020067 begin');
      const result: string | undefined = new SideBarMode<string>('a', 'b').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(String(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('tabs')), String('b'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('tabs'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('a', 'b').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('a', 'b').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('a', 'b').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('a', 'b').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020067 end');
    });

    /**
     * @tc.name   testSbmTypeVol020068
     * @tc.number SUB_MNB_SBM_0563
     * @tc.desc   SideBarMode<string> pair #17 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020068 begin');
      const result: string | undefined = new SideBarMode<string>('0', '1').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('list')), String('0'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('list'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('0', '1').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('0', '1').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('0', '1').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('0', '1').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020068 end');
    });

    /**
     * @tc.name   testSbmTypeVol020069
     * @tc.number SUB_MNB_SBM_0564
     * @tc.desc   SideBarMode<string> pair #18 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020069 begin');
      const result: string | undefined = new SideBarMode<string>('true', 'false').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue('tabs')), String('false'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue('tabs'))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('true', 'false').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('true', 'false').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('true', 'false').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('true', 'false').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020069 end');
    });

    /**
     * @tc.name   testSbmTypeVol020070
     * @tc.number SUB_MNB_SBM_0565
     * @tc.desc   SideBarMode<string> pair #19 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020070 begin');
      const result: string | undefined = new SideBarMode<string>('on', 'off').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('off'));
      expect(String(result)).assertEqual('off');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue('list')), String('on'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue('list'))).assertEqual('on');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('on', 'off').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('on', 'off').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('on', 'off').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('on', 'off').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020070 end');
    });

    /**
     * @tc.name   testSbmTypeVol020071
     * @tc.number SUB_MNB_SBM_0566
     * @tc.desc   SideBarMode<string> pair #20 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020071 begin');
      const result: string | undefined = new SideBarMode<string>('x', 'y').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x'));
      expect(String(result)).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('tabs')), String('y'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue('tabs'))).assertEqual('y');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('x', 'y').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('x', 'y').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('x', 'y').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('x', 'y').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020071 end');
    });

    /**
     * @tc.name   testSbmTypeVol020072
     * @tc.number SUB_MNB_SBM_0567
     * @tc.desc   SideBarMode<string> pair #21 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020072 begin');
      const result: string | undefined = new SideBarMode<string>('first', 'last').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('last'));
      expect(String(result)).assertEqual('last');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('list')), String('first'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('list'))).assertEqual('first');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('first', 'last').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('first', 'last').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('first', 'last').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('first', 'last').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020072 end');
    });

    /**
     * @tc.name   testSbmTypeVol020073
     * @tc.number SUB_MNB_SBM_0568
     * @tc.desc   SideBarMode<string> pair #22 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020073 begin');
      const result: string | undefined = new SideBarMode<string>('begin', 'end').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('begin'));
      expect(String(result)).assertEqual('begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('tabs')), String('end'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('tabs'))).assertEqual('end');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('begin', 'end').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('begin', 'end').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('begin', 'end').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('begin', 'end').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020073 end');
    });

    /**
     * @tc.name   testSbmTypeVol020074
     * @tc.number SUB_MNB_SBM_0569
     * @tc.desc   SideBarMode<string> pair #23 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020074 begin');
      const result: string | undefined = new SideBarMode<string>('north', 'south').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('south'));
      expect(String(result)).assertEqual('south');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue('list')), String('north'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue('list'))).assertEqual('north');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('north', 'south').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('north', 'south').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('north', 'south').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('north', 'south').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020074 end');
    });

    /**
     * @tc.name   testSbmTypeVol020075
     * @tc.number SUB_MNB_SBM_0570
     * @tc.desc   Anchor: two empty string slots are still positional values, not undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020075 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=[%{public}s] tabs=[%{public}s]', String(sut.GetValue('list')),
        String(sut.GetValue('tabs')));
      expect(String(sut.GetValue('list'))).assertEqual('');
      expect(String(sut.GetValue('tabs'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'LIST\'))');
      expect(String(sut.GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020075 end');
    });
  });
}
