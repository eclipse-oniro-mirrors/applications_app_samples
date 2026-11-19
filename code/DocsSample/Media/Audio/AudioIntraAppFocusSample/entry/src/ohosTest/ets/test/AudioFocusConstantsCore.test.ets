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
import { SCENARIO_LIST } from '../../../main/ets/common/constants/AudioConstants';
import { APP_ROOT_FILE_PATH } from '../../../main/ets/common/constants/CommonConstants';

const TAG: string = '[Sample_audioFocusConstantsCore]';
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

export default function audioFocusConstantsCoreTest(): void {
  describe('audioFocusConstantsCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0001
     * @tc.name      testExtFocusConst0000
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0002
     * @tc.name      testExtFocusConst0001
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0003
     * @tc.name      testExtFocusConst0002
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0004
     * @tc.name      testExtFocusConst0003
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0005
     * @tc.name      testExtFocusConst0004
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0006
     * @tc.name      testExtFocusConst0005
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0007
     * @tc.name      testExtFocusConst0006
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0008
     * @tc.name      testExtFocusConst0007
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0009
     * @tc.name      testExtFocusConst0008
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0010
     * @tc.name      testExtFocusConst0009
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0011
     * @tc.name      testExtFocusConst0010
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0012
     * @tc.name      testExtFocusConst0011
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0013
     * @tc.name      testExtFocusConst0012
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0014
     * @tc.name      testExtFocusConst0013
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0015
     * @tc.name      testExtFocusConst0014
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0016
     * @tc.name      testExtFocusConst0015
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0017
     * @tc.name      testExtFocusConst0016
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0018
     * @tc.name      testExtFocusConst0017
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0019
     * @tc.name      testExtFocusConst0018
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0020
     * @tc.name      testExtFocusConst0019
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0021
     * @tc.name      testExtFocusConst0020
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0022
     * @tc.name      testExtFocusConst0021
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0023
     * @tc.name      testExtFocusConst0022
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0024
     * @tc.name      testExtFocusConst0023
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0025
     * @tc.name      testExtFocusConst0024
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0026
     * @tc.name      testExtFocusConst0025
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0027
     * @tc.name      testExtFocusConst0026
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0028
     * @tc.name      testExtFocusConst0027
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0029
     * @tc.name      testExtFocusConst0028
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0030
     * @tc.name      testExtFocusConst0029
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0031
     * @tc.name      testExtFocusConst0030
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0032
     * @tc.name      testExtFocusConst0031
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0033
     * @tc.name      testExtFocusConst0032
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0034
     * @tc.name      testExtFocusConst0033
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0035
     * @tc.name      testExtFocusConst0034
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0036
     * @tc.name      testExtFocusConst0035
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0037
     * @tc.name      testExtFocusConst0036
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0038
     * @tc.name      testExtFocusConst0037
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0039
     * @tc.name      testExtFocusConst0038
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0040
     * @tc.name      testExtFocusConst0039
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0041
     * @tc.name      testExtFocusConst0040
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0042
     * @tc.name      testExtFocusConst0041
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0043
     * @tc.name      testExtFocusConst0042
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0044
     * @tc.name      testExtFocusConst0043
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0045
     * @tc.name      testExtFocusConst0044
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0046
     * @tc.name      testExtFocusConst0045
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0047
     * @tc.name      testExtFocusConst0046
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0048
     * @tc.name      testExtFocusConst0047
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0049
     * @tc.name      testExtFocusConst0048
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0050
     * @tc.name      testExtFocusConst0049
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0051
     * @tc.name      testExtFocusConst0050
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0052
     * @tc.name      testExtFocusConst0051
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0053
     * @tc.name      testExtFocusConst0052
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0054
     * @tc.name      testExtFocusConst0053
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0055
     * @tc.name      testExtFocusConst0054
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0056
     * @tc.name      testExtFocusConst0055
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0057
     * @tc.name      testExtFocusConst0056
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0058
     * @tc.name      testExtFocusConst0057
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0059
     * @tc.name      testExtFocusConst0058
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0060
     * @tc.name      testExtFocusConst0059
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0061
     * @tc.name      testExtFocusConst0060
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0062
     * @tc.name      testExtFocusConst0061
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0063
     * @tc.name      testExtFocusConst0062
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0064
     * @tc.name      testExtFocusConst0063
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0065
     * @tc.name      testExtFocusConst0064
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0066
     * @tc.name      testExtFocusConst0065
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0067
     * @tc.name      testExtFocusConst0066
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0068
     * @tc.name      testExtFocusConst0067
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0069
     * @tc.name      testExtFocusConst0068
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0070
     * @tc.name      testExtFocusConst0069
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0071
     * @tc.name      testExtFocusConst0070
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0072
     * @tc.name      testExtFocusConst0071
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0073
     * @tc.name      testExtFocusConst0072
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0074
     * @tc.name      testExtFocusConst0073
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0075
     * @tc.name      testExtFocusConst0074
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0076
     * @tc.name      testExtFocusConst0075
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0077
     * @tc.name      testExtFocusConst0076
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0078
     * @tc.name      testExtFocusConst0077
     * @tc.desc      Scenario musicVsGame and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[2].id).assertEqual('musicVsGame');
      expect(SCENARIO_LIST[2].page).assertEqual('pages/MusicVsGamePage');
      expect(SCENARIO_LIST[2].name.length).assertLarger(0);
      expect(SCENARIO_LIST[2].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0079
     * @tc.name      testExtFocusConst0078
     * @tc.desc      Scenario musicVsMusic and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[0].id).assertEqual('musicVsMusic');
      expect(SCENARIO_LIST[0].page).assertEqual('pages/MusicVsMusicPage');
      expect(SCENARIO_LIST[0].name.length).assertLarger(0);
      expect(SCENARIO_LIST[0].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_CONST_0080
     * @tc.name      testExtFocusConst0079
     * @tc.desc      Scenario musicVsVideo and root path.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusConst0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(SCENARIO_LIST.length).assertEqual(3);
      expect(SCENARIO_LIST[1].id).assertEqual('musicVsVideo');
      expect(SCENARIO_LIST[1].page).assertEqual('pages/MusicVsVideoPage');
      expect(SCENARIO_LIST[1].name.length).assertLarger(0);
      expect(SCENARIO_LIST[1].desc.length).assertLarger(0);
      expect(APP_ROOT_FILE_PATH.endsWith('/files')).assertTrue();
    })
  });
}
