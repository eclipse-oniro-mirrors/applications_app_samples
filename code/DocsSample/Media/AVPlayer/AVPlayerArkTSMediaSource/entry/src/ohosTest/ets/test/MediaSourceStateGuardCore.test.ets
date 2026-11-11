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

const TAG: string = '[Sample_mediaSourceStateGuardCore]';
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

export default function mediaSourceStateGuardCoreTest(): void {
  describe('mediaSourceStateGuardCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0001
     * @tc.name      testExtStateGuard0000
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0002
     * @tc.name      testExtStateGuard0001
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0003
     * @tc.name      testExtStateGuard0002
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0004
     * @tc.name      testExtStateGuard0003
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0005
     * @tc.name      testExtStateGuard0004
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0006
     * @tc.name      testExtStateGuard0005
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0007
     * @tc.name      testExtStateGuard0006
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0008
     * @tc.name      testExtStateGuard0007
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0009
     * @tc.name      testExtStateGuard0008
     * @tc.desc      State prepared action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0010
     * @tc.name      testExtStateGuard0009
     * @tc.desc      State prepared action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0011
     * @tc.name      testExtStateGuard0010
     * @tc.desc      State prepared action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0012
     * @tc.name      testExtStateGuard0011
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0013
     * @tc.name      testExtStateGuard0012
     * @tc.desc      State playing action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0014
     * @tc.name      testExtStateGuard0013
     * @tc.desc      State playing action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0015
     * @tc.name      testExtStateGuard0014
     * @tc.desc      State playing action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0016
     * @tc.name      testExtStateGuard0015
     * @tc.desc      State playing action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0017
     * @tc.name      testExtStateGuard0016
     * @tc.desc      State paused action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0018
     * @tc.name      testExtStateGuard0017
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0019
     * @tc.name      testExtStateGuard0018
     * @tc.desc      State paused action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0020
     * @tc.name      testExtStateGuard0019
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0021
     * @tc.name      testExtStateGuard0020
     * @tc.desc      State completed action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0022
     * @tc.name      testExtStateGuard0021
     * @tc.desc      State completed action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0023
     * @tc.name      testExtStateGuard0022
     * @tc.desc      State completed action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0024
     * @tc.name      testExtStateGuard0023
     * @tc.desc      State completed action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0025
     * @tc.name      testExtStateGuard0024
     * @tc.desc      State stopped action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0026
     * @tc.name      testExtStateGuard0025
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0027
     * @tc.name      testExtStateGuard0026
     * @tc.desc      State stopped action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0028
     * @tc.name      testExtStateGuard0027
     * @tc.desc      State stopped action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0029
     * @tc.name      testExtStateGuard0028
     * @tc.desc      State released action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0030
     * @tc.name      testExtStateGuard0029
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0031
     * @tc.name      testExtStateGuard0030
     * @tc.desc      State released action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0032
     * @tc.name      testExtStateGuard0031
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0033
     * @tc.name      testExtStateGuard0032
     * @tc.desc      State error action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0034
     * @tc.name      testExtStateGuard0033
     * @tc.desc      State error action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0035
     * @tc.name      testExtStateGuard0034
     * @tc.desc      State error action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0036
     * @tc.name      testExtStateGuard0035
     * @tc.desc      State error action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0037
     * @tc.name      testExtStateGuard0036
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0038
     * @tc.name      testExtStateGuard0037
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0039
     * @tc.name      testExtStateGuard0038
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0040
     * @tc.name      testExtStateGuard0039
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0041
     * @tc.name      testExtStateGuard0040
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0042
     * @tc.name      testExtStateGuard0041
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0043
     * @tc.name      testExtStateGuard0042
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0044
     * @tc.name      testExtStateGuard0043
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0045
     * @tc.name      testExtStateGuard0044
     * @tc.desc      State prepared action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0046
     * @tc.name      testExtStateGuard0045
     * @tc.desc      State prepared action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0047
     * @tc.name      testExtStateGuard0046
     * @tc.desc      State prepared action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0048
     * @tc.name      testExtStateGuard0047
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'prepared';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0049
     * @tc.name      testExtStateGuard0048
     * @tc.desc      State playing action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0050
     * @tc.name      testExtStateGuard0049
     * @tc.desc      State playing action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0051
     * @tc.name      testExtStateGuard0050
     * @tc.desc      State playing action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0052
     * @tc.name      testExtStateGuard0051
     * @tc.desc      State playing action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'playing';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0053
     * @tc.name      testExtStateGuard0052
     * @tc.desc      State paused action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0054
     * @tc.name      testExtStateGuard0053
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0055
     * @tc.name      testExtStateGuard0054
     * @tc.desc      State paused action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0056
     * @tc.name      testExtStateGuard0055
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'paused';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0057
     * @tc.name      testExtStateGuard0056
     * @tc.desc      State completed action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0058
     * @tc.name      testExtStateGuard0057
     * @tc.desc      State completed action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0059
     * @tc.name      testExtStateGuard0058
     * @tc.desc      State completed action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0060
     * @tc.name      testExtStateGuard0059
     * @tc.desc      State completed action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'completed';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0061
     * @tc.name      testExtStateGuard0060
     * @tc.desc      State stopped action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0062
     * @tc.name      testExtStateGuard0061
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0063
     * @tc.name      testExtStateGuard0062
     * @tc.desc      State stopped action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0064
     * @tc.name      testExtStateGuard0063
     * @tc.desc      State stopped action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'stopped';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0065
     * @tc.name      testExtStateGuard0064
     * @tc.desc      State released action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0066
     * @tc.name      testExtStateGuard0065
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0067
     * @tc.name      testExtStateGuard0066
     * @tc.desc      State released action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0068
     * @tc.name      testExtStateGuard0067
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'released';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0069
     * @tc.name      testExtStateGuard0068
     * @tc.desc      State error action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0070
     * @tc.name      testExtStateGuard0069
     * @tc.desc      State error action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0071
     * @tc.name      testExtStateGuard0070
     * @tc.desc      State error action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0072
     * @tc.name      testExtStateGuard0071
     * @tc.desc      State error action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'error';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0073
     * @tc.name      testExtStateGuard0072
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0074
     * @tc.name      testExtStateGuard0073
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0075
     * @tc.name      testExtStateGuard0074
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0076
     * @tc.name      testExtStateGuard0075
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'idle';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0077
     * @tc.name      testExtStateGuard0076
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'play';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0078
     * @tc.name      testExtStateGuard0077
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'pause';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0079
     * @tc.name      testExtStateGuard0078
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'seek';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_GUARD_0080
     * @tc.name      testExtStateGuard0079
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtStateGuard0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const state: string = 'initialized';
      const action: string = 'release';
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
  });
}
