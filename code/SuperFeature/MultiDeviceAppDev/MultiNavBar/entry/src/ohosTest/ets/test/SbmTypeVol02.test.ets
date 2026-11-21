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

// @volume rule=input-value basis=main-frozen cases=38
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SideBarMode } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sbmTypeVol02Test() {
  describe('MultiNavBarSbmTypeVol02', () => {

    /**
     * @tc.name   testSbmTypeVol020001
     * @tc.number SUB_MNB_SBM_0496
     * @tc.desc   SideBarMode<string> pair #0 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020001 end');
    });

    /**
     * @tc.name   testSbmTypeVol020002
     * @tc.number SUB_MNB_SBM_0497
     * @tc.desc   SideBarMode<string> pair #1 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020002 end');
    });

    /**
     * @tc.name   testSbmTypeVol020003
     * @tc.number SUB_MNB_SBM_0498
     * @tc.desc   SideBarMode<string> pair #2 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020003 end');
    });

    /**
     * @tc.name   testSbmTypeVol020004
     * @tc.number SUB_MNB_SBM_0499
     * @tc.desc   SideBarMode<string> pair #3 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020004 end');
    });

    /**
     * @tc.name   testSbmTypeVol020005
     * @tc.number SUB_MNB_SBM_0500
     * @tc.desc   SideBarMode<string> pair #4 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020005 end');
    });

    /**
     * @tc.name   testSbmTypeVol020006
     * @tc.number SUB_MNB_SBM_0501
     * @tc.desc   SideBarMode<string> pair #5 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020006 end');
    });

    /**
     * @tc.name   testSbmTypeVol020007
     * @tc.number SUB_MNB_SBM_0502
     * @tc.desc   SideBarMode<string> pair #6 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020007 end');
    });

    /**
     * @tc.name   testSbmTypeVol020008
     * @tc.number SUB_MNB_SBM_0503
     * @tc.desc   SideBarMode<string> pair #7 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020008 end');
    });

    /**
     * @tc.name   testSbmTypeVol020009
     * @tc.number SUB_MNB_SBM_0504
     * @tc.desc   SideBarMode<string> pair #8 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020009 end');
    });

    /**
     * @tc.name   testSbmTypeVol020010
     * @tc.number SUB_MNB_SBM_0505
     * @tc.desc   SideBarMode<string> pair #9 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020010 end');
    });

    /**
     * @tc.name   testSbmTypeVol020011
     * @tc.number SUB_MNB_SBM_0506
     * @tc.desc   SideBarMode<string> pair #10 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020011 end');
    });

    /**
     * @tc.name   testSbmTypeVol020012
     * @tc.number SUB_MNB_SBM_0507
     * @tc.desc   SideBarMode<string> pair #11 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020012 end');
    });

    /**
     * @tc.name   testSbmTypeVol020013
     * @tc.number SUB_MNB_SBM_0508
     * @tc.desc   SideBarMode<string> pair #12 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020013 end');
    });

    /**
     * @tc.name   testSbmTypeVol020014
     * @tc.number SUB_MNB_SBM_0509
     * @tc.desc   SideBarMode<string> pair #13 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020014 end');
    });

    /**
     * @tc.name   testSbmTypeVol020015
     * @tc.number SUB_MNB_SBM_0510
     * @tc.desc   SideBarMode<string> pair #14 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020015 end');
    });

    /**
     * @tc.name   testSbmTypeVol020016
     * @tc.number SUB_MNB_SBM_0511
     * @tc.desc   SideBarMode<string> pair #15 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020016 end');
    });

    /**
     * @tc.name   testSbmTypeVol020017
     * @tc.number SUB_MNB_SBM_0512
     * @tc.desc   SideBarMode<string> pair #16 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020017 end');
    });

    /**
     * @tc.name   testSbmTypeVol020018
     * @tc.number SUB_MNB_SBM_0513
     * @tc.desc   SideBarMode<string> pair #17 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020018 end');
    });

    /**
     * @tc.name   testSbmTypeVol020019
     * @tc.number SUB_MNB_SBM_0514
     * @tc.desc   SideBarMode<string> pair #18 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020019 end');
    });

    /**
     * @tc.name   testSbmTypeVol020020
     * @tc.number SUB_MNB_SBM_0515
     * @tc.desc   SideBarMode<string> pair #19 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020020 end');
    });

    /**
     * @tc.name   testSbmTypeVol020021
     * @tc.number SUB_MNB_SBM_0516
     * @tc.desc   SideBarMode<string> pair #20 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020021 end');
    });

    /**
     * @tc.name   testSbmTypeVol020022
     * @tc.number SUB_MNB_SBM_0517
     * @tc.desc   SideBarMode<string> pair #21 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020022 end');
    });

    /**
     * @tc.name   testSbmTypeVol020023
     * @tc.number SUB_MNB_SBM_0518
     * @tc.desc   SideBarMode<string> pair #22 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020023 end');
    });

    /**
     * @tc.name   testSbmTypeVol020024
     * @tc.number SUB_MNB_SBM_0519
     * @tc.desc   SideBarMode<string> pair #23 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020024 end');
    });

    /**
     * @tc.name   testSbmTypeVol020025
     * @tc.number SUB_MNB_SBM_0520
     * @tc.desc   SideBarMode<string> pair #24 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020025 begin');
      const result: string | undefined = new SideBarMode<string>('open', 'close').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('open'));
      expect(String(result)).assertEqual('open');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue('tabs')), String('close'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue('tabs'))).assertEqual('close');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('open', 'close').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('open', 'close').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('open', 'close').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('open', 'close').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020025 end');
    });

    /**
     * @tc.name   testSbmTypeVol020026
     * @tc.number SUB_MNB_SBM_0521
     * @tc.desc   SideBarMode<string> pair #0 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020026 begin');
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
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('vertical')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('vertical'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue('')), String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexAlign.Center', 'FlexAlign.Start').GetValue(''))
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020026 end');
    });

    /**
     * @tc.name   testSbmTypeVol020027
     * @tc.number SUB_MNB_SBM_0522
     * @tc.desc   SideBarMode<string> pair #1 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020027 begin');
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
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('0')), String('undefined'));
      expect(
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('0'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('tabs ')), String('undefined'));
      expect(
        String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('tabs '))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('Axis.Horizontal', 'Axis.Vertical').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020027 end');
    });

    /**
     * @tc.name   testSbmTypeVol020028
     * @tc.number SUB_MNB_SBM_0523
     * @tc.desc   SideBarMode<string> pair #2 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020028 begin');
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
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('listtabs')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('listtabs'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('0')), String('undefined'));
      expect(
        String(new SideBarMode<string>('TextAlign.Center', 'TextAlign.Start').GetValue('0'))
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020028 end');
    });

    /**
     * @tc.name   testSbmTypeVol020029
     * @tc.number SUB_MNB_SBM_0524
     * @tc.desc   SideBarMode<string> pair #3 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020029 begin');
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
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('LIST')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('LIST'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('lists')),
        String('undefined'));
      expect(
        String(new SideBarMode<string>('FlexDirection.Column', 'FlexDirection.Row').GetValue('lists'))
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020029 end');
    });

    /**
     * @tc.name   testSbmTypeVol020030
     * @tc.number SUB_MNB_SBM_0525
     * @tc.desc   SideBarMode<string> pair #4 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020030 begin');
      const result: string | undefined = new SideBarMode<string>('', 'tabs').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue('tabs')), String('tabs'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue('tabs'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue('lists')), String('undefined'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue('lists'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('', 'tabs').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('', 'tabs').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('', 'tabs').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('', 'tabs').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020030 end');
    });

    /**
     * @tc.name   testSbmTypeVol020031
     * @tc.number SUB_MNB_SBM_0526
     * @tc.desc   SideBarMode<string> pair #5 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020031 begin');
      const result: string | undefined = new SideBarMode<string>('list', '').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('list')), String('list'));
      expect(String(new SideBarMode<string>('list', '').GetValue('list'))).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('list', '').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', '').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('list', '').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('list', '').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('list', '').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020031 end');
    });

    /**
     * @tc.name   testSbmTypeVol020032
     * @tc.number SUB_MNB_SBM_0527
     * @tc.desc   SideBarMode<string> pair #6 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020032 begin');
      const result: string | undefined = new SideBarMode<string>('#0a59f7', '#182431').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#0a59f7'));
      expect(String(result)).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')), String('#182431'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs'))).assertEqual('#182431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('LIST')), String('undefined'));
      expect(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('LIST'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('#0a59f7', '#182431').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020032 end');
    });

    /**
     * @tc.name   testSbmTypeVol020033
     * @tc.number SUB_MNB_SBM_0528
     * @tc.desc   SideBarMode<string> pair #7 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020033 begin');
      const result: string | undefined = new SideBarMode<string>('100%', '').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String(''));
      expect(String(result)).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('list')), String('100%'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('list'))).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('TABS')), String('undefined'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('TABS'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('100%', '').GetValue('List')), String('undefined'));
      expect(String(new SideBarMode<string>('100%', '').GetValue('List'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('100%', '').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('100%', '').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020033 end');
    });

    /**
     * @tc.name   testSbmTypeVol020034
     * @tc.number SUB_MNB_SBM_0529
     * @tc.desc   SideBarMode<string> pair #8 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020034 begin');
      const result: string | undefined = new SideBarMode<string>('left', 'right').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('left'));
      expect(String(result)).assertEqual('left');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue('tabs')), String('right'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue('tabs'))).assertEqual('right');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('left', 'right').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('left', 'right').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('left', 'right').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('left', 'right').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020034 end');
    });

    /**
     * @tc.name   testSbmTypeVol020035
     * @tc.number SUB_MNB_SBM_0530
     * @tc.desc   SideBarMode<string> pair #9 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020035 begin');
      const result: string | undefined = new SideBarMode<string>('top', 'bottom').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('bottom'));
      expect(String(result)).assertEqual('bottom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue('list')), String('top'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue('list'))).assertEqual('top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue(' tab')), String('undefined'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue(' tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('top', 'bottom').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('top', 'bottom').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('top', 'bottom').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('top', 'bottom').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020035 end');
    });

    /**
     * @tc.name   testSbmTypeVol020036
     * @tc.number SUB_MNB_SBM_0531
     * @tc.desc   SideBarMode<string> pair #10 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020036 begin');
      const result: string | undefined = new SideBarMode<string>('compact', 'wide').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('compact'));
      expect(String(result)).assertEqual('compact');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')), String('wide'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs'))).assertEqual('wide');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('vertical')), String('undefined'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue('vertical'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('compact', 'wide').GetValue('')), String('undefined'));
      expect(String(new SideBarMode<string>('compact', 'wide').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')) === String(result)),
        String('false'));
      expect(
        String(String(new SideBarMode<string>('compact', 'wide').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020036 end');
    });

    /**
     * @tc.name   testSbmTypeVol020037
     * @tc.number SUB_MNB_SBM_0532
     * @tc.desc   SideBarMode<string> pair #11 probed with 'tabs'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020037 begin');
      const result: string | undefined = new SideBarMode<string>('sm', 'lg').GetValue('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('lg'));
      expect(String(result)).assertEqual('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('list')), String('sm'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('list'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('sm', 'lg').GetValue('tabs ')), String('undefined'));
      expect(String(new SideBarMode<string>('sm', 'lg').GetValue('tabs '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('sm', 'lg').GetValue('list')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('sm', 'lg').GetValue('list')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020037 end');
    });

    /**
     * @tc.name   testSbmTypeVol020038
     * @tc.number SUB_MNB_SBM_0533
     * @tc.desc   SideBarMode<string> pair #12 probed with 'list'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSbmTypeVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020038 begin');
      const result: string | undefined = new SideBarMode<string>('list', 'tabs').GetValue('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('list'));
      expect(String(result)).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')), String('tabs'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('listtabs')), String('undefined'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('listtabs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new SideBarMode<string>('list', 'tabs').GetValue('0')), String('undefined'));
      expect(String(new SideBarMode<string>('list', 'tabs').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')) === String(result)), String('false'));
      expect(
        String(String(new SideBarMode<string>('list', 'tabs').GetValue('tabs')) === String(result))
      ).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSbmTypeVol020038 end');
    });

  });
}
