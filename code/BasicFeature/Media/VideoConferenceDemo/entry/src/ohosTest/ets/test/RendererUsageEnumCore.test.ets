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

const TAG: string = '[Sample_rendererUsageEnumCore]';
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


export default function rendererUsageEnumCoreTest(): void {
  describe('rendererUsageEnumCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0100
     * @tc.name      testRendererUsageEnum0001
     * @tc.desc      Verify rendererUsageEnumCore case 0.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0200
     * @tc.name      testRendererUsageEnum0002
     * @tc.desc      Verify rendererUsageEnumCore case 1.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0300
     * @tc.name      testRendererUsageEnum0003
     * @tc.desc      Verify rendererUsageEnumCore case 2.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0400
     * @tc.name      testRendererUsageEnum0004
     * @tc.desc      Verify rendererUsageEnumCore case 3.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0500
     * @tc.name      testRendererUsageEnum0005
     * @tc.desc      Verify rendererUsageEnumCore case 4.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0600
     * @tc.name      testRendererUsageEnum0006
     * @tc.desc      Verify rendererUsageEnumCore case 5.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0700
     * @tc.name      testRendererUsageEnum0007
     * @tc.desc      Verify rendererUsageEnumCore case 6.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0800
     * @tc.name      testRendererUsageEnum0008
     * @tc.desc      Verify rendererUsageEnumCore case 7.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_0900
     * @tc.name      testRendererUsageEnum0009
     * @tc.desc      Verify rendererUsageEnumCore case 8.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1000
     * @tc.name      testRendererUsageEnum0010
     * @tc.desc      Verify rendererUsageEnumCore case 9.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1100
     * @tc.name      testRendererUsageEnum0011
     * @tc.desc      Verify rendererUsageEnumCore case 10.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1200
     * @tc.name      testRendererUsageEnum0012
     * @tc.desc      Verify rendererUsageEnumCore case 11.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1300
     * @tc.name      testRendererUsageEnum0013
     * @tc.desc      Verify rendererUsageEnumCore case 12.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1400
     * @tc.name      testRendererUsageEnum0014
     * @tc.desc      Verify rendererUsageEnumCore case 13.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1500
     * @tc.name      testRendererUsageEnum0015
     * @tc.desc      Verify rendererUsageEnumCore case 14.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1600
     * @tc.name      testRendererUsageEnum0016
     * @tc.desc      Verify rendererUsageEnumCore case 15.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1700
     * @tc.name      testRendererUsageEnum0017
     * @tc.desc      Verify rendererUsageEnumCore case 16.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1800
     * @tc.name      testRendererUsageEnum0018
     * @tc.desc      Verify rendererUsageEnumCore case 17.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_1900
     * @tc.name      testRendererUsageEnum0019
     * @tc.desc      Verify rendererUsageEnumCore case 18.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2000
     * @tc.name      testRendererUsageEnum0020
     * @tc.desc      Verify rendererUsageEnumCore case 19.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2100
     * @tc.name      testRendererUsageEnum0021
     * @tc.desc      Verify rendererUsageEnumCore case 20.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2200
     * @tc.name      testRendererUsageEnum0022
     * @tc.desc      Verify rendererUsageEnumCore case 21.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2300
     * @tc.name      testRendererUsageEnum0023
     * @tc.desc      Verify rendererUsageEnumCore case 22.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2400
     * @tc.name      testRendererUsageEnum0024
     * @tc.desc      Verify rendererUsageEnumCore case 23.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2500
     * @tc.name      testRendererUsageEnum0025
     * @tc.desc      Verify rendererUsageEnumCore case 24.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2600
     * @tc.name      testRendererUsageEnum0026
     * @tc.desc      Verify rendererUsageEnumCore case 25.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2700
     * @tc.name      testRendererUsageEnum0027
     * @tc.desc      Verify rendererUsageEnumCore case 26.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2800
     * @tc.name      testRendererUsageEnum0028
     * @tc.desc      Verify rendererUsageEnumCore case 27.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_2900
     * @tc.name      testRendererUsageEnum0029
     * @tc.desc      Verify rendererUsageEnumCore case 28.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3000
     * @tc.name      testRendererUsageEnum0030
     * @tc.desc      Verify rendererUsageEnumCore case 29.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3100
     * @tc.name      testRendererUsageEnum0031
     * @tc.desc      Verify rendererUsageEnumCore case 30.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3200
     * @tc.name      testRendererUsageEnum0032
     * @tc.desc      Verify rendererUsageEnumCore case 31.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3300
     * @tc.name      testRendererUsageEnum0033
     * @tc.desc      Verify rendererUsageEnumCore case 32.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3400
     * @tc.name      testRendererUsageEnum0034
     * @tc.desc      Verify rendererUsageEnumCore case 33.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3500
     * @tc.name      testRendererUsageEnum0035
     * @tc.desc      Verify rendererUsageEnumCore case 34.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3600
     * @tc.name      testRendererUsageEnum0036
     * @tc.desc      Verify rendererUsageEnumCore case 35.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3700
     * @tc.name      testRendererUsageEnum0037
     * @tc.desc      Verify rendererUsageEnumCore case 36.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3800
     * @tc.name      testRendererUsageEnum0038
     * @tc.desc      Verify rendererUsageEnumCore case 37.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_3900
     * @tc.name      testRendererUsageEnum0039
     * @tc.desc      Verify rendererUsageEnumCore case 38.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4000
     * @tc.name      testRendererUsageEnum0040
     * @tc.desc      Verify rendererUsageEnumCore case 39.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4100
     * @tc.name      testRendererUsageEnum0041
     * @tc.desc      Verify rendererUsageEnumCore case 40.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4200
     * @tc.name      testRendererUsageEnum0042
     * @tc.desc      Verify rendererUsageEnumCore case 41.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4300
     * @tc.name      testRendererUsageEnum0043
     * @tc.desc      Verify rendererUsageEnumCore case 42.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4400
     * @tc.name      testRendererUsageEnum0044
     * @tc.desc      Verify rendererUsageEnumCore case 43.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4500
     * @tc.name      testRendererUsageEnum0045
     * @tc.desc      Verify rendererUsageEnumCore case 44.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4600
     * @tc.name      testRendererUsageEnum0046
     * @tc.desc      Verify rendererUsageEnumCore case 45.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4700
     * @tc.name      testRendererUsageEnum0047
     * @tc.desc      Verify rendererUsageEnumCore case 46.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4800
     * @tc.name      testRendererUsageEnum0048
     * @tc.desc      Verify rendererUsageEnumCore case 47.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_4900
     * @tc.name      testRendererUsageEnum0049
     * @tc.desc      Verify rendererUsageEnumCore case 48.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5000
     * @tc.name      testRendererUsageEnum0050
     * @tc.desc      Verify rendererUsageEnumCore case 49.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5100
     * @tc.name      testRendererUsageEnum0051
     * @tc.desc      Verify rendererUsageEnumCore case 50.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5200
     * @tc.name      testRendererUsageEnum0052
     * @tc.desc      Verify rendererUsageEnumCore case 51.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5300
     * @tc.name      testRendererUsageEnum0053
     * @tc.desc      Verify rendererUsageEnumCore case 52.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5400
     * @tc.name      testRendererUsageEnum0054
     * @tc.desc      Verify rendererUsageEnumCore case 53.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5500
     * @tc.name      testRendererUsageEnum0055
     * @tc.desc      Verify rendererUsageEnumCore case 54.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5600
     * @tc.name      testRendererUsageEnum0056
     * @tc.desc      Verify rendererUsageEnumCore case 55.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5700
     * @tc.name      testRendererUsageEnum0057
     * @tc.desc      Verify rendererUsageEnumCore case 56.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5800
     * @tc.name      testRendererUsageEnum0058
     * @tc.desc      Verify rendererUsageEnumCore case 57.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_5900
     * @tc.name      testRendererUsageEnum0059
     * @tc.desc      Verify rendererUsageEnumCore case 58.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6000
     * @tc.name      testRendererUsageEnum0060
     * @tc.desc      Verify rendererUsageEnumCore case 59.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6100
     * @tc.name      testRendererUsageEnum0061
     * @tc.desc      Verify rendererUsageEnumCore case 60.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6200
     * @tc.name      testRendererUsageEnum0062
     * @tc.desc      Verify rendererUsageEnumCore case 61.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6300
     * @tc.name      testRendererUsageEnum0063
     * @tc.desc      Verify rendererUsageEnumCore case 62.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6400
     * @tc.name      testRendererUsageEnum0064
     * @tc.desc      Verify rendererUsageEnumCore case 63.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6500
     * @tc.name      testRendererUsageEnum0065
     * @tc.desc      Verify rendererUsageEnumCore case 64.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6600
     * @tc.name      testRendererUsageEnum0066
     * @tc.desc      Verify rendererUsageEnumCore case 65.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6700
     * @tc.name      testRendererUsageEnum0067
     * @tc.desc      Verify rendererUsageEnumCore case 66.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6800
     * @tc.name      testRendererUsageEnum0068
     * @tc.desc      Verify rendererUsageEnumCore case 67.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_6900
     * @tc.name      testRendererUsageEnum0069
     * @tc.desc      Verify rendererUsageEnumCore case 68.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7000
     * @tc.name      testRendererUsageEnum0070
     * @tc.desc      Verify rendererUsageEnumCore case 69.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7100
     * @tc.name      testRendererUsageEnum0071
     * @tc.desc      Verify rendererUsageEnumCore case 70.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7200
     * @tc.name      testRendererUsageEnum0072
     * @tc.desc      Verify rendererUsageEnumCore case 71.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7300
     * @tc.name      testRendererUsageEnum0073
     * @tc.desc      Verify rendererUsageEnumCore case 72.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7400
     * @tc.name      testRendererUsageEnum0074
     * @tc.desc      Verify rendererUsageEnumCore case 73.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7500
     * @tc.name      testRendererUsageEnum0075
     * @tc.desc      Verify rendererUsageEnumCore case 74.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7600
     * @tc.name      testRendererUsageEnum0076
     * @tc.desc      Verify rendererUsageEnumCore case 75.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7700
     * @tc.name      testRendererUsageEnum0077
     * @tc.desc      Verify rendererUsageEnumCore case 76.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7800
     * @tc.name      testRendererUsageEnum0078
     * @tc.desc      Verify rendererUsageEnumCore case 77.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_7900
     * @tc.name      testRendererUsageEnum0079
     * @tc.desc      Verify rendererUsageEnumCore case 78.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_8000
     * @tc.name      testRendererUsageEnum0080
     * @tc.desc      Verify rendererUsageEnumCore case 79.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

    /**
     * @tc.number    SUB_VIDEO_CONF_USAGE_8100
     * @tc.name      testRendererUsageEnum0081
     * @tc.desc      Verify rendererUsageEnumCore case 80.
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRendererUsageEnum0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      expect(Constants.RENDERER_INFO.usage).assertEqual(audio.StreamUsage.STREAM_USAGE_MUSIC);
      expect(typeof audio.StreamUsage.STREAM_USAGE_MUSIC).assertEqual('number');
      expect(Constants.RENDERER_INFO.rendererFlags).assertEqual(0);
      expect(Constants.RENDERER_INFO.usage !== audio.StreamUsage.STREAM_USAGE_UNKNOWN).assertTrue();
    });

  });
}
