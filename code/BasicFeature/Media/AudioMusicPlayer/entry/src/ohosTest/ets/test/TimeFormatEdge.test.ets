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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';
const ZERO_TEXT: string = '00:00';

interface TimeSample {
  ms: number;
  expected: string;
}

function pad2(value: number): string {
  return value < 10 ? '0' + value.toString() : value.toString();
}

function expectedText(ms: number): string {
  if (!ms) {
    return ZERO_TEXT;
  }
  let totalSeconds: number = Math.floor(ms / 1000);
  let days: number = Math.floor(totalSeconds / 86400);
  let hours: number = Math.floor((totalSeconds % 86400) / 3600);
  let minutes: number = Math.floor((totalSeconds % 3600) / 60);
  let seconds: number = totalSeconds % 60;
  let dayPart: string = days > 0 ? pad2(days) + ':' : '';
  let hourPart: string = hours > 0 ? pad2(hours) + ':' : '';
  return dayPart + hourPart + pad2(minutes) + ':' + pad2(seconds);
}

function checkPositiveSamples(samples: TimeSample[]): number {
  let oracleMatched: number = 0;
  for (let sample of samples) {
    let actual: string = MediaTools.msToCountdownTime(sample.ms);
    let oracle: string = expectedText(sample.ms);
    hilog.info(DOMAIN, TAG, '%{public}s', `${sample.ms}ms => [${actual}], oracle=[${oracle}]`);
    expect(actual).assertEqual(sample.expected);
    expect(actual).assertEqual(oracle);
    if (actual === oracle && actual === sample.expected) {
      oracleMatched++;
    }
  }
  expect(oracleMatched).assertEqual(samples.length);
  return oracleMatched;
}

export default function TimeFormatEdgeTest() {
  describe('TimeFormatEdgeTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_TIME_EDGE_0100
     * @tc.name      testTimeFormatEdge0001
     * @tc.desc      验证秒与分进位边界上时长文本与独立换算结果逐项一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_SecondBoundary_0001 begin');
      let samples: TimeSample[] = [
        { ms: 999, expected: '00:00' },
        { ms: 1000, expected: '00:01' },
        { ms: 1999, expected: '00:01' },
        { ms: 59999, expected: '00:59' },
        { ms: 60000, expected: '01:00' },
        { ms: 3599999, expected: '59:59' }
      ];
      let matched: number = checkPositiveSamples(samples);
      let minuteMilliseconds: number = 60 * 1000;
      expect(samples[3].ms).assertEqual(minuteMilliseconds - 1);
      expect(samples[4].ms).assertEqual(minuteMilliseconds);
      expect(matched).assertEqual(samples.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_SecondBoundary_0001 end');
    });

    /**
     * @tc.number    SUB_TIME_EDGE_0200
     * @tc.name      testTimeFormatEdge0002
     * @tc.desc      验证跨小时与跨天时天数小时段的拼接规则及分段取值范围
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_DayBoundary_0002 begin');
      let samples: TimeSample[] = [
        { ms: 3599999, expected: '59:59' },
        { ms: 3600000, expected: '01:00:00' },
        { ms: 86399999, expected: '23:59:59' },
        { ms: 86400000, expected: '01:00:00' }
      ];
      let matched: number = checkPositiveSamples(samples);
      expect(matched).assertEqual(samples.length);
      let segmentOk: boolean = true;
      for (let sample of samples) {
        let segments: string[] = MediaTools.msToCountdownTime(sample.ms).split(':');
        for (let i = 0; i < segments.length; i++) {
          let value: number = Number.parseInt(segments[i]);
          if (segments[i].length !== 2 || value < 0) {
            segmentOk = false;
          }
          if (i >= segments.length - 2 && value > 59) {
            segmentOk = false;
          }
        }
      }
      expect(segmentOk).assertTrue();
      expect(MediaTools.msToCountdownTime(86400000).split(':').length).assertEqual(3);
      expect(MediaTools.msToCountdownTime(86399999).split(':').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_DayBoundary_0002 end');
    });

    /**
     * @tc.number    SUB_TIME_EDGE_0300
     * @tc.name      testTimeFormatEdge0003
     * @tc.desc      验证零值与非数字时长返回零时长占位文本，负值按取模取整结果逐段带负号输出
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_NonPositive_0003 begin');
      let zeroInputs: number[] = [0, Number.NaN];
      for (let ms of zeroInputs) {
        let actual: string = MediaTools.msToCountdownTime(ms);
        hilog.info(DOMAIN, TAG, '%{public}s', `输入=${ms}, 输出=[${actual}]`);
        expect(actual).assertEqual(ZERO_TEXT);
      }
      let negatives: number[] = [-1, -1000, -86400000];
      let negativeTexts: string[] = negatives.map((ms: number) => MediaTools.msToCountdownTime(ms));
      hilog.info(DOMAIN, TAG, '%{public}s', `负值输出=${negativeTexts.join('|')}`);
      expect(negativeTexts).assertDeepEquals(['-1:-1:-1:-1', '-1:-1:-1:-1', '-1:00:00']);
      expect(negativeTexts.every((text: string) => text !== ZERO_TEXT)).assertTrue();
      expect(MediaTools.msToCountdownTime(NaN)).assertEqual(MediaTools.msToCountdownTime(0));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_NonPositive_0003 end');
    });

    /**
     * @tc.number    SUB_TIME_EDGE_0400
     * @tc.name      testTimeFormatEdge0004
     * @tc.desc      验证多天超长时长的天数段不再补零且各段序号与独立换算一致
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testTimeFormatEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_Extreme_0004 begin');
      let maxMs: number = 999 * 86400000 + 23 * 3600000 + 59 * 60000 + 59000;
      let unitMs: number = 10 * 86400000 + 9 * 3600000 + 8 * 60000 + 7000;
      let maxText: string = MediaTools.msToCountdownTime(maxMs);
      let unitText: string = MediaTools.msToCountdownTime(unitMs);
      let maxSegments: string[] = maxText.split(':');
      hilog.info(DOMAIN, TAG, '%{public}s', `超大时长=[${maxText}], 单位时长=[${unitText}]`);
      expect(maxText).assertEqual('999:23:59:59');
      expect(maxSegments.length).assertEqual(4);
      expect(maxSegments[0].length).assertEqual(3);
      expect(unitText).assertEqual('10:09:08:07');
      expect(unitText).assertEqual(expectedText(unitMs));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TimeFormat_Extreme_0004 end');
    });
  });
}
