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

const TAG: string = '[Sample_audioFocusInterruptGuardCore]';
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

export default function audioFocusInterruptGuardCoreTest(): void {
  describe('audioFocusInterruptGuardCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0001
     * @tc.name      testExtFocusGuard0000
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0002
     * @tc.name      testExtFocusGuard0001
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0003
     * @tc.name      testExtFocusGuard0002
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0004
     * @tc.name      testExtFocusGuard0003
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0005
     * @tc.name      testExtFocusGuard0004
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0006
     * @tc.name      testExtFocusGuard0005
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0007
     * @tc.name      testExtFocusGuard0006
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0008
     * @tc.name      testExtFocusGuard0007
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0009
     * @tc.name      testExtFocusGuard0008
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0010
     * @tc.name      testExtFocusGuard0009
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0011
     * @tc.name      testExtFocusGuard0010
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0012
     * @tc.name      testExtFocusGuard0011
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0013
     * @tc.name      testExtFocusGuard0012
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0014
     * @tc.name      testExtFocusGuard0013
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0015
     * @tc.name      testExtFocusGuard0014
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0016
     * @tc.name      testExtFocusGuard0015
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0017
     * @tc.name      testExtFocusGuard0016
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0018
     * @tc.name      testExtFocusGuard0017
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0019
     * @tc.name      testExtFocusGuard0018
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0020
     * @tc.name      testExtFocusGuard0019
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0021
     * @tc.name      testExtFocusGuard0020
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0022
     * @tc.name      testExtFocusGuard0021
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0023
     * @tc.name      testExtFocusGuard0022
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0024
     * @tc.name      testExtFocusGuard0023
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0025
     * @tc.name      testExtFocusGuard0024
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0026
     * @tc.name      testExtFocusGuard0025
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0027
     * @tc.name      testExtFocusGuard0026
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0028
     * @tc.name      testExtFocusGuard0027
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0029
     * @tc.name      testExtFocusGuard0028
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0030
     * @tc.name      testExtFocusGuard0029
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0031
     * @tc.name      testExtFocusGuard0030
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0032
     * @tc.name      testExtFocusGuard0031
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0033
     * @tc.name      testExtFocusGuard0032
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0034
     * @tc.name      testExtFocusGuard0033
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0035
     * @tc.name      testExtFocusGuard0034
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0036
     * @tc.name      testExtFocusGuard0035
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0037
     * @tc.name      testExtFocusGuard0036
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0038
     * @tc.name      testExtFocusGuard0037
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0039
     * @tc.name      testExtFocusGuard0038
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0040
     * @tc.name      testExtFocusGuard0039
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0041
     * @tc.name      testExtFocusGuard0040
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0042
     * @tc.name      testExtFocusGuard0041
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0043
     * @tc.name      testExtFocusGuard0042
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0044
     * @tc.name      testExtFocusGuard0043
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0045
     * @tc.name      testExtFocusGuard0044
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0046
     * @tc.name      testExtFocusGuard0045
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0047
     * @tc.name      testExtFocusGuard0046
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0048
     * @tc.name      testExtFocusGuard0047
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0049
     * @tc.name      testExtFocusGuard0048
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0050
     * @tc.name      testExtFocusGuard0049
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0051
     * @tc.name      testExtFocusGuard0050
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0052
     * @tc.name      testExtFocusGuard0051
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0053
     * @tc.name      testExtFocusGuard0052
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0054
     * @tc.name      testExtFocusGuard0053
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0055
     * @tc.name      testExtFocusGuard0054
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0056
     * @tc.name      testExtFocusGuard0055
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0057
     * @tc.name      testExtFocusGuard0056
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0058
     * @tc.name      testExtFocusGuard0057
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0059
     * @tc.name      testExtFocusGuard0058
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0060
     * @tc.name      testExtFocusGuard0059
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0061
     * @tc.name      testExtFocusGuard0060
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0062
     * @tc.name      testExtFocusGuard0061
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0063
     * @tc.name      testExtFocusGuard0062
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0064
     * @tc.name      testExtFocusGuard0063
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0065
     * @tc.name      testExtFocusGuard0064
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0066
     * @tc.name      testExtFocusGuard0065
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0067
     * @tc.name      testExtFocusGuard0066
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0068
     * @tc.name      testExtFocusGuard0067
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0069
     * @tc.name      testExtFocusGuard0068
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0070
     * @tc.name      testExtFocusGuard0069
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0071
     * @tc.name      testExtFocusGuard0070
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0072
     * @tc.name      testExtFocusGuard0071
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0073
     * @tc.name      testExtFocusGuard0072
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0074
     * @tc.name      testExtFocusGuard0073
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0075
     * @tc.name      testExtFocusGuard0074
     * @tc.desc      Interrupt guard force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0076
     * @tc.name      testExtFocusGuard0075
     * @tc.desc      Interrupt guard force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0077
     * @tc.name      testExtFocusGuard0076
     * @tc.desc      Interrupt guard force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0078
     * @tc.name      testExtFocusGuard0077
     * @tc.desc      Interrupt guard force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0079
     * @tc.name      testExtFocusGuard0078
     * @tc.desc      Interrupt guard force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
      expect(logCount).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_GUARD_0080
     * @tc.name      testExtFocusGuard0079
     * @tc.desc      Interrupt guard force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusGuard0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      const logCount: number = 1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(1);
    })
  });
}
