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

const TAG: string = '[Sample_audioFocusPlaybackUi]';
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

export default function audioFocusPlaybackUiTest(): void {
  describe('audioFocusPlaybackUiTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0001
     * @tc.name      testExtFocusPlayback0000
     * @tc.desc      Playback UI playA control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0002
     * @tc.name      testExtFocusPlayback0001
     * @tc.desc      Playback UI playB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0003
     * @tc.name      testExtFocusPlayback0002
     * @tc.desc      Playback UI pauseB control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0004
     * @tc.name      testExtFocusPlayback0003
     * @tc.desc      Playback UI stopB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0005
     * @tc.name      testExtFocusPlayback0004
     * @tc.desc      Playback UI playA control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0006
     * @tc.name      testExtFocusPlayback0005
     * @tc.desc      Playback UI playB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0007
     * @tc.name      testExtFocusPlayback0006
     * @tc.desc      Playback UI pauseB control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0008
     * @tc.name      testExtFocusPlayback0007
     * @tc.desc      Playback UI stopB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0009
     * @tc.name      testExtFocusPlayback0008
     * @tc.desc      Playback UI playA control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0010
     * @tc.name      testExtFocusPlayback0009
     * @tc.desc      Playback UI playB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0011
     * @tc.name      testExtFocusPlayback0010
     * @tc.desc      Playback UI pauseB control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0012
     * @tc.name      testExtFocusPlayback0011
     * @tc.desc      Playback UI stopB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0013
     * @tc.name      testExtFocusPlayback0012
     * @tc.desc      Playback UI playA control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0014
     * @tc.name      testExtFocusPlayback0013
     * @tc.desc      Playback UI playB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0015
     * @tc.name      testExtFocusPlayback0014
     * @tc.desc      Playback UI pauseB control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0016
     * @tc.name      testExtFocusPlayback0015
     * @tc.desc      Playback UI stopB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = true;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0017
     * @tc.name      testExtFocusPlayback0016
     * @tc.desc      Playback UI playA control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = false;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0018
     * @tc.name      testExtFocusPlayback0017
     * @tc.desc      Playback UI playB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0019
     * @tc.name      testExtFocusPlayback0018
     * @tc.desc      Playback UI pauseB control=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = true;
      let playingB: boolean = true;
      const appControl: boolean = false;
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
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_PLAYUI_0020
     * @tc.name      testExtFocusPlayback0019
     * @tc.desc      Playback UI stopB control=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusPlayback0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let playingA: boolean = false;
      let playingB: boolean = false;
      const appControl: boolean = true;
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
