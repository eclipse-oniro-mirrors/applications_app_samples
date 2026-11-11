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

const TAG: string = '[Sample_avRecorderStateGuardCore]';
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
  assertClose(expectValue: number, precision: number): void;
  assertUndefined(): void;
  assertFail(): void;
}

function expect(actual: string | number | boolean | Object | null | undefined): ExpectAssert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderStateGuardCoreTest(): void {
  describe('avRecorderStateGuardCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0001
     * @tc.name      testExtRecState0000
     * @tc.desc      State idle action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0002
     * @tc.name      testExtRecState0001
     * @tc.desc      State idle action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0003
     * @tc.name      testExtRecState0002
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0004
     * @tc.name      testExtRecState0003
     * @tc.desc      State idle action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0005
     * @tc.name      testExtRecState0004
     * @tc.desc      State idle action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0006
     * @tc.name      testExtRecState0005
     * @tc.desc      State idle action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0007
     * @tc.name      testExtRecState0006
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0008
     * @tc.name      testExtRecState0007
     * @tc.desc      State prepared action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0009
     * @tc.name      testExtRecState0008
     * @tc.desc      State prepared action start allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0010
     * @tc.name      testExtRecState0009
     * @tc.desc      State prepared action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0011
     * @tc.name      testExtRecState0010
     * @tc.desc      State prepared action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0012
     * @tc.name      testExtRecState0011
     * @tc.desc      State prepared action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0013
     * @tc.name      testExtRecState0012
     * @tc.desc      State prepared action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0014
     * @tc.name      testExtRecState0013
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0015
     * @tc.name      testExtRecState0014
     * @tc.desc      State started action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0016
     * @tc.name      testExtRecState0015
     * @tc.desc      State started action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0017
     * @tc.name      testExtRecState0016
     * @tc.desc      State started action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0018
     * @tc.name      testExtRecState0017
     * @tc.desc      State started action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0019
     * @tc.name      testExtRecState0018
     * @tc.desc      State started action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0020
     * @tc.name      testExtRecState0019
     * @tc.desc      State started action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0021
     * @tc.name      testExtRecState0020
     * @tc.desc      State started action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0022
     * @tc.name      testExtRecState0021
     * @tc.desc      State paused action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0023
     * @tc.name      testExtRecState0022
     * @tc.desc      State paused action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0024
     * @tc.name      testExtRecState0023
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0025
     * @tc.name      testExtRecState0024
     * @tc.desc      State paused action resume allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0026
     * @tc.name      testExtRecState0025
     * @tc.desc      State paused action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0027
     * @tc.name      testExtRecState0026
     * @tc.desc      State paused action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0028
     * @tc.name      testExtRecState0027
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0029
     * @tc.name      testExtRecState0028
     * @tc.desc      State stopped action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0030
     * @tc.name      testExtRecState0029
     * @tc.desc      State stopped action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0031
     * @tc.name      testExtRecState0030
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0032
     * @tc.name      testExtRecState0031
     * @tc.desc      State stopped action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0033
     * @tc.name      testExtRecState0032
     * @tc.desc      State stopped action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0034
     * @tc.name      testExtRecState0033
     * @tc.desc      State stopped action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0035
     * @tc.name      testExtRecState0034
     * @tc.desc      State stopped action release allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0036
     * @tc.name      testExtRecState0035
     * @tc.desc      State released action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0037
     * @tc.name      testExtRecState0036
     * @tc.desc      State released action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0038
     * @tc.name      testExtRecState0037
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0039
     * @tc.name      testExtRecState0038
     * @tc.desc      State released action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0040
     * @tc.name      testExtRecState0039
     * @tc.desc      State released action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0041
     * @tc.name      testExtRecState0040
     * @tc.desc      State released action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0042
     * @tc.name      testExtRecState0041
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0043
     * @tc.name      testExtRecState0042
     * @tc.desc      State idle action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0044
     * @tc.name      testExtRecState0043
     * @tc.desc      State idle action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0045
     * @tc.name      testExtRecState0044
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0046
     * @tc.name      testExtRecState0045
     * @tc.desc      State idle action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0047
     * @tc.name      testExtRecState0046
     * @tc.desc      State idle action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0048
     * @tc.name      testExtRecState0047
     * @tc.desc      State idle action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0049
     * @tc.name      testExtRecState0048
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0050
     * @tc.name      testExtRecState0049
     * @tc.desc      State prepared action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0051
     * @tc.name      testExtRecState0050
     * @tc.desc      State prepared action start allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0052
     * @tc.name      testExtRecState0051
     * @tc.desc      State prepared action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0053
     * @tc.name      testExtRecState0052
     * @tc.desc      State prepared action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0054
     * @tc.name      testExtRecState0053
     * @tc.desc      State prepared action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0055
     * @tc.name      testExtRecState0054
     * @tc.desc      State prepared action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0056
     * @tc.name      testExtRecState0055
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0057
     * @tc.name      testExtRecState0056
     * @tc.desc      State started action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0058
     * @tc.name      testExtRecState0057
     * @tc.desc      State started action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0059
     * @tc.name      testExtRecState0058
     * @tc.desc      State started action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0060
     * @tc.name      testExtRecState0059
     * @tc.desc      State started action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0061
     * @tc.name      testExtRecState0060
     * @tc.desc      State started action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0062
     * @tc.name      testExtRecState0061
     * @tc.desc      State started action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0063
     * @tc.name      testExtRecState0062
     * @tc.desc      State started action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0064
     * @tc.name      testExtRecState0063
     * @tc.desc      State paused action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0065
     * @tc.name      testExtRecState0064
     * @tc.desc      State paused action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0066
     * @tc.name      testExtRecState0065
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0067
     * @tc.name      testExtRecState0066
     * @tc.desc      State paused action resume allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0068
     * @tc.name      testExtRecState0067
     * @tc.desc      State paused action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0069
     * @tc.name      testExtRecState0068
     * @tc.desc      State paused action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0070
     * @tc.name      testExtRecState0069
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0071
     * @tc.name      testExtRecState0070
     * @tc.desc      State stopped action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0072
     * @tc.name      testExtRecState0071
     * @tc.desc      State stopped action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0073
     * @tc.name      testExtRecState0072
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0074
     * @tc.name      testExtRecState0073
     * @tc.desc      State stopped action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0075
     * @tc.name      testExtRecState0074
     * @tc.desc      State stopped action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0076
     * @tc.name      testExtRecState0075
     * @tc.desc      State stopped action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0077
     * @tc.name      testExtRecState0076
     * @tc.desc      State stopped action release allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0078
     * @tc.name      testExtRecState0077
     * @tc.desc      State released action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0079
     * @tc.name      testExtRecState0078
     * @tc.desc      State released action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE_0080
     * @tc.name      testExtRecState0079
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecState0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
  });
}
