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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { dateTime } from '../../../main/ets/utils/DateTimeUtil';

const TAG: string = '[Sample_avRecorderDurationStateCore]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderDurationStateCoreTest(): void {
  describe('avRecorderDurationStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0001
     * @tc.name      testExtRecDuration0000
     * @tc.desc      Duration 0s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0002
     * @tc.name      testExtRecDuration0001
     * @tc.desc      Duration 1s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0003
     * @tc.name      testExtRecDuration0002
     * @tc.desc      Duration 30s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0004
     * @tc.name      testExtRecDuration0003
     * @tc.desc      Duration 59s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0005
     * @tc.name      testExtRecDuration0004
     * @tc.desc      Duration 60s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0006
     * @tc.name      testExtRecDuration0005
     * @tc.desc      Duration 61s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0007
     * @tc.name      testExtRecDuration0006
     * @tc.desc      Duration 3599s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0008
     * @tc.name      testExtRecDuration0007
     * @tc.desc      Duration 3600s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0009
     * @tc.name      testExtRecDuration0008
     * @tc.desc      Duration 0s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0010
     * @tc.name      testExtRecDuration0009
     * @tc.desc      Duration 1s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0011
     * @tc.name      testExtRecDuration0010
     * @tc.desc      Duration 30s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0012
     * @tc.name      testExtRecDuration0011
     * @tc.desc      Duration 59s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0013
     * @tc.name      testExtRecDuration0012
     * @tc.desc      Duration 60s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0014
     * @tc.name      testExtRecDuration0013
     * @tc.desc      Duration 61s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0015
     * @tc.name      testExtRecDuration0014
     * @tc.desc      Duration 3599s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0016
     * @tc.name      testExtRecDuration0015
     * @tc.desc      Duration 3600s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0017
     * @tc.name      testExtRecDuration0016
     * @tc.desc      Duration 0s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0018
     * @tc.name      testExtRecDuration0017
     * @tc.desc      Duration 1s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0019
     * @tc.name      testExtRecDuration0018
     * @tc.desc      Duration 30s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0020
     * @tc.name      testExtRecDuration0019
     * @tc.desc      Duration 59s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0021
     * @tc.name      testExtRecDuration0020
     * @tc.desc      Duration 60s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0022
     * @tc.name      testExtRecDuration0021
     * @tc.desc      Duration 61s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0023
     * @tc.name      testExtRecDuration0022
     * @tc.desc      Duration 3599s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0024
     * @tc.name      testExtRecDuration0023
     * @tc.desc      Duration 3600s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0025
     * @tc.name      testExtRecDuration0024
     * @tc.desc      Duration 0s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0026
     * @tc.name      testExtRecDuration0025
     * @tc.desc      Duration 1s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0027
     * @tc.name      testExtRecDuration0026
     * @tc.desc      Duration 30s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0028
     * @tc.name      testExtRecDuration0027
     * @tc.desc      Duration 59s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0029
     * @tc.name      testExtRecDuration0028
     * @tc.desc      Duration 60s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0030
     * @tc.name      testExtRecDuration0029
     * @tc.desc      Duration 61s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0031
     * @tc.name      testExtRecDuration0030
     * @tc.desc      Duration 3599s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0032
     * @tc.name      testExtRecDuration0031
     * @tc.desc      Duration 3600s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0033
     * @tc.name      testExtRecDuration0032
     * @tc.desc      Duration 0s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0034
     * @tc.name      testExtRecDuration0033
     * @tc.desc      Duration 1s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0035
     * @tc.name      testExtRecDuration0034
     * @tc.desc      Duration 30s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0036
     * @tc.name      testExtRecDuration0035
     * @tc.desc      Duration 59s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0037
     * @tc.name      testExtRecDuration0036
     * @tc.desc      Duration 60s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0038
     * @tc.name      testExtRecDuration0037
     * @tc.desc      Duration 61s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0039
     * @tc.name      testExtRecDuration0038
     * @tc.desc      Duration 3599s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0040
     * @tc.name      testExtRecDuration0039
     * @tc.desc      Duration 3600s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0041
     * @tc.name      testExtRecDuration0040
     * @tc.desc      Duration 0s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0042
     * @tc.name      testExtRecDuration0041
     * @tc.desc      Duration 1s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0043
     * @tc.name      testExtRecDuration0042
     * @tc.desc      Duration 30s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0044
     * @tc.name      testExtRecDuration0043
     * @tc.desc      Duration 59s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0045
     * @tc.name      testExtRecDuration0044
     * @tc.desc      Duration 60s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0046
     * @tc.name      testExtRecDuration0045
     * @tc.desc      Duration 61s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0047
     * @tc.name      testExtRecDuration0046
     * @tc.desc      Duration 3599s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0048
     * @tc.name      testExtRecDuration0047
     * @tc.desc      Duration 3600s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0049
     * @tc.name      testExtRecDuration0048
     * @tc.desc      Duration 0s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0050
     * @tc.name      testExtRecDuration0049
     * @tc.desc      Duration 1s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0051
     * @tc.name      testExtRecDuration0050
     * @tc.desc      Duration 30s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0052
     * @tc.name      testExtRecDuration0051
     * @tc.desc      Duration 59s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0053
     * @tc.name      testExtRecDuration0052
     * @tc.desc      Duration 60s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0054
     * @tc.name      testExtRecDuration0053
     * @tc.desc      Duration 61s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0055
     * @tc.name      testExtRecDuration0054
     * @tc.desc      Duration 3599s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0056
     * @tc.name      testExtRecDuration0055
     * @tc.desc      Duration 3600s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0057
     * @tc.name      testExtRecDuration0056
     * @tc.desc      Duration 0s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0058
     * @tc.name      testExtRecDuration0057
     * @tc.desc      Duration 1s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0059
     * @tc.name      testExtRecDuration0058
     * @tc.desc      Duration 30s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0060
     * @tc.name      testExtRecDuration0059
     * @tc.desc      Duration 59s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0061
     * @tc.name      testExtRecDuration0060
     * @tc.desc      Duration 60s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0062
     * @tc.name      testExtRecDuration0061
     * @tc.desc      Duration 61s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0063
     * @tc.name      testExtRecDuration0062
     * @tc.desc      Duration 3599s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0064
     * @tc.name      testExtRecDuration0063
     * @tc.desc      Duration 3600s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0065
     * @tc.name      testExtRecDuration0064
     * @tc.desc      Duration 0s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0066
     * @tc.name      testExtRecDuration0065
     * @tc.desc      Duration 1s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0067
     * @tc.name      testExtRecDuration0066
     * @tc.desc      Duration 30s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0068
     * @tc.name      testExtRecDuration0067
     * @tc.desc      Duration 59s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0069
     * @tc.name      testExtRecDuration0068
     * @tc.desc      Duration 60s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0070
     * @tc.name      testExtRecDuration0069
     * @tc.desc      Duration 61s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0071
     * @tc.name      testExtRecDuration0070
     * @tc.desc      Duration 3599s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0072
     * @tc.name      testExtRecDuration0071
     * @tc.desc      Duration 3600s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0073
     * @tc.name      testExtRecDuration0072
     * @tc.desc      Duration 0s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 0;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0074
     * @tc.name      testExtRecDuration0073
     * @tc.desc      Duration 1s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 1;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0075
     * @tc.name      testExtRecDuration0074
     * @tc.desc      Duration 30s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 30;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:30');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0076
     * @tc.name      testExtRecDuration0075
     * @tc.desc      Duration 59s size 0 state idle.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 59;
      const fileSize: number = 0;
      const state: string = 'idle';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:59');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0077
     * @tc.name      testExtRecDuration0076
     * @tc.desc      Duration 60s size 500 state prepared.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 60;
      const fileSize: number = 500;
      const state: string = 'prepared';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:00');
      expect(validFile).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0078
     * @tc.name      testExtRecDuration0077
     * @tc.desc      Duration 61s size 1000 state started.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 61;
      const fileSize: number = 1000;
      const state: string = 'started';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('01:01');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0079
     * @tc.name      testExtRecDuration0078
     * @tc.desc      Duration 3599s size 10000 state paused.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3599;
      const fileSize: number = 10000;
      const state: string = 'paused';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('59:59');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_DURATION_0080
     * @tc.name      testExtRecDuration0079
     * @tc.desc      Duration 3600s size 1000000 state stopped.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecDuration0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seconds: number = 3600;
      const fileSize: number = 1000000;
      const state: string = 'stopped';
      const validFile: boolean = fileSize >= 1000;
      expect(dateTime(seconds)).assertEqual('00:00');
      expect(validFile).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(seconds).assertLargerOrEqual(0);
    })
  });
}
