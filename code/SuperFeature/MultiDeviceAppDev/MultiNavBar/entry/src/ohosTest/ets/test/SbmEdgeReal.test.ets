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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SideBarMode } from '../../../main/ets/common/BreakpointSystem';
import { SIDEBAR_LIST, SIDEBAR_TABS, NON_LIST_MODES, UNKNOWN_MODES } from '../util/NavSpec';

const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

/**
 * L1 cases for SideBarMode<T>.GetValue (common/BreakpointSystem.ets:50).
 * Only the two literals 'list' and 'tabs' select a slot; every other key returns undefined.
 */
export default function sbmEdgeRealTest() {
  describe('MultiNavBarSbmEdgeReal', () => {
    /**
     * @tc.name   testSbmReal0401
     * @tc.number SUB_MNB_SBM_0401
     * @tc.desc   GetValue('list') returns the list slot of a number pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSbmReal0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0401 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(12, 36);
      const actual: number = sut.GetValue(SIDEBAR_LIST) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(actual), '12');
      expect(actual).assertEqual(12);
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(36);
      expect(String(sut.GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0401 end');
    });

    /**
     * @tc.name   testSbmReal0402
     * @tc.number SUB_MNB_SBM_0402
     * @tc.desc   GetValue('tabs') returns the tabs slot of a string pair
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('testSbmReal0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0402 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start');
      const actual: string = sut.GetValue(SIDEBAR_TABS) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', actual, 'FlexAlign.Start');
      expect(actual).assertEqual('FlexAlign.Start');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual('FlexAlign.Center');
      expect(String(sut.GetValue('Tabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0402 end');
    });

    /**
     * @tc.name   testSbmReal0403
     * @tc.number SUB_MNB_SBM_0403
     * @tc.desc   The list and tabs slots stay distinct on the same instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0403 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('horizontal', 'vertical');
      const listValue: string = sut.GetValue(SIDEBAR_LIST) as string;
      const tabsValue: string = sut.GetValue(SIDEBAR_TABS) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s tabs=%{public}s', listValue, tabsValue);
      expect(listValue).assertEqual('horizontal');
      expect(tabsValue).assertEqual('vertical');
      expect(listValue === tabsValue).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0403 end');
    });

    /**
     * @tc.name   testSbmReal0404
     * @tc.number SUB_MNB_SBM_0404
     * @tc.desc   Anchor: an empty side bar mode resolves to undefined instead of a slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0404 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(0, 24);
      const raw: number | undefined = sut.GetValue('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(raw), 'undefined');
      expect(String(raw)).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(0);
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(24);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0404 end');
    });

    /**
     * @tc.name   testSbmReal0405
     * @tc.number SUB_MNB_SBM_0405
     * @tc.desc   Anchor: capitalised 'List' is not accepted because mode matching is case sensitive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0405 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(24, 0);
      const capitalised: number | undefined = sut.GetValue('List');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(capitalised), 'undefined');
      expect(String(capitalised)).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(24);
      expect(String(sut.GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0405 end');
    });

    /**
     * @tc.name   testSbmReal0406
     * @tc.number SUB_MNB_SBM_0406
     * @tc.desc   Anchor: trailing whitespace in 'tabs ' does not select the tabs slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0406 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(12, 24);
      const trailing: number | undefined = sut.GetValue('tabs ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(trailing), 'undefined');
      expect(String(trailing)).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(24);
      expect(String(sut.GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0406 end');
    });

    /**
     * @tc.name   testSbmReal0407
     * @tc.number SUB_MNB_SBM_0407
     * @tc.desc   A different orientation word such as 'vertical' is not a side bar mode
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0407 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('l', 't');
      const vertical: string | undefined = sut.GetValue('vertical');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'vertical=%{public}s', String(vertical));
      expect(String(vertical)).assertEqual('undefined');
      expect(String(sut.GetValue('horizontal'))).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual('l');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0407 end');
    });

    /**
     * @tc.name   testSbmReal0408
     * @tc.number SUB_MNB_SBM_0408
     * @tc.desc   A numeric string such as '0' is not coerced into the first slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0408 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(7, 9);
      const zeroKey: number | undefined = sut.GetValue('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'zero=%{public}s one=%{public}s', String(zeroKey), String(sut.GetValue('1')));
      expect(String(zeroKey)).assertEqual('undefined');
      expect(String(sut.GetValue('1'))).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0408 end');
    });

    /**
     * @tc.name   testSbmReal0409
     * @tc.number SUB_MNB_SBM_0409
     * @tc.desc   Extreme: a 96 character mode string resolves to undefined without throwing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0409 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(1, 2);
      const longKey: string = 'list'.repeat(24);
      const longValue: number | undefined = sut.GetValue(longKey);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'len=%{public}s actual=%{public}s', String(longKey.length), String(longValue));
      expect(String(longValue)).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(1);
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(2);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0409 end');
    });

    /**
     * @tc.name   testSbmReal0410
     * @tc.number SUB_MNB_SBM_0410
     * @tc.desc   Combination: SideBarMode<boolean> returns a false slot instead of collapsing to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0410 begin');
      const sut: SideBarMode<boolean> = new SideBarMode<boolean>(false, true);
      const listValue: boolean = sut.GetValue(SIDEBAR_LIST) as boolean;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s expected=%{public}s', String(listValue), 'false');
      expect(listValue).assertFalse();
      expect(sut.GetValue(SIDEBAR_TABS) as boolean).assertTrue();
      expect(String(sut.GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0410 end');
    });

    /**
     * @tc.name   testSbmReal0411
     * @tc.number SUB_MNB_SBM_0411
     * @tc.desc   Combination: SideBarMode<Array<number>> keeps each slot's content separate
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0411 begin');
      const sut: SideBarMode<Array<number>> = new SideBarMode<Array<number>>([24, 0], [0, 24]);
      const listJoin: string = (sut.GetValue(SIDEBAR_LIST) as Array<number>).join(',');
      const tabsJoin: string = (sut.GetValue(SIDEBAR_TABS) as Array<number>).join(',');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s tabs=%{public}s', listJoin, tabsJoin);
      expect(listJoin).assertEqual('24,0');
      expect(tabsJoin).assertEqual('0,24');
      expect(listJoin === tabsJoin).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0411 end');
    });

    /**
     * @tc.name   testSbmReal0412
     * @tc.number SUB_MNB_SBM_0412
     * @tc.desc   State: alternating list/tabs/list lookups always report the matching slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0412 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('L', 'T');
      const first: string = sut.GetValue(SIDEBAR_LIST) as string;
      const second: string = sut.GetValue(SIDEBAR_TABS) as string;
      const third: string = sut.GetValue(SIDEBAR_LIST) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'first=%{public}s second=%{public}s third=%{public}s', first, second, third);
      expect(first).assertEqual('L');
      expect(second).assertEqual('T');
      expect(third).assertEqual('L');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0412 end');
    });

    /**
     * @tc.name   testSbmReal0413
     * @tc.number SUB_MNB_SBM_0413
     * @tc.desc   State: an unknown mode lookup does not disturb the following valid lookup
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0413 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(5, 6);
      const bad: number | undefined = sut.GetValue('listtabs');
      const after: number = sut.GetValue(SIDEBAR_TABS) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'bad=%{public}s after=%{public}s', String(bad), String(after));
      expect(String(bad)).assertEqual('undefined');
      expect(after).assertEqual(6);
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(5);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0413 end');
    });

    /**
     * @tc.name   testSbmReal0414
     * @tc.number SUB_MNB_SBM_0414
     * @tc.desc   Combination: every probe in UNKNOWN_MODES resolves to undefined
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0414 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(10, 20);
      const resolved: string[] = [];
      for (let i: number = 0; i < UNKNOWN_MODES.length; i++) {
        const probe: string = UNKNOWN_MODES[i];
        if (sut.GetValue(probe) !== undefined) {
          resolved.push(probe);
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'unexpected=%{public}s', resolved.join('|'));
      expect(resolved.length).assertEqual(0);
      expect(UNKNOWN_MODES.length).assertEqual(9);
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(10);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0414 end');
    });

    /**
     * @tc.name   testSbmReal0415
     * @tc.number SUB_MNB_SBM_0415
     * @tc.desc   Combination: NON_LIST_MODES never selects the list slot
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0415 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('LIST-SLOT', 'TABS-SLOT');
      let listHits: number = 0;
      for (let i: number = 0; i < NON_LIST_MODES.length; i++) {
        if ((sut.GetValue(NON_LIST_MODES[i]) as string) === 'LIST-SLOT') {
          listHits++;
        }
      }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'listHits=%{public}s probes=%{public}s', String(listHits),
        String(NON_LIST_MODES.length));
      expect(listHits).assertEqual(0);
      expect(NON_LIST_MODES.length).assertEqual(9);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check sut.GetValue(SIDEBAR_TABS)');
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual('TABS-SLOT');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0415 end');
    });

    /**
     * @tc.name   testSbmReal0416
     * @tc.number SUB_MNB_SBM_0416
     * @tc.desc   Property: a three-state probe reports list, tabs and undefined in one pass
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0416 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('listValue', 'tabsValue');
      const listValue: string = sut.GetValue(SIDEBAR_LIST) as string;
      const tabsValue: string = sut.GetValue(SIDEBAR_TABS) as string;
      const missing: string | undefined = sut.GetValue('grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s tabs=%{public}s missing=%{public}s',
        listValue, tabsValue, String(missing));
      expect(listValue).assertEqual('listValue');
      expect(tabsValue).assertEqual('tabsValue');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(missing)');
      expect(String(missing)).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0416 end');
    });

    /**
     * @tc.name   testSbmReal0417
     * @tc.number SUB_MNB_SBM_0417
     * @tc.desc   Property: two slots holding the same value report that value for both keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0417 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(8, 8);
      const listValue: number = sut.GetValue(SIDEBAR_LIST) as number;
      const tabsValue: number = sut.GetValue(SIDEBAR_TABS) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s tabs=%{public}s', String(listValue), String(tabsValue));
      expect(listValue).assertEqual(8);
      expect(tabsValue).assertEqual(8);
      expect(String(sut.GetValue('grid'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0417 end');
    });

    /**
     * @tc.name   testSbmReal0418
     * @tc.number SUB_MNB_SBM_0418
     * @tc.desc   Boundary: a zero-valued list slot is returned rather than treated as missing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0418 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(0, 24);
      const listValue: number = sut.GetValue(SIDEBAR_LIST) as number;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=%{public}s expected=%{public}s', String(listValue), '0');
      expect(listValue).assertEqual(0);
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual(24);
      expect(String(sut.GetValue('list '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0418 end');
    });

    /**
     * @tc.name   testSbmReal0419
     * @tc.number SUB_MNB_SBM_0419
     * @tc.desc   Boundary: an empty string slot is returned rather than treated as missing
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmReal0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0419 begin');
      const sut: SideBarMode<string> = new SideBarMode<string>('', '100%');
      const listValue: string = sut.GetValue(SIDEBAR_LIST) as string;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'list=[%{public}s] tabs=%{public}s', listValue,
        sut.GetValue(SIDEBAR_TABS) as string);
      expect(listValue).assertEqual('');
      expect(sut.GetValue(SIDEBAR_TABS)).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check String(sut.GetValue(\'\'))');
      expect(String(sut.GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0419 end');
    });

    /**
     * @tc.name   testSbmReal0420
     * @tc.number SUB_MNB_SBM_0420
     * @tc.desc   Anchor: concatenated modes such as 'listtabs' do not partially match
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('testSbmReal0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0420 begin');
      const sut: SideBarMode<number> = new SideBarMode<number>(3, 4);
      const combined: number | undefined = sut.GetValue('listtabs');
      const prefixed: number | undefined = sut.GetValue('tabslist');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'combined=%{public}s prefixed=%{public}s', String(combined), String(prefixed));
      expect(String(combined)).assertEqual('undefined');
      expect(String(prefixed)).assertEqual('undefined');
      expect(sut.GetValue(SIDEBAR_LIST)).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmReal0420 end');
    });
  });
}
