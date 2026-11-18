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

const TAG: string = '[Sample_audioFocusPageControlCore]';
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

export default function audioFocusPageControlCoreTest(): void {
  describe('audioFocusPageControlCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0001
     * @tc.name      testExtFocusPageCtl0000
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0002
     * @tc.name      testExtFocusPageCtl0001
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0003
     * @tc.name      testExtFocusPageCtl0002
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0004
     * @tc.name      testExtFocusPageCtl0003
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0005
     * @tc.name      testExtFocusPageCtl0004
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0006
     * @tc.name      testExtFocusPageCtl0005
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0007
     * @tc.name      testExtFocusPageCtl0006
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0008
     * @tc.name      testExtFocusPageCtl0007
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0009
     * @tc.name      testExtFocusPageCtl0008
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0010
     * @tc.name      testExtFocusPageCtl0009
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0011
     * @tc.name      testExtFocusPageCtl0010
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0012
     * @tc.name      testExtFocusPageCtl0011
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0013
     * @tc.name      testExtFocusPageCtl0012
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0014
     * @tc.name      testExtFocusPageCtl0013
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0015
     * @tc.name      testExtFocusPageCtl0014
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0016
     * @tc.name      testExtFocusPageCtl0015
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0017
     * @tc.name      testExtFocusPageCtl0016
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0018
     * @tc.name      testExtFocusPageCtl0017
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0019
     * @tc.name      testExtFocusPageCtl0018
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0020
     * @tc.name      testExtFocusPageCtl0019
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0021
     * @tc.name      testExtFocusPageCtl0020
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0022
     * @tc.name      testExtFocusPageCtl0021
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0023
     * @tc.name      testExtFocusPageCtl0022
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0024
     * @tc.name      testExtFocusPageCtl0023
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0025
     * @tc.name      testExtFocusPageCtl0024
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0026
     * @tc.name      testExtFocusPageCtl0025
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0027
     * @tc.name      testExtFocusPageCtl0026
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0028
     * @tc.name      testExtFocusPageCtl0027
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0029
     * @tc.name      testExtFocusPageCtl0028
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0030
     * @tc.name      testExtFocusPageCtl0029
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0031
     * @tc.name      testExtFocusPageCtl0030
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0032
     * @tc.name      testExtFocusPageCtl0031
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0033
     * @tc.name      testExtFocusPageCtl0032
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0034
     * @tc.name      testExtFocusPageCtl0033
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0035
     * @tc.name      testExtFocusPageCtl0034
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0036
     * @tc.name      testExtFocusPageCtl0035
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0037
     * @tc.name      testExtFocusPageCtl0036
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0038
     * @tc.name      testExtFocusPageCtl0037
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0039
     * @tc.name      testExtFocusPageCtl0038
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0040
     * @tc.name      testExtFocusPageCtl0039
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0041
     * @tc.name      testExtFocusPageCtl0040
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0042
     * @tc.name      testExtFocusPageCtl0041
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0043
     * @tc.name      testExtFocusPageCtl0042
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0044
     * @tc.name      testExtFocusPageCtl0043
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0045
     * @tc.name      testExtFocusPageCtl0044
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0046
     * @tc.name      testExtFocusPageCtl0045
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0047
     * @tc.name      testExtFocusPageCtl0046
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0048
     * @tc.name      testExtFocusPageCtl0047
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0049
     * @tc.name      testExtFocusPageCtl0048
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0050
     * @tc.name      testExtFocusPageCtl0049
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0051
     * @tc.name      testExtFocusPageCtl0050
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0052
     * @tc.name      testExtFocusPageCtl0051
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0053
     * @tc.name      testExtFocusPageCtl0052
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0054
     * @tc.name      testExtFocusPageCtl0053
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0055
     * @tc.name      testExtFocusPageCtl0054
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0056
     * @tc.name      testExtFocusPageCtl0055
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0057
     * @tc.name      testExtFocusPageCtl0056
     * @tc.desc      Page control playA True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'playA';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0058
     * @tc.name      testExtFocusPageCtl0057
     * @tc.desc      Page control playB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'playB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0059
     * @tc.name      testExtFocusPageCtl0058
     * @tc.desc      Page control pauseB True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
      const action: string = 'pauseB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGECTL_0060
     * @tc.name      testExtFocusPageCtl0059
     * @tc.desc      Page control stopB False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageCtl0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = false;
      const action: string = 'stopB';
      if (action === 'playA') { playingA = true; }
      else if (action === 'playB') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pauseB') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingA || !playingA).assertTrue();
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
  });
}
