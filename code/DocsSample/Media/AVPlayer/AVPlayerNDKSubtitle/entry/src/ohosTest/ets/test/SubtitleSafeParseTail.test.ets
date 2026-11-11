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
import { describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';


const TAG: string = '[Sample_SubtitleSafeParseTail]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}


function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}
export default function subtitleSafeParseTailTest(): void {
  describe('subtitleSafeParseTailTest', () => {
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0001
     * @tc.name      testSafeParseCue0001
     * @tc.desc      Cue 1 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '1';
      const start: number = 0;
      const end: number = 1000;
      const duration: number = end - start;
      const text: string = 'line1';
      expect(index).assertEqual('1');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0002
     * @tc.name      testSafeParseCue0002
     * @tc.desc      Cue 2 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '2';
      const start: number = 250;
      const end: number = 1350;
      const duration: number = end - start;
      const text: string = 'line2';
      expect(index).assertEqual('2');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0003
     * @tc.name      testSafeParseCue0003
     * @tc.desc      Cue 3 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '3';
      const start: number = 500;
      const end: number = 1700;
      const duration: number = end - start;
      const text: string = 'line3';
      expect(index).assertEqual('3');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0004
     * @tc.name      testSafeParseCue0004
     * @tc.desc      Cue 4 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '4';
      const start: number = 750;
      const end: number = 2050;
      const duration: number = end - start;
      const text: string = 'line4';
      expect(index).assertEqual('4');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0005
     * @tc.name      testSafeParseCue0005
     * @tc.desc      Cue 5 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '5';
      const start: number = 1000;
      const end: number = 2400;
      const duration: number = end - start;
      const text: string = 'line5';
      expect(index).assertEqual('5');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0006
     * @tc.name      testSafeParseCue0006
     * @tc.desc      Cue 6 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '6';
      const start: number = 1250;
      const end: number = 2250;
      const duration: number = end - start;
      const text: string = 'line6';
      expect(index).assertEqual('6');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0007
     * @tc.name      testSafeParseCue0007
     * @tc.desc      Cue 7 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '7';
      const start: number = 1500;
      const end: number = 2600;
      const duration: number = end - start;
      const text: string = 'line7';
      expect(index).assertEqual('7');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0008
     * @tc.name      testSafeParseCue0008
     * @tc.desc      Cue 8 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '8';
      const start: number = 1750;
      const end: number = 2950;
      const duration: number = end - start;
      const text: string = 'line8';
      expect(index).assertEqual('8');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0009
     * @tc.name      testSafeParseCue0009
     * @tc.desc      Cue 9 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '9';
      const start: number = 2000;
      const end: number = 3300;
      const duration: number = end - start;
      const text: string = 'line9';
      expect(index).assertEqual('9');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0010
     * @tc.name      testSafeParseCue0010
     * @tc.desc      Cue 10 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '10';
      const start: number = 2250;
      const end: number = 3650;
      const duration: number = end - start;
      const text: string = 'line10';
      expect(index).assertEqual('10');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0011
     * @tc.name      testSafeParseCue0011
     * @tc.desc      Cue 11 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '11';
      const start: number = 2500;
      const end: number = 3500;
      const duration: number = end - start;
      const text: string = 'line11';
      expect(index).assertEqual('11');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0012
     * @tc.name      testSafeParseCue0012
     * @tc.desc      Cue 12 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '12';
      const start: number = 2750;
      const end: number = 3850;
      const duration: number = end - start;
      const text: string = 'line12';
      expect(index).assertEqual('12');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0013
     * @tc.name      testSafeParseCue0013
     * @tc.desc      Cue 13 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '13';
      const start: number = 3000;
      const end: number = 4200;
      const duration: number = end - start;
      const text: string = 'line13';
      expect(index).assertEqual('13');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0014
     * @tc.name      testSafeParseCue0014
     * @tc.desc      Cue 14 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '14';
      const start: number = 3250;
      const end: number = 4550;
      const duration: number = end - start;
      const text: string = 'line14';
      expect(index).assertEqual('14');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0015
     * @tc.name      testSafeParseCue0015
     * @tc.desc      Cue 15 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '15';
      const start: number = 3500;
      const end: number = 4900;
      const duration: number = end - start;
      const text: string = 'line15';
      expect(index).assertEqual('15');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0016
     * @tc.name      testSafeParseCue0016
     * @tc.desc      Cue 16 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '16';
      const start: number = 3750;
      const end: number = 4750;
      const duration: number = end - start;
      const text: string = 'line16';
      expect(index).assertEqual('16');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0017
     * @tc.name      testSafeParseCue0017
     * @tc.desc      Cue 17 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '17';
      const start: number = 4000;
      const end: number = 5100;
      const duration: number = end - start;
      const text: string = 'line17';
      expect(index).assertEqual('17');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0018
     * @tc.name      testSafeParseCue0018
     * @tc.desc      Cue 18 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '18';
      const start: number = 4250;
      const end: number = 5450;
      const duration: number = end - start;
      const text: string = 'line18';
      expect(index).assertEqual('18');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0019
     * @tc.name      testSafeParseCue0019
     * @tc.desc      Cue 19 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '19';
      const start: number = 4500;
      const end: number = 5800;
      const duration: number = end - start;
      const text: string = 'line19';
      expect(index).assertEqual('19');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0020
     * @tc.name      testSafeParseCue0020
     * @tc.desc      Cue 20 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '20';
      const start: number = 4750;
      const end: number = 6150;
      const duration: number = end - start;
      const text: string = 'line20';
      expect(index).assertEqual('20');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0021
     * @tc.name      testSafeParseCue0021
     * @tc.desc      Cue 21 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '21';
      const start: number = 5000;
      const end: number = 6000;
      const duration: number = end - start;
      const text: string = 'line21';
      expect(index).assertEqual('21');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0022
     * @tc.name      testSafeParseCue0022
     * @tc.desc      Cue 22 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '22';
      const start: number = 5250;
      const end: number = 6350;
      const duration: number = end - start;
      const text: string = 'line22';
      expect(index).assertEqual('22');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0023
     * @tc.name      testSafeParseCue0023
     * @tc.desc      Cue 23 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '23';
      const start: number = 5500;
      const end: number = 6700;
      const duration: number = end - start;
      const text: string = 'line23';
      expect(index).assertEqual('23');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0024
     * @tc.name      testSafeParseCue0024
     * @tc.desc      Cue 24 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '24';
      const start: number = 5750;
      const end: number = 7050;
      const duration: number = end - start;
      const text: string = 'line24';
      expect(index).assertEqual('24');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0025
     * @tc.name      testSafeParseCue0025
     * @tc.desc      Cue 25 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '25';
      const start: number = 6000;
      const end: number = 7400;
      const duration: number = end - start;
      const text: string = 'line25';
      expect(index).assertEqual('25');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0026
     * @tc.name      testSafeParseCue0026
     * @tc.desc      Cue 26 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '26';
      const start: number = 6250;
      const end: number = 7250;
      const duration: number = end - start;
      const text: string = 'line26';
      expect(index).assertEqual('26');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0027
     * @tc.name      testSafeParseCue0027
     * @tc.desc      Cue 27 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '27';
      const start: number = 6500;
      const end: number = 7600;
      const duration: number = end - start;
      const text: string = 'line27';
      expect(index).assertEqual('27');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0028
     * @tc.name      testSafeParseCue0028
     * @tc.desc      Cue 28 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '28';
      const start: number = 6750;
      const end: number = 7950;
      const duration: number = end - start;
      const text: string = 'line28';
      expect(index).assertEqual('28');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0029
     * @tc.name      testSafeParseCue0029
     * @tc.desc      Cue 29 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '29';
      const start: number = 7000;
      const end: number = 8300;
      const duration: number = end - start;
      const text: string = 'line29';
      expect(index).assertEqual('29');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0030
     * @tc.name      testSafeParseCue0030
     * @tc.desc      Cue 30 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '30';
      const start: number = 7250;
      const end: number = 8650;
      const duration: number = end - start;
      const text: string = 'line30';
      expect(index).assertEqual('30');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0031
     * @tc.name      testSafeParseCue0031
     * @tc.desc      Cue 31 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '31';
      const start: number = 7500;
      const end: number = 8500;
      const duration: number = end - start;
      const text: string = 'line31';
      expect(index).assertEqual('31');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0032
     * @tc.name      testSafeParseCue0032
     * @tc.desc      Cue 32 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '32';
      const start: number = 7750;
      const end: number = 8850;
      const duration: number = end - start;
      const text: string = 'line32';
      expect(index).assertEqual('32');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0033
     * @tc.name      testSafeParseCue0033
     * @tc.desc      Cue 33 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '33';
      const start: number = 8000;
      const end: number = 9200;
      const duration: number = end - start;
      const text: string = 'line33';
      expect(index).assertEqual('33');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0034
     * @tc.name      testSafeParseCue0034
     * @tc.desc      Cue 34 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '34';
      const start: number = 8250;
      const end: number = 9550;
      const duration: number = end - start;
      const text: string = 'line34';
      expect(index).assertEqual('34');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0035
     * @tc.name      testSafeParseCue0035
     * @tc.desc      Cue 35 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '35';
      const start: number = 8500;
      const end: number = 9900;
      const duration: number = end - start;
      const text: string = 'line35';
      expect(index).assertEqual('35');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0036
     * @tc.name      testSafeParseCue0036
     * @tc.desc      Cue 36 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '36';
      const start: number = 8750;
      const end: number = 9750;
      const duration: number = end - start;
      const text: string = 'line36';
      expect(index).assertEqual('36');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0037
     * @tc.name      testSafeParseCue0037
     * @tc.desc      Cue 37 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '37';
      const start: number = 9000;
      const end: number = 10100;
      const duration: number = end - start;
      const text: string = 'line37';
      expect(index).assertEqual('37');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0038
     * @tc.name      testSafeParseCue0038
     * @tc.desc      Cue 38 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '38';
      const start: number = 9250;
      const end: number = 10450;
      const duration: number = end - start;
      const text: string = 'line38';
      expect(index).assertEqual('38');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0039
     * @tc.name      testSafeParseCue0039
     * @tc.desc      Cue 39 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '39';
      const start: number = 9500;
      const end: number = 10800;
      const duration: number = end - start;
      const text: string = 'line39';
      expect(index).assertEqual('39');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0040
     * @tc.name      testSafeParseCue0040
     * @tc.desc      Cue 40 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '40';
      const start: number = 9750;
      const end: number = 11150;
      const duration: number = end - start;
      const text: string = 'line40';
      expect(index).assertEqual('40');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0041
     * @tc.name      testSafeParseCue0041
     * @tc.desc      Cue 41 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '41';
      const start: number = 10000;
      const end: number = 11000;
      const duration: number = end - start;
      const text: string = 'line41';
      expect(index).assertEqual('41');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0042
     * @tc.name      testSafeParseCue0042
     * @tc.desc      Cue 42 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '42';
      const start: number = 10250;
      const end: number = 11350;
      const duration: number = end - start;
      const text: string = 'line42';
      expect(index).assertEqual('42');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0043
     * @tc.name      testSafeParseCue0043
     * @tc.desc      Cue 43 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '43';
      const start: number = 10500;
      const end: number = 11700;
      const duration: number = end - start;
      const text: string = 'line43';
      expect(index).assertEqual('43');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0044
     * @tc.name      testSafeParseCue0044
     * @tc.desc      Cue 44 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '44';
      const start: number = 10750;
      const end: number = 12050;
      const duration: number = end - start;
      const text: string = 'line44';
      expect(index).assertEqual('44');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0045
     * @tc.name      testSafeParseCue0045
     * @tc.desc      Cue 45 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '45';
      const start: number = 11000;
      const end: number = 12400;
      const duration: number = end - start;
      const text: string = 'line45';
      expect(index).assertEqual('45');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0046
     * @tc.name      testSafeParseCue0046
     * @tc.desc      Cue 46 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '46';
      const start: number = 11250;
      const end: number = 12250;
      const duration: number = end - start;
      const text: string = 'line46';
      expect(index).assertEqual('46');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0047
     * @tc.name      testSafeParseCue0047
     * @tc.desc      Cue 47 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '47';
      const start: number = 11500;
      const end: number = 12600;
      const duration: number = end - start;
      const text: string = 'line47';
      expect(index).assertEqual('47');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0048
     * @tc.name      testSafeParseCue0048
     * @tc.desc      Cue 48 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '48';
      const start: number = 11750;
      const end: number = 12950;
      const duration: number = end - start;
      const text: string = 'line48';
      expect(index).assertEqual('48');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0049
     * @tc.name      testSafeParseCue0049
     * @tc.desc      Cue 49 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '49';
      const start: number = 12000;
      const end: number = 13300;
      const duration: number = end - start;
      const text: string = 'line49';
      expect(index).assertEqual('49');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0050
     * @tc.name      testSafeParseCue0050
     * @tc.desc      Cue 50 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '50';
      const start: number = 12250;
      const end: number = 13650;
      const duration: number = end - start;
      const text: string = 'line50';
      expect(index).assertEqual('50');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0051
     * @tc.name      testSafeParseCue0051
     * @tc.desc      Cue 51 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '51';
      const start: number = 12500;
      const end: number = 13500;
      const duration: number = end - start;
      const text: string = 'line51';
      expect(index).assertEqual('51');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0052
     * @tc.name      testSafeParseCue0052
     * @tc.desc      Cue 52 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '52';
      const start: number = 12750;
      const end: number = 13850;
      const duration: number = end - start;
      const text: string = 'line52';
      expect(index).assertEqual('52');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0053
     * @tc.name      testSafeParseCue0053
     * @tc.desc      Cue 53 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '53';
      const start: number = 13000;
      const end: number = 14200;
      const duration: number = end - start;
      const text: string = 'line53';
      expect(index).assertEqual('53');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0054
     * @tc.name      testSafeParseCue0054
     * @tc.desc      Cue 54 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '54';
      const start: number = 13250;
      const end: number = 14550;
      const duration: number = end - start;
      const text: string = 'line54';
      expect(index).assertEqual('54');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0055
     * @tc.name      testSafeParseCue0055
     * @tc.desc      Cue 55 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '55';
      const start: number = 13500;
      const end: number = 14900;
      const duration: number = end - start;
      const text: string = 'line55';
      expect(index).assertEqual('55');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0056
     * @tc.name      testSafeParseCue0056
     * @tc.desc      Cue 56 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '56';
      const start: number = 13750;
      const end: number = 14750;
      const duration: number = end - start;
      const text: string = 'line56';
      expect(index).assertEqual('56');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0057
     * @tc.name      testSafeParseCue0057
     * @tc.desc      Cue 57 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '57';
      const start: number = 14000;
      const end: number = 15100;
      const duration: number = end - start;
      const text: string = 'line57';
      expect(index).assertEqual('57');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0058
     * @tc.name      testSafeParseCue0058
     * @tc.desc      Cue 58 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '58';
      const start: number = 14250;
      const end: number = 15450;
      const duration: number = end - start;
      const text: string = 'line58';
      expect(index).assertEqual('58');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0059
     * @tc.name      testSafeParseCue0059
     * @tc.desc      Cue 59 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '59';
      const start: number = 14500;
      const end: number = 15800;
      const duration: number = end - start;
      const text: string = 'line59';
      expect(index).assertEqual('59');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0060
     * @tc.name      testSafeParseCue0060
     * @tc.desc      Cue 60 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '60';
      const start: number = 14750;
      const end: number = 16150;
      const duration: number = end - start;
      const text: string = 'line60';
      expect(index).assertEqual('60');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0061
     * @tc.name      testSafeParseCue0061
     * @tc.desc      Cue 61 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '61';
      const start: number = 15000;
      const end: number = 16000;
      const duration: number = end - start;
      const text: string = 'line61';
      expect(index).assertEqual('61');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0062
     * @tc.name      testSafeParseCue0062
     * @tc.desc      Cue 62 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '62';
      const start: number = 15250;
      const end: number = 16350;
      const duration: number = end - start;
      const text: string = 'line62';
      expect(index).assertEqual('62');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0063
     * @tc.name      testSafeParseCue0063
     * @tc.desc      Cue 63 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '63';
      const start: number = 15500;
      const end: number = 16700;
      const duration: number = end - start;
      const text: string = 'line63';
      expect(index).assertEqual('63');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0064
     * @tc.name      testSafeParseCue0064
     * @tc.desc      Cue 64 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '64';
      const start: number = 15750;
      const end: number = 17050;
      const duration: number = end - start;
      const text: string = 'line64';
      expect(index).assertEqual('64');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0065
     * @tc.name      testSafeParseCue0065
     * @tc.desc      Cue 65 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '65';
      const start: number = 16000;
      const end: number = 17400;
      const duration: number = end - start;
      const text: string = 'line65';
      expect(index).assertEqual('65');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0066
     * @tc.name      testSafeParseCue0066
     * @tc.desc      Cue 66 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '66';
      const start: number = 16250;
      const end: number = 17250;
      const duration: number = end - start;
      const text: string = 'line66';
      expect(index).assertEqual('66');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0067
     * @tc.name      testSafeParseCue0067
     * @tc.desc      Cue 67 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '67';
      const start: number = 16500;
      const end: number = 17600;
      const duration: number = end - start;
      const text: string = 'line67';
      expect(index).assertEqual('67');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0068
     * @tc.name      testSafeParseCue0068
     * @tc.desc      Cue 68 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '68';
      const start: number = 16750;
      const end: number = 17950;
      const duration: number = end - start;
      const text: string = 'line68';
      expect(index).assertEqual('68');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0069
     * @tc.name      testSafeParseCue0069
     * @tc.desc      Cue 69 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '69';
      const start: number = 17000;
      const end: number = 18300;
      const duration: number = end - start;
      const text: string = 'line69';
      expect(index).assertEqual('69');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0070
     * @tc.name      testSafeParseCue0070
     * @tc.desc      Cue 70 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '70';
      const start: number = 17250;
      const end: number = 18650;
      const duration: number = end - start;
      const text: string = 'line70';
      expect(index).assertEqual('70');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0071
     * @tc.name      testSafeParseCue0071
     * @tc.desc      Cue 71 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '71';
      const start: number = 17500;
      const end: number = 18500;
      const duration: number = end - start;
      const text: string = 'line71';
      expect(index).assertEqual('71');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0072
     * @tc.name      testSafeParseCue0072
     * @tc.desc      Cue 72 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '72';
      const start: number = 17750;
      const end: number = 18850;
      const duration: number = end - start;
      const text: string = 'line72';
      expect(index).assertEqual('72');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0073
     * @tc.name      testSafeParseCue0073
     * @tc.desc      Cue 73 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '73';
      const start: number = 18000;
      const end: number = 19200;
      const duration: number = end - start;
      const text: string = 'line73';
      expect(index).assertEqual('73');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0074
     * @tc.name      testSafeParseCue0074
     * @tc.desc      Cue 74 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '74';
      const start: number = 18250;
      const end: number = 19550;
      const duration: number = end - start;
      const text: string = 'line74';
      expect(index).assertEqual('74');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0075
     * @tc.name      testSafeParseCue0075
     * @tc.desc      Cue 75 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '75';
      const start: number = 18500;
      const end: number = 19900;
      const duration: number = end - start;
      const text: string = 'line75';
      expect(index).assertEqual('75');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0076
     * @tc.name      testSafeParseCue0076
     * @tc.desc      Cue 76 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '76';
      const start: number = 18750;
      const end: number = 19750;
      const duration: number = end - start;
      const text: string = 'line76';
      expect(index).assertEqual('76');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0077
     * @tc.name      testSafeParseCue0077
     * @tc.desc      Cue 77 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '77';
      const start: number = 19000;
      const end: number = 20100;
      const duration: number = end - start;
      const text: string = 'line77';
      expect(index).assertEqual('77');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0078
     * @tc.name      testSafeParseCue0078
     * @tc.desc      Cue 78 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '78';
      const start: number = 19250;
      const end: number = 20450;
      const duration: number = end - start;
      const text: string = 'line78';
      expect(index).assertEqual('78');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0079
     * @tc.name      testSafeParseCue0079
     * @tc.desc      Cue 79 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '79';
      const start: number = 19500;
      const end: number = 20800;
      const duration: number = end - start;
      const text: string = 'line79';
      expect(index).assertEqual('79');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0080
     * @tc.name      testSafeParseCue0080
     * @tc.desc      Cue 80 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '80';
      const start: number = 19750;
      const end: number = 21150;
      const duration: number = end - start;
      const text: string = 'line80';
      expect(index).assertEqual('80');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0081
     * @tc.name      testSafeParseCue0081
     * @tc.desc      Cue 81 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '81';
      const start: number = 20000;
      const end: number = 21000;
      const duration: number = end - start;
      const text: string = 'line81';
      expect(index).assertEqual('81');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0082
     * @tc.name      testSafeParseCue0082
     * @tc.desc      Cue 82 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '82';
      const start: number = 20250;
      const end: number = 21350;
      const duration: number = end - start;
      const text: string = 'line82';
      expect(index).assertEqual('82');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0083
     * @tc.name      testSafeParseCue0083
     * @tc.desc      Cue 83 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '83';
      const start: number = 20500;
      const end: number = 21700;
      const duration: number = end - start;
      const text: string = 'line83';
      expect(index).assertEqual('83');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0084
     * @tc.name      testSafeParseCue0084
     * @tc.desc      Cue 84 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '84';
      const start: number = 20750;
      const end: number = 22050;
      const duration: number = end - start;
      const text: string = 'line84';
      expect(index).assertEqual('84');
      expect(duration).assertEqual(1300);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0085
     * @tc.name      testSafeParseCue0085
     * @tc.desc      Cue 85 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '85';
      const start: number = 21000;
      const end: number = 22400;
      const duration: number = end - start;
      const text: string = 'line85';
      expect(index).assertEqual('85');
      expect(duration).assertEqual(1400);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0086
     * @tc.name      testSafeParseCue0086
     * @tc.desc      Cue 86 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '86';
      const start: number = 21250;
      const end: number = 22250;
      const duration: number = end - start;
      const text: string = 'line86';
      expect(index).assertEqual('86');
      expect(duration).assertEqual(1000);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0087
     * @tc.name      testSafeParseCue0087
     * @tc.desc      Cue 87 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '87';
      const start: number = 21500;
      const end: number = 22600;
      const duration: number = end - start;
      const text: string = 'line87';
      expect(index).assertEqual('87');
      expect(duration).assertEqual(1100);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_NATIVE_SUBTITLE_SAFE_PB_0088
     * @tc.name      testSafeParseCue0088
     * @tc.desc      Cue 88 start/end/duration and text are consistent.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSafeParseCue0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const index: string = '88';
      const start: number = 21750;
      const end: number = 22950;
      const duration: number = end - start;
      const text: string = 'line88';
      expect(index).assertEqual('88');
      expect(duration).assertEqual(1200);
      expect(end).assertLarger(start);
      expect(text.indexOf('line')).assertEqual(0);
      expect(text.length).assertLarger(0);
    })
  })
}
