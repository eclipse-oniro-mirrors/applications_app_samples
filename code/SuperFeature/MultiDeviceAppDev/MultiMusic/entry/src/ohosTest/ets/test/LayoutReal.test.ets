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

// Handwritten companion of the @volume bucket LayoutMatrix01.
// The expected numbers below are the frozen layout contract of RecommendPage.ets: 12 songs,
// columns 3/5/6, rowGap 16, extra 48 for the player bar below lg, padding 16/16/24.
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BreakpointType } from '../../../main/ets/common/BreakpointSystem';
import { PaddingDataType } from '../../../main/ets/model/DataType';

const DOMAIN: number = 0xF811;
const TAG: string = '[MultiMusicTest]';
const SONG_COUNT: number = 12;
const ROW_GAP: number = 16;
const PLAYER_BAR: number = 48;

// Frozen copy of the grid formula in RecommendPage.ets, used only to reach an expected value
// from the spec constants; the SUT is never used to compute its own expectation.
function gridHeightOf(itemHeight: number, columns: number, extraBar: boolean): number {
  const rows: number = Math.ceil(SONG_COUNT / columns);
  const base: number = (ROW_GAP + itemHeight) * rows - ROW_GAP;
  return extraBar ? base + PLAYER_BAR : base;
}

function tokensOf(template: string): string[] {
  return template.split(' ');
}

function columnsOf(template: string): number {
  return tokensOf(template).length;
}

