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

const TAG: string = '[Sample_avRecorderStateMatrix]';
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

export default function avRecorderStateMatrixTest(): void {
  describe('avRecorderStateMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0001
     * @tc.name      testExtRecMatrix0000
     * @tc.desc      State idle action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0002
     * @tc.name      testExtRecMatrix0001
     * @tc.desc      State idle action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0003
     * @tc.name      testExtRecMatrix0002
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0004
     * @tc.name      testExtRecMatrix0003
     * @tc.desc      State idle action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0005
     * @tc.name      testExtRecMatrix0004
     * @tc.desc      State idle action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0006
     * @tc.name      testExtRecMatrix0005
     * @tc.desc      State idle action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0007
     * @tc.name      testExtRecMatrix0006
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0008
     * @tc.name      testExtRecMatrix0007
     * @tc.desc      State prepared action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0009
     * @tc.name      testExtRecMatrix0008
     * @tc.desc      State prepared action start allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0010
     * @tc.name      testExtRecMatrix0009
     * @tc.desc      State prepared action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0011
     * @tc.name      testExtRecMatrix0010
     * @tc.desc      State prepared action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0012
     * @tc.name      testExtRecMatrix0011
     * @tc.desc      State prepared action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0013
     * @tc.name      testExtRecMatrix0012
     * @tc.desc      State prepared action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0014
     * @tc.name      testExtRecMatrix0013
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0015
     * @tc.name      testExtRecMatrix0014
     * @tc.desc      State started action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0016
     * @tc.name      testExtRecMatrix0015
     * @tc.desc      State started action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0017
     * @tc.name      testExtRecMatrix0016
     * @tc.desc      State started action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0018
     * @tc.name      testExtRecMatrix0017
     * @tc.desc      State started action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0019
     * @tc.name      testExtRecMatrix0018
     * @tc.desc      State started action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0020
     * @tc.name      testExtRecMatrix0019
     * @tc.desc      State started action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0021
     * @tc.name      testExtRecMatrix0020
     * @tc.desc      State started action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0022
     * @tc.name      testExtRecMatrix0021
     * @tc.desc      State paused action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0023
     * @tc.name      testExtRecMatrix0022
     * @tc.desc      State paused action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0024
     * @tc.name      testExtRecMatrix0023
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0025
     * @tc.name      testExtRecMatrix0024
     * @tc.desc      State paused action resume allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0026
     * @tc.name      testExtRecMatrix0025
     * @tc.desc      State paused action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0027
     * @tc.name      testExtRecMatrix0026
     * @tc.desc      State paused action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0028
     * @tc.name      testExtRecMatrix0027
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0029
     * @tc.name      testExtRecMatrix0028
     * @tc.desc      State stopped action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0030
     * @tc.name      testExtRecMatrix0029
     * @tc.desc      State stopped action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0031
     * @tc.name      testExtRecMatrix0030
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0032
     * @tc.name      testExtRecMatrix0031
     * @tc.desc      State stopped action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0033
     * @tc.name      testExtRecMatrix0032
     * @tc.desc      State stopped action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0034
     * @tc.name      testExtRecMatrix0033
     * @tc.desc      State stopped action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0035
     * @tc.name      testExtRecMatrix0034
     * @tc.desc      State stopped action release allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0036
     * @tc.name      testExtRecMatrix0035
     * @tc.desc      State released action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0037
     * @tc.name      testExtRecMatrix0036
     * @tc.desc      State released action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0038
     * @tc.name      testExtRecMatrix0037
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0039
     * @tc.name      testExtRecMatrix0038
     * @tc.desc      State released action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0040
     * @tc.name      testExtRecMatrix0039
     * @tc.desc      State released action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0041
     * @tc.name      testExtRecMatrix0040
     * @tc.desc      State released action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0042
     * @tc.name      testExtRecMatrix0041
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0043
     * @tc.name      testExtRecMatrix0042
     * @tc.desc      State idle action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0044
     * @tc.name      testExtRecMatrix0043
     * @tc.desc      State idle action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0045
     * @tc.name      testExtRecMatrix0044
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0046
     * @tc.name      testExtRecMatrix0045
     * @tc.desc      State idle action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0047
     * @tc.name      testExtRecMatrix0046
     * @tc.desc      State idle action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0048
     * @tc.name      testExtRecMatrix0047
     * @tc.desc      State idle action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0049
     * @tc.name      testExtRecMatrix0048
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0050
     * @tc.name      testExtRecMatrix0049
     * @tc.desc      State prepared action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0051
     * @tc.name      testExtRecMatrix0050
     * @tc.desc      State prepared action start allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0052
     * @tc.name      testExtRecMatrix0051
     * @tc.desc      State prepared action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0053
     * @tc.name      testExtRecMatrix0052
     * @tc.desc      State prepared action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0054
     * @tc.name      testExtRecMatrix0053
     * @tc.desc      State prepared action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0055
     * @tc.name      testExtRecMatrix0054
     * @tc.desc      State prepared action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0056
     * @tc.name      testExtRecMatrix0055
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0057
     * @tc.name      testExtRecMatrix0056
     * @tc.desc      State started action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0058
     * @tc.name      testExtRecMatrix0057
     * @tc.desc      State started action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0059
     * @tc.name      testExtRecMatrix0058
     * @tc.desc      State started action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0060
     * @tc.name      testExtRecMatrix0059
     * @tc.desc      State started action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0061
     * @tc.name      testExtRecMatrix0060
     * @tc.desc      State started action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0062
     * @tc.name      testExtRecMatrix0061
     * @tc.desc      State started action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0063
     * @tc.name      testExtRecMatrix0062
     * @tc.desc      State started action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0064
     * @tc.name      testExtRecMatrix0063
     * @tc.desc      State paused action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0065
     * @tc.name      testExtRecMatrix0064
     * @tc.desc      State paused action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0066
     * @tc.name      testExtRecMatrix0065
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0067
     * @tc.name      testExtRecMatrix0066
     * @tc.desc      State paused action resume allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0068
     * @tc.name      testExtRecMatrix0067
     * @tc.desc      State paused action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0069
     * @tc.name      testExtRecMatrix0068
     * @tc.desc      State paused action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0070
     * @tc.name      testExtRecMatrix0069
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0071
     * @tc.name      testExtRecMatrix0070
     * @tc.desc      State stopped action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0072
     * @tc.name      testExtRecMatrix0071
     * @tc.desc      State stopped action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0073
     * @tc.name      testExtRecMatrix0072
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0074
     * @tc.name      testExtRecMatrix0073
     * @tc.desc      State stopped action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0075
     * @tc.name      testExtRecMatrix0074
     * @tc.desc      State stopped action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0076
     * @tc.name      testExtRecMatrix0075
     * @tc.desc      State stopped action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0077
     * @tc.name      testExtRecMatrix0076
     * @tc.desc      State stopped action release allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0078
     * @tc.name      testExtRecMatrix0077
     * @tc.desc      State released action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0079
     * @tc.name      testExtRecMatrix0078
     * @tc.desc      State released action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0080
     * @tc.name      testExtRecMatrix0079
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0081
     * @tc.name      testExtRecMatrix0080
     * @tc.desc      State released action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0082
     * @tc.name      testExtRecMatrix0081
     * @tc.desc      State released action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0083
     * @tc.name      testExtRecMatrix0082
     * @tc.desc      State released action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0084
     * @tc.name      testExtRecMatrix0083
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0085
     * @tc.name      testExtRecMatrix0084
     * @tc.desc      State idle action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0086
     * @tc.name      testExtRecMatrix0085
     * @tc.desc      State idle action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0087
     * @tc.name      testExtRecMatrix0086
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0088
     * @tc.name      testExtRecMatrix0087
     * @tc.desc      State idle action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0089
     * @tc.name      testExtRecMatrix0088
     * @tc.desc      State idle action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0090
     * @tc.name      testExtRecMatrix0089
     * @tc.desc      State idle action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0091
     * @tc.name      testExtRecMatrix0090
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0092
     * @tc.name      testExtRecMatrix0091
     * @tc.desc      State prepared action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0093
     * @tc.name      testExtRecMatrix0092
     * @tc.desc      State prepared action start allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0094
     * @tc.name      testExtRecMatrix0093
     * @tc.desc      State prepared action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0095
     * @tc.name      testExtRecMatrix0094
     * @tc.desc      State prepared action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0096
     * @tc.name      testExtRecMatrix0095
     * @tc.desc      State prepared action stop allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0097
     * @tc.name      testExtRecMatrix0096
     * @tc.desc      State prepared action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0098
     * @tc.name      testExtRecMatrix0097
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0099
     * @tc.name      testExtRecMatrix0098
     * @tc.desc      State started action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0100
     * @tc.name      testExtRecMatrix0099
     * @tc.desc      State started action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0101
     * @tc.name      testExtRecMatrix0100
     * @tc.desc      State started action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0102
     * @tc.name      testExtRecMatrix0101
     * @tc.desc      State started action resume allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0103
     * @tc.name      testExtRecMatrix0102
     * @tc.desc      State started action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0104
     * @tc.name      testExtRecMatrix0103
     * @tc.desc      State started action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0105
     * @tc.name      testExtRecMatrix0104
     * @tc.desc      State started action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'started';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0106
     * @tc.name      testExtRecMatrix0105
     * @tc.desc      State paused action prepare allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0107
     * @tc.name      testExtRecMatrix0106
     * @tc.desc      State paused action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0108
     * @tc.name      testExtRecMatrix0107
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0109
     * @tc.name      testExtRecMatrix0108
     * @tc.desc      State paused action resume allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'resume';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0110
     * @tc.name      testExtRecMatrix0109
     * @tc.desc      State paused action stop allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'stop';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0111
     * @tc.name      testExtRecMatrix0110
     * @tc.desc      State paused action reset allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'reset';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0112
     * @tc.name      testExtRecMatrix0111
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0113
     * @tc.name      testExtRecMatrix0112
     * @tc.desc      State stopped action prepare allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'prepare';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0114
     * @tc.name      testExtRecMatrix0113
     * @tc.desc      State stopped action start allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'start';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_STATE2_0115
     * @tc.name      testExtRecMatrix0114
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecMatrix0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>prepare', 'idle>release', 'stopped>prepare', 'prepared>start', 'prepared>release', 'started>pause', 'started>stop', 'started>release', 'paused>resume', 'paused>stop', 'paused>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      expect(allowedActions.indexOf(state + '>' + action) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
  });
}
