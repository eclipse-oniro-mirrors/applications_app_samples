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
import { AudioStreamState, InterruptMode, InterruptHintType, InterruptForceType } from '../../../main/ets/common/constants/AudioConstants';

const TAG: string = '[Sample_audioFocusStateContract]';
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

export default function audioFocusStateContractTest(): void {
  describe('audioFocusStateContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0001
     * @tc.name      testExtFocusState0000
     * @tc.desc      State/enums contract 1.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0002
     * @tc.name      testExtFocusState0001
     * @tc.desc      State/enums contract 2.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0003
     * @tc.name      testExtFocusState0002
     * @tc.desc      State/enums contract 3.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0004
     * @tc.name      testExtFocusState0003
     * @tc.desc      State/enums contract 4.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0005
     * @tc.name      testExtFocusState0004
     * @tc.desc      State/enums contract 5.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0006
     * @tc.name      testExtFocusState0005
     * @tc.desc      State/enums contract 6.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0007
     * @tc.name      testExtFocusState0006
     * @tc.desc      State/enums contract 7.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0008
     * @tc.name      testExtFocusState0007
     * @tc.desc      State/enums contract 8.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0009
     * @tc.name      testExtFocusState0008
     * @tc.desc      State/enums contract 9.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0010
     * @tc.name      testExtFocusState0009
     * @tc.desc      State/enums contract 10.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0011
     * @tc.name      testExtFocusState0010
     * @tc.desc      State/enums contract 11.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0012
     * @tc.name      testExtFocusState0011
     * @tc.desc      State/enums contract 12.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0013
     * @tc.name      testExtFocusState0012
     * @tc.desc      State/enums contract 13.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0014
     * @tc.name      testExtFocusState0013
     * @tc.desc      State/enums contract 14.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0015
     * @tc.name      testExtFocusState0014
     * @tc.desc      State/enums contract 15.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0016
     * @tc.name      testExtFocusState0015
     * @tc.desc      State/enums contract 16.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0017
     * @tc.name      testExtFocusState0016
     * @tc.desc      State/enums contract 17.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0018
     * @tc.name      testExtFocusState0017
     * @tc.desc      State/enums contract 18.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0019
     * @tc.name      testExtFocusState0018
     * @tc.desc      State/enums contract 19.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0020
     * @tc.name      testExtFocusState0019
     * @tc.desc      State/enums contract 20.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0021
     * @tc.name      testExtFocusState0020
     * @tc.desc      State/enums contract 21.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0022
     * @tc.name      testExtFocusState0021
     * @tc.desc      State/enums contract 22.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0023
     * @tc.name      testExtFocusState0022
     * @tc.desc      State/enums contract 23.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0024
     * @tc.name      testExtFocusState0023
     * @tc.desc      State/enums contract 24.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0025
     * @tc.name      testExtFocusState0024
     * @tc.desc      State/enums contract 25.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0026
     * @tc.name      testExtFocusState0025
     * @tc.desc      State/enums contract 26.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0027
     * @tc.name      testExtFocusState0026
     * @tc.desc      State/enums contract 27.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0028
     * @tc.name      testExtFocusState0027
     * @tc.desc      State/enums contract 28.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0029
     * @tc.name      testExtFocusState0028
     * @tc.desc      State/enums contract 29.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0030
     * @tc.name      testExtFocusState0029
     * @tc.desc      State/enums contract 30.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0031
     * @tc.name      testExtFocusState0030
     * @tc.desc      State/enums contract 31.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0032
     * @tc.name      testExtFocusState0031
     * @tc.desc      State/enums contract 32.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0033
     * @tc.name      testExtFocusState0032
     * @tc.desc      State/enums contract 33.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0034
     * @tc.name      testExtFocusState0033
     * @tc.desc      State/enums contract 34.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0035
     * @tc.name      testExtFocusState0034
     * @tc.desc      State/enums contract 35.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0036
     * @tc.name      testExtFocusState0035
     * @tc.desc      State/enums contract 36.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0037
     * @tc.name      testExtFocusState0036
     * @tc.desc      State/enums contract 37.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0038
     * @tc.name      testExtFocusState0037
     * @tc.desc      State/enums contract 38.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0039
     * @tc.name      testExtFocusState0038
     * @tc.desc      State/enums contract 39.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0040
     * @tc.name      testExtFocusState0039
     * @tc.desc      State/enums contract 40.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0041
     * @tc.name      testExtFocusState0040
     * @tc.desc      State/enums contract 41.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0042
     * @tc.name      testExtFocusState0041
     * @tc.desc      State/enums contract 42.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0043
     * @tc.name      testExtFocusState0042
     * @tc.desc      State/enums contract 43.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0044
     * @tc.name      testExtFocusState0043
     * @tc.desc      State/enums contract 44.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0045
     * @tc.name      testExtFocusState0044
     * @tc.desc      State/enums contract 45.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0046
     * @tc.name      testExtFocusState0045
     * @tc.desc      State/enums contract 46.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0047
     * @tc.name      testExtFocusState0046
     * @tc.desc      State/enums contract 47.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0048
     * @tc.name      testExtFocusState0047
     * @tc.desc      State/enums contract 48.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0049
     * @tc.name      testExtFocusState0048
     * @tc.desc      State/enums contract 49.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0050
     * @tc.name      testExtFocusState0049
     * @tc.desc      State/enums contract 50.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0051
     * @tc.name      testExtFocusState0050
     * @tc.desc      State/enums contract 51.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0052
     * @tc.name      testExtFocusState0051
     * @tc.desc      State/enums contract 52.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0053
     * @tc.name      testExtFocusState0052
     * @tc.desc      State/enums contract 53.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0054
     * @tc.name      testExtFocusState0053
     * @tc.desc      State/enums contract 54.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0055
     * @tc.name      testExtFocusState0054
     * @tc.desc      State/enums contract 55.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0056
     * @tc.name      testExtFocusState0055
     * @tc.desc      State/enums contract 56.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0057
     * @tc.name      testExtFocusState0056
     * @tc.desc      State/enums contract 57.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0058
     * @tc.name      testExtFocusState0057
     * @tc.desc      State/enums contract 58.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0059
     * @tc.name      testExtFocusState0058
     * @tc.desc      State/enums contract 59.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_INTRA_APP_FOCUS_EXT_STATE_0060
     * @tc.name      testExtFocusState0059
     * @tc.desc      State/enums contract 60.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtFocusState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      expect(InterruptMode.SHARE_MODE).assertEqual(0);
      expect(InterruptMode.INDEPENDENT_MODE).assertEqual(1);
      expect(AudioStreamState.PREPARED).assertEqual(0);
      expect(AudioStreamState.RUNNING).assertEqual(1);
      expect(AudioStreamState.PAUSED).assertEqual(2);
      expect(AudioStreamState.STOPPED).assertEqual(3);
      expect(AudioStreamState.RELEASED).assertEqual(4);
      expect(InterruptHintType.INTERRUPT_HINT_PAUSE).assertEqual(2);
      expect(InterruptForceType.INTERRUPT_FORCE).assertEqual(0);
    })
  });
}
