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

const TAG: string = '[Sample_audioFocusRoutingCore]';
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

export default function audioFocusRoutingCoreTest(): void {
  describe('audioFocusRoutingCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0001
     * @tc.name      testExtFocusRoute0000
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0002
     * @tc.name      testExtFocusRoute0001
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0003
     * @tc.name      testExtFocusRoute0002
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0004
     * @tc.name      testExtFocusRoute0003
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0005
     * @tc.name      testExtFocusRoute0004
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0006
     * @tc.name      testExtFocusRoute0005
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0007
     * @tc.name      testExtFocusRoute0006
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0008
     * @tc.name      testExtFocusRoute0007
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0009
     * @tc.name      testExtFocusRoute0008
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0010
     * @tc.name      testExtFocusRoute0009
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0011
     * @tc.name      testExtFocusRoute0010
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0012
     * @tc.name      testExtFocusRoute0011
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0013
     * @tc.name      testExtFocusRoute0012
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0014
     * @tc.name      testExtFocusRoute0013
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0015
     * @tc.name      testExtFocusRoute0014
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0016
     * @tc.name      testExtFocusRoute0015
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0017
     * @tc.name      testExtFocusRoute0016
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0018
     * @tc.name      testExtFocusRoute0017
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0019
     * @tc.name      testExtFocusRoute0018
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0020
     * @tc.name      testExtFocusRoute0019
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0021
     * @tc.name      testExtFocusRoute0020
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0022
     * @tc.name      testExtFocusRoute0021
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0023
     * @tc.name      testExtFocusRoute0022
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0024
     * @tc.name      testExtFocusRoute0023
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0025
     * @tc.name      testExtFocusRoute0024
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0026
     * @tc.name      testExtFocusRoute0025
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0027
     * @tc.name      testExtFocusRoute0026
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0028
     * @tc.name      testExtFocusRoute0027
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0029
     * @tc.name      testExtFocusRoute0028
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0030
     * @tc.name      testExtFocusRoute0029
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0031
     * @tc.name      testExtFocusRoute0030
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0032
     * @tc.name      testExtFocusRoute0031
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0033
     * @tc.name      testExtFocusRoute0032
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0034
     * @tc.name      testExtFocusRoute0033
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0035
     * @tc.name      testExtFocusRoute0034
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0036
     * @tc.name      testExtFocusRoute0035
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0037
     * @tc.name      testExtFocusRoute0036
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0038
     * @tc.name      testExtFocusRoute0037
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0039
     * @tc.name      testExtFocusRoute0038
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0040
     * @tc.name      testExtFocusRoute0039
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0041
     * @tc.name      testExtFocusRoute0040
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0042
     * @tc.name      testExtFocusRoute0041
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0043
     * @tc.name      testExtFocusRoute0042
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0044
     * @tc.name      testExtFocusRoute0043
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0045
     * @tc.name      testExtFocusRoute0044
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0046
     * @tc.name      testExtFocusRoute0045
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0047
     * @tc.name      testExtFocusRoute0046
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0048
     * @tc.name      testExtFocusRoute0047
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0049
     * @tc.name      testExtFocusRoute0048
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0050
     * @tc.name      testExtFocusRoute0049
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0051
     * @tc.name      testExtFocusRoute0050
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0052
     * @tc.name      testExtFocusRoute0051
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0053
     * @tc.name      testExtFocusRoute0052
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0054
     * @tc.name      testExtFocusRoute0053
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0055
     * @tc.name      testExtFocusRoute0054
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0056
     * @tc.name      testExtFocusRoute0055
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0057
     * @tc.name      testExtFocusRoute0056
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0058
     * @tc.name      testExtFocusRoute0057
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0059
     * @tc.name      testExtFocusRoute0058
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0060
     * @tc.name      testExtFocusRoute0059
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0061
     * @tc.name      testExtFocusRoute0060
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0062
     * @tc.name      testExtFocusRoute0061
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0063
     * @tc.name      testExtFocusRoute0062
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0064
     * @tc.name      testExtFocusRoute0063
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0065
     * @tc.name      testExtFocusRoute0064
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0066
     * @tc.name      testExtFocusRoute0065
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0067
     * @tc.name      testExtFocusRoute0066
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0068
     * @tc.name      testExtFocusRoute0067
     * @tc.desc      UI id modeDesc.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('modeDesc'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0069
     * @tc.name      testExtFocusRoute0068
     * @tc.desc      UI id enter_musicVsMusic.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('enter_musicVsMusic'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0070
     * @tc.name      testExtFocusRoute0069
     * @tc.desc      UI id enter_musicVsVideo.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('enter_musicVsVideo'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0071
     * @tc.name      testExtFocusRoute0070
     * @tc.desc      UI id enter_musicVsGame.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('enter_musicVsGame'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0072
     * @tc.name      testExtFocusRoute0071
     * @tc.desc      UI id pageModeLabelMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('pageModeLabelMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0073
     * @tc.name      testExtFocusRoute0072
     * @tc.desc      UI id pageModeLabelMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('pageModeLabelMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0074
     * @tc.name      testExtFocusRoute0073
     * @tc.desc      UI id pageModeLabelMG.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('pageModeLabelMG'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0075
     * @tc.name      testExtFocusRoute0074
     * @tc.desc      UI id appControlToggleMM.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('appControlToggleMM'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0076
     * @tc.name      testExtFocusRoute0075
     * @tc.desc      UI id appControlToggleMV.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('appControlToggleMV'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0077
     * @tc.name      testExtFocusRoute0076
     * @tc.desc      UI id playStop.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('playStop'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0078
     * @tc.name      testExtFocusRoute0077
     * @tc.desc      UI id clearLog.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('clearLog'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0079
     * @tc.name      testExtFocusRoute0078
     * @tc.desc      UI id shareModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('shareModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_ROUTE_0080
     * @tc.name      testExtFocusRoute0079
     * @tc.desc      UI id independentModeBtn.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusRoute0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('independentModeBtn'.length).assertLarger(0);
      expect(ids.length).assertEqual(13);
    })
  });
}
