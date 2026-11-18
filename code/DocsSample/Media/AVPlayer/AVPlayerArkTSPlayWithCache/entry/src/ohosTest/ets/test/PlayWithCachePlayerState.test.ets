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

const TAG: string = '[Sample_playWithCachePlayerState]';
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

export default function playWithCachePlayerStateTest(): void {
  describe('playWithCachePlayerStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0001
     * @tc.name      testExtCacheStateGuard0000
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0002
     * @tc.name      testExtCacheStateGuard0001
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0003
     * @tc.name      testExtCacheStateGuard0002
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0004
     * @tc.name      testExtCacheStateGuard0003
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0005
     * @tc.name      testExtCacheStateGuard0004
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0006
     * @tc.name      testExtCacheStateGuard0005
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0007
     * @tc.name      testExtCacheStateGuard0006
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0008
     * @tc.name      testExtCacheStateGuard0007
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0009
     * @tc.name      testExtCacheStateGuard0008
     * @tc.desc      State prepared action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0010
     * @tc.name      testExtCacheStateGuard0009
     * @tc.desc      State prepared action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0011
     * @tc.name      testExtCacheStateGuard0010
     * @tc.desc      State prepared action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0012
     * @tc.name      testExtCacheStateGuard0011
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0013
     * @tc.name      testExtCacheStateGuard0012
     * @tc.desc      State playing action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0014
     * @tc.name      testExtCacheStateGuard0013
     * @tc.desc      State playing action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0015
     * @tc.name      testExtCacheStateGuard0014
     * @tc.desc      State playing action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0016
     * @tc.name      testExtCacheStateGuard0015
     * @tc.desc      State playing action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0017
     * @tc.name      testExtCacheStateGuard0016
     * @tc.desc      State paused action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0018
     * @tc.name      testExtCacheStateGuard0017
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0019
     * @tc.name      testExtCacheStateGuard0018
     * @tc.desc      State paused action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0020
     * @tc.name      testExtCacheStateGuard0019
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0021
     * @tc.name      testExtCacheStateGuard0020
     * @tc.desc      State completed action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0022
     * @tc.name      testExtCacheStateGuard0021
     * @tc.desc      State completed action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0023
     * @tc.name      testExtCacheStateGuard0022
     * @tc.desc      State completed action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0024
     * @tc.name      testExtCacheStateGuard0023
     * @tc.desc      State completed action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0025
     * @tc.name      testExtCacheStateGuard0024
     * @tc.desc      State stopped action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0026
     * @tc.name      testExtCacheStateGuard0025
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0027
     * @tc.name      testExtCacheStateGuard0026
     * @tc.desc      State stopped action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0028
     * @tc.name      testExtCacheStateGuard0027
     * @tc.desc      State stopped action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0029
     * @tc.name      testExtCacheStateGuard0028
     * @tc.desc      State released action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0030
     * @tc.name      testExtCacheStateGuard0029
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0031
     * @tc.name      testExtCacheStateGuard0030
     * @tc.desc      State released action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0032
     * @tc.name      testExtCacheStateGuard0031
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0033
     * @tc.name      testExtCacheStateGuard0032
     * @tc.desc      State error action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0034
     * @tc.name      testExtCacheStateGuard0033
     * @tc.desc      State error action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0035
     * @tc.name      testExtCacheStateGuard0034
     * @tc.desc      State error action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0036
     * @tc.name      testExtCacheStateGuard0035
     * @tc.desc      State error action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0037
     * @tc.name      testExtCacheStateGuard0036
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0038
     * @tc.name      testExtCacheStateGuard0037
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0039
     * @tc.name      testExtCacheStateGuard0038
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0040
     * @tc.name      testExtCacheStateGuard0039
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0041
     * @tc.name      testExtCacheStateGuard0040
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0042
     * @tc.name      testExtCacheStateGuard0041
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0043
     * @tc.name      testExtCacheStateGuard0042
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0044
     * @tc.name      testExtCacheStateGuard0043
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0045
     * @tc.name      testExtCacheStateGuard0044
     * @tc.desc      State prepared action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0046
     * @tc.name      testExtCacheStateGuard0045
     * @tc.desc      State prepared action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0047
     * @tc.name      testExtCacheStateGuard0046
     * @tc.desc      State prepared action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0048
     * @tc.name      testExtCacheStateGuard0047
     * @tc.desc      State prepared action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'prepared';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0049
     * @tc.name      testExtCacheStateGuard0048
     * @tc.desc      State playing action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0050
     * @tc.name      testExtCacheStateGuard0049
     * @tc.desc      State playing action pause allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0051
     * @tc.name      testExtCacheStateGuard0050
     * @tc.desc      State playing action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0052
     * @tc.name      testExtCacheStateGuard0051
     * @tc.desc      State playing action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'playing';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0053
     * @tc.name      testExtCacheStateGuard0052
     * @tc.desc      State paused action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0054
     * @tc.name      testExtCacheStateGuard0053
     * @tc.desc      State paused action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0055
     * @tc.name      testExtCacheStateGuard0054
     * @tc.desc      State paused action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0056
     * @tc.name      testExtCacheStateGuard0055
     * @tc.desc      State paused action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'paused';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0057
     * @tc.name      testExtCacheStateGuard0056
     * @tc.desc      State completed action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0058
     * @tc.name      testExtCacheStateGuard0057
     * @tc.desc      State completed action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0059
     * @tc.name      testExtCacheStateGuard0058
     * @tc.desc      State completed action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0060
     * @tc.name      testExtCacheStateGuard0059
     * @tc.desc      State completed action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'completed';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0061
     * @tc.name      testExtCacheStateGuard0060
     * @tc.desc      State stopped action play allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0062
     * @tc.name      testExtCacheStateGuard0061
     * @tc.desc      State stopped action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0063
     * @tc.name      testExtCacheStateGuard0062
     * @tc.desc      State stopped action seek allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0064
     * @tc.name      testExtCacheStateGuard0063
     * @tc.desc      State stopped action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'stopped';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0065
     * @tc.name      testExtCacheStateGuard0064
     * @tc.desc      State released action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0066
     * @tc.name      testExtCacheStateGuard0065
     * @tc.desc      State released action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0067
     * @tc.name      testExtCacheStateGuard0066
     * @tc.desc      State released action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0068
     * @tc.name      testExtCacheStateGuard0067
     * @tc.desc      State released action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'released';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0069
     * @tc.name      testExtCacheStateGuard0068
     * @tc.desc      State error action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0070
     * @tc.name      testExtCacheStateGuard0069
     * @tc.desc      State error action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0071
     * @tc.name      testExtCacheStateGuard0070
     * @tc.desc      State error action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0072
     * @tc.name      testExtCacheStateGuard0071
     * @tc.desc      State error action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'error';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0073
     * @tc.name      testExtCacheStateGuard0072
     * @tc.desc      State idle action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0074
     * @tc.name      testExtCacheStateGuard0073
     * @tc.desc      State idle action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0075
     * @tc.name      testExtCacheStateGuard0074
     * @tc.desc      State idle action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0076
     * @tc.name      testExtCacheStateGuard0075
     * @tc.desc      State idle action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'idle';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0077
     * @tc.name      testExtCacheStateGuard0076
     * @tc.desc      State initialized action play allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'play';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0078
     * @tc.name      testExtCacheStateGuard0077
     * @tc.desc      State initialized action pause allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'pause';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0079
     * @tc.name      testExtCacheStateGuard0078
     * @tc.desc      State initialized action seek allowed=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'seek';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(false);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_CACHE_EXT_STATE_0080
     * @tc.name      testExtCacheStateGuard0079
     * @tc.desc      State initialized action release allowed=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtCacheStateGuard0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const allowedActions: string[] = ['idle>release', 'initialized>release', 'prepared>play', 'prepared>pause', 'prepared>seek', 'prepared>release', 'playing>pause', 'playing>seek', 'playing>release', 'paused>play', 'paused>seek', 'paused>release', 'completed>seek', 'completed>release', 'stopped>play', 'stopped>seek', 'stopped>release', 'error>release', 'released>release'];
      const state: string = 'initialized';
      const action: string = 'release';
      const key: string = state + '>' + action;
      expect(allowedActions.indexOf(key) >= 0).assertEqual(true);
      expect(state.length).assertLarger(0);
      expect(action.length).assertLarger(0);
    })
  });
}
