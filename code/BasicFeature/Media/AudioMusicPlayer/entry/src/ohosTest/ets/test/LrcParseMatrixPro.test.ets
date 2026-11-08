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
import { parseLrcLyric } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';

export default function LrcParseMatrixProTest() {
  describe('LrcParseMatrixProTest', () => {
    /**
     * @tc.number SUB_LRC_PRO_0100
     * @tc.name testLrcPro0001
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0200
     * @tc.name testLrcPro0002
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.00] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0300
     * @tc.name testLrcPro0003
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.00]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0400
     * @tc.name testLrcPro0004
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.00]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0500
     * @tc.name testLrcPro0005
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.50]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(21500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0600
     * @tc.name testLrcPro0006
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.00]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0700
     * @tc.name testLrcPro0007
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0800
     * @tc.name testLrcPro0008
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.00] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_0900
     * @tc.name testLrcPro0009
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.00]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1000
     * @tc.name testLrcPro0010
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.25]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1100
     * @tc.name testLrcPro0011
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.25]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1250);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1200
     * @tc.name testLrcPro0012
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1300
     * @tc.name testLrcPro0013
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.25]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10250);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1400
     * @tc.name testLrcPro0014
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.75] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(21750);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1500
     * @tc.name testLrcPro0015
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.25]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1600
     * @tc.name testLrcPro0016
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.25]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1700
     * @tc.name testLrcPro0017
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.25]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120250);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1800
     * @tc.name testLrcPro0018
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_1900
     * @tc.name testLrcPro0019
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.50]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2000
     * @tc.name testLrcPro0020
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.50] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1500);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2100
     * @tc.name testLrcPro0021
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2200
     * @tc.name testLrcPro0022
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.50]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10500);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2300
     * @tc.name testLrcPro0023
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:22.00]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(22000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2400
     * @tc.name testLrcPro0024
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.50]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60500);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2500
     * @tc.name testLrcPro0025
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.50]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2600
     * @tc.name testLrcPro0026
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.50] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120500);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2700
     * @tc.name testLrcPro0027
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2800
     * @tc.name testLrcPro0028
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.75]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(750);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_2900
     * @tc.name testLrcPro0029
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.75]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1750);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3000
     * @tc.name testLrcPro0030
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.75]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3100
     * @tc.name testLrcPro0031
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.75]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10750);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3200
     * @tc.name testLrcPro0032
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:22.25] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(22250);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3300
     * @tc.name testLrcPro0033
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.75]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60750);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3400
     * @tc.name testLrcPro0034
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.75]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61750);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3500
     * @tc.name testLrcPro0035
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.75]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120750);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3600
     * @tc.name testLrcPro0036
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.75]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3700
     * @tc.name testLrcPro0037
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3800
     * @tc.name testLrcPro0038
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.00] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_3900
     * @tc.name testLrcPro0039
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.00]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4000
     * @tc.name testLrcPro0040
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.00]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4100
     * @tc.name testLrcPro0041
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.50]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(21500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4200
     * @tc.name testLrcPro0042
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.00]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4300
     * @tc.name testLrcPro0043
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4400
     * @tc.name testLrcPro0044
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.00] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4500
     * @tc.name testLrcPro0045
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.00]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4600
     * @tc.name testLrcPro0046
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.25]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4700
     * @tc.name testLrcPro0047
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.25]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1250);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4800
     * @tc.name testLrcPro0048
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 48
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_4900
     * @tc.name testLrcPro0049
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.25]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10250);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5000
     * @tc.name testLrcPro0050
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.75] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(21750);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5100
     * @tc.name testLrcPro0051
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 51
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.25]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5200
     * @tc.name testLrcPro0052
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 52
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:01.25]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(61250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5300
     * @tc.name testLrcPro0053
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:00.25]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120250);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5400
     * @tc.name testLrcPro0054
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[59:59.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5500
     * @tc.name testLrcPro0055
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.50]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5600
     * @tc.name testLrcPro0056
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.50] hello");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1500);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5700
     * @tc.name testLrcPro0057
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 57
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5800
     * @tc.name testLrcPro0058
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 58
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.50]x y");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10500);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_5900
     * @tc.name testLrcPro0059
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:22.00]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(22000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_6000
     * @tc.name testLrcPro0060
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries for case 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.50]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60500);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO_6100
     * @tc.name testLrcPro0061
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 61
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.25] hello\n[00:00.00]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(7250);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6200
     * @tc.name testLrcPro0062
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 62
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.75]x y\n[00:08.50]\u4f60\u597d\n[00:01.25] hello\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1250);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(8500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(15750);
      expect(entries[2].lineWords.trim()).assertEqual("x y");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6300
     * @tc.name testLrcPro0063
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:23.25]line\n[00:16.00]OpenHarmony\n[00:09.75]x y\n[00:02.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(2500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(9750);
      expect(entries[1].lineWords.trim()).assertEqual("x y");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(16000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(23250);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6400
     * @tc.name testLrcPro0064
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.00]OpenHarmony\n[00:03.75]x y\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(3750);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(10000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6500
     * @tc.name testLrcPro0065
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:18.50]a\n[00:11.25]line\n[00:04.00]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(4000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(11250);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(18500);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6600
     * @tc.name testLrcPro0066
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 66
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:26.00]\u4f60\u597d\n[00:19.75] hello\n[00:12.50]a\n[00:05.25]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(5250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(12500);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(19750);
      expect(entries[2].lineWords.trim()).assertEqual("hello");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(26000);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6700
     * @tc.name testLrcPro0067
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 67
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:13.75] hello\n[00:06.50]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(6500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(13750);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6800
     * @tc.name testLrcPro0068
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 68
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.25]x y\n[00:14.00]\u4f60\u597d\n[00:07.75] hello\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(7750);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(14000);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(21250);
      expect(entries[2].lineWords.trim()).assertEqual("x y");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_6900
     * @tc.name testLrcPro0069
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 69
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:29.75]line\n[00:22.50]OpenHarmony\n[00:15.25]x y\n[00:08.00]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(8000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(15250);
      expect(entries[1].lineWords.trim()).assertEqual("x y");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(22500);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(29750);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7000
     * @tc.name testLrcPro0070
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 70
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:16.50]OpenHarmony\n[00:09.25]x y\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(9250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(16500);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7100
     * @tc.name testLrcPro0071
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 71
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:24.00]a\n[00:17.75]line\n[00:10.50]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(10500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(17750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(24000);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7200
     * @tc.name testLrcPro0072
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 72
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:32.50]\u4f60\u597d\n[00:25.25] hello\n[00:18.00]a\n[00:11.75]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(11750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(18000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(25250);
      expect(entries[2].lineWords.trim()).assertEqual("hello");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(32500);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7300
     * @tc.name testLrcPro0073
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 73
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:19.25] hello\n[00:12.00]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(12000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(19250);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7400
     * @tc.name testLrcPro0074
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 74
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:27.75]x y\n[00:20.50]\u4f60\u597d\n[00:13.25] hello\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(13250);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(20500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(27750);
      expect(entries[2].lineWords.trim()).assertEqual("x y");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7500
     * @tc.name testLrcPro0075
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:35.25]line\n[00:28.00]OpenHarmony\n[00:21.75]x y\n[00:14.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(14500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(21750);
      expect(entries[1].lineWords.trim()).assertEqual("x y");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(28000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(35250);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7600
     * @tc.name testLrcPro0076
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 76
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:22.00]OpenHarmony\n[00:15.75]x y\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(15750);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(22000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7700
     * @tc.name testLrcPro0077
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:30.50]a\n[00:23.25]line\n[00:16.00]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(16000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(23250);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(30500);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7800
     * @tc.name testLrcPro0078
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 78
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:38.00]\u4f60\u597d\n[00:31.75] hello\n[00:24.50]a\n[00:17.25]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(17250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(24500);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(31750);
      expect(entries[2].lineWords.trim()).assertEqual("hello");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(38000);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_7900
     * @tc.name testLrcPro0079
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 79
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:25.75] hello\n[00:18.50]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(18500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(25750);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8000
     * @tc.name testLrcPro0080
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 80
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:33.25]x y\n[00:26.00]\u4f60\u597d\n[00:19.75] hello\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(19750);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(26000);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(33250);
      expect(entries[2].lineWords.trim()).assertEqual("x y");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8100
     * @tc.name testLrcPro0081
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 81
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:41.75]line\n[00:34.50]OpenHarmony\n[00:27.25]x y\n[00:20.00]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(20000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(27250);
      expect(entries[1].lineWords.trim()).assertEqual("x y");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(34500);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(41750);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8200
     * @tc.name testLrcPro0082
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 82
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:28.50]OpenHarmony\n[00:21.25]x y\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(21250);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(28500);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8300
     * @tc.name testLrcPro0083
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 83
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:36.00]a\n[00:29.75]line\n[00:22.50]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(22500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(29750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(36000);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8400
     * @tc.name testLrcPro0084
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 84
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:44.50]\u4f60\u597d\n[00:37.25] hello\n[00:30.00]a\n[00:23.75]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(23750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(30000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(37250);
      expect(entries[2].lineWords.trim()).assertEqual("hello");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(44500);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8500
     * @tc.name testLrcPro0085
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 85
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:31.25] hello\n[00:24.00]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(24000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(31250);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8600
     * @tc.name testLrcPro0086
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 86
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:39.75]x y\n[00:32.50]\u4f60\u597d\n[00:25.25] hello\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(25250);
      expect(entries[0].lineWords.trim()).assertEqual("hello");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(32500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(39750);
      expect(entries[2].lineWords.trim()).assertEqual("x y");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8700
     * @tc.name testLrcPro0087
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 87
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:47.25]line\n[00:40.00]OpenHarmony\n[00:33.75]x y\n[00:26.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(26500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(33750);
      expect(entries[1].lineWords.trim()).assertEqual("x y");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(40000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(47250);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8800
     * @tc.name testLrcPro0088
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:34.00]OpenHarmony\n[00:27.75]x y\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(27750);
      expect(entries[0].lineWords.trim()).assertEqual("x y");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(34000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_8900
     * @tc.name testLrcPro0089
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries for case 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:42.50]a\n[00:35.25]line\n[00:28.00]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(28000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(35250);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(42500);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_9000
     * @tc.name testLrcPro0090
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries for case 90
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:50.00]\u4f60\u597d\n[00:43.75] hello\n[00:36.50]a\n[00:29.25]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(29250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(36500);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[2].lineStartTime).assertEqual(43750);
      expect(entries[2].lineWords.trim()).assertEqual("hello");
      expect(entries[2].words.length).assertEqual(0);
      expect(entries[3].lineStartTime).assertEqual(50000);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].words.length).assertEqual(0);
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO_9100
     * @tc.name testLrcPro0091
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries for case 91
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:37.75] hello\n[00:30.50]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(30500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].words.length).assertEqual(0);
      expect(entries[1].lineStartTime).assertEqual(37750);
      expect(entries[1].lineWords.trim()).assertEqual("hello");
      expect(entries[1].words.length).assertEqual(0);
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let sorted: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) {
          sorted = false;
        }
      }
      expect(sorted).assertTrue();
    });


  });
}
