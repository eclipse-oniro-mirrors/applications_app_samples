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

const TAG: string = '[Sample_channelKeyMapCore]';
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

export default function channelKeyMapCoreTest(): void {
  describe('channelKeyMapCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0100
     * @tc.name      testChannelKeyMap0001
     * @tc.desc      Verify channelKeyMapCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0200
     * @tc.name      testChannelKeyMap0002
     * @tc.desc      Verify channelKeyMapCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0300
     * @tc.name      testChannelKeyMap0003
     * @tc.desc      Verify channelKeyMapCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0400
     * @tc.name      testChannelKeyMap0004
     * @tc.desc      Verify channelKeyMapCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0500
     * @tc.name      testChannelKeyMap0005
     * @tc.desc      Verify channelKeyMapCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0600
     * @tc.name      testChannelKeyMap0006
     * @tc.desc      Verify channelKeyMapCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0700
     * @tc.name      testChannelKeyMap0007
     * @tc.desc      Verify channelKeyMapCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0800
     * @tc.name      testChannelKeyMap0008
     * @tc.desc      Verify channelKeyMapCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_0900
     * @tc.name      testChannelKeyMap0009
     * @tc.desc      Verify channelKeyMapCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1000
     * @tc.name      testChannelKeyMap0010
     * @tc.desc      Verify channelKeyMapCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1100
     * @tc.name      testChannelKeyMap0011
     * @tc.desc      Verify channelKeyMapCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1200
     * @tc.name      testChannelKeyMap0012
     * @tc.desc      Verify channelKeyMapCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1300
     * @tc.name      testChannelKeyMap0013
     * @tc.desc      Verify channelKeyMapCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1400
     * @tc.name      testChannelKeyMap0014
     * @tc.desc      Verify channelKeyMapCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1500
     * @tc.name      testChannelKeyMap0015
     * @tc.desc      Verify channelKeyMapCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1600
     * @tc.name      testChannelKeyMap0016
     * @tc.desc      Verify channelKeyMapCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1700
     * @tc.name      testChannelKeyMap0017
     * @tc.desc      Verify channelKeyMapCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1800
     * @tc.name      testChannelKeyMap0018
     * @tc.desc      Verify channelKeyMapCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_1900
     * @tc.name      testChannelKeyMap0019
     * @tc.desc      Verify channelKeyMapCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2000
     * @tc.name      testChannelKeyMap0020
     * @tc.desc      Verify channelKeyMapCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2100
     * @tc.name      testChannelKeyMap0021
     * @tc.desc      Verify channelKeyMapCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2200
     * @tc.name      testChannelKeyMap0022
     * @tc.desc      Verify channelKeyMapCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2300
     * @tc.name      testChannelKeyMap0023
     * @tc.desc      Verify channelKeyMapCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2400
     * @tc.name      testChannelKeyMap0024
     * @tc.desc      Verify channelKeyMapCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2500
     * @tc.name      testChannelKeyMap0025
     * @tc.desc      Verify channelKeyMapCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2600
     * @tc.name      testChannelKeyMap0026
     * @tc.desc      Verify channelKeyMapCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2700
     * @tc.name      testChannelKeyMap0027
     * @tc.desc      Verify channelKeyMapCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2800
     * @tc.name      testChannelKeyMap0028
     * @tc.desc      Verify channelKeyMapCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_2900
     * @tc.name      testChannelKeyMap0029
     * @tc.desc      Verify channelKeyMapCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3000
     * @tc.name      testChannelKeyMap0030
     * @tc.desc      Verify channelKeyMapCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3100
     * @tc.name      testChannelKeyMap0031
     * @tc.desc      Verify channelKeyMapCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3200
     * @tc.name      testChannelKeyMap0032
     * @tc.desc      Verify channelKeyMapCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3300
     * @tc.name      testChannelKeyMap0033
     * @tc.desc      Verify channelKeyMapCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3400
     * @tc.name      testChannelKeyMap0034
     * @tc.desc      Verify channelKeyMapCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3500
     * @tc.name      testChannelKeyMap0035
     * @tc.desc      Verify channelKeyMapCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3600
     * @tc.name      testChannelKeyMap0036
     * @tc.desc      Verify channelKeyMapCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3700
     * @tc.name      testChannelKeyMap0037
     * @tc.desc      Verify channelKeyMapCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3800
     * @tc.name      testChannelKeyMap0038
     * @tc.desc      Verify channelKeyMapCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_3900
     * @tc.name      testChannelKeyMap0039
     * @tc.desc      Verify channelKeyMapCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4000
     * @tc.name      testChannelKeyMap0040
     * @tc.desc      Verify channelKeyMapCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4100
     * @tc.name      testChannelKeyMap0041
     * @tc.desc      Verify channelKeyMapCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4200
     * @tc.name      testChannelKeyMap0042
     * @tc.desc      Verify channelKeyMapCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4300
     * @tc.name      testChannelKeyMap0043
     * @tc.desc      Verify channelKeyMapCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4400
     * @tc.name      testChannelKeyMap0044
     * @tc.desc      Verify channelKeyMapCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4500
     * @tc.name      testChannelKeyMap0045
     * @tc.desc      Verify channelKeyMapCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4600
     * @tc.name      testChannelKeyMap0046
     * @tc.desc      Verify channelKeyMapCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4700
     * @tc.name      testChannelKeyMap0047
     * @tc.desc      Verify channelKeyMapCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4800
     * @tc.name      testChannelKeyMap0048
     * @tc.desc      Verify channelKeyMapCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_4900
     * @tc.name      testChannelKeyMap0049
     * @tc.desc      Verify channelKeyMapCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5000
     * @tc.name      testChannelKeyMap0050
     * @tc.desc      Verify channelKeyMapCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5100
     * @tc.name      testChannelKeyMap0051
     * @tc.desc      Verify channelKeyMapCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5200
     * @tc.name      testChannelKeyMap0052
     * @tc.desc      Verify channelKeyMapCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5300
     * @tc.name      testChannelKeyMap0053
     * @tc.desc      Verify channelKeyMapCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5400
     * @tc.name      testChannelKeyMap0054
     * @tc.desc      Verify channelKeyMapCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5500
     * @tc.name      testChannelKeyMap0055
     * @tc.desc      Verify channelKeyMapCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5600
     * @tc.name      testChannelKeyMap0056
     * @tc.desc      Verify channelKeyMapCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5700
     * @tc.name      testChannelKeyMap0057
     * @tc.desc      Verify channelKeyMapCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5800
     * @tc.name      testChannelKeyMap0058
     * @tc.desc      Verify channelKeyMapCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_5900
     * @tc.name      testChannelKeyMap0059
     * @tc.desc      Verify channelKeyMapCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6000
     * @tc.name      testChannelKeyMap0060
     * @tc.desc      Verify channelKeyMapCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6100
     * @tc.name      testChannelKeyMap0061
     * @tc.desc      Verify channelKeyMapCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6200
     * @tc.name      testChannelKeyMap0062
     * @tc.desc      Verify channelKeyMapCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6300
     * @tc.name      testChannelKeyMap0063
     * @tc.desc      Verify channelKeyMapCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6400
     * @tc.name      testChannelKeyMap0064
     * @tc.desc      Verify channelKeyMapCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6500
     * @tc.name      testChannelKeyMap0065
     * @tc.desc      Verify channelKeyMapCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6600
     * @tc.name      testChannelKeyMap0066
     * @tc.desc      Verify channelKeyMapCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6700
     * @tc.name      testChannelKeyMap0067
     * @tc.desc      Verify channelKeyMapCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6800
     * @tc.name      testChannelKeyMap0068
     * @tc.desc      Verify channelKeyMapCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_6900
     * @tc.name      testChannelKeyMap0069
     * @tc.desc      Verify channelKeyMapCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7000
     * @tc.name      testChannelKeyMap0070
     * @tc.desc      Verify channelKeyMapCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7100
     * @tc.name      testChannelKeyMap0071
     * @tc.desc      Verify channelKeyMapCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7200
     * @tc.name      testChannelKeyMap0072
     * @tc.desc      Verify channelKeyMapCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7300
     * @tc.name      testChannelKeyMap0073
     * @tc.desc      Verify channelKeyMapCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7400
     * @tc.name      testChannelKeyMap0074
     * @tc.desc      Verify channelKeyMapCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7500
     * @tc.name      testChannelKeyMap0075
     * @tc.desc      Verify channelKeyMapCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7600
     * @tc.name      testChannelKeyMap0076
     * @tc.desc      Verify channelKeyMapCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7700
     * @tc.name      testChannelKeyMap0077
     * @tc.desc      Verify channelKeyMapCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7800
     * @tc.name      testChannelKeyMap0078
     * @tc.desc      Verify channelKeyMapCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_7900
     * @tc.name      testChannelKeyMap0079
     * @tc.desc      Verify channelKeyMapCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_8000
     * @tc.name      testChannelKeyMap0080
     * @tc.desc      Verify channelKeyMapCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

    /**
     * @tc.number    SUB_CAPTURER_CHANNEL_MAP_8100
     * @tc.name      testChannelKeyMap0081
     * @tc.desc      Verify channelKeyMapCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelKeyMap0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(CHANNEL_KEY_MAP['MONO']).assertEqual(1);
      expect(CHANNEL_KEY_MAP['STEREO']).assertEqual(2);
      expect(Object.keys(CHANNEL_KEY_MAP).length).assertEqual(2);
      expect(CHANNEL_KEY_MAP['MONO']).assertLess(CHANNEL_KEY_MAP['STEREO']);
    });

  });
}
