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

const TAG: string = '[Sample_channelSourceOptionsCore]';
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

export default function channelSourceOptionsCoreTest(): void {
  describe('channelSourceOptionsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_CAPTURER_OPT_0100
     * @tc.name      testChannelSourceOptions0001
     * @tc.desc      Verify channelSourceOptionsCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0200
     * @tc.name      testChannelSourceOptions0002
     * @tc.desc      Verify channelSourceOptionsCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0300
     * @tc.name      testChannelSourceOptions0003
     * @tc.desc      Verify channelSourceOptionsCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0400
     * @tc.name      testChannelSourceOptions0004
     * @tc.desc      Verify channelSourceOptionsCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0500
     * @tc.name      testChannelSourceOptions0005
     * @tc.desc      Verify channelSourceOptionsCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0600
     * @tc.name      testChannelSourceOptions0006
     * @tc.desc      Verify channelSourceOptionsCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0700
     * @tc.name      testChannelSourceOptions0007
     * @tc.desc      Verify channelSourceOptionsCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0800
     * @tc.name      testChannelSourceOptions0008
     * @tc.desc      Verify channelSourceOptionsCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_0900
     * @tc.name      testChannelSourceOptions0009
     * @tc.desc      Verify channelSourceOptionsCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1000
     * @tc.name      testChannelSourceOptions0010
     * @tc.desc      Verify channelSourceOptionsCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1100
     * @tc.name      testChannelSourceOptions0011
     * @tc.desc      Verify channelSourceOptionsCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1200
     * @tc.name      testChannelSourceOptions0012
     * @tc.desc      Verify channelSourceOptionsCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1300
     * @tc.name      testChannelSourceOptions0013
     * @tc.desc      Verify channelSourceOptionsCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1400
     * @tc.name      testChannelSourceOptions0014
     * @tc.desc      Verify channelSourceOptionsCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1500
     * @tc.name      testChannelSourceOptions0015
     * @tc.desc      Verify channelSourceOptionsCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1600
     * @tc.name      testChannelSourceOptions0016
     * @tc.desc      Verify channelSourceOptionsCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1700
     * @tc.name      testChannelSourceOptions0017
     * @tc.desc      Verify channelSourceOptionsCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1800
     * @tc.name      testChannelSourceOptions0018
     * @tc.desc      Verify channelSourceOptionsCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_1900
     * @tc.name      testChannelSourceOptions0019
     * @tc.desc      Verify channelSourceOptionsCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2000
     * @tc.name      testChannelSourceOptions0020
     * @tc.desc      Verify channelSourceOptionsCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2100
     * @tc.name      testChannelSourceOptions0021
     * @tc.desc      Verify channelSourceOptionsCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2200
     * @tc.name      testChannelSourceOptions0022
     * @tc.desc      Verify channelSourceOptionsCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2300
     * @tc.name      testChannelSourceOptions0023
     * @tc.desc      Verify channelSourceOptionsCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2400
     * @tc.name      testChannelSourceOptions0024
     * @tc.desc      Verify channelSourceOptionsCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2500
     * @tc.name      testChannelSourceOptions0025
     * @tc.desc      Verify channelSourceOptionsCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2600
     * @tc.name      testChannelSourceOptions0026
     * @tc.desc      Verify channelSourceOptionsCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2700
     * @tc.name      testChannelSourceOptions0027
     * @tc.desc      Verify channelSourceOptionsCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2800
     * @tc.name      testChannelSourceOptions0028
     * @tc.desc      Verify channelSourceOptionsCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_2900
     * @tc.name      testChannelSourceOptions0029
     * @tc.desc      Verify channelSourceOptionsCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3000
     * @tc.name      testChannelSourceOptions0030
     * @tc.desc      Verify channelSourceOptionsCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3100
     * @tc.name      testChannelSourceOptions0031
     * @tc.desc      Verify channelSourceOptionsCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3200
     * @tc.name      testChannelSourceOptions0032
     * @tc.desc      Verify channelSourceOptionsCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3300
     * @tc.name      testChannelSourceOptions0033
     * @tc.desc      Verify channelSourceOptionsCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3400
     * @tc.name      testChannelSourceOptions0034
     * @tc.desc      Verify channelSourceOptionsCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3500
     * @tc.name      testChannelSourceOptions0035
     * @tc.desc      Verify channelSourceOptionsCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3600
     * @tc.name      testChannelSourceOptions0036
     * @tc.desc      Verify channelSourceOptionsCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3700
     * @tc.name      testChannelSourceOptions0037
     * @tc.desc      Verify channelSourceOptionsCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3800
     * @tc.name      testChannelSourceOptions0038
     * @tc.desc      Verify channelSourceOptionsCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_3900
     * @tc.name      testChannelSourceOptions0039
     * @tc.desc      Verify channelSourceOptionsCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4000
     * @tc.name      testChannelSourceOptions0040
     * @tc.desc      Verify channelSourceOptionsCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4100
     * @tc.name      testChannelSourceOptions0041
     * @tc.desc      Verify channelSourceOptionsCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4200
     * @tc.name      testChannelSourceOptions0042
     * @tc.desc      Verify channelSourceOptionsCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4300
     * @tc.name      testChannelSourceOptions0043
     * @tc.desc      Verify channelSourceOptionsCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4400
     * @tc.name      testChannelSourceOptions0044
     * @tc.desc      Verify channelSourceOptionsCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4500
     * @tc.name      testChannelSourceOptions0045
     * @tc.desc      Verify channelSourceOptionsCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4600
     * @tc.name      testChannelSourceOptions0046
     * @tc.desc      Verify channelSourceOptionsCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4700
     * @tc.name      testChannelSourceOptions0047
     * @tc.desc      Verify channelSourceOptionsCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4800
     * @tc.name      testChannelSourceOptions0048
     * @tc.desc      Verify channelSourceOptionsCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_4900
     * @tc.name      testChannelSourceOptions0049
     * @tc.desc      Verify channelSourceOptionsCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5000
     * @tc.name      testChannelSourceOptions0050
     * @tc.desc      Verify channelSourceOptionsCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5100
     * @tc.name      testChannelSourceOptions0051
     * @tc.desc      Verify channelSourceOptionsCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5200
     * @tc.name      testChannelSourceOptions0052
     * @tc.desc      Verify channelSourceOptionsCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5300
     * @tc.name      testChannelSourceOptions0053
     * @tc.desc      Verify channelSourceOptionsCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5400
     * @tc.name      testChannelSourceOptions0054
     * @tc.desc      Verify channelSourceOptionsCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5500
     * @tc.name      testChannelSourceOptions0055
     * @tc.desc      Verify channelSourceOptionsCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5600
     * @tc.name      testChannelSourceOptions0056
     * @tc.desc      Verify channelSourceOptionsCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5700
     * @tc.name      testChannelSourceOptions0057
     * @tc.desc      Verify channelSourceOptionsCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5800
     * @tc.name      testChannelSourceOptions0058
     * @tc.desc      Verify channelSourceOptionsCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_5900
     * @tc.name      testChannelSourceOptions0059
     * @tc.desc      Verify channelSourceOptionsCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6000
     * @tc.name      testChannelSourceOptions0060
     * @tc.desc      Verify channelSourceOptionsCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6100
     * @tc.name      testChannelSourceOptions0061
     * @tc.desc      Verify channelSourceOptionsCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6200
     * @tc.name      testChannelSourceOptions0062
     * @tc.desc      Verify channelSourceOptionsCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6300
     * @tc.name      testChannelSourceOptions0063
     * @tc.desc      Verify channelSourceOptionsCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6400
     * @tc.name      testChannelSourceOptions0064
     * @tc.desc      Verify channelSourceOptionsCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6500
     * @tc.name      testChannelSourceOptions0065
     * @tc.desc      Verify channelSourceOptionsCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6600
     * @tc.name      testChannelSourceOptions0066
     * @tc.desc      Verify channelSourceOptionsCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6700
     * @tc.name      testChannelSourceOptions0067
     * @tc.desc      Verify channelSourceOptionsCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6800
     * @tc.name      testChannelSourceOptions0068
     * @tc.desc      Verify channelSourceOptionsCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_6900
     * @tc.name      testChannelSourceOptions0069
     * @tc.desc      Verify channelSourceOptionsCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7000
     * @tc.name      testChannelSourceOptions0070
     * @tc.desc      Verify channelSourceOptionsCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7100
     * @tc.name      testChannelSourceOptions0071
     * @tc.desc      Verify channelSourceOptionsCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7200
     * @tc.name      testChannelSourceOptions0072
     * @tc.desc      Verify channelSourceOptionsCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7300
     * @tc.name      testChannelSourceOptions0073
     * @tc.desc      Verify channelSourceOptionsCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7400
     * @tc.name      testChannelSourceOptions0074
     * @tc.desc      Verify channelSourceOptionsCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[1].value).assertEqual(keys[1]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7500
     * @tc.name      testChannelSourceOptions0075
     * @tc.desc      Verify channelSourceOptionsCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[2].value).assertEqual(keys[2]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7600
     * @tc.name      testChannelSourceOptions0076
     * @tc.desc      Verify channelSourceOptionsCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[3].value).assertEqual(keys[3]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7700
     * @tc.name      testChannelSourceOptions0077
     * @tc.desc      Verify channelSourceOptionsCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[4].value).assertEqual(keys[4]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7800
     * @tc.name      testChannelSourceOptions0078
     * @tc.desc      Verify channelSourceOptionsCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[5].value).assertEqual(keys[5]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_7900
     * @tc.name      testChannelSourceOptions0079
     * @tc.desc      Verify channelSourceOptionsCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[6].value).assertEqual(keys[6]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_8000
     * @tc.name      testChannelSourceOptions0080
     * @tc.desc      Verify channelSourceOptionsCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 1;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[1].value).assertEqual(['MONO', 'STEREO'][1]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[1].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[7].value).assertEqual(keys[7]);
      }
    });

    /**
     * @tc.number    SUB_CAPTURER_OPT_8100
     * @tc.name      testChannelSourceOptions0081
     * @tc.desc      Verify channelSourceOptionsCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testChannelSourceOptions0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const variant: number = 0;
      if (variant === 0) {
        expect(CHANNEL_OPTIONS.length).assertEqual(2);
        expect(CHANNEL_OPTIONS[0].value).assertEqual(['MONO', 'STEREO'][0]);
        expect(CHANNEL_KEY_MAP[CHANNEL_OPTIONS[0].value as string] !== undefined).assertTrue();
      } else {
        const keys: string[] = ['MIC', 'VOICE_RECOGNITION', 'PLAYBACK_CAPTURE', 'VOICE_COMMUNICATION',
          'VOICE_MESSAGE', 'TYPE_CAMCORDER', 'UNPROCESSED', 'LIVE'];
        expect(SOURCE_TYPE_OPTIONS.length).assertEqual(8);
        expect(SOURCE_TYPE_OPTIONS[0].value).assertEqual(keys[0]);
      }
    });

  });
}
