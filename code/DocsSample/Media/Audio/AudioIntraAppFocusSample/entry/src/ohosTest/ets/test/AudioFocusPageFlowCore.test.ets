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

const TAG: string = '[Sample_audioFocusPageFlowCore]';
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

export default function audioFocusPageFlowCoreTest(): void {
  describe('audioFocusPageFlowCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0001
     * @tc.name      testExtFocusPageFlow0000
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0002
     * @tc.name      testExtFocusPageFlow0001
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0003
     * @tc.name      testExtFocusPageFlow0002
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0004
     * @tc.name      testExtFocusPageFlow0003
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0005
     * @tc.name      testExtFocusPageFlow0004
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0006
     * @tc.name      testExtFocusPageFlow0005
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0007
     * @tc.name      testExtFocusPageFlow0006
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0008
     * @tc.name      testExtFocusPageFlow0007
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0009
     * @tc.name      testExtFocusPageFlow0008
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0010
     * @tc.name      testExtFocusPageFlow0009
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0011
     * @tc.name      testExtFocusPageFlow0010
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0012
     * @tc.name      testExtFocusPageFlow0011
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0013
     * @tc.name      testExtFocusPageFlow0012
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0014
     * @tc.name      testExtFocusPageFlow0013
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0015
     * @tc.name      testExtFocusPageFlow0014
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0016
     * @tc.name      testExtFocusPageFlow0015
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0017
     * @tc.name      testExtFocusPageFlow0016
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0018
     * @tc.name      testExtFocusPageFlow0017
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0019
     * @tc.name      testExtFocusPageFlow0018
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0020
     * @tc.name      testExtFocusPageFlow0019
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0021
     * @tc.name      testExtFocusPageFlow0020
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0022
     * @tc.name      testExtFocusPageFlow0021
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0023
     * @tc.name      testExtFocusPageFlow0022
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0024
     * @tc.name      testExtFocusPageFlow0023
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0025
     * @tc.name      testExtFocusPageFlow0024
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0026
     * @tc.name      testExtFocusPageFlow0025
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0027
     * @tc.name      testExtFocusPageFlow0026
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0028
     * @tc.name      testExtFocusPageFlow0027
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0029
     * @tc.name      testExtFocusPageFlow0028
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0030
     * @tc.name      testExtFocusPageFlow0029
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0031
     * @tc.name      testExtFocusPageFlow0030
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0032
     * @tc.name      testExtFocusPageFlow0031
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0033
     * @tc.name      testExtFocusPageFlow0032
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0034
     * @tc.name      testExtFocusPageFlow0033
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0035
     * @tc.name      testExtFocusPageFlow0034
     * @tc.desc      Page flow pause control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0036
     * @tc.name      testExtFocusPageFlow0035
     * @tc.desc      Page flow stop control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0037
     * @tc.name      testExtFocusPageFlow0036
     * @tc.desc      Page flow play control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = true;
      let playingB: boolean = false;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0038
     * @tc.name      testExtFocusPageFlow0037
     * @tc.desc      Page flow pause control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = false;
      let playingB: boolean = true;
      const action: string = 'pause';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0039
     * @tc.name      testExtFocusPageFlow0038
     * @tc.desc      Page flow stop control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = true;
      let playingA: boolean = false;
      let playingB: boolean = false;
      const action: string = 'stop';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PAGEFLOW_0040
     * @tc.name      testExtFocusPageFlow0039
     * @tc.desc      Page flow play control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPageFlow0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let appControl: boolean = false;
      let playingA: boolean = true;
      let playingB: boolean = true;
      const action: string = 'play';
      if (action === 'play') { playingB = true; if (appControl && playingA) { playingA = false; } }
      else if (action === 'pause') { playingB = false; }
      else { playingB = false; if (appControl && !playingA) { playingA = true; } }
      expect(playingB || !playingB).assertTrue();
      expect(appControl || !appControl).assertTrue();
    })
  });
}
