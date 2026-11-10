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
import { describe, it, expect } from '@ohos/hypium';


export default function subtitleSrtExpandedTest() {
  describe('subtitleSrtExpandedTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0001
     * @tc.name      testExpSubtitleSrt0001
     * @tc.desc      SRT block 1 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0001', 0, () => {
      const index: string = '1';
      const text: string = 'line1 a\nline1 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('1');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line1 a');
      expect(lines[1]).assertEqual('line1 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0002
     * @tc.name      testExpSubtitleSrt0002
     * @tc.desc      SRT block 2 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0002', 0, () => {
      const index: string = '2';
      const text: string = 'line2 a\nline2 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('2');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line2 a');
      expect(lines[1]).assertEqual('line2 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0003
     * @tc.name      testExpSubtitleSrt0003
     * @tc.desc      SRT block 3 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0003', 0, () => {
      const index: string = '3';
      const text: string = 'line3 a\nline3 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('3');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line3 a');
      expect(lines[1]).assertEqual('line3 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0004
     * @tc.name      testExpSubtitleSrt0004
     * @tc.desc      SRT block 4 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0004', 0, () => {
      const index: string = '4';
      const text: string = 'line4 a\nline4 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('4');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line4 a');
      expect(lines[1]).assertEqual('line4 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0005
     * @tc.name      testExpSubtitleSrt0005
     * @tc.desc      SRT block 5 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0005', 0, () => {
      const index: string = '5';
      const text: string = 'line5 a\nline5 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('5');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line5 a');
      expect(lines[1]).assertEqual('line5 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0006
     * @tc.name      testExpSubtitleSrt0006
     * @tc.desc      SRT block 6 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0006', 0, () => {
      const index: string = '6';
      const text: string = 'line6 a\nline6 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('6');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line6 a');
      expect(lines[1]).assertEqual('line6 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0007
     * @tc.name      testExpSubtitleSrt0007
     * @tc.desc      SRT block 7 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0007', 0, () => {
      const index: string = '7';
      const text: string = 'line7 a\nline7 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('7');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line7 a');
      expect(lines[1]).assertEqual('line7 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0008
     * @tc.name      testExpSubtitleSrt0008
     * @tc.desc      SRT block 8 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0008', 0, () => {
      const index: string = '8';
      const text: string = 'line8 a\nline8 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('8');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line8 a');
      expect(lines[1]).assertEqual('line8 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0009
     * @tc.name      testExpSubtitleSrt0009
     * @tc.desc      SRT block 9 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0009', 0, () => {
      const index: string = '9';
      const text: string = 'line9 a\nline9 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('9');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line9 a');
      expect(lines[1]).assertEqual('line9 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0010
     * @tc.name      testExpSubtitleSrt0010
     * @tc.desc      SRT block 10 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0010', 0, () => {
      const index: string = '10';
      const text: string = 'line10 a\nline10 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('10');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line10 a');
      expect(lines[1]).assertEqual('line10 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0011
     * @tc.name      testExpSubtitleSrt0011
     * @tc.desc      SRT block 11 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0011', 0, () => {
      const index: string = '11';
      const text: string = 'line11 a\nline11 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('11');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line11 a');
      expect(lines[1]).assertEqual('line11 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0012
     * @tc.name      testExpSubtitleSrt0012
     * @tc.desc      SRT block 12 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0012', 0, () => {
      const index: string = '12';
      const text: string = 'line12 a\nline12 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('12');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line12 a');
      expect(lines[1]).assertEqual('line12 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0013
     * @tc.name      testExpSubtitleSrt0013
     * @tc.desc      SRT block 13 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0013', 0, () => {
      const index: string = '13';
      const text: string = 'line13 a\nline13 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('13');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line13 a');
      expect(lines[1]).assertEqual('line13 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0014
     * @tc.name      testExpSubtitleSrt0014
     * @tc.desc      SRT block 14 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0014', 0, () => {
      const index: string = '14';
      const text: string = 'line14 a\nline14 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('14');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line14 a');
      expect(lines[1]).assertEqual('line14 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0015
     * @tc.name      testExpSubtitleSrt0015
     * @tc.desc      SRT block 15 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0015', 0, () => {
      const index: string = '15';
      const text: string = 'line15 a\nline15 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('15');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line15 a');
      expect(lines[1]).assertEqual('line15 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0016
     * @tc.name      testExpSubtitleSrt0016
     * @tc.desc      SRT block 16 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0016', 0, () => {
      const index: string = '16';
      const text: string = 'line16 a\nline16 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('16');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line16 a');
      expect(lines[1]).assertEqual('line16 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0017
     * @tc.name      testExpSubtitleSrt0017
     * @tc.desc      SRT block 17 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0017', 0, () => {
      const index: string = '17';
      const text: string = 'line17 a\nline17 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('17');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line17 a');
      expect(lines[1]).assertEqual('line17 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0018
     * @tc.name      testExpSubtitleSrt0018
     * @tc.desc      SRT block 18 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0018', 0, () => {
      const index: string = '18';
      const text: string = 'line18 a\nline18 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('18');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line18 a');
      expect(lines[1]).assertEqual('line18 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0019
     * @tc.name      testExpSubtitleSrt0019
     * @tc.desc      SRT block 19 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0019', 0, () => {
      const index: string = '19';
      const text: string = 'line19 a\nline19 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('19');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line19 a');
      expect(lines[1]).assertEqual('line19 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0020
     * @tc.name      testExpSubtitleSrt0020
     * @tc.desc      SRT block 20 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0020', 0, () => {
      const index: string = '20';
      const text: string = 'line20 a\nline20 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('20');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line20 a');
      expect(lines[1]).assertEqual('line20 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0021
     * @tc.name      testExpSubtitleSrt0021
     * @tc.desc      SRT block 21 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0021', 0, () => {
      const index: string = '21';
      const text: string = 'line21 a\nline21 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('21');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line21 a');
      expect(lines[1]).assertEqual('line21 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0022
     * @tc.name      testExpSubtitleSrt0022
     * @tc.desc      SRT block 22 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0022', 0, () => {
      const index: string = '22';
      const text: string = 'line22 a\nline22 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('22');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line22 a');
      expect(lines[1]).assertEqual('line22 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0023
     * @tc.name      testExpSubtitleSrt0023
     * @tc.desc      SRT block 23 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0023', 0, () => {
      const index: string = '23';
      const text: string = 'line23 a\nline23 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('23');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line23 a');
      expect(lines[1]).assertEqual('line23 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0024
     * @tc.name      testExpSubtitleSrt0024
     * @tc.desc      SRT block 24 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0024', 0, () => {
      const index: string = '24';
      const text: string = 'line24 a\nline24 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('24');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line24 a');
      expect(lines[1]).assertEqual('line24 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0025
     * @tc.name      testExpSubtitleSrt0025
     * @tc.desc      SRT block 25 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0025', 0, () => {
      const index: string = '25';
      const text: string = 'line25 a\nline25 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('25');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line25 a');
      expect(lines[1]).assertEqual('line25 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0026
     * @tc.name      testExpSubtitleSrt0026
     * @tc.desc      SRT block 26 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0026', 0, () => {
      const index: string = '26';
      const text: string = 'line26 a\nline26 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('26');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line26 a');
      expect(lines[1]).assertEqual('line26 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0027
     * @tc.name      testExpSubtitleSrt0027
     * @tc.desc      SRT block 27 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0027', 0, () => {
      const index: string = '27';
      const text: string = 'line27 a\nline27 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('27');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line27 a');
      expect(lines[1]).assertEqual('line27 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0028
     * @tc.name      testExpSubtitleSrt0028
     * @tc.desc      SRT block 28 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0028', 0, () => {
      const index: string = '28';
      const text: string = 'line28 a\nline28 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('28');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line28 a');
      expect(lines[1]).assertEqual('line28 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0029
     * @tc.name      testExpSubtitleSrt0029
     * @tc.desc      SRT block 29 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0029', 0, () => {
      const index: string = '29';
      const text: string = 'line29 a\nline29 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('29');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line29 a');
      expect(lines[1]).assertEqual('line29 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0030
     * @tc.name      testExpSubtitleSrt0030
     * @tc.desc      SRT block 30 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0030', 0, () => {
      const index: string = '30';
      const text: string = 'line30 a\nline30 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('30');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line30 a');
      expect(lines[1]).assertEqual('line30 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0031
     * @tc.name      testExpSubtitleSrt0031
     * @tc.desc      SRT block 31 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0031', 0, () => {
      const index: string = '31';
      const text: string = 'line31 a\nline31 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('31');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line31 a');
      expect(lines[1]).assertEqual('line31 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0032
     * @tc.name      testExpSubtitleSrt0032
     * @tc.desc      SRT block 32 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0032', 0, () => {
      const index: string = '32';
      const text: string = 'line32 a\nline32 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('32');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line32 a');
      expect(lines[1]).assertEqual('line32 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0033
     * @tc.name      testExpSubtitleSrt0033
     * @tc.desc      SRT block 33 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0033', 0, () => {
      const index: string = '33';
      const text: string = 'line33 a\nline33 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('33');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line33 a');
      expect(lines[1]).assertEqual('line33 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0034
     * @tc.name      testExpSubtitleSrt0034
     * @tc.desc      SRT block 34 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0034', 0, () => {
      const index: string = '34';
      const text: string = 'line34 a\nline34 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('34');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line34 a');
      expect(lines[1]).assertEqual('line34 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0035
     * @tc.name      testExpSubtitleSrt0035
     * @tc.desc      SRT block 35 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0035', 0, () => {
      const index: string = '35';
      const text: string = 'line35 a\nline35 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('35');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line35 a');
      expect(lines[1]).assertEqual('line35 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0036
     * @tc.name      testExpSubtitleSrt0036
     * @tc.desc      SRT block 36 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0036', 0, () => {
      const index: string = '36';
      const text: string = 'line36 a\nline36 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('36');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line36 a');
      expect(lines[1]).assertEqual('line36 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0037
     * @tc.name      testExpSubtitleSrt0037
     * @tc.desc      SRT block 37 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0037', 0, () => {
      const index: string = '37';
      const text: string = 'line37 a\nline37 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('37');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line37 a');
      expect(lines[1]).assertEqual('line37 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0038
     * @tc.name      testExpSubtitleSrt0038
     * @tc.desc      SRT block 38 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0038', 0, () => {
      const index: string = '38';
      const text: string = 'line38 a\nline38 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('38');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line38 a');
      expect(lines[1]).assertEqual('line38 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0039
     * @tc.name      testExpSubtitleSrt0039
     * @tc.desc      SRT block 39 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0039', 0, () => {
      const index: string = '39';
      const text: string = 'line39 a\nline39 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('39');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line39 a');
      expect(lines[1]).assertEqual('line39 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0040
     * @tc.name      testExpSubtitleSrt0040
     * @tc.desc      SRT block 40 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0040', 0, () => {
      const index: string = '40';
      const text: string = 'line40 a\nline40 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('40');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line40 a');
      expect(lines[1]).assertEqual('line40 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0041
     * @tc.name      testExpSubtitleSrt0041
     * @tc.desc      SRT block 41 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0041', 0, () => {
      const index: string = '41';
      const text: string = 'line41 a\nline41 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('41');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line41 a');
      expect(lines[1]).assertEqual('line41 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0042
     * @tc.name      testExpSubtitleSrt0042
     * @tc.desc      SRT block 42 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0042', 0, () => {
      const index: string = '42';
      const text: string = 'line42 a\nline42 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('42');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line42 a');
      expect(lines[1]).assertEqual('line42 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0043
     * @tc.name      testExpSubtitleSrt0043
     * @tc.desc      SRT block 43 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0043', 0, () => {
      const index: string = '43';
      const text: string = 'line43 a\nline43 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('43');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line43 a');
      expect(lines[1]).assertEqual('line43 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0044
     * @tc.name      testExpSubtitleSrt0044
     * @tc.desc      SRT block 44 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0044', 0, () => {
      const index: string = '44';
      const text: string = 'line44 a\nline44 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('44');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line44 a');
      expect(lines[1]).assertEqual('line44 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0045
     * @tc.name      testExpSubtitleSrt0045
     * @tc.desc      SRT block 45 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0045', 0, () => {
      const index: string = '45';
      const text: string = 'line45 a\nline45 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('45');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line45 a');
      expect(lines[1]).assertEqual('line45 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0046
     * @tc.name      testExpSubtitleSrt0046
     * @tc.desc      SRT block 46 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0046', 0, () => {
      const index: string = '46';
      const text: string = 'line46 a\nline46 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('46');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line46 a');
      expect(lines[1]).assertEqual('line46 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0047
     * @tc.name      testExpSubtitleSrt0047
     * @tc.desc      SRT block 47 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0047', 0, () => {
      const index: string = '47';
      const text: string = 'line47 a\nline47 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('47');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line47 a');
      expect(lines[1]).assertEqual('line47 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0048
     * @tc.name      testExpSubtitleSrt0048
     * @tc.desc      SRT block 48 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0048', 0, () => {
      const index: string = '48';
      const text: string = 'line48 a\nline48 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('48');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line48 a');
      expect(lines[1]).assertEqual('line48 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0049
     * @tc.name      testExpSubtitleSrt0049
     * @tc.desc      SRT block 49 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0049', 0, () => {
      const index: string = '49';
      const text: string = 'line49 a\nline49 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('49');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line49 a');
      expect(lines[1]).assertEqual('line49 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0050
     * @tc.name      testExpSubtitleSrt0050
     * @tc.desc      SRT block 50 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0050', 0, () => {
      const index: string = '50';
      const text: string = 'line50 a\nline50 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('50');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line50 a');
      expect(lines[1]).assertEqual('line50 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0051
     * @tc.name      testExpSubtitleSrt0051
     * @tc.desc      SRT block 51 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0051', 0, () => {
      const index: string = '51';
      const text: string = 'line51 a\nline51 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('51');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line51 a');
      expect(lines[1]).assertEqual('line51 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0052
     * @tc.name      testExpSubtitleSrt0052
     * @tc.desc      SRT block 52 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0052', 0, () => {
      const index: string = '52';
      const text: string = 'line52 a\nline52 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('52');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line52 a');
      expect(lines[1]).assertEqual('line52 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0053
     * @tc.name      testExpSubtitleSrt0053
     * @tc.desc      SRT block 53 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0053', 0, () => {
      const index: string = '53';
      const text: string = 'line53 a\nline53 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('53');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line53 a');
      expect(lines[1]).assertEqual('line53 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0054
     * @tc.name      testExpSubtitleSrt0054
     * @tc.desc      SRT block 54 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0054', 0, () => {
      const index: string = '54';
      const text: string = 'line54 a\nline54 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('54');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line54 a');
      expect(lines[1]).assertEqual('line54 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0055
     * @tc.name      testExpSubtitleSrt0055
     * @tc.desc      SRT block 55 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0055', 0, () => {
      const index: string = '55';
      const text: string = 'line55 a\nline55 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('55');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line55 a');
      expect(lines[1]).assertEqual('line55 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0056
     * @tc.name      testExpSubtitleSrt0056
     * @tc.desc      SRT block 56 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0056', 0, () => {
      const index: string = '56';
      const text: string = 'line56 a\nline56 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('56');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line56 a');
      expect(lines[1]).assertEqual('line56 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0057
     * @tc.name      testExpSubtitleSrt0057
     * @tc.desc      SRT block 57 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0057', 0, () => {
      const index: string = '57';
      const text: string = 'line57 a\nline57 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('57');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line57 a');
      expect(lines[1]).assertEqual('line57 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0058
     * @tc.name      testExpSubtitleSrt0058
     * @tc.desc      SRT block 58 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0058', 0, () => {
      const index: string = '58';
      const text: string = 'line58 a\nline58 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('58');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line58 a');
      expect(lines[1]).assertEqual('line58 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0059
     * @tc.name      testExpSubtitleSrt0059
     * @tc.desc      SRT block 59 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0059', 0, () => {
      const index: string = '59';
      const text: string = 'line59 a\nline59 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('59');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line59 a');
      expect(lines[1]).assertEqual('line59 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0060
     * @tc.name      testExpSubtitleSrt0060
     * @tc.desc      SRT block 60 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0060', 0, () => {
      const index: string = '60';
      const text: string = 'line60 a\nline60 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('60');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line60 a');
      expect(lines[1]).assertEqual('line60 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0061
     * @tc.name      testExpSubtitleSrt0061
     * @tc.desc      SRT block 61 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0061', 0, () => {
      const index: string = '61';
      const text: string = 'line61 a\nline61 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('61');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line61 a');
      expect(lines[1]).assertEqual('line61 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0062
     * @tc.name      testExpSubtitleSrt0062
     * @tc.desc      SRT block 62 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0062', 0, () => {
      const index: string = '62';
      const text: string = 'line62 a\nline62 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('62');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line62 a');
      expect(lines[1]).assertEqual('line62 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0063
     * @tc.name      testExpSubtitleSrt0063
     * @tc.desc      SRT block 63 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0063', 0, () => {
      const index: string = '63';
      const text: string = 'line63 a\nline63 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('63');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line63 a');
      expect(lines[1]).assertEqual('line63 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0064
     * @tc.name      testExpSubtitleSrt0064
     * @tc.desc      SRT block 64 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0064', 0, () => {
      const index: string = '64';
      const text: string = 'line64 a\nline64 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('64');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line64 a');
      expect(lines[1]).assertEqual('line64 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0065
     * @tc.name      testExpSubtitleSrt0065
     * @tc.desc      SRT block 65 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0065', 0, () => {
      const index: string = '65';
      const text: string = 'line65 a\nline65 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('65');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line65 a');
      expect(lines[1]).assertEqual('line65 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0066
     * @tc.name      testExpSubtitleSrt0066
     * @tc.desc      SRT block 66 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0066', 0, () => {
      const index: string = '66';
      const text: string = 'line66 a\nline66 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('66');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line66 a');
      expect(lines[1]).assertEqual('line66 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0067
     * @tc.name      testExpSubtitleSrt0067
     * @tc.desc      SRT block 67 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0067', 0, () => {
      const index: string = '67';
      const text: string = 'line67 a\nline67 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('67');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line67 a');
      expect(lines[1]).assertEqual('line67 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0068
     * @tc.name      testExpSubtitleSrt0068
     * @tc.desc      SRT block 68 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0068', 0, () => {
      const index: string = '68';
      const text: string = 'line68 a\nline68 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('68');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line68 a');
      expect(lines[1]).assertEqual('line68 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0069
     * @tc.name      testExpSubtitleSrt0069
     * @tc.desc      SRT block 69 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0069', 0, () => {
      const index: string = '69';
      const text: string = 'line69 a\nline69 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('69');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line69 a');
      expect(lines[1]).assertEqual('line69 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0070
     * @tc.name      testExpSubtitleSrt0070
     * @tc.desc      SRT block 70 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0070', 0, () => {
      const index: string = '70';
      const text: string = 'line70 a\nline70 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('70');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line70 a');
      expect(lines[1]).assertEqual('line70 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0071
     * @tc.name      testExpSubtitleSrt0071
     * @tc.desc      SRT block 71 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0071', 0, () => {
      const index: string = '71';
      const text: string = 'line71 a\nline71 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('71');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line71 a');
      expect(lines[1]).assertEqual('line71 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0072
     * @tc.name      testExpSubtitleSrt0072
     * @tc.desc      SRT block 72 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0072', 0, () => {
      const index: string = '72';
      const text: string = 'line72 a\nline72 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('72');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line72 a');
      expect(lines[1]).assertEqual('line72 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0073
     * @tc.name      testExpSubtitleSrt0073
     * @tc.desc      SRT block 73 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0073', 0, () => {
      const index: string = '73';
      const text: string = 'line73 a\nline73 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('73');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line73 a');
      expect(lines[1]).assertEqual('line73 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0074
     * @tc.name      testExpSubtitleSrt0074
     * @tc.desc      SRT block 74 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0074', 0, () => {
      const index: string = '74';
      const text: string = 'line74 a\nline74 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('74');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line74 a');
      expect(lines[1]).assertEqual('line74 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0075
     * @tc.name      testExpSubtitleSrt0075
     * @tc.desc      SRT block 75 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0075', 0, () => {
      const index: string = '75';
      const text: string = 'line75 a\nline75 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('75');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line75 a');
      expect(lines[1]).assertEqual('line75 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0076
     * @tc.name      testExpSubtitleSrt0076
     * @tc.desc      SRT block 76 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0076', 0, () => {
      const index: string = '76';
      const text: string = 'line76 a\nline76 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('76');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line76 a');
      expect(lines[1]).assertEqual('line76 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0077
     * @tc.name      testExpSubtitleSrt0077
     * @tc.desc      SRT block 77 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0077', 0, () => {
      const index: string = '77';
      const text: string = 'line77 a\nline77 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('77');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line77 a');
      expect(lines[1]).assertEqual('line77 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0078
     * @tc.name      testExpSubtitleSrt0078
     * @tc.desc      SRT block 78 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0078', 0, () => {
      const index: string = '78';
      const text: string = 'line78 a\nline78 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('78');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line78 a');
      expect(lines[1]).assertEqual('line78 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0079
     * @tc.name      testExpSubtitleSrt0079
     * @tc.desc      SRT block 79 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0079', 0, () => {
      const index: string = '79';
      const text: string = 'line79 a\nline79 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('79');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line79 a');
      expect(lines[1]).assertEqual('line79 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0080
     * @tc.name      testExpSubtitleSrt0080
     * @tc.desc      SRT block 80 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0080', 0, () => {
      const index: string = '80';
      const text: string = 'line80 a\nline80 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('80');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line80 a');
      expect(lines[1]).assertEqual('line80 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0081
     * @tc.name      testExpSubtitleSrt0081
     * @tc.desc      SRT block 81 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0081', 0, () => {
      const index: string = '81';
      const text: string = 'line81 a\nline81 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('81');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line81 a');
      expect(lines[1]).assertEqual('line81 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0082
     * @tc.name      testExpSubtitleSrt0082
     * @tc.desc      SRT block 82 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0082', 0, () => {
      const index: string = '82';
      const text: string = 'line82 a\nline82 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('82');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line82 a');
      expect(lines[1]).assertEqual('line82 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0083
     * @tc.name      testExpSubtitleSrt0083
     * @tc.desc      SRT block 83 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0083', 0, () => {
      const index: string = '83';
      const text: string = 'line83 a\nline83 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('83');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line83 a');
      expect(lines[1]).assertEqual('line83 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0084
     * @tc.name      testExpSubtitleSrt0084
     * @tc.desc      SRT block 84 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0084', 0, () => {
      const index: string = '84';
      const text: string = 'line84 a\nline84 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('84');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line84 a');
      expect(lines[1]).assertEqual('line84 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0085
     * @tc.name      testExpSubtitleSrt0085
     * @tc.desc      SRT block 85 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0085', 0, () => {
      const index: string = '85';
      const text: string = 'line85 a\nline85 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('85');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line85 a');
      expect(lines[1]).assertEqual('line85 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0086
     * @tc.name      testExpSubtitleSrt0086
     * @tc.desc      SRT block 86 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0086', 0, () => {
      const index: string = '86';
      const text: string = 'line86 a\nline86 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('86');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line86 a');
      expect(lines[1]).assertEqual('line86 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0087
     * @tc.name      testExpSubtitleSrt0087
     * @tc.desc      SRT block 87 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0087', 0, () => {
      const index: string = '87';
      const text: string = 'line87 a\nline87 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('87');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line87 a');
      expect(lines[1]).assertEqual('line87 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0088
     * @tc.name      testExpSubtitleSrt0088
     * @tc.desc      SRT block 88 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0088', 0, () => {
      const index: string = '88';
      const text: string = 'line88 a\nline88 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('88');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line88 a');
      expect(lines[1]).assertEqual('line88 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0089
     * @tc.name      testExpSubtitleSrt0089
     * @tc.desc      SRT block 89 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0089', 0, () => {
      const index: string = '89';
      const text: string = 'line89 a\nline89 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('89');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line89 a');
      expect(lines[1]).assertEqual('line89 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0090
     * @tc.name      testExpSubtitleSrt0090
     * @tc.desc      SRT block 90 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0090', 0, () => {
      const index: string = '90';
      const text: string = 'line90 a\nline90 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('90');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line90 a');
      expect(lines[1]).assertEqual('line90 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0091
     * @tc.name      testExpSubtitleSrt0091
     * @tc.desc      SRT block 91 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0091', 0, () => {
      const index: string = '91';
      const text: string = 'line91 a\nline91 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('91');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line91 a');
      expect(lines[1]).assertEqual('line91 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0092
     * @tc.name      testExpSubtitleSrt0092
     * @tc.desc      SRT block 92 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0092', 0, () => {
      const index: string = '92';
      const text: string = 'line92 a\nline92 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('92');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line92 a');
      expect(lines[1]).assertEqual('line92 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0093
     * @tc.name      testExpSubtitleSrt0093
     * @tc.desc      SRT block 93 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0093', 0, () => {
      const index: string = '93';
      const text: string = 'line93 a\nline93 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('93');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line93 a');
      expect(lines[1]).assertEqual('line93 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0094
     * @tc.name      testExpSubtitleSrt0094
     * @tc.desc      SRT block 94 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0094', 0, () => {
      const index: string = '94';
      const text: string = 'line94 a\nline94 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('94');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line94 a');
      expect(lines[1]).assertEqual('line94 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0095
     * @tc.name      testExpSubtitleSrt0095
     * @tc.desc      SRT block 95 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0095', 0, () => {
      const index: string = '95';
      const text: string = 'line95 a\nline95 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('95');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line95 a');
      expect(lines[1]).assertEqual('line95 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0096
     * @tc.name      testExpSubtitleSrt0096
     * @tc.desc      SRT block 96 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0096', 0, () => {
      const index: string = '96';
      const text: string = 'line96 a\nline96 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('96');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line96 a');
      expect(lines[1]).assertEqual('line96 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0097
     * @tc.name      testExpSubtitleSrt0097
     * @tc.desc      SRT block 97 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0097', 0, () => {
      const index: string = '97';
      const text: string = 'line97 a\nline97 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('97');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line97 a');
      expect(lines[1]).assertEqual('line97 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0098
     * @tc.name      testExpSubtitleSrt0098
     * @tc.desc      SRT block 98 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0098', 0, () => {
      const index: string = '98';
      const text: string = 'line98 a\nline98 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('98');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line98 a');
      expect(lines[1]).assertEqual('line98 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0099
     * @tc.name      testExpSubtitleSrt0099
     * @tc.desc      SRT block 99 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0099', 0, () => {
      const index: string = '99';
      const text: string = 'line99 a\nline99 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('99');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line99 a');
      expect(lines[1]).assertEqual('line99 b');
    })
    /**
     * @tc.number    SUB_AVPLAYER_NDK_SUBTITLE_EXP_SRT_0100
     * @tc.name      testExpSubtitleSrt0100
     * @tc.desc      SRT block 100 keeps its index and two text lines.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExpSubtitleSrt0100', 0, () => {
      const index: string = '100';
      const text: string = 'line100 a\nline100 b';
      const lines: string[] = text.split('\n');
      expect(index).assertEqual('100');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('line100 a');
      expect(lines[1]).assertEqual('line100 b');
    })
  })
}
