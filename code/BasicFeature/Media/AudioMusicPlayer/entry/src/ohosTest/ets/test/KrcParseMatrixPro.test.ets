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
import { parseKrcLyric } from '../../../main/ets/common/utils/LrcUtils';
import { LrcEntry } from '../../../main/ets/viewmodel/LrcEntry';

export default function KrcParseMatrixProTest() {
  describe('KrcParseMatrixProTest', () => {
    /**
     * @tc.number SUB_KRC_PRO_0100
     * @tc.name testKrcPro0001
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,0]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_0200
     * @tc.name testKrcPro0002
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,100]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_0300
     * @tc.name testKrcPro0003
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,500]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_0400
     * @tc.name testKrcPro0004
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,1000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_0500
     * @tc.name testKrcPro0005
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,5000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_0600
     * @tc.name testKrcPro0006
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,0]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_0700
     * @tc.name testKrcPro0007
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,100]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_0800
     * @tc.name testKrcPro0008
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,500]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_0900
     * @tc.name testKrcPro0009
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,1000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_1000
     * @tc.name testKrcPro0010
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,5000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_1100
     * @tc.name testKrcPro0011
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,0]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_1200
     * @tc.name testKrcPro0012
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,100]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_1300
     * @tc.name testKrcPro0013
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,500]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_1400
     * @tc.name testKrcPro0014
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,1000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_1500
     * @tc.name testKrcPro0015
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,5000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_1600
     * @tc.name testKrcPro0016
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,0]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_1700
     * @tc.name testKrcPro0017
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,100]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_1800
     * @tc.name testKrcPro0018
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,500]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_1900
     * @tc.name testKrcPro0019
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,1000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_2000
     * @tc.name testKrcPro0020
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,5000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_2100
     * @tc.name testKrcPro0021
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,0]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_2200
     * @tc.name testKrcPro0022
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,100]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_2300
     * @tc.name testKrcPro0023
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,500]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_2400
     * @tc.name testKrcPro0024
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,1000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_2500
     * @tc.name testKrcPro0025
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,5000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_2600
     * @tc.name testKrcPro0026
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,0]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_2700
     * @tc.name testKrcPro0027
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,100]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_2800
     * @tc.name testKrcPro0028
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,500]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_2900
     * @tc.name testKrcPro0029
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,1000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_3000
     * @tc.name testKrcPro0030
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,5000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_3100
     * @tc.name testKrcPro0031
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,0]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_3200
     * @tc.name testKrcPro0032
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,100]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_3300
     * @tc.name testKrcPro0033
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,500]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_3400
     * @tc.name testKrcPro0034
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,1000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_3500
     * @tc.name testKrcPro0035
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,5000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_3600
     * @tc.name testKrcPro0036
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,0]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_3700
     * @tc.name testKrcPro0037
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,100]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_3800
     * @tc.name testKrcPro0038
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,500]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_3900
     * @tc.name testKrcPro0039
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,1000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_4000
     * @tc.name testKrcPro0040
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,5000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_4100
     * @tc.name testKrcPro0041
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,0]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_4200
     * @tc.name testKrcPro0042
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,100]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_4300
     * @tc.name testKrcPro0043
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,500]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_4400
     * @tc.name testKrcPro0044
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,1000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_4500
     * @tc.name testKrcPro0045
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,5000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_4600
     * @tc.name testKrcPro0046
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,0]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_4700
     * @tc.name testKrcPro0047
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,100]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_4800
     * @tc.name testKrcPro0048
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,500]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_4900
     * @tc.name testKrcPro0049
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,1000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_5000
     * @tc.name testKrcPro0050
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,5000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_5100
     * @tc.name testKrcPro0051
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,0]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_5200
     * @tc.name testKrcPro0052
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,100]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_5300
     * @tc.name testKrcPro0053
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,500]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_5400
     * @tc.name testKrcPro0054
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,1000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_5500
     * @tc.name testKrcPro0055
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,5000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_5600
     * @tc.name testKrcPro0056
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,0]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_5700
     * @tc.name testKrcPro0057
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,100]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_5800
     * @tc.name testKrcPro0058
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,500]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_5900
     * @tc.name testKrcPro0059
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,1000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_6000
     * @tc.name testKrcPro0060
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,5000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_6100
     * @tc.name testKrcPro0061
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,0]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_6200
     * @tc.name testKrcPro0062
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,100]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_6300
     * @tc.name testKrcPro0063
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,500]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_6400
     * @tc.name testKrcPro0064
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,1000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_6500
     * @tc.name testKrcPro0065
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,5000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_6600
     * @tc.name testKrcPro0066
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,0]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_6700
     * @tc.name testKrcPro0067
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,100]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_6800
     * @tc.name testKrcPro0068
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,500]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_6900
     * @tc.name testKrcPro0069
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,1000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_7000
     * @tc.name testKrcPro0070
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,5000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_7100
     * @tc.name testKrcPro0071
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,0]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_7200
     * @tc.name testKrcPro0072
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,100]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_7300
     * @tc.name testKrcPro0073
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,500]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_7400
     * @tc.name testKrcPro0074
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,1000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_7500
     * @tc.name testKrcPro0075
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,5000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_7600
     * @tc.name testKrcPro0076
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,0]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_7700
     * @tc.name testKrcPro0077
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,100]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_7800
     * @tc.name testKrcPro0078
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,500]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_7900
     * @tc.name testKrcPro0079
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,1000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_8000
     * @tc.name testKrcPro0080
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,5000]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_8100
     * @tc.name testKrcPro0081
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,0]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_8200
     * @tc.name testKrcPro0082
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,100]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_8300
     * @tc.name testKrcPro0083
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,500]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_8400
     * @tc.name testKrcPro0084
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,1000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_8500
     * @tc.name testKrcPro0085
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,5000]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_8600
     * @tc.name testKrcPro0086
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,0]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_8700
     * @tc.name testKrcPro0087
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,100]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_8800
     * @tc.name testKrcPro0088
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,500]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_8900
     * @tc.name testKrcPro0089
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,1000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_9000
     * @tc.name testKrcPro0090
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,5000]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_9100
     * @tc.name testKrcPro0091
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,0]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_9200
     * @tc.name testKrcPro0092
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,100]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_9300
     * @tc.name testKrcPro0093
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,500]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_9400
     * @tc.name testKrcPro0094
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[5000,1000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(5000);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_9500
     * @tc.name testKrcPro0095
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[10000,5000]<0,100,0>x y<100,150,0>line');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(10000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('x yline');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('x y');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('line');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_9600
     * @tc.name testKrcPro0096
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[60000,0]<0,100,0>line<100,150,0>a<250,200,0>Hello');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(60000);
      expect(entries[0].lineDuration).assertEqual(0);
      expect(entries[0].lineWords).assertEqual('lineaHello');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('line');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('a');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('Hello');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_9700
     * @tc.name testKrcPro0097
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[120000,100]<0,100,0>a');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(120000);
      expect(entries[0].lineDuration).assertEqual(100);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('a');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_9800
     * @tc.name testKrcPro0098
     * @tc.desc Verify parseKrcLyric parses one KRC line with 2 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3599000,500]<0,100,0>Hello<100,150,0>\u4f60\u597d');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(3599000);
      expect(entries[0].lineDuration).assertEqual(500);
      expect(entries[0].lineWords).assertEqual('Hello\u4f60\u597d');
      expect(entries[0].words.length).assertEqual(2);
      expect(entries[0].words[0].text).assertEqual('Hello');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
    });

    /**
     * @tc.number SUB_KRC_PRO_9900
     * @tc.name testKrcPro0099
     * @tc.desc Verify parseKrcLyric parses one KRC line with 3 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[0,1000]<0,100,0>\u4f60\u597d<100,150,0>OpenHarmony<250,200,0>x y');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(0);
      expect(entries[0].lineDuration).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('\u4f60\u597dOpenHarmonyx y');
      expect(entries[0].words.length).assertEqual(3);
      expect(entries[0].words[0].text).assertEqual('\u4f60\u597d');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
      expect(entries[0].words[1].text).assertEqual('OpenHarmony');
      expect(entries[0].words[1].wordStartTime).assertEqual(100);
      expect(entries[0].words[1].duration).assertEqual(150);
      expect(entries[0].words[2].text).assertEqual('x y');
      expect(entries[0].words[2].wordStartTime).assertEqual(250);
      expect(entries[0].words[2].duration).assertEqual(200);
    });

    /**
     * @tc.number SUB_KRC_PRO_10000
     * @tc.name testKrcPro0100
     * @tc.desc Verify parseKrcLyric parses one KRC line with 1 words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,5000]<0,100,0>OpenHarmony');
      expect(entries.length).assertEqual(1);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineDuration).assertEqual(5000);
      expect(entries[0].lineWords).assertEqual('OpenHarmony');
      expect(entries[0].words.length).assertEqual(1);
      expect(entries[0].words[0].text).assertEqual('OpenHarmony');
      expect(entries[0].words[0].wordStartTime).assertEqual(0);
      expect(entries[0].words[0].duration).assertEqual(100);
    });

    /**
     * @tc.number SUB_KRC_PRO_10100
     * @tc.name testKrcPro0101
     * @tc.desc Verify multiple KRC lines are sorted by start time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[2000,100]<0,100,0>b\n[1000,100]<0,100,0>a');
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[1].lineStartTime).assertEqual(2000);
      expect(entries[1].lineWords).assertEqual('b');
    });

    /**
     * @tc.number SUB_KRC_PRO_10200
     * @tc.name testKrcPro0102
     * @tc.desc Verify multiple KRC lines are sorted by start time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[3000,100]<0,100,0>c\n[1000,100]<0,100,0>a');
      expect(entries.length).assertEqual(2);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[1].lineStartTime).assertEqual(3000);
      expect(entries[1].lineWords).assertEqual('c');
    });

    /**
     * @tc.number SUB_KRC_PRO_10300
     * @tc.name testKrcPro0103
     * @tc.desc Verify multiple KRC lines are sorted by start time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testKrcPro0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const entries: LrcEntry[] = parseKrcLyric('[1000,100]<0,100,0>a\n[2000,100]<0,100,0>b\n[3000,100]<0,100,0>c');
      expect(entries.length).assertEqual(3);
      expect(entries[0].lineStartTime).assertEqual(1000);
      expect(entries[0].lineWords).assertEqual('a');
      expect(entries[1].lineStartTime).assertEqual(2000);
      expect(entries[1].lineWords).assertEqual('b');
      expect(entries[2].lineStartTime).assertEqual(3000);
      expect(entries[2].lineWords).assertEqual('c');
    });
  });
}
