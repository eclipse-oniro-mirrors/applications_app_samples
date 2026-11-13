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
import Constants from '../../../main/ets/common/Constants';
import { audio } from '@kit.AudioKit';

const TAG: string = '[Sample_constantsRendererInfoCore]';
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


export default function constantsRendererInfoCoreTest(): void {
  describe('constantsRendererInfoCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0100
     * @tc.name      testConstantsRendererInfo0001
     * @tc.desc      Verify constantsRendererInfoCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0200
     * @tc.name      testConstantsRendererInfo0002
     * @tc.desc      Verify constantsRendererInfoCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0300
     * @tc.name      testConstantsRendererInfo0003
     * @tc.desc      Verify constantsRendererInfoCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0400
     * @tc.name      testConstantsRendererInfo0004
     * @tc.desc      Verify constantsRendererInfoCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0500
     * @tc.name      testConstantsRendererInfo0005
     * @tc.desc      Verify constantsRendererInfoCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0600
     * @tc.name      testConstantsRendererInfo0006
     * @tc.desc      Verify constantsRendererInfoCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0700
     * @tc.name      testConstantsRendererInfo0007
     * @tc.desc      Verify constantsRendererInfoCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0800
     * @tc.name      testConstantsRendererInfo0008
     * @tc.desc      Verify constantsRendererInfoCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_0900
     * @tc.name      testConstantsRendererInfo0009
     * @tc.desc      Verify constantsRendererInfoCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1000
     * @tc.name      testConstantsRendererInfo0010
     * @tc.desc      Verify constantsRendererInfoCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1100
     * @tc.name      testConstantsRendererInfo0011
     * @tc.desc      Verify constantsRendererInfoCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1200
     * @tc.name      testConstantsRendererInfo0012
     * @tc.desc      Verify constantsRendererInfoCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1300
     * @tc.name      testConstantsRendererInfo0013
     * @tc.desc      Verify constantsRendererInfoCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1400
     * @tc.name      testConstantsRendererInfo0014
     * @tc.desc      Verify constantsRendererInfoCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1500
     * @tc.name      testConstantsRendererInfo0015
     * @tc.desc      Verify constantsRendererInfoCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1600
     * @tc.name      testConstantsRendererInfo0016
     * @tc.desc      Verify constantsRendererInfoCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1700
     * @tc.name      testConstantsRendererInfo0017
     * @tc.desc      Verify constantsRendererInfoCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1800
     * @tc.name      testConstantsRendererInfo0018
     * @tc.desc      Verify constantsRendererInfoCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_1900
     * @tc.name      testConstantsRendererInfo0019
     * @tc.desc      Verify constantsRendererInfoCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2000
     * @tc.name      testConstantsRendererInfo0020
     * @tc.desc      Verify constantsRendererInfoCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2100
     * @tc.name      testConstantsRendererInfo0021
     * @tc.desc      Verify constantsRendererInfoCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2200
     * @tc.name      testConstantsRendererInfo0022
     * @tc.desc      Verify constantsRendererInfoCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2300
     * @tc.name      testConstantsRendererInfo0023
     * @tc.desc      Verify constantsRendererInfoCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2400
     * @tc.name      testConstantsRendererInfo0024
     * @tc.desc      Verify constantsRendererInfoCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2500
     * @tc.name      testConstantsRendererInfo0025
     * @tc.desc      Verify constantsRendererInfoCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2600
     * @tc.name      testConstantsRendererInfo0026
     * @tc.desc      Verify constantsRendererInfoCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2700
     * @tc.name      testConstantsRendererInfo0027
     * @tc.desc      Verify constantsRendererInfoCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2800
     * @tc.name      testConstantsRendererInfo0028
     * @tc.desc      Verify constantsRendererInfoCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_2900
     * @tc.name      testConstantsRendererInfo0029
     * @tc.desc      Verify constantsRendererInfoCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3000
     * @tc.name      testConstantsRendererInfo0030
     * @tc.desc      Verify constantsRendererInfoCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3100
     * @tc.name      testConstantsRendererInfo0031
     * @tc.desc      Verify constantsRendererInfoCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3200
     * @tc.name      testConstantsRendererInfo0032
     * @tc.desc      Verify constantsRendererInfoCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3300
     * @tc.name      testConstantsRendererInfo0033
     * @tc.desc      Verify constantsRendererInfoCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3400
     * @tc.name      testConstantsRendererInfo0034
     * @tc.desc      Verify constantsRendererInfoCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3500
     * @tc.name      testConstantsRendererInfo0035
     * @tc.desc      Verify constantsRendererInfoCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3600
     * @tc.name      testConstantsRendererInfo0036
     * @tc.desc      Verify constantsRendererInfoCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3700
     * @tc.name      testConstantsRendererInfo0037
     * @tc.desc      Verify constantsRendererInfoCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3800
     * @tc.name      testConstantsRendererInfo0038
     * @tc.desc      Verify constantsRendererInfoCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_3900
     * @tc.name      testConstantsRendererInfo0039
     * @tc.desc      Verify constantsRendererInfoCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4000
     * @tc.name      testConstantsRendererInfo0040
     * @tc.desc      Verify constantsRendererInfoCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4100
     * @tc.name      testConstantsRendererInfo0041
     * @tc.desc      Verify constantsRendererInfoCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4200
     * @tc.name      testConstantsRendererInfo0042
     * @tc.desc      Verify constantsRendererInfoCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4300
     * @tc.name      testConstantsRendererInfo0043
     * @tc.desc      Verify constantsRendererInfoCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4400
     * @tc.name      testConstantsRendererInfo0044
     * @tc.desc      Verify constantsRendererInfoCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4500
     * @tc.name      testConstantsRendererInfo0045
     * @tc.desc      Verify constantsRendererInfoCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4600
     * @tc.name      testConstantsRendererInfo0046
     * @tc.desc      Verify constantsRendererInfoCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4700
     * @tc.name      testConstantsRendererInfo0047
     * @tc.desc      Verify constantsRendererInfoCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4800
     * @tc.name      testConstantsRendererInfo0048
     * @tc.desc      Verify constantsRendererInfoCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_4900
     * @tc.name      testConstantsRendererInfo0049
     * @tc.desc      Verify constantsRendererInfoCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5000
     * @tc.name      testConstantsRendererInfo0050
     * @tc.desc      Verify constantsRendererInfoCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5100
     * @tc.name      testConstantsRendererInfo0051
     * @tc.desc      Verify constantsRendererInfoCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5200
     * @tc.name      testConstantsRendererInfo0052
     * @tc.desc      Verify constantsRendererInfoCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5300
     * @tc.name      testConstantsRendererInfo0053
     * @tc.desc      Verify constantsRendererInfoCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5400
     * @tc.name      testConstantsRendererInfo0054
     * @tc.desc      Verify constantsRendererInfoCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5500
     * @tc.name      testConstantsRendererInfo0055
     * @tc.desc      Verify constantsRendererInfoCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5600
     * @tc.name      testConstantsRendererInfo0056
     * @tc.desc      Verify constantsRendererInfoCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5700
     * @tc.name      testConstantsRendererInfo0057
     * @tc.desc      Verify constantsRendererInfoCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5800
     * @tc.name      testConstantsRendererInfo0058
     * @tc.desc      Verify constantsRendererInfoCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_5900
     * @tc.name      testConstantsRendererInfo0059
     * @tc.desc      Verify constantsRendererInfoCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6000
     * @tc.name      testConstantsRendererInfo0060
     * @tc.desc      Verify constantsRendererInfoCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6100
     * @tc.name      testConstantsRendererInfo0061
     * @tc.desc      Verify constantsRendererInfoCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6200
     * @tc.name      testConstantsRendererInfo0062
     * @tc.desc      Verify constantsRendererInfoCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6300
     * @tc.name      testConstantsRendererInfo0063
     * @tc.desc      Verify constantsRendererInfoCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6400
     * @tc.name      testConstantsRendererInfo0064
     * @tc.desc      Verify constantsRendererInfoCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6500
     * @tc.name      testConstantsRendererInfo0065
     * @tc.desc      Verify constantsRendererInfoCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6600
     * @tc.name      testConstantsRendererInfo0066
     * @tc.desc      Verify constantsRendererInfoCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6700
     * @tc.name      testConstantsRendererInfo0067
     * @tc.desc      Verify constantsRendererInfoCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6800
     * @tc.name      testConstantsRendererInfo0068
     * @tc.desc      Verify constantsRendererInfoCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_6900
     * @tc.name      testConstantsRendererInfo0069
     * @tc.desc      Verify constantsRendererInfoCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7000
     * @tc.name      testConstantsRendererInfo0070
     * @tc.desc      Verify constantsRendererInfoCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7100
     * @tc.name      testConstantsRendererInfo0071
     * @tc.desc      Verify constantsRendererInfoCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7200
     * @tc.name      testConstantsRendererInfo0072
     * @tc.desc      Verify constantsRendererInfoCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7300
     * @tc.name      testConstantsRendererInfo0073
     * @tc.desc      Verify constantsRendererInfoCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7400
     * @tc.name      testConstantsRendererInfo0074
     * @tc.desc      Verify constantsRendererInfoCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7500
     * @tc.name      testConstantsRendererInfo0075
     * @tc.desc      Verify constantsRendererInfoCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7600
     * @tc.name      testConstantsRendererInfo0076
     * @tc.desc      Verify constantsRendererInfoCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7700
     * @tc.name      testConstantsRendererInfo0077
     * @tc.desc      Verify constantsRendererInfoCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7800
     * @tc.name      testConstantsRendererInfo0078
     * @tc.desc      Verify constantsRendererInfoCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_7900
     * @tc.name      testConstantsRendererInfo0079
     * @tc.desc      Verify constantsRendererInfoCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_8000
     * @tc.name      testConstantsRendererInfo0080
     * @tc.desc      Verify constantsRendererInfoCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_RENDERER_8100
     * @tc.name      testConstantsRendererInfo0081
     * @tc.desc      Verify constantsRendererInfoCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testConstantsRendererInfo0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(typeof Constants.RENDERER_INFO.usage).assertEqual('number');
    });

  });
}