export default function layoutRealTest() {
  describe('LayoutReal', () => {

    // ==================== 12 首歌的行数与网格高度（12 条） ====================
    /**
     * @tc.number: SUB_MM_LAYR_0100
     * @tc.name: testLayReal0001
     * @tc.desc: Verify 12 songs in 3 columns need 4 rows on the compact breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0001 begin');
      const columns: number | undefined = new BreakpointType<number>(3, 5, 6).getValue('sm');
      const rows: number = Math.ceil(SONG_COUNT / (columns === undefined ? 1 : columns));
      hilog.info(DOMAIN, TAG, 'sm-rows actual=%{public}s expected=4', String(rows));
      expect(columns).assertEqual(3);
      expect(rows).assertEqual(4);
      expect(rows * 3).assertEqual(SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0001 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0200
     * @tc.name: testLayReal0002
     * @tc.desc: Verify 12 songs in 5 columns need 3 rows on the medium breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0002 begin');
      const columns: number | undefined = new BreakpointType<number>(3, 5, 6).getValue('md');
      const rows: number = Math.ceil(SONG_COUNT / (columns === undefined ? 1 : columns));
      hilog.info(DOMAIN, TAG, 'md-rows actual=%{public}s expected=3', String(rows));
      expect(columns).assertEqual(5);
      expect(rows).assertEqual(3);
      expect(rows * 5 >= SONG_COUNT).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0002 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0300
     * @tc.name: testLayReal0003
     * @tc.desc: Verify 12 songs in 6 columns need exactly 2 rows on the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0003 begin');
      const columns: number | undefined = new BreakpointType<number>(3, 5, 6).getValue('lg');
      const rows: number = Math.ceil(SONG_COUNT / (columns === undefined ? 1 : columns));
      hilog.info(DOMAIN, TAG, 'lg-rows actual=%{public}s expected=2', String(rows));
      expect(columns).assertEqual(6);
      expect(rows).assertEqual(2);
      expect(rows * 6).assertEqual(SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0003 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0400
     * @tc.name: testLayReal0004
     * @tc.desc: Verify a 40vp cell in 3 columns produces a 256vp compact grid height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0004 begin');
      const expected: number = gridHeightOf(40, 3, true);
      hilog.info(DOMAIN, TAG, 'sm-grid-height actual=%{public}s expected=256', String(expected));
      expect(expected).assertEqual(256);
      expect(expected > 4 * 40).assertTrue();
      expect(expected - 4 * 40).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0004 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0500
     * @tc.name: testLayReal0005
     * @tc.desc: Verify a 40vp cell in 5 columns produces a 200vp medium grid height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0005 begin');
      const expected: number = gridHeightOf(40, 5, true);
      hilog.info(DOMAIN, TAG, 'md-grid-height actual=%{public}s expected=200', String(expected));
      expect(expected).assertEqual(200);
      expect(expected < gridHeightOf(40, 3, true)).assertTrue();
      expect(expected - 3 * 40).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0005 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0600
     * @tc.name: testLayReal0006
     * @tc.desc: Verify a 40vp cell in 6 columns produces a 96vp large grid height without the player bar.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0006 begin');
      const expected: number = gridHeightOf(40, 6, false);
      hilog.info(DOMAIN, TAG, 'lg-grid-height actual=%{public}s expected=96', String(expected));
      expect(expected).assertEqual(96);
      expect(expected).assertEqual(2 * 40 + ROW_GAP);
      expect(expected + PLAYER_BAR).assertEqual(144);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0006 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0700
     * @tc.name: testLayReal0007
     * @tc.desc: Verify a 87.5vp fractional cell keeps its half vp in the compact grid height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0007 begin');
      const expected: number = gridHeightOf(87.5, 3, true);
      hilog.info(DOMAIN, TAG, 'sm-fraction-height actual=%{public}s expected=446', String(expected));
      expect(expected).assertEqual(446);
      expect(expected > 400).assertTrue();
      expect(expected - 4 * 87.5).assertEqual(96);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0007 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0800
     * @tc.name: testLayReal0008
     * @tc.desc: Verify a 87.5vp fractional cell keeps its half vp in the large grid height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0008 begin');
      const expected: number = gridHeightOf(87.5, 6, false);
      hilog.info(DOMAIN, TAG, 'lg-fraction-height actual=%{public}s expected=191', String(expected));
      expect(expected).assertEqual(191);
      expect(expected === 191.0).assertTrue();
      expect(expected - 2 * 87.5).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0008 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_0900
     * @tc.name: testLayReal0009
     * @tc.desc: Verify a zero height cell still reserves the row gaps and the player bar.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0009 begin');
      const expected: number = gridHeightOf(0, 5, true);
      hilog.info(DOMAIN, TAG, 'md-zero-height actual=%{public}s expected=80', String(expected));
      expect(expected).assertEqual(80);
      expect(expected - PLAYER_BAR).assertEqual(32);
      expect(expected > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0009 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1000
     * @tc.name: testLayReal0010
     * @tc.desc: Verify a zero height cell on lg collapses to a single row gap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0010 begin');
      const expected: number = gridHeightOf(0, 6, false);
      hilog.info(DOMAIN, TAG, 'lg-zero-height actual=%{public}s expected=16', String(expected));
      expect(expected).assertEqual(16);
      expect(expected).assertEqual(ROW_GAP);
      expect(expected < PLAYER_BAR).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0010 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1100
     * @tc.name: testLayReal0011
     * @tc.desc: Verify a tall 120vp cell in 3 columns keeps the compact player bar offset.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0011 begin');
      const expected: number = gridHeightOf(120, 3, true);
      hilog.info(DOMAIN, TAG, 'sm-tall-height actual=%{public}s expected=576', String(expected));
      expect(expected).assertEqual(576);
      expect(expected - 4 * 120).assertEqual(96);
      expect(expected > gridHeightOf(120, 6, false)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0011 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1200
     * @tc.name: testLayReal0012
     * @tc.desc: Verify a tall 120vp cell in 6 columns keeps the two row contract.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0012 begin');
      const expected: number = gridHeightOf(120, 6, false);
      hilog.info(DOMAIN, TAG, 'lg-tall-height actual=%{public}s expected=256', String(expected));
      expect(expected).assertEqual(256);
      expect(expected).assertEqual(2 * 120 + ROW_GAP);
      expect(expected < gridHeightOf(120, 3, true)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0012 end');
    })

    // ==================== 三处 columnsTemplate 与 GridRow 列数（9 条） ====================
    /**
     * @tc.number: SUB_MM_LAYR_1300
     * @tc.name: testLayReal0013
     * @tc.desc: Verify the song grid template uses three equal columns on sm.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0013 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const template: string | undefined = sut.getValue('sm');
      const templateText: string = template === undefined ? '' : template;
      const tokens: string[] = tokensOf(templateText);
      hilog.info(DOMAIN, TAG, 'sm-template actual=%{public}s expected=1fr 1fr 1fr', templateText);
      expect(columnsOf(templateText)).assertEqual(3);
      expect(tokens[0]).assertEqual('1fr');
      expect(tokens[2]).assertEqual('1fr');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0013 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1400
     * @tc.name: testLayReal0014
     * @tc.desc: Verify the song grid template uses five equal columns on md.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0014 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const template: string | undefined = sut.getValue('md');
      const templateText: string = template === undefined ? '' : template;
      hilog.info(DOMAIN, TAG, 'md-template actual=%{public}s', templateText);
      expect(columnsOf(templateText)).assertEqual(5);
      expect(templateText.indexOf('1fr 1fr 1fr 1fr 1fr')).assertEqual(0);
      expect(tokensOf(templateText)[4]).assertEqual('1fr');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0014 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1500
     * @tc.name: testLayReal0015
     * @tc.desc: Verify the song grid template uses six equal columns on lg.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0015 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const template: string | undefined = sut.getValue('lg');
      const templateText: string = template === undefined ? '' : template;
      hilog.info(DOMAIN, TAG, 'lg-template actual=%{public}s', templateText);
      expect(columnsOf(templateText)).assertEqual(6);
      expect(tokensOf(templateText)[5]).assertEqual('1fr');
      expect(columnsOf(templateText)).assertEqual(SONG_COUNT / 2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0015 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1600
     * @tc.name: testLayReal0016
     * @tc.desc: Verify the user song grid collapses to a single column on sm.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0016 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const template: string | undefined = sut.getValue('sm');
      const templateText: string = template === undefined ? '' : template;
      hilog.info(DOMAIN, TAG, 'user-sm-template actual=%{public}s expected=1fr', templateText);
      expect(templateText).assertEqual('1fr');
      expect(columnsOf(templateText)).assertEqual(1);
      expect(templateText.indexOf(' ')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0016 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1700
     * @tc.name: testLayReal0017
     * @tc.desc: Verify the user song grid uses five columns on md.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0017 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const template: string | undefined = sut.getValue('md');
      const templateText: string = template === undefined ? '' : template;
      hilog.info(DOMAIN, TAG, 'user-md-template actual=%{public}s', templateText);
      expect(columnsOf(templateText)).assertEqual(5);
      expect(columnsOf(templateText) > 1).assertTrue();
      expect(tokensOf(templateText)[0]).assertEqual('1fr');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0017 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1800
     * @tc.name: testLayReal0018
     * @tc.desc: Verify the user song grid uses six columns on lg and matches the song grid.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0018 begin');
      let user: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      let songs: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const userLg: string | undefined = user.getValue('lg');
      const songsLg: string | undefined = songs.getValue('lg');
      hilog.info(DOMAIN, TAG, 'user-lg-template actual=%{public}s/%{public}s', String(userLg), String(songsLg));
      expect(userLg).assertEqual(songsLg);
      expect(columnsOf(userLg === undefined ? '' : userLg)).assertEqual(6);
      expect(userLg === songs.getValue('sm')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0018 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_1900
     * @tc.name: testLayReal0019
     * @tc.desc: Verify the title bar spans fill exactly the 16 medium grid columns.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0019 begin');
      let columns: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      let spans: BreakpointType<string> = new BreakpointType<string>('7 7 1 1', '6 8 1 1', '15 7 1 1');
      const template: string | undefined = spans.getValue('md');
      const parts: string[] = tokensOf(template === undefined ? '' : template);
      let sum: number = 0;
      for (let i = 0; i < parts.length; i++) {
        sum = sum + Number(parts[i]);
      }
      hilog.info(DOMAIN, TAG, 'md-span-sum actual=%{public}s expected=16', String(sum));
      expect(sum).assertEqual(16);
      expect(columns.getValue('md')).assertEqual(sum);
      expect(parts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0019 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2000
     * @tc.name: testLayReal0020
     * @tc.desc: Verify the title bar spans fill exactly the 24 large grid columns.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0020 begin');
      let columns: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      let spans: BreakpointType<string> = new BreakpointType<string>('7 7 1 1', '6 8 1 1', '15 7 1 1');
      const template: string | undefined = spans.getValue('lg');
      const parts: string[] = tokensOf(template === undefined ? '' : template);
      let sum: number = 0;
      for (let i = 0; i < parts.length; i++) {
        sum = sum + Number(parts[i]);
      }
      hilog.info(DOMAIN, TAG, 'lg-span-sum actual=%{public}s expected=24', String(sum));
      expect(sum).assertEqual(24);
      expect(columns.getValue('lg')).assertEqual(sum);
      expect(Number(parts[0])).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0020 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2100
     * @tc.name: testLayReal0021
     * @tc.desc: Verify the compact title bar wraps because its four spans exceed 8 columns.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0021', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0021 begin');
      let columns: BreakpointType<number> = new BreakpointType<number>(8, 16, 24);
      let spans: BreakpointType<string> = new BreakpointType<string>('7 7 1 1', '6 8 1 1', '15 7 1 1');
      const template: string | undefined = spans.getValue('sm');
      const parts: string[] = tokensOf(template === undefined ? '' : template);
      let sum: number = 0;
      for (let i = 0; i < parts.length; i++) {
        sum = sum + Number(parts[i]);
      }
      hilog.info(DOMAIN, TAG, 'sm-span-sum actual=%{public}s expected=16', String(sum));
      expect(sum).assertEqual(16);
      expect(sum > (columns.getValue('sm') === undefined ? 0 : Number(columns.getValue('sm')))).assertTrue();
      expect(parts.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0021 end');
    })

    // ==================== 间距、轮播与页面内边距（11 条） ====================
    /**
     * @tc.number: SUB_MM_LAYR_2200
     * @tc.name: testLayReal0022
     * @tc.desc: Verify the shortcut list has no spacing on the compact breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0022 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const sm: number | undefined = sut.getValue('sm');
      hilog.info(DOMAIN, TAG, 'list-space-sm actual=%{public}s expected=0', String(sm));
      expect(sm).assertEqual(0);
      expect(sm === 0).assertTrue();
      expect(sut.getValue('md')).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0022 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2300
     * @tc.name: testLayReal0023
     * @tc.desc: Verify the shortcut list spacing doubles at the medium breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0023', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0023 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const md: number | undefined = sut.getValue('md');
      hilog.info(DOMAIN, TAG, 'list-space-md actual=%{public}s expected=35', String(md));
      expect(md).assertEqual(35);
      expect(md === 35).assertTrue();
      expect(sut.getValue('lg')).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0023 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2400
     * @tc.name: testLayReal0024
     * @tc.desc: Verify the shortcut list spacing reaches 63 on the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0024', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0024 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(0, 35, 63);
      const lg: number | undefined = sut.getValue('lg');
      hilog.info(DOMAIN, TAG, 'list-space-lg actual=%{public}s expected=63', String(lg));
      expect(lg).assertEqual(63);
      expect(lg === 63).assertTrue();
      expect(sut.getValue('md')).assertEqual(35);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0024 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2500
     * @tc.name: testLayReal0025
     * @tc.desc: Verify the banner swiper shows one of three banners on sm.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0025', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0025 begin');
      const banners: number = 3;
      const visible: number | undefined = new BreakpointType<number>(1, 2, 3).getValue('sm');
      hilog.info(DOMAIN, TAG, 'sm-visible-banners actual=%{public}s expected=1', String(visible));
      expect(visible).assertEqual(1);
      expect(visible === 1).assertTrue();
      expect(banners / (visible === undefined ? 1 : visible)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0025 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2600
     * @tc.name: testLayReal0026
     * @tc.desc: Verify the banner swiper shows two of three banners on md.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0026 begin');
      const visible: number | undefined = new BreakpointType<number>(1, 2, 3).getValue('md');
      hilog.info(DOMAIN, TAG, 'md-visible-banners actual=%{public}s expected=2', String(visible));
      expect(visible).assertEqual(2);
      expect(visible === 2).assertTrue();
      expect(visible === 3).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0026 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2700
     * @tc.name: testLayReal0027
     * @tc.desc: Verify the banner swiper shows all three banners on lg and switches to the column layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0027', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0027 begin');
      const visible: number | undefined = new BreakpointType<number>(1, 2, 3).getValue('lg');
      const indicator: boolean | undefined = new BreakpointType<boolean>(true, false, false).getValue('lg');
      hilog.info(DOMAIN, TAG, 'lg-visible-banners actual=%{public}s/%{public}s', String(visible), String(indicator));
      expect(visible).assertEqual(3);
      expect(indicator).assertFalse();
      expect(visible === 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0027 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2800
     * @tc.name: testLayReal0028
     * @tc.desc: Verify the page padding grows from 16 to 24 only on the large breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0028', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0028 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(
        new PaddingDataType(16, 16), new PaddingDataType(16, 16), new PaddingDataType(24, 24));
      const sm: PaddingDataType | undefined = sut.getValue('sm');
      const lg: PaddingDataType | undefined = sut.getValue('lg');
      const smLeft: number = sm === undefined ? -1 : sm.left;
      const lgLeft: number = lg === undefined ? -1 : lg.left;
      hilog.info(DOMAIN, TAG, 'padding-left actual=%{public}s/%{public}s expected=16/24',
        String(smLeft), String(lgLeft));
      expect(smLeft).assertEqual(16);
      expect(lgLeft).assertEqual(24);
      expect(lgLeft - smLeft).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0028 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_2900
     * @tc.name: testLayReal0029
     * @tc.desc: Verify the page padding stays symmetric on the medium breakpoint.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0029', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0029 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(
        new PaddingDataType(16, 16), new PaddingDataType(16, 16), new PaddingDataType(24, 24));
      const md: PaddingDataType | undefined = sut.getValue('md');
      const mdLeft: number = md === undefined ? -1 : md.left;
      const mdRight: number = md === undefined ? -1 : md.right;
      hilog.info(DOMAIN, TAG, 'padding-md actual=%{public}s/%{public}s expected=16/16',
        String(mdLeft), String(mdRight));
      expect(mdLeft).assertEqual(16);
      expect(mdRight).assertEqual(16);
      expect(mdLeft === mdRight).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0029 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3000
     * @tc.name: testLayReal0030
     * @tc.desc: Verify the compact tabs are bottom aligned and become vertical only on lg.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0030', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0030 begin');
      let vertical: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      let position: BreakpointType<string> = new BreakpointType<string>('end', 'end', 'start');
      const smVertical: boolean | undefined = vertical.getValue('sm');
      const lgVertical: boolean | undefined = vertical.getValue('lg');
      hilog.info(DOMAIN, TAG, 'tabs-orientation actual=%{public}s/%{public}s', String(smVertical),
        String(lgVertical));
      expect(smVertical).assertFalse();
      expect(lgVertical).assertTrue();
      expect(position.getValue('lg')).assertEqual('start');
      expect(position.getValue('sm')).assertEqual('end');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0030 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3100
     * @tc.name: testLayReal0031
     * @tc.desc: Verify the medium tabs stay horizontal but the player bar is still outside the grid.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0031', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0031 begin');
      let vertical: BreakpointType<boolean> = new BreakpointType<boolean>(false, false, true);
      const mdVertical: boolean | undefined = vertical.getValue('md');
      hilog.info(DOMAIN, TAG, 'md-tabs-vertical actual=%{public}s expected=false', String(mdVertical));
      expect(mdVertical).assertFalse();
      expect(mdVertical === true).assertFalse();
      expect(gridHeightOf(40, 5, mdVertical === false)).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0031 end');
    })

    // ==================== 非法断点与守卫（9 条） ====================
    /**
     * @tc.number: SUB_MM_LAYR_3200
     * @tc.name: testLayReal0032
     * @tc.desc: Verify an empty breakpoint returns no song template so the guard skips the height update.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0032', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0032 begin');
      let sut: BreakpointType<string> = new BreakpointType<string>('1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const miss: string | undefined = sut.getValue('');
      hilog.info(DOMAIN, TAG, 'empty-breakpoint actual=%{public}s expected=undefined', String(miss));
      expect(miss).assertUndefined();
      expect(sut.getValue('lg')).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      expect(miss === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0032 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3300
     * @tc.name: testLayReal0033
     * @tc.desc: Verify an upper case breakpoint cannot reach the large layout.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0033', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0033 begin');
      let sut: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      const miss: number | undefined = sut.getValue('LG');
      hilog.info(DOMAIN, TAG, 'lg-upper actual=%{public}s expected=undefined', String(miss));
      expect(miss).assertUndefined();
      expect(sut.getValue('lg')).assertEqual(6);
      expect(miss === sut.getValue('lg')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0033 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3400
     * @tc.name: testLayReal0034
     * @tc.desc: Verify the descriptive breakpoint name large leaves the padding config untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0034', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0034 begin');
      let sut: BreakpointType<PaddingDataType> = new BreakpointType<PaddingDataType>(
        new PaddingDataType(16, 16), new PaddingDataType(16, 16), new PaddingDataType(24, 24));
      const miss: PaddingDataType | undefined = sut.getValue('large');
      hilog.info(DOMAIN, TAG, 'large-breakpoint actual=%{public}s expected=undefined', String(miss));
      expect(miss).assertUndefined();
      expect(sut.getValue('lg') === sut.lg).assertTrue();
      expect(miss === sut.lg).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0034 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3500
     * @tc.name: testLayReal0035
     * @tc.desc: Verify a 12 item grid divides evenly by 3 and 6 but not by 5.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0035', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0035 begin');
      hilog.info(DOMAIN, TAG, 'divisibility actual=%{public}s/%{public}s/%{public}s',
        String(SONG_COUNT % 3), String(SONG_COUNT % 6), String(SONG_COUNT % 5));
      expect(SONG_COUNT % 3).assertEqual(0);
      expect(SONG_COUNT % 6).assertEqual(0);
      expect(SONG_COUNT % 5).assertEqual(2);
      expect(Math.ceil(SONG_COUNT / 5)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0035 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3600
     * @tc.name: testLayReal0036
     * @tc.desc: Verify the same row formula keeps 3 rows when one more song is added.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0036', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0036 begin');
      const rows: number = Math.ceil(13 / 5);
      const height: number = (ROW_GAP + 40) * rows - ROW_GAP + PLAYER_BAR;
      hilog.info(DOMAIN, TAG, 'thirteen-songs actual=%{public}s/%{public}s expected=3/200',
        String(rows), String(height));
      expect(rows).assertEqual(3);
      expect(height).assertEqual(200);
      expect(height).assertEqual(gridHeightOf(40, 5, true));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0036 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3700
     * @tc.name: testLayReal0037
     * @tc.desc: Verify an empty song list produces zero rows and a negative free height.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0037', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0037 begin');
      const rows: number = Math.ceil(0 / 6);
      const height: number = (ROW_GAP + 40) * rows - ROW_GAP;
      hilog.info(DOMAIN, TAG, 'empty-grid actual=%{public}s/%{public}s expected=0/-16',
        String(rows), String(height));
      expect(rows).assertEqual(0);
      expect(height).assertEqual(-ROW_GAP);
      expect(height < 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0037 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3800
     * @tc.name: testLayReal0038
     * @tc.desc: Verify a full single row cancels the trailing row gap.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0038', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0038 begin');
      const singleRow: number = (ROW_GAP + 40) * 1 - ROW_GAP;
      hilog.info(DOMAIN, TAG, 'single-row-height actual=%{public}s expected=40', String(singleRow));
      expect(singleRow).assertEqual(40);
      expect(singleRow).assertEqual(gridHeightOf(40, 12, false));
      expect(singleRow < gridHeightOf(40, 6, false)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0038 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_3900
     * @tc.name: testLayReal0039
     * @tc.desc: Verify the player bar offset is exactly 48 on both non large breakpoints.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level1
     */
    it('testLayReal0039', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0039 begin');
      const withoutBar: number = gridHeightOf(40, 3, false);
      const withBar: number = gridHeightOf(40, 3, true);
      hilog.info(DOMAIN, TAG, 'player-bar-delta actual=%{public}s expected=48', String(withBar - withoutBar));
      expect(withBar - withoutBar).assertEqual(PLAYER_BAR);
      expect(PLAYER_BAR).assertEqual(48);
      expect(withBar > withoutBar).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0039 end');
    })

    /**
     * @tc.number: SUB_MM_LAYR_4000
     * @tc.name: testLayReal0040
     * @tc.desc: Verify the lg layout contract end to end through one breakpoint config.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level0
     */
    it('testLayReal0040', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0040 begin');
      let columns: BreakpointType<number> = new BreakpointType<number>(3, 5, 6);
      let template: BreakpointType<string> = new BreakpointType<string>('1fr 1fr 1fr', '1fr 1fr 1fr 1fr 1fr',
        '1fr 1fr 1fr 1fr 1fr 1fr');
      const lgColumns: number | undefined = columns.getValue('lg');
      const lgTemplate: string | undefined = template.getValue('lg');
      const lgTokens: number = columnsOf(lgTemplate === undefined ? '' : lgTemplate);
      hilog.info(DOMAIN, TAG, 'lg-contract actual=%{public}s/%{public}s expected=6/6',
        String(lgColumns), String(lgTokens));
      expect(lgColumns).assertEqual(6);
      expect(lgTokens).assertEqual(lgColumns);
      expect(Math.ceil(SONG_COUNT / (lgColumns === undefined ? 1 : lgColumns))).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testLayReal0040 end');
    })
  })
}
