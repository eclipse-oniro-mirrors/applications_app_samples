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
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function bptTypeVol02Test() {
  describe('MultiNavBarBptTypeVol02', () => {

    /**
     * @tc.name   testBptTypeVol020001
     * @tc.number SUB_MNB_BPT_0098
     * @tc.desc   BreakpointType<string> triple #0 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020001 begin');
      const result: string | undefined = new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-home'));
      expect(String(result)).assertEqual('nav-home');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md')), String('nav-app'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md'))
      ).assertEqual('nav-app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('lg')), String('nav-game'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('lg'))
      ).assertEqual('nav-game');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue(''))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('xs')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('xs'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020001 end');
    });

    /**
     * @tc.name   testBptTypeVol020002
     * @tc.number SUB_MNB_BPT_0099
     * @tc.desc   BreakpointType<string> triple #1 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020002 begin');
      const result: string | undefined = new BreakpointType<string>('', 'b', 'c').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('b'));
      expect(String(result)).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('sm')), String(''));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('sm'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('lg')), String('c'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('lg'))).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020002 end');
    });

    /**
     * @tc.name   testBptTypeVol020003
     * @tc.number SUB_MNB_BPT_0100
     * @tc.desc   BreakpointType<string> triple #2 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020003 begin');
      const result: string | undefined = new BreakpointType<string>('x', '', 'z').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('z'));
      expect(String(result)).assertEqual('z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('sm')), String('x'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('sm'))).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('md')), String(''));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('md'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020003 end');
    });

    /**
     * @tc.name   testBptTypeVol020004
     * @tc.number SUB_MNB_BPT_0101
     * @tc.desc   BreakpointType<string> triple #3 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020004 begin');
      const result: string | undefined = new BreakpointType<string>('a', 'b', '').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a'));
      expect(String(result)).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('md')), String('b'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('md'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('lg')), String(''));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('lg'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020004 end');
    });

    /**
     * @tc.name   testBptTypeVol020005
     * @tc.number SUB_MNB_BPT_0102
     * @tc.desc   BreakpointType<string> triple #4 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020005 begin');
      const result: string | undefined = new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tab-1'));
      expect(String(result)).assertEqual('tab-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('sm')), String('tab-0'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('sm'))).assertEqual('tab-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg')), String('tab-2'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg'))).assertEqual('tab-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020005 end');
    });

    /**
     * @tc.name   testBptTypeVol020006
     * @tc.number SUB_MNB_BPT_0103
     * @tc.desc   BreakpointType<string> triple #5 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020006 begin');
      const result: string | undefined = new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#fff'));
      expect(String(result)).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('sm')), String('#0a59f7'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('sm'))).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md')), String('#182431'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md'))).assertEqual('#182431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('smlg')), String('undefined'));
      expect(
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('smlg'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020006 end');
    });

    /**
     * @tc.name   testBptTypeVol020007
     * @tc.number SUB_MNB_BPT_0104
     * @tc.desc   BreakpointType<string> triple #6 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020007 begin');
      const result: string | undefined = new BreakpointType<string>('56vp', '100%', '20%').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56vp'));
      expect(String(result)).assertEqual('56vp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md')), String('100%'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md'))).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('lg')), String('20%'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('lg'))).assertEqual('20%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020007 end');
    });

    /**
     * @tc.name   testBptTypeVol020008
     * @tc.number SUB_MNB_BPT_0105
     * @tc.desc   BreakpointType<string> triple #7 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020008 begin');
      const result: string | undefined = new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('fff'));
      expect(String(result)).assertEqual('fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('sm')), String('f1f3f5'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('sm'))).assertEqual('f1f3f5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('lg')), String('#fff'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('lg'))).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020008 end');
    });

    /**
     * @tc.name   testBptTypeVol020009
     * @tc.number SUB_MNB_BPT_0106
     * @tc.desc   BreakpointType<string> triple #8 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020009 begin');
      const result: string | undefined = new BreakpointType<string>('list', 'tabs', 'sm').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('sm'));
      expect(String(result)).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm')), String('list'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm'))).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md')), String('tabs'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020009 end');
    });

    /**
     * @tc.name   testBptTypeVol020010
     * @tc.number SUB_MNB_BPT_0107
     * @tc.desc   BreakpointType<string> triple #9 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020010 begin');
      const result: string | undefined = new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('sm'));
      expect(String(result)).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md')), String('md'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md'))).assertEqual('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('lg')), String('lg'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('lg'))).assertEqual('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020010 end');
    });

    /**
     * @tc.name   testBptTypeVol020011
     * @tc.number SUB_MNB_BPT_0108
     * @tc.desc   BreakpointType<string> triple #10 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020011 begin');
      const result: string | undefined = new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('RIGHT'));
      expect(String(result)).assertEqual('RIGHT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm')), String('LEFT'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm'))).assertEqual('LEFT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('lg')), String('CENTER'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('lg'))).assertEqual('CENTER');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020011 end');
    });

    /**
     * @tc.name   testBptTypeVol020012
     * @tc.number SUB_MNB_BPT_0109
     * @tc.desc   BreakpointType<string> triple #11 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020012 begin');
      const result: string | undefined = new BreakpointType<string>('top', 'bottom', 'middle').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('middle'));
      expect(String(result)).assertEqual('middle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('sm')), String('top'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('sm'))).assertEqual('top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md')), String('bottom'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md'))).assertEqual('bottom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020012 end');
    });

    /**
     * @tc.name   testBptTypeVol020013
     * @tc.number SUB_MNB_BPT_0110
     * @tc.desc   BreakpointType<string> triple #12 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020013 begin');
      const result: string | undefined = new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a b'));
      expect(String(result)).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md')), String('a  b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md'))).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('lg')), String(' a b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('lg'))).assertEqual(' a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020013 end');
    });

    /**
     * @tc.name   testBptTypeVol020014
     * @tc.number SUB_MNB_BPT_0111
     * @tc.desc   BreakpointType<string> triple #13 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020014 begin');
      const result: string | undefined = new BreakpointType<string>('0', '1', '2').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('sm')), String('0'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('sm'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('lg')), String('2'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('lg'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('0', '1', '2').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('0', '1', '2').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020014 end');
    });

    /**
     * @tc.name   testBptTypeVol020015
     * @tc.number SUB_MNB_BPT_0112
     * @tc.desc   BreakpointType<string> triple #14 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020015 begin');
      const result: string | undefined = new BreakpointType<string>('-1', '-2', '-3').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('-3'));
      expect(String(result)).assertEqual('-3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('sm')), String('-1'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('sm'))).assertEqual('-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md')), String('-2'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md'))).assertEqual('-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('-1', '-2', '-3').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020015 end');
    });

    /**
     * @tc.name   testBptTypeVol020016
     * @tc.number SUB_MNB_BPT_0113
     * @tc.desc   BreakpointType<string> triple #15 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020016 begin');
      const result: string | undefined = new BreakpointType<string>('v1', 'v2', 'v3').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('v1'));
      expect(String(result)).assertEqual('v1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('md')), String('v2'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('md'))).assertEqual('v2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg')), String('v3'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('lg'))).assertEqual('v3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('v1', 'v2', 'v3').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020016 end');
    });

    /**
     * @tc.name   testBptTypeVol020017
     * @tc.number SUB_MNB_BPT_0114
     * @tc.desc   BreakpointType<string> triple #16 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020017 begin');
      const result: string | undefined = new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('beta'));
      expect(String(result)).assertEqual('beta');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('sm')), String('alpha'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('sm'))).assertEqual('alpha');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg')), String('gamma'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg'))).assertEqual('gamma');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('alpha', 'beta', 'gamma').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020017 end');
    });

    /**
     * @tc.name   testBptTypeVol020018
     * @tc.number SUB_MNB_BPT_0115
     * @tc.desc   BreakpointType<string> triple #17 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020018 begin');
      const result: string | undefined = new BreakpointType<string>('one', 'two', 'three').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('three'));
      expect(String(result)).assertEqual('three');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('sm')), String('one'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('sm'))).assertEqual('one');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('md')), String('two'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('md'))).assertEqual('two');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('one', 'two', 'three').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('one', 'two', 'three').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020018 end');
    });

    /**
     * @tc.name   testBptTypeVol020019
     * @tc.number SUB_MNB_BPT_0116
     * @tc.desc   BreakpointType<string> triple #18 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020019 begin');
      const result: string | undefined = new BreakpointType<string>('row', 'column', 'stack').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('row'));
      expect(String(result)).assertEqual('row');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md')), String('column'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md'))).assertEqual('column');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('lg')), String('stack'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('lg'))).assertEqual('stack');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('row', 'column', 'stack').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020019 end');
    });

    /**
     * @tc.name   testBptTypeVol020020
     * @tc.number SUB_MNB_BPT_0117
     * @tc.desc   BreakpointType<string> triple #19 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020020 begin');
      const result: string | undefined = new BreakpointType<string>('start', 'center', 'end').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('center'));
      expect(String(result)).assertEqual('center');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('sm')), String('start'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('sm'))).assertEqual('start');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('lg')), String('end'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('lg'))).assertEqual('end');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('start', 'center', 'end').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('start', 'center', 'end').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020020 end');
    });

    /**
     * @tc.name   testBptTypeVol020021
     * @tc.number SUB_MNB_BPT_0118
     * @tc.desc   BreakpointType<string> triple #20 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020021 begin');
      const result: string | undefined = new BreakpointType<string>('p', 'q', 'r').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('r'));
      expect(String(result)).assertEqual('r');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm')), String('p'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('sm'))).assertEqual('p');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('md')), String('q'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('md'))).assertEqual('q');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('p', 'q', 'r').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('p', 'q', 'r').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020021 end');
    });

    /**
     * @tc.name   testBptTypeVol020022
     * @tc.number SUB_MNB_BPT_0119
     * @tc.desc   BreakpointType<string> triple #21 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020022 begin');
      const result: string | undefined = new BreakpointType<string>('k1', 'k2', 'k3').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('k1'));
      expect(String(result)).assertEqual('k1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md')), String('k2'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('md'))).assertEqual('k2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('lg')), String('k3'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('lg'))).assertEqual('k3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('k1', 'k2', 'k3').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020022 end');
    });

    /**
     * @tc.name   testBptTypeVol020023
     * @tc.number SUB_MNB_BPT_0120
     * @tc.desc   BreakpointType<string> triple #22 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020023 begin');
      const result: string | undefined = new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-tabs'));
      expect(String(result)).assertEqual('nav-tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm')), String('nav-list'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm'))
      ).assertEqual('nav-list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('lg')), String('nav-grid'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('lg'))
      ).assertEqual('nav-grid');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm sm')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('sm sm'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md\t')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-list', 'nav-tabs', 'nav-grid').GetValue('md\t'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020023 end');
    });

    /**
     * @tc.name   testBptTypeVol020024
     * @tc.number SUB_MNB_BPT_0121
     * @tc.desc   BreakpointType<string> triple #23 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020024 begin');
      const result: string | undefined = new BreakpointType<string>('north', 'south', 'west').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('west'));
      expect(String(result)).assertEqual('west');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('sm')), String('north'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('sm'))).assertEqual('north');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('md')), String('south'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('md'))).assertEqual('south');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('north', 'south', 'west').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('north', 'south', 'west').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020024 end');
    });

    /**
     * @tc.name   testBptTypeVol020025
     * @tc.number SUB_MNB_BPT_0122
     * @tc.desc   BreakpointType<string> triple #24 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020025 begin');
      const result: string | undefined = new BreakpointType<string>('#000', '#111', '#222').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#000'));
      expect(String(result)).assertEqual('#000');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('md')), String('#111'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('md'))).assertEqual('#111');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('lg')), String('#222'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('lg'))).assertEqual('#222');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('')), String('undefined'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#000', '#111', '#222').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('#000', '#111', '#222').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020025 end');
    });

    /**
     * @tc.name   testBptTypeVol020026
     * @tc.number SUB_MNB_BPT_0123
     * @tc.desc   BreakpointType<string> triple #0 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020026 begin');
      const result: string | undefined = new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('nav-app'));
      expect(String(result)).assertEqual('nav-app');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('sm')), String('nav-home'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('sm'))
      ).assertEqual('nav-home');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('lg')), String('nav-game'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('lg'))
      ).assertEqual('nav-game');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('SM')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('SM'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('smlg')), String('undefined'));
      expect(
        String(new BreakpointType<string>('nav-home', 'nav-app', 'nav-game').GetValue('smlg'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020026 end');
    });

    /**
     * @tc.name   testBptTypeVol020027
     * @tc.number SUB_MNB_BPT_0124
     * @tc.desc   BreakpointType<string> triple #1 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020027 begin');
      const result: string | undefined = new BreakpointType<string>('', 'b', 'c').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('c'));
      expect(String(result)).assertEqual('c');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('sm')), String(''));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('sm'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('md')), String('b'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('md'))).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('', 'b', 'c').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('', 'b', 'c').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020027 end');
    });

    /**
     * @tc.name   testBptTypeVol020028
     * @tc.number SUB_MNB_BPT_0125
     * @tc.desc   BreakpointType<string> triple #2 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020028 begin');
      const result: string | undefined = new BreakpointType<string>('x', '', 'z').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('x'));
      expect(String(result)).assertEqual('x');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('md')), String(''));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('md'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('lg')), String('z'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('lg'))).assertEqual('z');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('x', '', 'z').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('x', '', 'z').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020028 end');
    });

    /**
     * @tc.name   testBptTypeVol020029
     * @tc.number SUB_MNB_BPT_0126
     * @tc.desc   BreakpointType<string> triple #3 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020029 begin');
      const result: string | undefined = new BreakpointType<string>('a', 'b', '').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('b'));
      expect(String(result)).assertEqual('b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('sm')), String('a'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('sm'))).assertEqual('a');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('lg')), String(''));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('lg'))).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a', 'b', '').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('a', 'b', '').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020029 end');
    });

    /**
     * @tc.name   testBptTypeVol020030
     * @tc.number SUB_MNB_BPT_0127
     * @tc.desc   BreakpointType<string> triple #4 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020030 begin');
      const result: string | undefined = new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('tab-2'));
      expect(String(result)).assertEqual('tab-2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('sm')), String('tab-0'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('sm'))).assertEqual('tab-0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md')), String('tab-1'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('md'))).assertEqual('tab-1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('tab-0', 'tab-1', 'tab-2').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020030 end');
    });

    /**
     * @tc.name   testBptTypeVol020031
     * @tc.number SUB_MNB_BPT_0128
     * @tc.desc   BreakpointType<string> triple #5 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020031 begin');
      const result: string | undefined = new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#0a59f7'));
      expect(String(result)).assertEqual('#0a59f7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md')), String('#182431'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md'))).assertEqual('#182431');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('lg')), String('#fff'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('lg'))).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md\t')), String('undefined'));
      expect(
        String(new BreakpointType<string>('#0a59f7', '#182431', '#fff').GetValue('md\t'))
      ).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020031 end');
    });

    /**
     * @tc.name   testBptTypeVol020032
     * @tc.number SUB_MNB_BPT_0129
     * @tc.desc   BreakpointType<string> triple #6 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020032 begin');
      const result: string | undefined = new BreakpointType<string>('56vp', '100%', '20%').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('100%'));
      expect(String(result)).assertEqual('100%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('sm')), String('56vp'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('sm'))).assertEqual('56vp');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('lg')), String('20%'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('lg'))).assertEqual('20%');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('56vp', '100%', '20%').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020032 end');
    });

    /**
     * @tc.name   testBptTypeVol020033
     * @tc.number SUB_MNB_BPT_0130
     * @tc.desc   BreakpointType<string> triple #7 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020033 begin');
      const result: string | undefined = new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('#fff'));
      expect(String(result)).assertEqual('#fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('sm')), String('f1f3f5'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('sm'))).assertEqual('f1f3f5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('md')), String('fff'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('md'))).assertEqual('fff');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('f1f3f5', 'fff', '#fff').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020033 end');
    });

    /**
     * @tc.name   testBptTypeVol020034
     * @tc.number SUB_MNB_BPT_0131
     * @tc.desc   BreakpointType<string> triple #8 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020034 begin');
      const result: string | undefined = new BreakpointType<string>('list', 'tabs', 'sm').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('list'));
      expect(String(result)).assertEqual('list');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md')), String('tabs'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('md'))).assertEqual('tabs');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('lg')), String('sm'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('lg'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('list', 'tabs', 'sm').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020034 end');
    });

    /**
     * @tc.name   testBptTypeVol020035
     * @tc.number SUB_MNB_BPT_0132
     * @tc.desc   BreakpointType<string> triple #9 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020035 begin');
      const result: string | undefined = new BreakpointType<string>('sm', 'md', 'lg').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('md'));
      expect(String(result)).assertEqual('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm')), String('sm'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm'))).assertEqual('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('lg')), String('lg'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('lg'))).assertEqual('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('sm', 'md', 'lg').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020035 end');
    });

    /**
     * @tc.name   testBptTypeVol020036
     * @tc.number SUB_MNB_BPT_0133
     * @tc.desc   BreakpointType<string> triple #10 probed with 'lg'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020036 begin');
      const result: string | undefined = new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('CENTER'));
      expect(String(result)).assertEqual('CENTER');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm')), String('LEFT'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('sm'))).assertEqual('LEFT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md')), String('RIGHT'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md'))).assertEqual('RIGHT');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<string>('LEFT', 'RIGHT', 'CENTER').GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020036 end');
    });

    /**
     * @tc.name   testBptTypeVol020037
     * @tc.number SUB_MNB_BPT_0134
     * @tc.desc   BreakpointType<string> triple #11 probed with 'sm'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020037 begin');
      const result: string | undefined = new BreakpointType<string>('top', 'bottom', 'middle').GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('top'));
      expect(String(result)).assertEqual('top');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md')), String('bottom'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('md'))).assertEqual('bottom');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('lg')), String('middle'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('lg'))).assertEqual('middle');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<string>('top', 'bottom', 'middle').GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020037 end');
    });

    /**
     * @tc.name   testBptTypeVol020038
     * @tc.number SUB_MNB_BPT_0135
     * @tc.desc   BreakpointType<string> triple #12 probed with 'md'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020038 begin');
      const result: string | undefined = new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('a  b'));
      expect(String(result)).assertEqual('a  b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('sm')), String('a b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('sm'))).assertEqual('a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('lg')), String(' a b'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('lg'))).assertEqual(' a b');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<string>('a b', 'a  b', ' a b').GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol020038 end');
    });

  });
}
