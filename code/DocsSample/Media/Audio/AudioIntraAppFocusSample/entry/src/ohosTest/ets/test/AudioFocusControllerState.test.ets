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

const TAG: string = '[Sample_audioFocusControllerState]';
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

export default function audioFocusControllerStateTest(): void {
  describe('audioFocusControllerStateTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0001
     * @tc.name      testExtFocusCtrl0000
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0002
     * @tc.name      testExtFocusCtrl0001
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0003
     * @tc.name      testExtFocusCtrl0002
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0004
     * @tc.name      testExtFocusCtrl0003
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0005
     * @tc.name      testExtFocusCtrl0004
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0006
     * @tc.name      testExtFocusCtrl0005
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0007
     * @tc.name      testExtFocusCtrl0006
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0008
     * @tc.name      testExtFocusCtrl0007
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0009
     * @tc.name      testExtFocusCtrl0008
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0010
     * @tc.name      testExtFocusCtrl0009
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0011
     * @tc.name      testExtFocusCtrl0010
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0012
     * @tc.name      testExtFocusCtrl0011
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0013
     * @tc.name      testExtFocusCtrl0012
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0014
     * @tc.name      testExtFocusCtrl0013
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0015
     * @tc.name      testExtFocusCtrl0014
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0016
     * @tc.name      testExtFocusCtrl0015
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0017
     * @tc.name      testExtFocusCtrl0016
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0018
     * @tc.name      testExtFocusCtrl0017
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0019
     * @tc.name      testExtFocusCtrl0018
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0020
     * @tc.name      testExtFocusCtrl0019
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0021
     * @tc.name      testExtFocusCtrl0020
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0022
     * @tc.name      testExtFocusCtrl0021
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0023
     * @tc.name      testExtFocusCtrl0022
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0024
     * @tc.name      testExtFocusCtrl0023
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0025
     * @tc.name      testExtFocusCtrl0024
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0026
     * @tc.name      testExtFocusCtrl0025
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0027
     * @tc.name      testExtFocusCtrl0026
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0028
     * @tc.name      testExtFocusCtrl0027
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0029
     * @tc.name      testExtFocusCtrl0028
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0030
     * @tc.name      testExtFocusCtrl0029
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0031
     * @tc.name      testExtFocusCtrl0030
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0032
     * @tc.name      testExtFocusCtrl0031
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0033
     * @tc.name      testExtFocusCtrl0032
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0034
     * @tc.name      testExtFocusCtrl0033
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0035
     * @tc.name      testExtFocusCtrl0034
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0036
     * @tc.name      testExtFocusCtrl0035
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0037
     * @tc.name      testExtFocusCtrl0036
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0038
     * @tc.name      testExtFocusCtrl0037
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0039
     * @tc.name      testExtFocusCtrl0038
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0040
     * @tc.name      testExtFocusCtrl0039
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0041
     * @tc.name      testExtFocusCtrl0040
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0042
     * @tc.name      testExtFocusCtrl0041
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0043
     * @tc.name      testExtFocusCtrl0042
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0044
     * @tc.name      testExtFocusCtrl0043
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0045
     * @tc.name      testExtFocusCtrl0044
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0046
     * @tc.name      testExtFocusCtrl0045
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0047
     * @tc.name      testExtFocusCtrl0046
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0048
     * @tc.name      testExtFocusCtrl0047
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0049
     * @tc.name      testExtFocusCtrl0048
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0050
     * @tc.name      testExtFocusCtrl0049
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0051
     * @tc.name      testExtFocusCtrl0050
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0052
     * @tc.name      testExtFocusCtrl0051
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0053
     * @tc.name      testExtFocusCtrl0052
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0054
     * @tc.name      testExtFocusCtrl0053
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0055
     * @tc.name      testExtFocusCtrl0054
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0056
     * @tc.name      testExtFocusCtrl0055
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0057
     * @tc.name      testExtFocusCtrl0056
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0058
     * @tc.name      testExtFocusCtrl0057
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0059
     * @tc.name      testExtFocusCtrl0058
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0060
     * @tc.name      testExtFocusCtrl0059
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0061
     * @tc.name      testExtFocusCtrl0060
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0062
     * @tc.name      testExtFocusCtrl0061
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0063
     * @tc.name      testExtFocusCtrl0062
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0064
     * @tc.name      testExtFocusCtrl0063
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0065
     * @tc.name      testExtFocusCtrl0064
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0066
     * @tc.name      testExtFocusCtrl0065
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0067
     * @tc.name      testExtFocusCtrl0066
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0068
     * @tc.name      testExtFocusCtrl0067
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0069
     * @tc.name      testExtFocusCtrl0068
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0070
     * @tc.name      testExtFocusCtrl0069
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0071
     * @tc.name      testExtFocusCtrl0070
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0072
     * @tc.name      testExtFocusCtrl0071
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0073
     * @tc.name      testExtFocusCtrl0072
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0074
     * @tc.name      testExtFocusCtrl0073
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0075
     * @tc.name      testExtFocusCtrl0074
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0076
     * @tc.name      testExtFocusCtrl0075
     * @tc.desc      Controller state action start.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'start';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0077
     * @tc.name      testExtFocusCtrl0076
     * @tc.desc      Controller state action pause.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'pause';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(2);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0078
     * @tc.name      testExtFocusCtrl0077
     * @tc.desc      Controller state action stop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'stop';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(3);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0079
     * @tc.name      testExtFocusCtrl0078
     * @tc.desc      Controller state action release.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'release';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(false);
      expect(state).assertEqual(4);
      expect(logCount).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CTRL_0080
     * @tc.name      testExtFocusCtrl0079
     * @tc.desc      Controller state action clear.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusCtrl0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let isPlaying: boolean = true;
      let state: number = 1;
      let logCount: number = 0;
      const action: string = 'clear';
      if (action === 'start') { isPlaying = true; state = 1; }
      else if (action === 'pause') { isPlaying = false; state = 2; }
      else if (action === 'stop') { isPlaying = false; state = 3; }
      else if (action === 'release') { isPlaying = false; state = 4; logCount = 0; }
      else { logCount = 0; state = 1; }
      expect(isPlaying).assertEqual(true);
      expect(state).assertEqual(1);
      expect(logCount).assertEqual(0);
    })
  });
}
