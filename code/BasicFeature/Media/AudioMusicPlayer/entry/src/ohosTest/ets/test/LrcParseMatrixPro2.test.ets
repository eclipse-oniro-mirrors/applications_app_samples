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

export default function LrcParseMatrixPro2Test() {
  describe('LrcParseMatrixPro2Test', () => {
    /**
     * @tc.number SUB_LRC_PRO2_0100
     * @tc.name testLrcPro20001
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0200
     * @tc.name testLrcPro20002
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.00] b");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(2000);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0300
     * @tc.name testLrcPro20003
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(7500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0400
     * @tc.name testLrcPro20004
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.00]x y z");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(15000);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0500
     * @tc.name testLrcPro20005
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:45.00]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(45000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0600
     * @tc.name testLrcPro20006
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:30.00]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(90000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0700
     * @tc.name testLrcPro20007
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:30.00] chorus");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(150000);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0800
     * @tc.name testLrcPro20008
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[04:00.00]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(240000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_0900
     * @tc.name testLrcPro20009
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[10:00.00]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(600000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1000
     * @tc.name testLrcPro20010
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.25] b");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(250);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1100
     * @tc.name testLrcPro20011
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.25]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(2250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1200
     * @tc.name testLrcPro20012
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.75]x y z");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(7750);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1300
     * @tc.name testLrcPro20013
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.25]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(15250);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1400
     * @tc.name testLrcPro20014
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:45.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(45250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1500
     * @tc.name testLrcPro20015
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:30.25] chorus");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(90250);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1600
     * @tc.name testLrcPro20016
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:30.25]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(150250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1700
     * @tc.name testLrcPro20017
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[04:00.25]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(240250);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1800
     * @tc.name testLrcPro20018
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[10:00.25] b");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(600250);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_1900
     * @tc.name testLrcPro20019
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2000
     * @tc.name testLrcPro20020
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.50]x y z");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(2500);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2100
     * @tc.name testLrcPro20021
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:08.00]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(8000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2200
     * @tc.name testLrcPro20022
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.50]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(15500);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2300
     * @tc.name testLrcPro20023
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:45.50] chorus");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(45500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2400
     * @tc.name testLrcPro20024
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:30.50]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(90500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2500
     * @tc.name testLrcPro20025
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:30.50]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(150500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2600
     * @tc.name testLrcPro20026
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[04:00.50] b");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(240500);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2700
     * @tc.name testLrcPro20027
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[10:00.50]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(600500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2800
     * @tc.name testLrcPro20028
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.75]x y z");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(750);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_2900
     * @tc.name testLrcPro20029
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.75]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(2750);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3000
     * @tc.name testLrcPro20030
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:08.25]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(8250);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3100
     * @tc.name testLrcPro20031
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.75] chorus");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(15750);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3200
     * @tc.name testLrcPro20032
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:45.75]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(45750);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3300
     * @tc.name testLrcPro20033
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:30.75]a");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(90750);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3400
     * @tc.name testLrcPro20034
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[02:30.75] b");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(150750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3500
     * @tc.name testLrcPro20035
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[04:00.75]\u4f60\u597d");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(240750);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3600
     * @tc.name testLrcPro20036
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[10:00.75]x y z");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(600750);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3700
     * @tc.name testLrcPro20037
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.00]OpenHarmony");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3800
     * @tc.name testLrcPro20038
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.00]line");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(2000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_3900
     * @tc.name testLrcPro20039
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.50] chorus");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(7500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_4000
     * @tc.name testLrcPro20040
     * @tc.desc Verify parseLrcLyric parses 1 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.00]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(15000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[0].lineDuration).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_LRC_PRO2_4100
     * @tc.name testLrcPro20041
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.75] b\n[00:00.00]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(5750);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4200
     * @tc.name testLrcPro20042
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:13.25]x y z\n[00:07.50]\u4f60\u597d\n[00:01.75] b\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(7500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[2].lineStartTime).assertEqual(13250);
      expect(entries[2].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4300
     * @tc.name testLrcPro20043
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:19.75]line\n[00:14.00]OpenHarmony\n[00:09.25]x y z\n[00:03.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(3500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(9250);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineStartTime).assertEqual(14000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[3].lineStartTime).assertEqual(19750);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4400
     * @tc.name testLrcPro20044
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.00]OpenHarmony\n[00:05.25]x y z\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(5250);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(10000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4500
     * @tc.name testLrcPro20045
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:17.50] chorus\n[00:11.75]line\n[00:06.00]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(6000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(11750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[2].lineStartTime).assertEqual(17500);
      expect(entries[2].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4600
     * @tc.name testLrcPro20046
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:24.00]a\n[00:19.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:13.50] chorus\n[00:07.75]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(7750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(13500);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineStartTime).assertEqual(19250);
      expect(entries[2].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[3].lineStartTime).assertEqual(24000);
      expect(entries[3].lineWords.trim()).assertEqual("a");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4700
     * @tc.name testLrcPro20047
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:15.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:09.50] chorus\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(9500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(15250);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4800
     * @tc.name testLrcPro20048
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:21.75] b\n[00:16.00]a\n[00:11.25]\u4e2d\u6587\u6b4c\u8bcd\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(11250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(16000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[2].lineStartTime).assertEqual(21750);
      expect(entries[2].lineWords.trim()).assertEqual("b");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_4900
     * @tc.name testLrcPro20049
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:29.25]x y z\n[00:23.50]\u4f60\u597d\n[00:17.75] b\n[00:12.00]a\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(12000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(17750);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[2].lineStartTime).assertEqual(23500);
      expect(entries[2].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].lineStartTime).assertEqual(29250);
      expect(entries[3].lineWords.trim()).assertEqual("x y z");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5000
     * @tc.name testLrcPro20050
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:19.50]\u4f60\u597d\n[00:13.75] b\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(13750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(19500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5100
     * @tc.name testLrcPro20051
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:26.00]OpenHarmony\n[00:21.25]x y z\n[00:15.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(15500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(21250);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineStartTime).assertEqual(26000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5200
     * @tc.name testLrcPro20052
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:33.50] chorus\n[00:27.75]line\n[00:22.00]OpenHarmony\n[00:17.25]x y z\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(17250);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(22000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].lineStartTime).assertEqual(27750);
      expect(entries[2].lineWords.trim()).assertEqual("line");
      expect(entries[3].lineStartTime).assertEqual(33500);
      expect(entries[3].lineWords.trim()).assertEqual("chorus");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5300
     * @tc.name testLrcPro20053
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:23.75]line\n[00:18.00]OpenHarmony\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(18000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(23750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5400
     * @tc.name testLrcPro20054
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:31.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:25.50] chorus\n[00:19.75]line\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(19750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(25500);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineStartTime).assertEqual(31250);
      expect(entries[2].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5500
     * @tc.name testLrcPro20055
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:37.75] b\n[00:32.00]a\n[00:27.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:21.50] chorus\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(21500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(27250);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[2].lineStartTime).assertEqual(32000);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[3].lineStartTime).assertEqual(37750);
      expect(entries[3].lineWords.trim()).assertEqual("b");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5600
     * @tc.name testLrcPro20056
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:28.00]a\n[00:23.25]\u4e2d\u6587\u6b4c\u8bcd\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(23250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(28000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5700
     * @tc.name testLrcPro20057
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:35.50]\u4f60\u597d\n[00:29.75] b\n[00:24.00]a\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(24000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(29750);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[2].lineStartTime).assertEqual(35500);
      expect(entries[2].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5800
     * @tc.name testLrcPro20058
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:42.00]OpenHarmony\n[00:37.25]x y z\n[00:31.50]\u4f60\u597d\n[00:25.75] b\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(25750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(31500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[2].lineStartTime).assertEqual(37250);
      expect(entries[2].lineWords.trim()).assertEqual("x y z");
      expect(entries[3].lineStartTime).assertEqual(42000);
      expect(entries[3].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_5900
     * @tc.name testLrcPro20059
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:33.25]x y z\n[00:27.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(27500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(33250);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6000
     * @tc.name testLrcPro20060
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:39.75]line\n[00:34.00]OpenHarmony\n[00:29.25]x y z\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(29250);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(34000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].lineStartTime).assertEqual(39750);
      expect(entries[2].lineWords.trim()).assertEqual("line");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6100
     * @tc.name testLrcPro20061
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:47.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:41.50] chorus\n[00:35.75]line\n[00:30.00]OpenHarmony\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(30000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(35750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[2].lineStartTime).assertEqual(41500);
      expect(entries[2].lineWords.trim()).assertEqual("chorus");
      expect(entries[3].lineStartTime).assertEqual(47250);
      expect(entries[3].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6200
     * @tc.name testLrcPro20062
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:37.50] chorus\n[00:31.75]line\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(31750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(37500);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6300
     * @tc.name testLrcPro20063
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:44.00]a\n[00:39.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:33.50] chorus\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(33500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(39250);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[2].lineStartTime).assertEqual(44000);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6400
     * @tc.name testLrcPro20064
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:51.50]\u4f60\u597d\n[00:45.75] b\n[00:40.00]a\n[00:35.25]\u4e2d\u6587\u6b4c\u8bcd\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(35250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(40000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[2].lineStartTime).assertEqual(45750);
      expect(entries[2].lineWords.trim()).assertEqual("b");
      expect(entries[3].lineStartTime).assertEqual(51500);
      expect(entries[3].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6500
     * @tc.name testLrcPro20065
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:41.75] b\n[00:36.00]a\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(36000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(41750);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6600
     * @tc.name testLrcPro20066
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:49.25]x y z\n[00:43.50]\u4f60\u597d\n[00:37.75] b\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(37750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(43500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[2].lineStartTime).assertEqual(49250);
      expect(entries[2].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6700
     * @tc.name testLrcPro20067
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:55.75]line\n[00:50.00]OpenHarmony\n[00:45.25]x y z\n[00:39.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(39500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(45250);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineStartTime).assertEqual(50000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[3].lineStartTime).assertEqual(55750);
      expect(entries[3].lineWords.trim()).assertEqual("line");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6800
     * @tc.name testLrcPro20068
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:46.00]OpenHarmony\n[00:41.25]x y z\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(41250);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(46000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_6900
     * @tc.name testLrcPro20069
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:53.50] chorus\n[00:47.75]line\n[00:42.00]OpenHarmony\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(42000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(47750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[2].lineStartTime).assertEqual(53500);
      expect(entries[2].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7000
     * @tc.name testLrcPro20070
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:00.00]a\n[00:55.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:49.50] chorus\n[00:43.75]line\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(43750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(49500);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineStartTime).assertEqual(55250);
      expect(entries[2].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[3].lineStartTime).assertEqual(60000);
      expect(entries[3].lineWords.trim()).assertEqual("a");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7100
     * @tc.name testLrcPro20071
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:51.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:45.50] chorus\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(45500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(51250);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7200
     * @tc.name testLrcPro20072
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:57.75] b\n[00:52.00]a\n[00:47.25]\u4e2d\u6587\u6b4c\u8bcd\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(47250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(52000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[2].lineStartTime).assertEqual(57750);
      expect(entries[2].lineWords.trim()).assertEqual("b");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7300
     * @tc.name testLrcPro20073
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:05.25]x y z\n[00:59.50]\u4f60\u597d\n[00:53.75] b\n[00:48.00]a\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(48000);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(53750);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[2].lineStartTime).assertEqual(59500);
      expect(entries[2].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[3].lineStartTime).assertEqual(65250);
      expect(entries[3].lineWords.trim()).assertEqual("x y z");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7400
     * @tc.name testLrcPro20074
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:55.50]\u4f60\u597d\n[00:49.75] b\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(49750);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(55500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7500
     * @tc.name testLrcPro20075
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:02.00]OpenHarmony\n[00:57.25]x y z\n[00:51.50]\u4f60\u597d\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(51500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(57250);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[2].lineStartTime).assertEqual(62000);
      expect(entries[2].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7600
     * @tc.name testLrcPro20076
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:09.50] chorus\n[01:03.75]line\n[00:58.00]OpenHarmony\n[00:53.25]x y z\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(53250);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(58000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[2].lineStartTime).assertEqual(63750);
      expect(entries[2].lineWords.trim()).assertEqual("line");
      expect(entries[3].lineStartTime).assertEqual(69500);
      expect(entries[3].lineWords.trim()).assertEqual("chorus");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7700
     * @tc.name testLrcPro20077
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:59.75]line\n[00:54.00]OpenHarmony\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(54000);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(59750);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7800
     * @tc.name testLrcPro20078
     * @tc.desc Verify parseLrcLyric parses 3 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:07.25]\u4e2d\u6587\u6b4c\u8bcd\n[01:01.50] chorus\n[00:55.75]line\n");
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(55750);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(61500);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[2].lineStartTime).assertEqual(67250);
      expect(entries[2].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[2].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_7900
     * @tc.name testLrcPro20079
     * @tc.desc Verify parseLrcLyric parses 4 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:13.75] b\n[01:08.00]a\n[01:03.25]\u4e2d\u6587\u6b4c\u8bcd\n[00:57.50] chorus\n");
      expect(entries.length).assertEqual(4);
      expect(entries[0].lineStartTime).assertEqual(57500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(63250);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[2].lineStartTime).assertEqual(68000);
      expect(entries[2].lineWords.trim()).assertEqual("a");
      expect(entries[3].lineStartTime).assertEqual(73750);
      expect(entries[3].lineWords.trim()).assertEqual("b");
      expect(entries[3].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8000
     * @tc.name testLrcPro20080
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[01:04.00]a\n[00:59.25]\u4e2d\u6587\u6b4c\u8bcd\n");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(59250);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(64000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8100
     * @tc.name testLrcPro20081
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:00.50][00:01.00]a");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(1000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8200
     * @tc.name testLrcPro20082
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.00][00:01.50] b");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(1500);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8300
     * @tc.name testLrcPro20083
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:01.50][00:02.00]\u4f60\u597d");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(2000);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8400
     * @tc.name testLrcPro20084
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.00][00:02.50]x y z");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(2000);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(2500);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8500
     * @tc.name testLrcPro20085
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:02.50][00:03.00]OpenHarmony");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(2500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(3000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8600
     * @tc.name testLrcPro20086
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:03.00][00:03.50]line");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(3000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(3500);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8700
     * @tc.name testLrcPro20087
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:03.50][00:04.00] chorus");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(3500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(4000);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8800
     * @tc.name testLrcPro20088
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:04.00][00:04.50]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(4000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(4500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_8900
     * @tc.name testLrcPro20089
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:04.50][00:05.00]a");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(4500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(5000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9000
     * @tc.name testLrcPro20090
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.00][00:05.50] b");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(5500);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9100
     * @tc.name testLrcPro20091
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:05.50][00:06.00]\u4f60\u597d");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(5500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(6000);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9200
     * @tc.name testLrcPro20092
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:06.00][00:06.50]x y z");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(6000);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(6500);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9300
     * @tc.name testLrcPro20093
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:06.50][00:07.00]OpenHarmony");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(6500);
      expect(entries[0].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineStartTime).assertEqual(7000);
      expect(entries[1].lineWords.trim()).assertEqual("OpenHarmony");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9400
     * @tc.name testLrcPro20094
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.00][00:07.50]line");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(7000);
      expect(entries[0].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineStartTime).assertEqual(7500);
      expect(entries[1].lineWords.trim()).assertEqual("line");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9500
     * @tc.name testLrcPro20095
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:07.50][00:08.00] chorus");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(7500);
      expect(entries[0].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineStartTime).assertEqual(8000);
      expect(entries[1].lineWords.trim()).assertEqual("chorus");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9600
     * @tc.name testLrcPro20096
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:08.00][00:08.50]\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(8000);
      expect(entries[0].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineStartTime).assertEqual(8500);
      expect(entries[1].lineWords.trim()).assertEqual("\u4e2d\u6587\u6b4c\u8bcd");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9700
     * @tc.name testLrcPro20097
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:08.50][00:09.00]a");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(8500);
      expect(entries[0].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineStartTime).assertEqual(9000);
      expect(entries[1].lineWords.trim()).assertEqual("a");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9800
     * @tc.name testLrcPro20098
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:09.00][00:09.50] b");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(9000);
      expect(entries[0].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineStartTime).assertEqual(9500);
      expect(entries[1].lineWords.trim()).assertEqual("b");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_9900
     * @tc.name testLrcPro20099
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:09.50][00:10.00]\u4f60\u597d");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(9500);
      expect(entries[0].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineStartTime).assertEqual(10000);
      expect(entries[1].lineWords.trim()).assertEqual("\u4f60\u597d");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number SUB_LRC_PRO2_10000
     * @tc.name testLrcPro20100
     * @tc.desc Verify parseLrcLyric parses 2 sorted entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testLrcPro20100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseLrcLyric("[00:10.00][00:10.50]x y z");
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineStartTime).assertEqual(10500);
      expect(entries[1].lineWords.trim()).assertEqual("x y z");
      expect(entries[1].lineDuration).assertEqual(Number.MAX_VALUE);
      let ordered: boolean = true;
      for (let i = 1; i < entries.length; i++) {
        if (entries[i].lineStartTime < entries[i - 1].lineStartTime) { ordered = false; }
      }
      expect(ordered).assertTrue();
    });
  });
}
