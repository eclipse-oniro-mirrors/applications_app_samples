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
import { beforeEach, describe, it as hypiumIt, expect as hypiumExpect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_MediaSourcePlayerLifecycle]';
const DOMAIN: number = 0xF812;

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

export default function mediaSourcePlayerLifecycleTest(): void {
  describe('mediaSourcePlayerLifecycleTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0001
     * @tc.name      testExtLifecycle0000
     * @tc.desc      Transition idle to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0002
     * @tc.name      testExtLifecycle0001
     * @tc.desc      Transition idle to initialized is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0003
     * @tc.name      testExtLifecycle0002
     * @tc.desc      Transition idle to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0004
     * @tc.name      testExtLifecycle0003
     * @tc.desc      Transition idle to playing is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0005
     * @tc.name      testExtLifecycle0004
     * @tc.desc      Transition idle to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0006
     * @tc.name      testExtLifecycle0005
     * @tc.desc      Transition idle to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0007
     * @tc.name      testExtLifecycle0006
     * @tc.desc      Transition idle to stopped is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0008
     * @tc.name      testExtLifecycle0007
     * @tc.desc      Transition idle to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0009
     * @tc.name      testExtLifecycle0008
     * @tc.desc      Transition idle to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'idle';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0010
     * @tc.name      testExtLifecycle0009
     * @tc.desc      Transition initialized to idle is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0011
     * @tc.name      testExtLifecycle0010
     * @tc.desc      Transition initialized to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0012
     * @tc.name      testExtLifecycle0011
     * @tc.desc      Transition initialized to prepared is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0013
     * @tc.name      testExtLifecycle0012
     * @tc.desc      Transition initialized to playing is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0014
     * @tc.name      testExtLifecycle0013
     * @tc.desc      Transition initialized to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0015
     * @tc.name      testExtLifecycle0014
     * @tc.desc      Transition initialized to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0016
     * @tc.name      testExtLifecycle0015
     * @tc.desc      Transition initialized to stopped is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0017
     * @tc.name      testExtLifecycle0016
     * @tc.desc      Transition initialized to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0018
     * @tc.name      testExtLifecycle0017
     * @tc.desc      Transition initialized to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'initialized';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0019
     * @tc.name      testExtLifecycle0018
     * @tc.desc      Transition prepared to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0020
     * @tc.name      testExtLifecycle0019
     * @tc.desc      Transition prepared to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0021
     * @tc.name      testExtLifecycle0020
     * @tc.desc      Transition prepared to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0022
     * @tc.name      testExtLifecycle0021
     * @tc.desc      Transition prepared to playing is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0023
     * @tc.name      testExtLifecycle0022
     * @tc.desc      Transition prepared to paused is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0024
     * @tc.name      testExtLifecycle0023
     * @tc.desc      Transition prepared to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0025
     * @tc.name      testExtLifecycle0024
     * @tc.desc      Transition prepared to stopped is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0026
     * @tc.name      testExtLifecycle0025
     * @tc.desc      Transition prepared to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0027
     * @tc.name      testExtLifecycle0026
     * @tc.desc      Transition prepared to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'prepared';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0028
     * @tc.name      testExtLifecycle0027
     * @tc.desc      Transition playing to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0029
     * @tc.name      testExtLifecycle0028
     * @tc.desc      Transition playing to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0030
     * @tc.name      testExtLifecycle0029
     * @tc.desc      Transition playing to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0031
     * @tc.name      testExtLifecycle0030
     * @tc.desc      Transition playing to playing is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0032
     * @tc.name      testExtLifecycle0031
     * @tc.desc      Transition playing to paused is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0033
     * @tc.name      testExtLifecycle0032
     * @tc.desc      Transition playing to completed is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0034
     * @tc.name      testExtLifecycle0033
     * @tc.desc      Transition playing to stopped is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0035
     * @tc.name      testExtLifecycle0034
     * @tc.desc      Transition playing to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0036
     * @tc.name      testExtLifecycle0035
     * @tc.desc      Transition playing to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'playing';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0037
     * @tc.name      testExtLifecycle0036
     * @tc.desc      Transition paused to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0038
     * @tc.name      testExtLifecycle0037
     * @tc.desc      Transition paused to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0039
     * @tc.name      testExtLifecycle0038
     * @tc.desc      Transition paused to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0040
     * @tc.name      testExtLifecycle0039
     * @tc.desc      Transition paused to playing is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0041
     * @tc.name      testExtLifecycle0040
     * @tc.desc      Transition paused to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0042
     * @tc.name      testExtLifecycle0041
     * @tc.desc      Transition paused to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0043
     * @tc.name      testExtLifecycle0042
     * @tc.desc      Transition paused to stopped is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0044
     * @tc.name      testExtLifecycle0043
     * @tc.desc      Transition paused to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0045
     * @tc.name      testExtLifecycle0044
     * @tc.desc      Transition paused to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'paused';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0046
     * @tc.name      testExtLifecycle0045
     * @tc.desc      Transition completed to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0047
     * @tc.name      testExtLifecycle0046
     * @tc.desc      Transition completed to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0048
     * @tc.name      testExtLifecycle0047
     * @tc.desc      Transition completed to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0049
     * @tc.name      testExtLifecycle0048
     * @tc.desc      Transition completed to playing is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0050
     * @tc.name      testExtLifecycle0049
     * @tc.desc      Transition completed to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0051
     * @tc.name      testExtLifecycle0050
     * @tc.desc      Transition completed to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0052
     * @tc.name      testExtLifecycle0051
     * @tc.desc      Transition completed to stopped is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0053
     * @tc.name      testExtLifecycle0052
     * @tc.desc      Transition completed to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0054
     * @tc.name      testExtLifecycle0053
     * @tc.desc      Transition completed to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'completed';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0055
     * @tc.name      testExtLifecycle0054
     * @tc.desc      Transition stopped to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0056
     * @tc.name      testExtLifecycle0055
     * @tc.desc      Transition stopped to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0057
     * @tc.name      testExtLifecycle0056
     * @tc.desc      Transition stopped to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0058
     * @tc.name      testExtLifecycle0057
     * @tc.desc      Transition stopped to playing is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0059
     * @tc.name      testExtLifecycle0058
     * @tc.desc      Transition stopped to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0060
     * @tc.name      testExtLifecycle0059
     * @tc.desc      Transition stopped to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0061
     * @tc.name      testExtLifecycle0060
     * @tc.desc      Transition stopped to stopped is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0062
     * @tc.name      testExtLifecycle0061
     * @tc.desc      Transition stopped to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0063
     * @tc.name      testExtLifecycle0062
     * @tc.desc      Transition stopped to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'stopped';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0064
     * @tc.name      testExtLifecycle0063
     * @tc.desc      Transition released to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0065
     * @tc.name      testExtLifecycle0064
     * @tc.desc      Transition released to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0066
     * @tc.name      testExtLifecycle0065
     * @tc.desc      Transition released to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0067
     * @tc.name      testExtLifecycle0066
     * @tc.desc      Transition released to playing is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0068
     * @tc.name      testExtLifecycle0067
     * @tc.desc      Transition released to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0069
     * @tc.name      testExtLifecycle0068
     * @tc.desc      Transition released to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0070
     * @tc.name      testExtLifecycle0069
     * @tc.desc      Transition released to stopped is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0071
     * @tc.name      testExtLifecycle0070
     * @tc.desc      Transition released to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0072
     * @tc.name      testExtLifecycle0071
     * @tc.desc      Transition released to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'released';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0073
     * @tc.name      testExtLifecycle0072
     * @tc.desc      Transition error to idle is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'idle';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0074
     * @tc.name      testExtLifecycle0073
     * @tc.desc      Transition error to initialized is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'initialized';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0075
     * @tc.name      testExtLifecycle0074
     * @tc.desc      Transition error to prepared is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'prepared';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0076
     * @tc.name      testExtLifecycle0075
     * @tc.desc      Transition error to playing is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'playing';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0077
     * @tc.name      testExtLifecycle0076
     * @tc.desc      Transition error to paused is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'paused';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0078
     * @tc.name      testExtLifecycle0077
     * @tc.desc      Transition error to completed is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'completed';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0079
     * @tc.name      testExtLifecycle0078
     * @tc.desc      Transition error to stopped is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'stopped';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0080
     * @tc.name      testExtLifecycle0079
     * @tc.desc      Transition error to released is accepted.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'released';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(true);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
    /**
     * @tc.number    SUB_AVPLAYER_ARKTS_MS_EXT_LIFE_0081
     * @tc.name      testExtLifecycle0080
     * @tc.desc      Transition error to error is rejected.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtLifecycle0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const validTransitions: string[] = ['idle>initialized', 'idle>released', 'initialized>prepared', 'initialized>idle', 'initialized>released', 'prepared>playing', 'prepared>paused', 'prepared>stopped', 'prepared>released', 'playing>paused', 'playing>completed', 'playing>stopped', 'playing>released', 'paused>playing', 'paused>stopped', 'paused>released', 'completed>playing', 'completed>stopped', 'completed>released', 'stopped>playing', 'stopped>released', 'error>released', 'released>released'];
      const fromState: string = 'error';
      const toState: string = 'error';
      const key: string = fromState + '>' + toState;
      expect(validTransitions.indexOf(key) >= 0).assertEqual(false);
      expect(fromState.length).assertLarger(0);
      expect(toState.length).assertLarger(0);
      expect(validTransitions.length).assertEqual(23);
    })
  });
}
