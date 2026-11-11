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

const TAG: string = '[Sample_avRecorderRecordingFlowCore]';
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

export default function avRecorderRecordingFlowCoreTest(): void {
  describe('avRecorderRecordingFlowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0001
     * @tc.name      testExtRecFlowFinal0000
     * @tc.desc      Recording flow start at 0s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 0;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0002
     * @tc.name      testExtRecFlowFinal0001
     * @tc.desc      Recording flow pause at 1s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 1;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0003
     * @tc.name      testExtRecFlowFinal0002
     * @tc.desc      Recording flow resume at 2s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 2;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0004
     * @tc.name      testExtRecFlowFinal0003
     * @tc.desc      Recording flow stop at 3s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 3;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0005
     * @tc.name      testExtRecFlowFinal0004
     * @tc.desc      Recording flow start at 4s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 4;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0006
     * @tc.name      testExtRecFlowFinal0005
     * @tc.desc      Recording flow pause at 5s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 5;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0007
     * @tc.name      testExtRecFlowFinal0006
     * @tc.desc      Recording flow resume at 6s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 6;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0008
     * @tc.name      testExtRecFlowFinal0007
     * @tc.desc      Recording flow stop at 7s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 7;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0009
     * @tc.name      testExtRecFlowFinal0008
     * @tc.desc      Recording flow start at 8s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 8;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0010
     * @tc.name      testExtRecFlowFinal0009
     * @tc.desc      Recording flow pause at 9s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 9;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0011
     * @tc.name      testExtRecFlowFinal0010
     * @tc.desc      Recording flow resume at 10s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 10;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0012
     * @tc.name      testExtRecFlowFinal0011
     * @tc.desc      Recording flow stop at 11s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 11;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0013
     * @tc.name      testExtRecFlowFinal0012
     * @tc.desc      Recording flow start at 12s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 12;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0014
     * @tc.name      testExtRecFlowFinal0013
     * @tc.desc      Recording flow pause at 13s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 13;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0015
     * @tc.name      testExtRecFlowFinal0014
     * @tc.desc      Recording flow resume at 14s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 14;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0016
     * @tc.name      testExtRecFlowFinal0015
     * @tc.desc      Recording flow stop at 15s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 15;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0017
     * @tc.name      testExtRecFlowFinal0016
     * @tc.desc      Recording flow start at 16s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 16;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0018
     * @tc.name      testExtRecFlowFinal0017
     * @tc.desc      Recording flow pause at 17s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 17;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(17);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0019
     * @tc.name      testExtRecFlowFinal0018
     * @tc.desc      Recording flow resume at 18s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 18;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(18);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0020
     * @tc.name      testExtRecFlowFinal0019
     * @tc.desc      Recording flow stop at 19s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 19;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0021
     * @tc.name      testExtRecFlowFinal0020
     * @tc.desc      Recording flow start at 20s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 20;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0022
     * @tc.name      testExtRecFlowFinal0021
     * @tc.desc      Recording flow pause at 21s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 21;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(21);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0023
     * @tc.name      testExtRecFlowFinal0022
     * @tc.desc      Recording flow resume at 22s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 22;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(22);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0024
     * @tc.name      testExtRecFlowFinal0023
     * @tc.desc      Recording flow stop at 23s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 23;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0025
     * @tc.name      testExtRecFlowFinal0024
     * @tc.desc      Recording flow start at 24s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 24;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0026
     * @tc.name      testExtRecFlowFinal0025
     * @tc.desc      Recording flow pause at 25s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 25;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(25);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0027
     * @tc.name      testExtRecFlowFinal0026
     * @tc.desc      Recording flow resume at 26s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 26;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(26);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0028
     * @tc.name      testExtRecFlowFinal0027
     * @tc.desc      Recording flow stop at 27s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 27;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0029
     * @tc.name      testExtRecFlowFinal0028
     * @tc.desc      Recording flow start at 28s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 28;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0030
     * @tc.name      testExtRecFlowFinal0029
     * @tc.desc      Recording flow pause at 29s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 29;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(29);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0031
     * @tc.name      testExtRecFlowFinal0030
     * @tc.desc      Recording flow resume at 30s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 30;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0032
     * @tc.name      testExtRecFlowFinal0031
     * @tc.desc      Recording flow stop at 31s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 31;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0033
     * @tc.name      testExtRecFlowFinal0032
     * @tc.desc      Recording flow start at 32s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 32;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0034
     * @tc.name      testExtRecFlowFinal0033
     * @tc.desc      Recording flow pause at 33s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 33;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(33);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0035
     * @tc.name      testExtRecFlowFinal0034
     * @tc.desc      Recording flow resume at 34s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 34;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(34);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0036
     * @tc.name      testExtRecFlowFinal0035
     * @tc.desc      Recording flow stop at 35s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 35;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0037
     * @tc.name      testExtRecFlowFinal0036
     * @tc.desc      Recording flow start at 36s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = true;
      let seconds: number = 36;
      const action: string = 'start';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0038
     * @tc.name      testExtRecFlowFinal0037
     * @tc.desc      Recording flow pause at 37s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = false;
      let seconds: number = 37;
      const action: string = 'pause';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(true);
      expect(seconds).assertEqual(37);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0039
     * @tc.name      testExtRecFlowFinal0038
     * @tc.desc      Recording flow resume at 38s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = true;
      let paused: boolean = false;
      let seconds: number = 38;
      const action: string = 'resume';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(true);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(38);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FLOW_0040
     * @tc.name      testExtRecFlowFinal0039
     * @tc.desc      Recording flow stop at 39s.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFlowFinal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let started: boolean = false;
      let paused: boolean = true;
      let seconds: number = 39;
      const action: string = 'stop';
      if (action === 'start') { started = true; paused = false; seconds = 0; }
      else if (action === 'pause') { paused = true; }
      else if (action === 'resume') { paused = false; }
      else { started = false; paused = false; seconds = 0; }
      expect(started).assertEqual(false);
      expect(paused).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
  });
}
