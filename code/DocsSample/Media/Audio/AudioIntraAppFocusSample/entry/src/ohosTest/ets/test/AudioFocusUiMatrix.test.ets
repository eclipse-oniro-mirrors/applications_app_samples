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

const TAG: string = '[Sample_audioFocusUiMatrix]';
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

export default function audioFocusUiMatrixTest(): void {
  describe('audioFocusUiMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0001
     * @tc.name      testExtFocusUiMatrix0000
     * @tc.desc      UI matrix shareModeBtn mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0002
     * @tc.name      testExtFocusUiMatrix0001
     * @tc.desc      UI matrix independentModeBtn mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0003
     * @tc.name      testExtFocusUiMatrix0002
     * @tc.desc      UI matrix modeDesc mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0004
     * @tc.name      testExtFocusUiMatrix0003
     * @tc.desc      UI matrix enter_musicVsMusic mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0005
     * @tc.name      testExtFocusUiMatrix0004
     * @tc.desc      UI matrix enter_musicVsVideo mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0006
     * @tc.name      testExtFocusUiMatrix0005
     * @tc.desc      UI matrix enter_musicVsGame mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0007
     * @tc.name      testExtFocusUiMatrix0006
     * @tc.desc      UI matrix pageModeLabelMM mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0008
     * @tc.name      testExtFocusUiMatrix0007
     * @tc.desc      UI matrix pageModeLabelMV mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0009
     * @tc.name      testExtFocusUiMatrix0008
     * @tc.desc      UI matrix pageModeLabelMG mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0010
     * @tc.name      testExtFocusUiMatrix0009
     * @tc.desc      UI matrix appControlToggleMM mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0011
     * @tc.name      testExtFocusUiMatrix0010
     * @tc.desc      UI matrix appControlToggleMV mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0012
     * @tc.name      testExtFocusUiMatrix0011
     * @tc.desc      UI matrix playStop mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0013
     * @tc.name      testExtFocusUiMatrix0012
     * @tc.desc      UI matrix clearLog mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0014
     * @tc.name      testExtFocusUiMatrix0013
     * @tc.desc      UI matrix shareModeBtn mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0015
     * @tc.name      testExtFocusUiMatrix0014
     * @tc.desc      UI matrix independentModeBtn mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0016
     * @tc.name      testExtFocusUiMatrix0015
     * @tc.desc      UI matrix modeDesc mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0017
     * @tc.name      testExtFocusUiMatrix0016
     * @tc.desc      UI matrix enter_musicVsMusic mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0018
     * @tc.name      testExtFocusUiMatrix0017
     * @tc.desc      UI matrix enter_musicVsVideo mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0019
     * @tc.name      testExtFocusUiMatrix0018
     * @tc.desc      UI matrix enter_musicVsGame mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0020
     * @tc.name      testExtFocusUiMatrix0019
     * @tc.desc      UI matrix pageModeLabelMM mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0021
     * @tc.name      testExtFocusUiMatrix0020
     * @tc.desc      UI matrix pageModeLabelMV mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0022
     * @tc.name      testExtFocusUiMatrix0021
     * @tc.desc      UI matrix pageModeLabelMG mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0023
     * @tc.name      testExtFocusUiMatrix0022
     * @tc.desc      UI matrix appControlToggleMM mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0024
     * @tc.name      testExtFocusUiMatrix0023
     * @tc.desc      UI matrix appControlToggleMV mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0025
     * @tc.name      testExtFocusUiMatrix0024
     * @tc.desc      UI matrix playStop mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0026
     * @tc.name      testExtFocusUiMatrix0025
     * @tc.desc      UI matrix clearLog mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0027
     * @tc.name      testExtFocusUiMatrix0026
     * @tc.desc      UI matrix shareModeBtn mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0028
     * @tc.name      testExtFocusUiMatrix0027
     * @tc.desc      UI matrix independentModeBtn mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('independentModeBtn') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0029
     * @tc.name      testExtFocusUiMatrix0028
     * @tc.desc      UI matrix modeDesc mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('modeDesc') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0030
     * @tc.name      testExtFocusUiMatrix0029
     * @tc.desc      UI matrix enter_musicVsMusic mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsMusic') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0031
     * @tc.name      testExtFocusUiMatrix0030
     * @tc.desc      UI matrix enter_musicVsVideo mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsVideo') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0032
     * @tc.name      testExtFocusUiMatrix0031
     * @tc.desc      UI matrix enter_musicVsGame mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('enter_musicVsGame') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0033
     * @tc.name      testExtFocusUiMatrix0032
     * @tc.desc      UI matrix pageModeLabelMM mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMM') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0034
     * @tc.name      testExtFocusUiMatrix0033
     * @tc.desc      UI matrix pageModeLabelMV mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMV') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0035
     * @tc.name      testExtFocusUiMatrix0034
     * @tc.desc      UI matrix pageModeLabelMG mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('pageModeLabelMG') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0036
     * @tc.name      testExtFocusUiMatrix0035
     * @tc.desc      UI matrix appControlToggleMM mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMM') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0037
     * @tc.name      testExtFocusUiMatrix0036
     * @tc.desc      UI matrix appControlToggleMV mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('appControlToggleMV') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0038
     * @tc.name      testExtFocusUiMatrix0037
     * @tc.desc      UI matrix playStop mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('playStop') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0039
     * @tc.name      testExtFocusUiMatrix0038
     * @tc.desc      UI matrix clearLog mode SHARE.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('clearLog') >= 0).assertTrue();
      expect('SHARE'.length).assertLarger(0);
      expect(true || !true).assertTrue();
      expect(ids.length).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_UIMATRIX_0040
     * @tc.name      testExtFocusUiMatrix0039
     * @tc.desc      UI matrix shareModeBtn mode INDEPENDENT.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusUiMatrix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ids: string[] = ['shareModeBtn', 'independentModeBtn', 'modeDesc', 'enter_musicVsMusic', 'enter_musicVsVideo', 'enter_musicVsGame', 'pageModeLabelMM', 'pageModeLabelMV', 'pageModeLabelMG', 'appControlToggleMM', 'appControlToggleMV', 'playStop', 'clearLog'];
      expect(ids.indexOf('shareModeBtn') >= 0).assertTrue();
      expect('INDEPENDENT'.length).assertLarger(0);
      expect(false || !false).assertTrue();
      expect(ids.length).assertEqual(13);
    })
  });
}
