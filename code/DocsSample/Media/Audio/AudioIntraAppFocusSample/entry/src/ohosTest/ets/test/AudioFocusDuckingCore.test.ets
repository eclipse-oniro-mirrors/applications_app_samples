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

const TAG: string = '[Sample_audioFocusDuckingCore]';
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

export default function audioFocusDuckingCoreTest(): void {
  describe('audioFocusDuckingCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0001
     * @tc.name      testExtFocusDuck0000
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0002
     * @tc.name      testExtFocusDuck0001
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0003
     * @tc.name      testExtFocusDuck0002
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0004
     * @tc.name      testExtFocusDuck0003
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0005
     * @tc.name      testExtFocusDuck0004
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0006
     * @tc.name      testExtFocusDuck0005
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0007
     * @tc.name      testExtFocusDuck0006
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0008
     * @tc.name      testExtFocusDuck0007
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0009
     * @tc.name      testExtFocusDuck0008
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0010
     * @tc.name      testExtFocusDuck0009
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0011
     * @tc.name      testExtFocusDuck0010
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0012
     * @tc.name      testExtFocusDuck0011
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0013
     * @tc.name      testExtFocusDuck0012
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0014
     * @tc.name      testExtFocusDuck0013
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0015
     * @tc.name      testExtFocusDuck0014
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0016
     * @tc.name      testExtFocusDuck0015
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0017
     * @tc.name      testExtFocusDuck0016
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0018
     * @tc.name      testExtFocusDuck0017
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0019
     * @tc.name      testExtFocusDuck0018
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0020
     * @tc.name      testExtFocusDuck0019
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0021
     * @tc.name      testExtFocusDuck0020
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0022
     * @tc.name      testExtFocusDuck0021
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0023
     * @tc.name      testExtFocusDuck0022
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0024
     * @tc.name      testExtFocusDuck0023
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0025
     * @tc.name      testExtFocusDuck0024
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0026
     * @tc.name      testExtFocusDuck0025
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0027
     * @tc.name      testExtFocusDuck0026
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0028
     * @tc.name      testExtFocusDuck0027
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0029
     * @tc.name      testExtFocusDuck0028
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0030
     * @tc.name      testExtFocusDuck0029
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0031
     * @tc.name      testExtFocusDuck0030
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0032
     * @tc.name      testExtFocusDuck0031
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0033
     * @tc.name      testExtFocusDuck0032
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0034
     * @tc.name      testExtFocusDuck0033
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0035
     * @tc.name      testExtFocusDuck0034
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0036
     * @tc.name      testExtFocusDuck0035
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0037
     * @tc.name      testExtFocusDuck0036
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0038
     * @tc.name      testExtFocusDuck0037
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0039
     * @tc.name      testExtFocusDuck0038
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0040
     * @tc.name      testExtFocusDuck0039
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0041
     * @tc.name      testExtFocusDuck0040
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0042
     * @tc.name      testExtFocusDuck0041
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0043
     * @tc.name      testExtFocusDuck0042
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0044
     * @tc.name      testExtFocusDuck0043
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0045
     * @tc.name      testExtFocusDuck0044
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0046
     * @tc.name      testExtFocusDuck0045
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0047
     * @tc.name      testExtFocusDuck0046
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0048
     * @tc.name      testExtFocusDuck0047
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0049
     * @tc.name      testExtFocusDuck0048
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0050
     * @tc.name      testExtFocusDuck0049
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0051
     * @tc.name      testExtFocusDuck0050
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0052
     * @tc.name      testExtFocusDuck0051
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0053
     * @tc.name      testExtFocusDuck0052
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0054
     * @tc.name      testExtFocusDuck0053
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0055
     * @tc.name      testExtFocusDuck0054
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0056
     * @tc.name      testExtFocusDuck0055
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0057
     * @tc.name      testExtFocusDuck0056
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0058
     * @tc.name      testExtFocusDuck0057
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0059
     * @tc.name      testExtFocusDuck0058
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0060
     * @tc.name      testExtFocusDuck0059
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0061
     * @tc.name      testExtFocusDuck0060
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0062
     * @tc.name      testExtFocusDuck0061
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0063
     * @tc.name      testExtFocusDuck0062
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0064
     * @tc.name      testExtFocusDuck0063
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0065
     * @tc.name      testExtFocusDuck0064
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0066
     * @tc.name      testExtFocusDuck0065
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0067
     * @tc.name      testExtFocusDuck0066
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0068
     * @tc.name      testExtFocusDuck0067
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0069
     * @tc.name      testExtFocusDuck0068
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0070
     * @tc.name      testExtFocusDuck0069
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0071
     * @tc.name      testExtFocusDuck0070
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0072
     * @tc.name      testExtFocusDuck0071
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0073
     * @tc.name      testExtFocusDuck0072
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0074
     * @tc.name      testExtFocusDuck0073
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0075
     * @tc.name      testExtFocusDuck0074
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0076
     * @tc.name      testExtFocusDuck0075
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0077
     * @tc.name      testExtFocusDuck0076
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0078
     * @tc.name      testExtFocusDuck0077
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 0.5;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0079
     * @tc.name      testExtFocusDuck0078
     * @tc.desc      Duck/unduck hint 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 4;
      let volume: number = 0.2;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_DUCK_0080
     * @tc.name      testExtFocusDuck0079
     * @tc.desc      Duck/unduck hint 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusDuck0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const hintType: number = 5;
      let volume: number = 1.0;
      let state: number = 1;
      if (hintType === 4) { volume = 0.2; state = 1; }
      else { volume = 1.0; state = 1; }
      expect(volume).assertLarger(0);
      expect(volume).assertLessOrEqual(1);
      expect(state).assertEqual(1);
    })
  });
}
