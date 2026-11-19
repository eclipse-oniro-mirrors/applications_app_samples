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

export default function bptTypeVol04Test() {
  describe('MultiNavBarBptTypeVol04', () => {

    /**
     * @tc.name   testBptTypeVol040001
     * @tc.number SUB_MNB_BPT_0248
     * @tc.desc   BreakpointType<number>(24/576/56) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040001 begin');
      const result: number | undefined = new BreakpointType<number>(24, 576, 56).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('24'));
      expect(String(result)).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('md')), String('576'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('md'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('lg')), String('56'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('lg'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040001 end');
    });

    /**
     * @tc.name   testBptTypeVol040002
     * @tc.number SUB_MNB_BPT_0249
     * @tc.desc   BreakpointType<number>(40/16/18) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040002 begin');
      const result: number | undefined = new BreakpointType<number>(40, 16, 18).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('sm')), String('40'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('sm'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('lg')), String('18'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('lg'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040002 end');
    });

    /**
     * @tc.name   testBptTypeVol040003
     * @tc.number SUB_MNB_BPT_0250
     * @tc.desc   BreakpointType<number>(7/22/12) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040003 begin');
      const result: number | undefined = new BreakpointType<number>(7, 22, 12).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12'));
      expect(String(result)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('sm')), String('7'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('sm'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('md')), String('22'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('md'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040003 end');
    });

    /**
     * @tc.name   testBptTypeVol040004
     * @tc.number SUB_MNB_BPT_0251
     * @tc.desc   BreakpointType<number>(10/106/8) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040004 begin');
      const result: number | undefined = new BreakpointType<number>(10, 106, 8).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('10'));
      expect(String(result)).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('md')), String('106'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('md'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('lg')), String('8'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('lg'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040004 end');
    });

    /**
     * @tc.name   testBptTypeVol040005
     * @tc.number SUB_MNB_BPT_0252
     * @tc.desc   BreakpointType<number>(14/220/44) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040005 begin');
      const result: number | undefined = new BreakpointType<number>(14, 220, 44).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('220'));
      expect(String(result)).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('sm')), String('14'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('sm'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('lg')), String('44'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('lg'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040005 end');
    });

    /**
     * @tc.name   testBptTypeVol040006
     * @tc.number SUB_MNB_BPT_0253
     * @tc.desc   BreakpointType<number>(284/48/0) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040006 begin');
      const result: number | undefined = new BreakpointType<number>(284, 48, 0).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('sm')), String('284'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('sm'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('md')), String('48'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('md'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040006 end');
    });

    /**
     * @tc.name   testBptTypeVol040007
     * @tc.number SUB_MNB_BPT_0254
     * @tc.desc   BreakpointType<number>(138/56/1) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040007 begin');
      const result: number | undefined = new BreakpointType<number>(138, 56, 1).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('138'));
      expect(String(result)).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('md')), String('56'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('md'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040007 end');
    });

    /**
     * @tc.name   testBptTypeVol040008
     * @tc.number SUB_MNB_BPT_0255
     * @tc.desc   BreakpointType<number>(576/18/4) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040008 begin');
      const result: number | undefined = new BreakpointType<number>(576, 18, 4).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18'));
      expect(String(result)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('sm')), String('576'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('sm'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('lg')), String('4'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('lg'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040008 end');
    });

    /**
     * @tc.name   testBptTypeVol040009
     * @tc.number SUB_MNB_BPT_0256
     * @tc.desc   BreakpointType<number>(16/12/2) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040009 begin');
      const result: number | undefined = new BreakpointType<number>(16, 12, 2).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('sm')), String('16'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('sm'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('md')), String('12'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('md'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040009 end');
    });

    /**
     * @tc.name   testBptTypeVol040010
     * @tc.number SUB_MNB_BPT_0257
     * @tc.desc   BreakpointType<number>(22/8/3) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040010 begin');
      const result: number | undefined = new BreakpointType<number>(22, 8, 3).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('22'));
      expect(String(result)).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('md')), String('8'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('md'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('lg')), String('3'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('lg'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040010 end');
    });

    /**
     * @tc.name   testBptTypeVol040011
     * @tc.number SUB_MNB_BPT_0258
     * @tc.desc   BreakpointType<number>(106/44/5) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040011 begin');
      const result: number | undefined = new BreakpointType<number>(106, 44, 5).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44'));
      expect(String(result)).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('sm')), String('106'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('sm'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('lg')), String('5'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('lg'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040011 end');
    });

    /**
     * @tc.name   testBptTypeVol040012
     * @tc.number SUB_MNB_BPT_0259
     * @tc.desc   BreakpointType<number>(220/0/6) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040012 begin');
      const result: number | undefined = new BreakpointType<number>(220, 0, 6).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6'));
      expect(String(result)).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('sm')), String('220'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('sm'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040012 end');
    });

    /**
     * @tc.name   testBptTypeVol040013
     * @tc.number SUB_MNB_BPT_0260
     * @tc.desc   BreakpointType<number>(48/1/24) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040013 begin');
      const result: number | undefined = new BreakpointType<number>(48, 1, 24).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('48'));
      expect(String(result)).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('md')), String('1'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('md'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('lg')), String('24'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('lg'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040013 end');
    });

    /**
     * @tc.name   testBptTypeVol040014
     * @tc.number SUB_MNB_BPT_0261
     * @tc.desc   BreakpointType<number>(56/4/40) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040014 begin');
      const result: number | undefined = new BreakpointType<number>(56, 4, 40).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(String(result)).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('sm')), String('56'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('sm'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('lg')), String('40'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('lg'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(56, 4, 40).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(56, 4, 40).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040014 end');
    });

    /**
     * @tc.name   testBptTypeVol040015
     * @tc.number SUB_MNB_BPT_0262
     * @tc.desc   BreakpointType<number>(18/2/7) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040015 begin');
      const result: number | undefined = new BreakpointType<number>(18, 2, 7).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('sm')), String('18'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('sm'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('md')), String('2'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('md'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(18, 2, 7).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(18, 2, 7).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040015 end');
    });

    /**
     * @tc.name   testBptTypeVol040016
     * @tc.number SUB_MNB_BPT_0263
     * @tc.desc   BreakpointType<number>(12/3/10) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040016 begin');
      const result: number | undefined = new BreakpointType<number>(12, 3, 10).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('12'));
      expect(String(result)).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('md')), String('3'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('md'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('lg')), String('10'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('lg'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(12, 3, 10).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(12, 3, 10).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040016 end');
    });

    /**
     * @tc.name   testBptTypeVol040017
     * @tc.number SUB_MNB_BPT_0264
     * @tc.desc   BreakpointType<number>(8/5/14) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040017 begin');
      const result: number | undefined = new BreakpointType<number>(8, 5, 14).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(String(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('sm')), String('8'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('sm'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('lg')), String('14'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('lg'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(8, 5, 14).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(8, 5, 14).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040017 end');
    });

    /**
     * @tc.name   testBptTypeVol040018
     * @tc.number SUB_MNB_BPT_0265
     * @tc.desc   BreakpointType<number>(44/6/284) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040018 begin');
      const result: number | undefined = new BreakpointType<number>(44, 6, 284).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('284'));
      expect(String(result)).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('sm')), String('44'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('sm'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('md')), String('6'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('md'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(44, 6, 284).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(44, 6, 284).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040018 end');
    });

    /**
     * @tc.name   testBptTypeVol040019
     * @tc.number SUB_MNB_BPT_0266
     * @tc.desc   BreakpointType<number>(0/24/138) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040019 begin');
      const result: number | undefined = new BreakpointType<number>(0, 24, 138).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('0'));
      expect(String(result)).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('md')), String('24'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('md'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('lg')), String('138'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('lg'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(0, 24, 138).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(0, 24, 138).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040019 end');
    });

    /**
     * @tc.name   testBptTypeVol040020
     * @tc.number SUB_MNB_BPT_0267
     * @tc.desc   BreakpointType<number>(1/40/576) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040020 begin');
      const result: number | undefined = new BreakpointType<number>(1, 40, 576).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('40'));
      expect(String(result)).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('sm')), String('1'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('sm'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('lg')), String('576'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('lg'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(1, 40, 576).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(1, 40, 576).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040020 end');
    });

    /**
     * @tc.name   testBptTypeVol040021
     * @tc.number SUB_MNB_BPT_0268
     * @tc.desc   BreakpointType<number>(4/7/16) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040021 begin');
      const result: number | undefined = new BreakpointType<number>(4, 7, 16).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('sm')), String('4'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('sm'))).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('md')), String('7'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('md'))).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(4, 7, 16).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(4, 7, 16).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040021 end');
    });

    /**
     * @tc.name   testBptTypeVol040022
     * @tc.number SUB_MNB_BPT_0269
     * @tc.desc   BreakpointType<number>(2/10/22) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040022 begin');
      const result: number | undefined = new BreakpointType<number>(2, 10, 22).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('2'));
      expect(String(result)).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('md')), String('10'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('md'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('lg')), String('22'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('lg'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(2, 10, 22).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(2, 10, 22).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040022 end');
    });

    /**
     * @tc.name   testBptTypeVol040023
     * @tc.number SUB_MNB_BPT_0270
     * @tc.desc   BreakpointType<number>(3/14/106) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040023 begin');
      const result: number | undefined = new BreakpointType<number>(3, 14, 106).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('14'));
      expect(String(result)).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('sm')), String('3'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('sm'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('lg')), String('106'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('lg'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(3, 14, 106).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(3, 14, 106).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040023 end');
    });

    /**
     * @tc.name   testBptTypeVol040024
     * @tc.number SUB_MNB_BPT_0271
     * @tc.desc   BreakpointType<number>(5/284/220) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040024 begin');
      const result: number | undefined = new BreakpointType<number>(5, 284, 220).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('220'));
      expect(String(result)).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('sm')), String('5'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('sm'))).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('md')), String('284'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('md'))).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(5, 284, 220).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(5, 284, 220).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040024 end');
    });

    /**
     * @tc.name   testBptTypeVol040025
     * @tc.number SUB_MNB_BPT_0272
     * @tc.desc   BreakpointType<number>(6/138/48) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040025 begin');
      const result: number | undefined = new BreakpointType<number>(6, 138, 48).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('6'));
      expect(String(result)).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('md')), String('138'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('md'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('lg')), String('48'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('lg'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(6, 138, 48).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(6, 138, 48).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040025 end');
    });

    /**
     * @tc.name   testBptTypeVol040026
     * @tc.number SUB_MNB_BPT_0273
     * @tc.desc   BreakpointType<number>(24/576/56) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040026 begin');
      const result: number | undefined = new BreakpointType<number>(24, 576, 56).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('576'));
      expect(String(result)).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('sm')), String('24'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('sm'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('lg')), String('56'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('lg'))).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(24, 576, 56).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(24, 576, 56).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040026 end');
    });

    /**
     * @tc.name   testBptTypeVol040027
     * @tc.number SUB_MNB_BPT_0274
     * @tc.desc   BreakpointType<number>(40/16/18) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040027 begin');
      const result: number | undefined = new BreakpointType<number>(40, 16, 18).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('18'));
      expect(String(result)).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('sm')), String('40'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('sm'))).assertEqual('40');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('md')), String('16'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('md'))).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(40, 16, 18).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(40, 16, 18).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040027 end');
    });

    /**
     * @tc.name   testBptTypeVol040028
     * @tc.number SUB_MNB_BPT_0275
     * @tc.desc   BreakpointType<number>(7/22/12) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040028 begin');
      const result: number | undefined = new BreakpointType<number>(7, 22, 12).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('7'));
      expect(String(result)).assertEqual('7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('md')), String('22'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('md'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('lg')), String('12'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('lg'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue(' sm')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue(' sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(7, 22, 12).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(7, 22, 12).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040028 end');
    });

    /**
     * @tc.name   testBptTypeVol040029
     * @tc.number SUB_MNB_BPT_0276
     * @tc.desc   BreakpointType<number>(10/106/8) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040029 begin');
      const result: number | undefined = new BreakpointType<number>(10, 106, 8).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('106'));
      expect(String(result)).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('sm')), String('10'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('sm'))).assertEqual('10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('lg')), String('8'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('lg'))).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('lg ')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('lg '))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(10, 106, 8).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(10, 106, 8).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040029 end');
    });

    /**
     * @tc.name   testBptTypeVol040030
     * @tc.number SUB_MNB_BPT_0277
     * @tc.desc   BreakpointType<number>(14/220/44) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040030 begin');
      const result: number | undefined = new BreakpointType<number>(14, 220, 44).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('44'));
      expect(String(result)).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('sm')), String('14'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('sm'))).assertEqual('14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('md')), String('220'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('md'))).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(14, 220, 44).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(14, 220, 44).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040030 end');
    });

    /**
     * @tc.name   testBptTypeVol040031
     * @tc.number SUB_MNB_BPT_0278
     * @tc.desc   BreakpointType<number>(284/48/0) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040031 begin');
      const result: number | undefined = new BreakpointType<number>(284, 48, 0).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('284'));
      expect(String(result)).assertEqual('284');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('md')), String('48'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('md'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('lg')), String('0'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('lg'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('0')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('0'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(284, 48, 0).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(284, 48, 0).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040031 end');
    });

    /**
     * @tc.name   testBptTypeVol040032
     * @tc.number SUB_MNB_BPT_0279
     * @tc.desc   BreakpointType<number>(138/56/1) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040032 begin');
      const result: number | undefined = new BreakpointType<number>(138, 56, 1).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('56'));
      expect(String(result)).assertEqual('56');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('sm')), String('138'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('sm'))).assertEqual('138');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('lg')), String('1'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('lg'))).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('s')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('s'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(138, 56, 1).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(138, 56, 1).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040032 end');
    });

    /**
     * @tc.name   testBptTypeVol040033
     * @tc.number SUB_MNB_BPT_0280
     * @tc.desc   BreakpointType<number>(576/18/4) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040033 begin');
      const result: number | undefined = new BreakpointType<number>(576, 18, 4).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('4'));
      expect(String(result)).assertEqual('4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('sm')), String('576'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('sm'))).assertEqual('576');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('md')), String('18'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('md'))).assertEqual('18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(576, 18, 4).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(576, 18, 4).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040033 end');
    });

    /**
     * @tc.name   testBptTypeVol040034
     * @tc.number SUB_MNB_BPT_0281
     * @tc.desc   BreakpointType<number>(16/12/2) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040034 begin');
      const result: number | undefined = new BreakpointType<number>(16, 12, 2).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('16'));
      expect(String(result)).assertEqual('16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('md')), String('12'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('md'))).assertEqual('12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('lg')), String('2'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('lg'))).assertEqual('2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('tab')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('tab'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(16, 12, 2).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(16, 12, 2).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040034 end');
    });

    /**
     * @tc.name   testBptTypeVol040035
     * @tc.number SUB_MNB_BPT_0282
     * @tc.desc   BreakpointType<number>(22/8/3) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040035 begin');
      const result: number | undefined = new BreakpointType<number>(22, 8, 3).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('8'));
      expect(String(result)).assertEqual('8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('sm')), String('22'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('sm'))).assertEqual('22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('lg')), String('3'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('lg'))).assertEqual('3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('sm sm')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('sm sm'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(22, 8, 3).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(22, 8, 3).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040035 end');
    });

    /**
     * @tc.name   testBptTypeVol040036
     * @tc.number SUB_MNB_BPT_0283
     * @tc.desc   BreakpointType<number>(106/44/5) probed with 'lg' returns slot 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040036 begin');
      const result: number | undefined = new BreakpointType<number>(106, 44, 5).GetValue('lg');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('5'));
      expect(String(result)).assertEqual('5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('sm')), String('106'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('sm'))).assertEqual('106');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('md')), String('44'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('md'))).assertEqual('44');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('md\t')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('md\t'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(106, 44, 5).GetValue('Md')), String('undefined'));
      expect(String(new BreakpointType<number>(106, 44, 5).GetValue('Md'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040036 end');
    });

    /**
     * @tc.name   testBptTypeVol040037
     * @tc.number SUB_MNB_BPT_0284
     * @tc.desc   BreakpointType<number>(220/0/6) probed with 'sm' returns slot 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040037 begin');
      const result: number | undefined = new BreakpointType<number>(220, 0, 6).GetValue('sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('220'));
      expect(String(result)).assertEqual('220');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('md')), String('0'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('md'))).assertEqual('0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('lg')), String('6'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('lg'))).assertEqual('6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue(''))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(220, 0, 6).GetValue('xs')), String('undefined'));
      expect(String(new BreakpointType<number>(220, 0, 6).GetValue('xs'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040037 end');
    });

    /**
     * @tc.name   testBptTypeVol040038
     * @tc.number SUB_MNB_BPT_0285
     * @tc.desc   BreakpointType<number>(48/1/24) probed with 'md' returns slot 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testBptTypeVol040038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040038 begin');
      const result: number | undefined = new BreakpointType<number>(48, 1, 24).GetValue('md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result), String('1'));
      expect(String(result)).assertEqual('1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('sm')), String('48'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('sm'))).assertEqual('48');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('lg')), String('24'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('lg'))).assertEqual('24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('SM')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('SM'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(new BreakpointType<number>(48, 1, 24).GetValue('smlg')), String('undefined'));
      expect(String(new BreakpointType<number>(48, 1, 24).GetValue('smlg'))).assertEqual('undefined');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testBptTypeVol040038 end');
    });

  });
}
