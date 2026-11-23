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

// Handwritten companion of the @volume buckets BreakpointMatrix01~12.
// Every expected value below is frozen from main/ets (BreakpointSystem.ets, Index.ets,
// RecommendPage.ets, UserSongList.ets, TitleBar.ets) and never recomputed from the SUT.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { IconItem, PaddingDataType } from '../../../main/ets/model/DataType';
import { labelByName } from '../util/LabelResolver';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';

// Narrowing helpers keep every assertion on a plain number even though getValue returns T | undefined.
function pickNumber(value: number | undefined, fallback: number): number {
  return value === undefined ? fallback : value;
}

export default function breakpointRealTest() {
  describe('BreakpointReal', () => {

    // ==================== Index / TitleBar 真实布局配置三元组（10 条） ====================
    /**
     * @tc.number: SUB_MM_BRKR_0100
     * @tc.name: testBrkReal0001
     * @tc.desc: Verify Index GridRow columns triple 4/8/12 resolves per breakpoint key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0001 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const sm: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'gridrow-columns-sm actual=%{public}s expected=%{public}s', String(sm), '4');
      expect(sm).assertEqual(4);
      expect(sut.getValue('md')).assertEqual(8);
      expect(sut.getValue('lg')).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0001 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0200
     * @tc.name: testBrkReal0002
     * @tc.desc: Verify Index GridCol span triple keeps the same 4/8/12 values read in reverse order.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0002 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'gridcol-span-lg actual=%{public}s expected=%{public}s', String(lg), '12');
      expect(lg).assertEqual(12);
      expect(sut.getValue('md')).assertEqual(8);
      expect(sut.getValue('sm')).assertEqual(4);
      expect(sut.getValue('lg') === sut.getValue('md')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0002 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0300
     * @tc.name: testBrkReal0003
     * @tc.desc: Verify Index Tabs barPosition switches to start only on the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0003 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('end', 'end', 'start');
      const sm: string | undefined = sut.getValue('sm');
      const lg: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'bar-position actual=%{public}s/%{public}s expected=%{public}s/%{public}s',
        String(sm), String(lg), 'end', 'start');
      expect(sm).assertEqual('end');
      expect(sut.getValue('md')).assertEqual('end');
      expect(lg).assertEqual('start');
      expect(sm === lg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0003 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0400
     * @tc.name: testBrkReal0004
     * @tc.desc: Verify Index Tabs vertical flag is only enabled on the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0004 begin');
      let sut: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const sm: boolean | undefined = sut.getValue('sm');
      const md: boolean | undefined = sut.getValue('md');
      const lg: boolean | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'tabs-vertical actual=%{public}s/%{public}s/%{public}s expected=false/false/true',
        String(sm), String(md), String(lg));
      expect(sm).assertFalse();
      expect(md).assertFalse();
      expect(lg).assertTrue();
      expect(sm === md).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0004 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0500
     * @tc.name: testBrkReal0005
     * @tc.desc: Verify RecommendPage song grid has 3/5/6 equal columns per breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0005 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const smValue: string | undefined = sut.getValue('sm');
      const mdValue: string | undefined = sut.getValue('md');
      const lgValue: string | undefined = sut.getValue('lg');
      const smColumns: number = smValue === undefined ? -1 : smValue.split(' ').length;
      const mdColumns: number = mdValue === undefined ? -1 : mdValue.split(' ').length;
      const lgColumns: number = lgValue === undefined ? -1 : lgValue.split(' ').length;
      hilog.info(DOMAIN, TAG, 'song-grid-columns actual=%{public}s/%{public}s/%{public}s expected=3/5/6',
        String(smColumns), String(mdColumns), String(lgColumns));
      expect(smColumns).assertEqual(3);
      expect(mdColumns).assertEqual(5);
      expect(lgColumns).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0005 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0600
     * @tc.name: testBrkReal0006
     * @tc.desc: Verify UserSongList grid keeps a single column on sm and 5/6 columns above it.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0006 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const smValue: string | undefined = sut.getValue('sm');
      const smColumns: number = smValue === undefined ? -1 : smValue.split(' ').length;
      const lgValue: string | undefined = sut.getValue('lg');
      const lgColumns: number = lgValue === undefined ? -1 : lgValue.split(' ').length;
      hilog.info(DOMAIN, TAG, 'user-grid-columns actual=%{public}s/%{public}s expected=1/6',
        String(smColumns), String(lgColumns));
      expect(smColumns).assertEqual(1);
      expect(sut.getValue('md') === sut.getValue('md')).assertTrue();
      expect(lgColumns).assertEqual(6);
      expect(lgColumns > smColumns).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0006 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0700
     * @tc.name: testBrkReal0007
     * @tc.desc: Verify ListModule horizontal list spacing grows from 0 to 35 and 63.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0007 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const sm: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'list-space actual=%{public}s/%{public}s/%{public}s expected=0/35/63',
        String(sm), String(sut.getValue('md')), String(sut.getValue('lg')));
      expect(sm).assertEqual(0);
      expect(sut.getValue('md')).assertEqual(35);
      expect(sut.getValue('lg')).assertEqual(63);
      const spacingDelta: number = pickNumber(sut.getValue('lg'), -1) - pickNumber(sut.getValue('md'), -1);
      expect(spacingDelta).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0007 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0800
     * @tc.name: testBrkReal0008
     * @tc.desc: Verify banner swiper indicator dots stay visible on sm only.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0008 begin');
      let sut: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, false);
      const sm: boolean | undefined = sut.getValue('sm');
      const md: boolean | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'swiper-indicator actual=%{public}s/%{public}s expected=true/false',
        String(sm), String(md));
      expect(sm).assertTrue();
      expect(md).assertFalse();
      expect(sut.getValue('lg')).assertFalse();
      expect(sm === sut.getValue('lg')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0008 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_0900
     * @tc.name: testBrkReal0009
     * @tc.desc: Verify banner swiper shows 1/2/3 cards as the breakpoint widens.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0009 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const sm: number | undefined = sut.getValue('sm');
      const md: number | undefined = sut.getValue('md');
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'swiper-display-count actual=%{public}s/%{public}s/%{public}s expected=1/2/3',
        String(sm), String(md), String(lg));
      expect(sm).assertEqual(1);
      expect(md).assertEqual(2);
      expect(lg).assertEqual(3);
      expect(pickNumber(md, -1) > pickNumber(sm, -1)).assertTrue();
      expect(pickNumber(lg, -1) > pickNumber(md, -1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0009 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1000
     * @tc.name: testBrkReal0010
     * @tc.desc: Verify TitleBar GridRow uses 8/16/24 columns while its four GridCol spans stay fixed.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0010 begin');
      let row: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      let spans: BreakpointType<string> = new BreakpointType<string>('7 7 1 1', '6 8 1 1', '15 7 1 1');
      const lgColumns: number | undefined = row.getValue('lg');
      const lgSpan: string | undefined = spans.getValue('lg');
      const lgSpanCount: number = lgSpan === undefined ? -1 : lgSpan.split(' ').length;
      hilog.info(DOMAIN, TAG, 'titlebar-columns actual=%{public}s/%{public}s expected=24/4',
        String(lgColumns), String(lgSpanCount));
      expect(lgColumns).assertEqual(24);
      expect(lgSpanCount).assertEqual(4);
      expect(row.getValue('sm')).assertEqual(8);
      expect(row.getValue('md')).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0010 end');
    })

    // ==================== 数值保真与极值（8 条） ====================
    /**
     * @tc.number: SUB_MM_BRKR_1100
     * @tc.name: testBrkReal0011
     * @tc.desc: Verify all three keys return zero when zero is stored at every slot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0011 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 0, 0);
      const sm: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'zero-triple actual=%{public}s/%{public}s/%{public}s expected=0/0/0',
        String(sm), String(sut.getValue('md')), String(sut.getValue('lg')));
      expect(sm).assertEqual(0);
      expect(sut.getValue('md')).assertEqual(0);
      expect(sut.getValue('lg')).assertEqual(0);
      expect(sut.getValue('lg') === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0011 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1200
     * @tc.name: testBrkReal0012
     * @tc.desc: Verify 32 bit boundary integers survive the constructor without clamping.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0012 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(2147483647, -2147483648, 0);
      const sm: number | undefined = sut.getValue('sm');
      const md: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'int32-boundary actual=%{public}s/%{public}s expected=2147483647/-2147483648',
        String(sm), String(md));
      expect(sm).assertEqual(2147483647);
      expect(md).assertEqual(-2147483648);
      expect(pickNumber(sm, 0) > pickNumber(md, 0)).assertTrue();
      expect(pickNumber(md, 0) < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0012 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1300
     * @tc.name: testBrkReal0013
     * @tc.desc: Verify the maximum safe integer is returned unchanged from both edge keys.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0013 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.MAX_SAFE_INTEGER, 0,
        Number.MIN_SAFE_INTEGER);
      const sm: number | undefined = sut.getValue('sm');
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'safe-integer-ends actual=%{public}s/%{public}s', String(sm), String(lg));
      expect(sm).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(lg).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(pickNumber(sm, 0) + 1 > pickNumber(sm, 0)).assertTrue();
      expect(sm === lg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0013 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1400
     * @tc.name: testBrkReal0014
     * @tc.desc: Verify decimal values keep their binary representation instead of being rounded.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0014 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0.1 + 0.2, 0.3, 1 / 3);
      const sm: number | undefined = sut.getValue('sm');
      const md: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'decimal-fidelity actual=%{public}s/%{public}s expected=0.30000000000000004/0.3',
        String(sm), String(md));
      expect(sm).assertEqual(0.30000000000000004);
      expect(md).assertEqual(0.3);
      expect(sm === md).assertFalse();
      expect(pickNumber(sut.getValue('lg'), 0) > 0.33).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0014 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1500
     * @tc.name: testBrkReal0015
     * @tc.desc: Verify negative slot values are never folded into their absolute value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0015 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-1, -2, -3);
      const md: number | undefined = sut.getValue('md');
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'negative-slots actual=%{public}s/%{public}s expected=-2/-3',
        String(md), String(lg));
      expect(md).assertEqual(-2);
      expect(lg).assertEqual(-3);
      expect(Math.abs(pickNumber(lg, 0))).assertEqual(3);
      expect(pickNumber(md, 0) > pickNumber(lg, 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0015 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1600
     * @tc.name: testBrkReal0016
     * @tc.desc: Verify a NaN slot stays NaN and does not poison the other two slots.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0016 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.NaN, 1, 2);
      const raw: number | undefined = sut.getValue('sm');
      const sm: number = pickNumber(raw, 0);
      hilog.info(DOMAIN, TAG, 'nan-slot actual=%{public}s expected=NaN', String(raw));
      expect(raw).assertNaN();
      expect(Number.isNaN(sm)).assertTrue();
      expect(sut.getValue('md')).assertEqual(1);
      expect(sut.getValue('lg')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0016 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1700
     * @tc.name: testBrkReal0017
     * @tc.desc: Verify positive and negative infinity are preserved per slot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0017 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(Number.POSITIVE_INFINITY, 0,
        Number.NEGATIVE_INFINITY);
      const sm: number | undefined = sut.getValue('sm');
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'infinity-slots actual=%{public}s/%{public}s expected=Infinity/-Infinity',
        String(sm), String(lg));
      expect(sm).assertEqual(Number.POSITIVE_INFINITY);
      expect(lg).assertEqual(Number.NEGATIVE_INFINITY);
      expect(pickNumber(sm, 0) > Number.MAX_VALUE).assertTrue();
      expect(pickNumber(lg, 0) < Number.MIN_VALUE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0017 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_1800
     * @tc.name: testBrkReal0018
     * @tc.desc: Verify negative zero stays distinguishable from positive zero in the two slots.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0018 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(-0, 0, 1);
      const sm: number | undefined = sut.getValue('sm');
      const md: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'signed-zero actual=%{public}s/%{public}s expected=-0/0', String(sm), String(md));
      expect(1 / pickNumber(sm, 1) === Number.NEGATIVE_INFINITY).assertTrue();
      expect(1 / pickNumber(md, 1) === Number.POSITIVE_INFINITY).assertTrue();
      expect(sm).assertEqual(0);
      expect(md).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0018 end');
    })

    // ==================== 非法 key 解析（12 条） ====================
    /**
     * @tc.number: SUB_MM_BRKR_1900
     * @tc.name: testBrkReal0019
     * @tc.desc: Verify the empty key is rejected while valid keys keep working.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0019 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      const empty: string | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'empty-key actual=%{public}s expected=undefined', String(empty));
      expect(empty).assertUndefined();
      expect(sut.getValue('sm')).assertEqual('s');
      expect(sut.getValue('lg')).assertEqual('l');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0019 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2000
     * @tc.name: testBrkReal0020
     * @tc.desc: Verify an upper case key is rejected because matching is case sensitive.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0020 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      const upper: string | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'upper-lg actual=%{public}s expected=undefined', String(upper));
      expect(upper).assertUndefined();
      expect(sut.getValue('lg')).assertEqual('l');
      expect(sut.getValue('md')).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0020 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2100
     * @tc.name: testBrkReal0021
     * @tc.desc: Verify the mixed case key Lg is rejected without touching the lower case slot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0021 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const mixed: number | undefined = sut.getValue('Lg');
      hilog.info(DOMAIN, TAG, 'mixed-case actual=%{public}s expected=undefined', String(mixed));
      expect(mixed).assertUndefined();
      expect(sut.getValue('lg')).assertEqual(3);
      expect(sut.getValue('lg') === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0021 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2200
     * @tc.name: testBrkReal0022
     * @tc.desc: Verify a trailing space in the key is not trimmed before matching.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0022 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const trailing: number | undefined = sut.getValue('lg ');
      hilog.info(DOMAIN, TAG, 'trailing-space actual=%{public}s expected=undefined', String(trailing));
      expect(trailing).assertUndefined();
      expect(sut.getValue('lg')).assertEqual(3);
      expect(trailing === sut.getValue('lg')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0022 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2300
     * @tc.name: testBrkReal0023
     * @tc.desc: Verify a leading space in the key is not trimmed before matching.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0023 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const leading: number | undefined = sut.getValue(' sm');
      hilog.info(DOMAIN, TAG, 'leading-space actual=%{public}s expected=undefined', String(leading));
      expect(leading).assertUndefined();
      expect(sut.getValue('sm')).assertEqual(1);
      expect(sut.sm).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0023 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2400
     * @tc.name: testBrkReal0024
     * @tc.desc: Verify the descriptive key large is rejected because only lg is accepted.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0024 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      const longKey: string | undefined = sut.getValue('large');
      hilog.info(DOMAIN, TAG, 'large-key actual=%{public}s expected=undefined', String(longKey));
      expect(longKey).assertUndefined();
      expect(sut.getValue('lg')).assertEqual('c');
      expect(sut.getValue('sm')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0024 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2500
     * @tc.name: testBrkReal0025
     * @tc.desc: Verify the suffixed key sm2 is rejected and does not match sm by prefix.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0025 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('a', 'b', 'c');
      const suffixed: string | undefined = sut.getValue('sm2');
      hilog.info(DOMAIN, TAG, 'suffixed-key actual=%{public}s expected=undefined', String(suffixed));
      expect(suffixed).assertUndefined();
      expect(sut.getValue('sm')).assertEqual('a');
      expect(suffixed === sut.getValue('sm')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0025 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2600
     * @tc.name: testBrkReal0026
     * @tc.desc: Verify the upper case MD key does not resolve the md slot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0026 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7, 8, 9);
      const upper: number | undefined = sut.getValue('MD');
      const lower: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'upper-md actual=%{public}s expected=undefined', String(upper));
      expect(upper).assertUndefined();
      expect(lower).assertEqual(8);
      expect(upper === lower).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0026 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2700
     * @tc.name: testBrkReal0027
     * @tc.desc: Verify a tab character inside the key keeps the lookup unresolved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0027 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7, 8, 9);
      const tabbed: number | undefined = sut.getValue('md\t');
      hilog.info(DOMAIN, TAG, 'tab-key actual=%{public}s expected=undefined', String(tabbed));
      expect(tabbed).assertUndefined();
      expect(sut.getValue('md')).assertEqual(8);
      expect(sut.md).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0027 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2800
     * @tc.name: testBrkReal0028
     * @tc.desc: Verify a newline terminated key keeps the lookup unresolved.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0028 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(7, 8, 9);
      const newlined: number | undefined = sut.getValue('lg\n');
      hilog.info(DOMAIN, TAG, 'newline-key actual=%{public}s expected=undefined', String(newlined));
      expect(newlined).assertUndefined();
      expect(sut.getValue('lg')).assertEqual(9);
      expect(sut.lg).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0028 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_2900
     * @tc.name: testBrkReal0029
     * @tc.desc: Verify the plural key mds is rejected instead of matching md.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0029 begin');
      let sut: BreakpointType<boolean> = new BreakpointType<boolean>(true, false, true);
      const plural: boolean | undefined = sut.getValue('mds');
      hilog.info(DOMAIN, TAG, 'plural-key actual=%{public}s expected=undefined', String(plural));
      expect(plural).assertUndefined();
      expect(sut.getValue('md')).assertFalse();
      expect(sut.getValue('sm')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0029 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3000
     * @tc.name: testBrkReal0030
     * @tc.desc: Verify the all caps key SMALL does not resolve any slot.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0030 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('small', 'medium', 'large');
      const caps: string | undefined = sut.getValue('SMALL');
      hilog.info(DOMAIN, TAG, 'caps-key actual=%{public}s expected=undefined', String(caps));
      expect(caps).assertUndefined();
      expect(sut.getValue('sm')).assertEqual('small');
      expect(sut.getValue('md')).assertEqual('medium');
      expect(sut.getValue('lg')).assertEqual('large');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0030 end');
    })

    // ==================== 状态与引用（10 条） ====================
    /**
     * @tc.number: SUB_MM_BRKR_3100
     * @tc.name: testBrkReal0031
     * @tc.desc: Verify writing the lg field is visible through getValue immediately.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0031 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('s', 'm', 'l');
      sut.lg = 'lg-after-write';
      const lg: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-after-write actual=%{public}s expected=lg-after-write', String(lg));
      expect(lg).assertEqual('lg-after-write');
      expect(sut.getValue('sm')).assertEqual('s');
      expect(sut.getValue('md')).assertEqual('m');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0031 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3200
     * @tc.name: testBrkReal0032
     * @tc.desc: Verify writing the md field leaves the sm and lg slots untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0032 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      sut.md = 10;
      const md: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-after-write actual=%{public}s expected=10', String(md));
      expect(md).assertEqual(10);
      expect(sut.getValue('sm')).assertEqual(4);
      expect(sut.getValue('lg')).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0032 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3300
     * @tc.name: testBrkReal0033
     * @tc.desc: Verify mutating one instance never leaks into a second instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0033 begin');
      let first: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      let second: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      first.lg = 24;
      const firstLg: number | undefined = first.getValue('lg');
      const secondLg: number | undefined = second.getValue('lg');
      hilog.info(DOMAIN, TAG, 'isolation actual=%{public}s/%{public}s expected=24/12',
        String(firstLg), String(secondLg));
      expect(firstLg).assertEqual(24);
      expect(secondLg).assertEqual(12);
      expect(first === second).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0033 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3400
     * @tc.name: testBrkReal0034
     * @tc.desc: Verify getValue returns the very object stored in the field, not a copy.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0034 begin');
      let padding: PaddingDataType = new PaddingDataType(16, 24);
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(padding, padding, padding);
      const got: PaddingDataType | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'reference-identity actual=%{public}s expected=true', String(got === padding));
      expect(got === padding).assertTrue();
      expect(got === sut.lg).assertTrue();
      expect(padding.left).assertEqual(16);
      expect(padding.right).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0034 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3500
     * @tc.name: testBrkReal0035
     * @tc.desc: Verify a value read back can drive a further write without corrupting the other slots.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0035 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(1, 2, 3);
      const readBack: number | undefined = sut.getValue('md');
      sut.lg = readBack === undefined ? -1 : readBack * 6;
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'read-then-write actual=%{public}s expected=12', String(lg));
      expect(lg).assertEqual(12);
      expect(sut.getValue('md')).assertEqual(2);
      expect(sut.getValue('sm')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0035 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3600
     * @tc.name: testBrkReal0036
     * @tc.desc: Verify the string union type reports undefined for a miss and a value for a hit.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0036 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('sm-value', 'md-value', 'lg-value');
      const miss: string | undefined = sut.getValue('xl');
      const hit: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'union-state actual=%{public}s/%{public}s expected=undefined/lg-value',
        String(miss), String(hit));
      expect(miss).assertUndefined();
      expect(hit).assertEqual('lg-value');
      expect(hit === undefined).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0036 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3700
     * @tc.name: testBrkReal0037
     * @tc.desc: Verify a Resource slot keeps its media identifier through getValue.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0037 begin');
      let sut: BreakpointType<Resource> = new BreakpointType<Resource>($r('app.media.list1'), $r('app.media.list2'),
        $r('app.media.list3'));
      const lg: Resource | undefined = sut.getValue('lg');
      const lgId: number = lg === undefined ? -1 : lg.id;
      hilog.info(DOMAIN, TAG, 'resource-lg-id actual=%{public}s expected=%{public}s',
        String(lgId), String($r('app.media.list3').id));
      expect(lgId).assertEqual($r('app.media.list3').id);
      expect(lgId > 0).assertTrue();
      expect(lg === sut.lg).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0037 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3800
     * @tc.name: testBrkReal0038
     * @tc.desc: Verify an IconItem slot keeps its description string through getValue.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0038 begin');
      let sut: BreakpointType<IconItem> = new BreakpointType<IconItem>(new IconItem($r('app.media.list4'), labelByName('index')),
        new IconItem($r('app.media.list5'), labelByName('radio')), new IconItem($r('app.media.list6'), labelByName('discovery')));
      const sm: IconItem | undefined = sut.getValue('sm');
      const description: string = sm === undefined ? '' : sm.description as string;
      hilog.info(DOMAIN, TAG, 'icon-description actual=%{public}s expected=%{public}s', description, labelByName('index'));
      expect(description).assertEqual(labelByName('index'));
      expect(description.length).assertEqual(2);
      expect(sm === sut.sm).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0038 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_3900
     * @tc.name: testBrkReal0039
     * @tc.desc: Verify the constructor binds the first argument to sm and the third to lg.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testBrkReal0039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0039 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('small', 'medium', 'large');
      const sm: string | undefined = sut.getValue('sm');
      const md: string | undefined = sut.getValue('md');
      const lg: string | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'arg-order actual=%{public}s/%{public}s/%{public}s expected=small/medium/large',
        String(sm), String(md), String(lg));
      expect(sm).assertEqual('small');
      expect(md).assertEqual('medium');
      expect(lg).assertEqual('large');
      expect(sm === lg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0039 end');
    })

    /**
     * @tc.number: SUB_MM_BRKR_4000
     * @tc.name: testBrkReal0040
     * @tc.desc: Verify repeated reads of the three keys stay stable within one instance.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testBrkReal0040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0040 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(4, 8, 12);
      const firstSm: number | undefined = sut.getValue('sm');
      const secondSm: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'repeat-read actual=%{public}s/%{public}s expected=4/4',
        String(firstSm), String(secondSm));
      expect(firstSm).assertEqual(secondSm);
      expect(sut.getValue('lg')).assertEqual(sut.getValue('lg'));
      expect(sut.getValue('md')).assertEqual(8);
      expect(firstSm).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBrkReal0040 end');
    })
  })
}
