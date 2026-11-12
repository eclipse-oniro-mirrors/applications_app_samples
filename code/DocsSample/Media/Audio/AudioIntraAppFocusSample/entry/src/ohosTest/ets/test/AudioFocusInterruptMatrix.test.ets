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
import { InterruptForceType, InterruptHintType, AudioStreamState } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioFocusInterruptMatrix]';
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

export default function audioFocusInterruptMatrixTest(): void {
  describe('audioFocusInterruptMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0001
     * @tc.name      testExtFocusInt0000
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0002
     * @tc.name      testExtFocusInt0001
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0003
     * @tc.name      testExtFocusInt0002
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0004
     * @tc.name      testExtFocusInt0003
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0005
     * @tc.name      testExtFocusInt0004
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0006
     * @tc.name      testExtFocusInt0005
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0007
     * @tc.name      testExtFocusInt0006
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0008
     * @tc.name      testExtFocusInt0007
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0009
     * @tc.name      testExtFocusInt0008
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0010
     * @tc.name      testExtFocusInt0009
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0011
     * @tc.name      testExtFocusInt0010
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0012
     * @tc.name      testExtFocusInt0011
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0013
     * @tc.name      testExtFocusInt0012
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0014
     * @tc.name      testExtFocusInt0013
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0015
     * @tc.name      testExtFocusInt0014
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0016
     * @tc.name      testExtFocusInt0015
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0017
     * @tc.name      testExtFocusInt0016
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0018
     * @tc.name      testExtFocusInt0017
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0019
     * @tc.name      testExtFocusInt0018
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0020
     * @tc.name      testExtFocusInt0019
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0021
     * @tc.name      testExtFocusInt0020
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0022
     * @tc.name      testExtFocusInt0021
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0023
     * @tc.name      testExtFocusInt0022
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0024
     * @tc.name      testExtFocusInt0023
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0025
     * @tc.name      testExtFocusInt0024
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0026
     * @tc.name      testExtFocusInt0025
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0027
     * @tc.name      testExtFocusInt0026
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0028
     * @tc.name      testExtFocusInt0027
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0029
     * @tc.name      testExtFocusInt0028
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0030
     * @tc.name      testExtFocusInt0029
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0031
     * @tc.name      testExtFocusInt0030
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0032
     * @tc.name      testExtFocusInt0031
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0033
     * @tc.name      testExtFocusInt0032
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0034
     * @tc.name      testExtFocusInt0033
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0035
     * @tc.name      testExtFocusInt0034
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0036
     * @tc.name      testExtFocusInt0035
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0037
     * @tc.name      testExtFocusInt0036
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0038
     * @tc.name      testExtFocusInt0037
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0039
     * @tc.name      testExtFocusInt0038
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0040
     * @tc.name      testExtFocusInt0039
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0041
     * @tc.name      testExtFocusInt0040
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0042
     * @tc.name      testExtFocusInt0041
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0043
     * @tc.name      testExtFocusInt0042
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0044
     * @tc.name      testExtFocusInt0043
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0045
     * @tc.name      testExtFocusInt0044
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0046
     * @tc.name      testExtFocusInt0045
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0047
     * @tc.name      testExtFocusInt0046
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0048
     * @tc.name      testExtFocusInt0047
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0049
     * @tc.name      testExtFocusInt0048
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0050
     * @tc.name      testExtFocusInt0049
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0051
     * @tc.name      testExtFocusInt0050
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0052
     * @tc.name      testExtFocusInt0051
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0053
     * @tc.name      testExtFocusInt0052
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0054
     * @tc.name      testExtFocusInt0053
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0055
     * @tc.name      testExtFocusInt0054
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0056
     * @tc.name      testExtFocusInt0055
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0057
     * @tc.name      testExtFocusInt0056
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0058
     * @tc.name      testExtFocusInt0057
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0059
     * @tc.name      testExtFocusInt0058
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0060
     * @tc.name      testExtFocusInt0059
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0061
     * @tc.name      testExtFocusInt0060
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0062
     * @tc.name      testExtFocusInt0061
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0063
     * @tc.name      testExtFocusInt0062
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0064
     * @tc.name      testExtFocusInt0063
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0065
     * @tc.name      testExtFocusInt0064
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0066
     * @tc.name      testExtFocusInt0065
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0067
     * @tc.name      testExtFocusInt0066
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0068
     * @tc.name      testExtFocusInt0067
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0069
     * @tc.name      testExtFocusInt0068
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0070
     * @tc.name      testExtFocusInt0069
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0071
     * @tc.name      testExtFocusInt0070
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0072
     * @tc.name      testExtFocusInt0071
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0073
     * @tc.name      testExtFocusInt0072
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0074
     * @tc.name      testExtFocusInt0073
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0075
     * @tc.name      testExtFocusInt0074
     * @tc.desc      Interrupt force 0 hint 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 2;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0076
     * @tc.name      testExtFocusInt0075
     * @tc.desc      Interrupt force 1 hint 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 3;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0077
     * @tc.name      testExtFocusInt0076
     * @tc.desc      Interrupt force 0 hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 4;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0078
     * @tc.name      testExtFocusInt0077
     * @tc.desc      Interrupt force 1 hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 5;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0079
     * @tc.name      testExtFocusInt0078
     * @tc.desc      Interrupt force 0 hint 0.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 0;
      const hintType: number = 0;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(-1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_INT_0080
     * @tc.name      testExtFocusInt0079
     * @tc.desc      Interrupt force 1 hint 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusInt0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const forceType: number = 1;
      const hintType: number = 1;
      let isPlaying: boolean = true;
      let state: number = -1;
      if (forceType === 0) {
        if (hintType === 3) { isPlaying = false; state = 3; }
        else if (hintType === 2) { isPlaying = false; state = 2; }
        else if (hintType === 4 || hintType === 5) { state = 1; }
      } else if (hintType === 1) { isPlaying = true; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
    })
  });
}
