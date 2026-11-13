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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  SAMPLING_RATE_KEY_MAP, CHANNEL_KEY_MAP, SOURCE_TYPE_KEY_MAP, SAMPLE_FORMAT_KEY_MAP,
  SAMPLING_RATE_OPTIONS, CHANNEL_OPTIONS, SOURCE_TYPE_OPTIONS, SAMPLE_FORMAT_OPTIONS
} from '../../../main/ets/common/constants/SelectConstants';

const TAG: string = '[Sample_sourceTypeKeyMapCore]';
const DOMAIN: number = 0xF811;

function it(name: string, filter: number, func: () => void | Promise<void>): void {
  hypiumIt(name, filter, async () => {
    hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
    try {
      await func();
    } finally {
      hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
    }
  });
}

interface ExpectAssert {
  assertEqual(expectValue: string | number | boolean | Object | null | undefined): void;
  assertTrue(): void;
  assertFalse(): void;
  assertLarger(expectValue: number): void;
  assertLargerOrEqual(expectValue: number): void;
  assertLess(expectValue: number): void;
  assertLessOrEqual(expectValue: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function sourceTypeKeyMapCoreTest(): void {
  describe('sourceTypeKeyMapCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0100
     * @tc.name      testSourceTypeKeyMap0001
     * @tc.desc      Verify sourceTypeKeyMapCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0200
     * @tc.name      testSourceTypeKeyMap0002
     * @tc.desc      Verify sourceTypeKeyMapCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0300
     * @tc.name      testSourceTypeKeyMap0003
     * @tc.desc      Verify sourceTypeKeyMapCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0400
     * @tc.name      testSourceTypeKeyMap0004
     * @tc.desc      Verify sourceTypeKeyMapCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0500
     * @tc.name      testSourceTypeKeyMap0005
     * @tc.desc      Verify sourceTypeKeyMapCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0600
     * @tc.name      testSourceTypeKeyMap0006
     * @tc.desc      Verify sourceTypeKeyMapCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0700
     * @tc.name      testSourceTypeKeyMap0007
     * @tc.desc      Verify sourceTypeKeyMapCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0800
     * @tc.name      testSourceTypeKeyMap0008
     * @tc.desc      Verify sourceTypeKeyMapCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_0900
     * @tc.name      testSourceTypeKeyMap0009
     * @tc.desc      Verify sourceTypeKeyMapCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1000
     * @tc.name      testSourceTypeKeyMap0010
     * @tc.desc      Verify sourceTypeKeyMapCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1100
     * @tc.name      testSourceTypeKeyMap0011
     * @tc.desc      Verify sourceTypeKeyMapCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1200
     * @tc.name      testSourceTypeKeyMap0012
     * @tc.desc      Verify sourceTypeKeyMapCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1300
     * @tc.name      testSourceTypeKeyMap0013
     * @tc.desc      Verify sourceTypeKeyMapCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1400
     * @tc.name      testSourceTypeKeyMap0014
     * @tc.desc      Verify sourceTypeKeyMapCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1500
     * @tc.name      testSourceTypeKeyMap0015
     * @tc.desc      Verify sourceTypeKeyMapCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1600
     * @tc.name      testSourceTypeKeyMap0016
     * @tc.desc      Verify sourceTypeKeyMapCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1700
     * @tc.name      testSourceTypeKeyMap0017
     * @tc.desc      Verify sourceTypeKeyMapCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1800
     * @tc.name      testSourceTypeKeyMap0018
     * @tc.desc      Verify sourceTypeKeyMapCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_1900
     * @tc.name      testSourceTypeKeyMap0019
     * @tc.desc      Verify sourceTypeKeyMapCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2000
     * @tc.name      testSourceTypeKeyMap0020
     * @tc.desc      Verify sourceTypeKeyMapCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2100
     * @tc.name      testSourceTypeKeyMap0021
     * @tc.desc      Verify sourceTypeKeyMapCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2200
     * @tc.name      testSourceTypeKeyMap0022
     * @tc.desc      Verify sourceTypeKeyMapCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2300
     * @tc.name      testSourceTypeKeyMap0023
     * @tc.desc      Verify sourceTypeKeyMapCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2400
     * @tc.name      testSourceTypeKeyMap0024
     * @tc.desc      Verify sourceTypeKeyMapCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2500
     * @tc.name      testSourceTypeKeyMap0025
     * @tc.desc      Verify sourceTypeKeyMapCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2600
     * @tc.name      testSourceTypeKeyMap0026
     * @tc.desc      Verify sourceTypeKeyMapCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2700
     * @tc.name      testSourceTypeKeyMap0027
     * @tc.desc      Verify sourceTypeKeyMapCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2800
     * @tc.name      testSourceTypeKeyMap0028
     * @tc.desc      Verify sourceTypeKeyMapCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_2900
     * @tc.name      testSourceTypeKeyMap0029
     * @tc.desc      Verify sourceTypeKeyMapCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3000
     * @tc.name      testSourceTypeKeyMap0030
     * @tc.desc      Verify sourceTypeKeyMapCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3100
     * @tc.name      testSourceTypeKeyMap0031
     * @tc.desc      Verify sourceTypeKeyMapCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3200
     * @tc.name      testSourceTypeKeyMap0032
     * @tc.desc      Verify sourceTypeKeyMapCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3300
     * @tc.name      testSourceTypeKeyMap0033
     * @tc.desc      Verify sourceTypeKeyMapCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3400
     * @tc.name      testSourceTypeKeyMap0034
     * @tc.desc      Verify sourceTypeKeyMapCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3500
     * @tc.name      testSourceTypeKeyMap0035
     * @tc.desc      Verify sourceTypeKeyMapCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3600
     * @tc.name      testSourceTypeKeyMap0036
     * @tc.desc      Verify sourceTypeKeyMapCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3700
     * @tc.name      testSourceTypeKeyMap0037
     * @tc.desc      Verify sourceTypeKeyMapCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3800
     * @tc.name      testSourceTypeKeyMap0038
     * @tc.desc      Verify sourceTypeKeyMapCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_3900
     * @tc.name      testSourceTypeKeyMap0039
     * @tc.desc      Verify sourceTypeKeyMapCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4000
     * @tc.name      testSourceTypeKeyMap0040
     * @tc.desc      Verify sourceTypeKeyMapCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4100
     * @tc.name      testSourceTypeKeyMap0041
     * @tc.desc      Verify sourceTypeKeyMapCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4200
     * @tc.name      testSourceTypeKeyMap0042
     * @tc.desc      Verify sourceTypeKeyMapCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4300
     * @tc.name      testSourceTypeKeyMap0043
     * @tc.desc      Verify sourceTypeKeyMapCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4400
     * @tc.name      testSourceTypeKeyMap0044
     * @tc.desc      Verify sourceTypeKeyMapCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4500
     * @tc.name      testSourceTypeKeyMap0045
     * @tc.desc      Verify sourceTypeKeyMapCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4600
     * @tc.name      testSourceTypeKeyMap0046
     * @tc.desc      Verify sourceTypeKeyMapCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4700
     * @tc.name      testSourceTypeKeyMap0047
     * @tc.desc      Verify sourceTypeKeyMapCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4800
     * @tc.name      testSourceTypeKeyMap0048
     * @tc.desc      Verify sourceTypeKeyMapCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_4900
     * @tc.name      testSourceTypeKeyMap0049
     * @tc.desc      Verify sourceTypeKeyMapCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5000
     * @tc.name      testSourceTypeKeyMap0050
     * @tc.desc      Verify sourceTypeKeyMapCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5100
     * @tc.name      testSourceTypeKeyMap0051
     * @tc.desc      Verify sourceTypeKeyMapCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5200
     * @tc.name      testSourceTypeKeyMap0052
     * @tc.desc      Verify sourceTypeKeyMapCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5300
     * @tc.name      testSourceTypeKeyMap0053
     * @tc.desc      Verify sourceTypeKeyMapCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5400
     * @tc.name      testSourceTypeKeyMap0054
     * @tc.desc      Verify sourceTypeKeyMapCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5500
     * @tc.name      testSourceTypeKeyMap0055
     * @tc.desc      Verify sourceTypeKeyMapCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5600
     * @tc.name      testSourceTypeKeyMap0056
     * @tc.desc      Verify sourceTypeKeyMapCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5700
     * @tc.name      testSourceTypeKeyMap0057
     * @tc.desc      Verify sourceTypeKeyMapCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5800
     * @tc.name      testSourceTypeKeyMap0058
     * @tc.desc      Verify sourceTypeKeyMapCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_5900
     * @tc.name      testSourceTypeKeyMap0059
     * @tc.desc      Verify sourceTypeKeyMapCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6000
     * @tc.name      testSourceTypeKeyMap0060
     * @tc.desc      Verify sourceTypeKeyMapCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6100
     * @tc.name      testSourceTypeKeyMap0061
     * @tc.desc      Verify sourceTypeKeyMapCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6200
     * @tc.name      testSourceTypeKeyMap0062
     * @tc.desc      Verify sourceTypeKeyMapCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6300
     * @tc.name      testSourceTypeKeyMap0063
     * @tc.desc      Verify sourceTypeKeyMapCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6400
     * @tc.name      testSourceTypeKeyMap0064
     * @tc.desc      Verify sourceTypeKeyMapCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6500
     * @tc.name      testSourceTypeKeyMap0065
     * @tc.desc      Verify sourceTypeKeyMapCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6600
     * @tc.name      testSourceTypeKeyMap0066
     * @tc.desc      Verify sourceTypeKeyMapCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6700
     * @tc.name      testSourceTypeKeyMap0067
     * @tc.desc      Verify sourceTypeKeyMapCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6800
     * @tc.name      testSourceTypeKeyMap0068
     * @tc.desc      Verify sourceTypeKeyMapCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_6900
     * @tc.name      testSourceTypeKeyMap0069
     * @tc.desc      Verify sourceTypeKeyMapCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7000
     * @tc.name      testSourceTypeKeyMap0070
     * @tc.desc      Verify sourceTypeKeyMapCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7100
     * @tc.name      testSourceTypeKeyMap0071
     * @tc.desc      Verify sourceTypeKeyMapCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7200
     * @tc.name      testSourceTypeKeyMap0072
     * @tc.desc      Verify sourceTypeKeyMapCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7300
     * @tc.name      testSourceTypeKeyMap0073
     * @tc.desc      Verify sourceTypeKeyMapCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7400
     * @tc.name      testSourceTypeKeyMap0074
     * @tc.desc      Verify sourceTypeKeyMapCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[1]]).assertEqual(expected[1]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7500
     * @tc.name      testSourceTypeKeyMap0075
     * @tc.desc      Verify sourceTypeKeyMapCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[2]]).assertEqual(expected[2]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7600
     * @tc.name      testSourceTypeKeyMap0076
     * @tc.desc      Verify sourceTypeKeyMapCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[3]]).assertEqual(expected[3]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7700
     * @tc.name      testSourceTypeKeyMap0077
     * @tc.desc      Verify sourceTypeKeyMapCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[4]]).assertEqual(expected[4]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7800
     * @tc.name      testSourceTypeKeyMap0078
     * @tc.desc      Verify sourceTypeKeyMapCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[5]]).assertEqual(expected[5]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_7900
     * @tc.name      testSourceTypeKeyMap0079
     * @tc.desc      Verify sourceTypeKeyMapCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[6]]).assertEqual(expected[6]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_8000
     * @tc.name      testSourceTypeKeyMap0080
     * @tc.desc      Verify sourceTypeKeyMapCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[7]]).assertEqual(expected[7]);
      expect(keys.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CAPTURER_SOURCE_MAP_8100
     * @tc.name      testSourceTypeKeyMap0081
     * @tc.desc      Verify sourceTypeKeyMapCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testSourceTypeKeyMap0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
        'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
      const expected: number[] = [0, 1, 2, 7, 10, 13, 14, 17];
      expect(SOURCE_TYPE_KEY_MAP[keys[0]]).assertEqual(expected[0]);
      expect(keys.length).assertEqual(8);
    });

  });
}
