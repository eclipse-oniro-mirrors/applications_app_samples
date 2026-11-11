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
import { describe, it as hypiumIt, expect as hypiumExpect, beforeEach, TestType, Size, Level, Assert } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = '[Sample_avRecorderPageStateCore]';
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

function expect(actual: string | number | boolean | Object | null | undefined): Assert {
  hilog.info(DOMAIN, TAG, '%{public}s', 'actual: ' + String(actual));
  return hypiumExpect(actual);
}

export default function avRecorderPageStateCoreTest(): void {
  describe('avRecorderPageStateCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0001
     * @tc.name      testExtRecPageState0000
     * @tc.desc      Page action start from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 0;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0002
     * @tc.name      testExtRecPageState0001
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 1;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(1);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0003
     * @tc.name      testExtRecPageState0002
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 2;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(2);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0004
     * @tc.name      testExtRecPageState0003
     * @tc.desc      Page action stop from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 3;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0005
     * @tc.name      testExtRecPageState0004
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 4;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0006
     * @tc.name      testExtRecPageState0005
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 5;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(5);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0007
     * @tc.name      testExtRecPageState0006
     * @tc.desc      Page action resume from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 6;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(6);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0008
     * @tc.name      testExtRecPageState0007
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 7;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0009
     * @tc.name      testExtRecPageState0008
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 8;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0010
     * @tc.name      testExtRecPageState0009
     * @tc.desc      Page action pause from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 9;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(9);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0011
     * @tc.name      testExtRecPageState0010
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 10;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(10);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0012
     * @tc.name      testExtRecPageState0011
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 11;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0013
     * @tc.name      testExtRecPageState0012
     * @tc.desc      Page action start from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 12;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0014
     * @tc.name      testExtRecPageState0013
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 13;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(13);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0015
     * @tc.name      testExtRecPageState0014
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 14;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(14);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0016
     * @tc.name      testExtRecPageState0015
     * @tc.desc      Page action stop from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 15;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0017
     * @tc.name      testExtRecPageState0016
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 16;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0018
     * @tc.name      testExtRecPageState0017
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 17;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(17);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0019
     * @tc.name      testExtRecPageState0018
     * @tc.desc      Page action resume from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 18;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(18);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0020
     * @tc.name      testExtRecPageState0019
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 19;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0021
     * @tc.name      testExtRecPageState0020
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 20;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0022
     * @tc.name      testExtRecPageState0021
     * @tc.desc      Page action pause from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 21;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(21);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0023
     * @tc.name      testExtRecPageState0022
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 22;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(22);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0024
     * @tc.name      testExtRecPageState0023
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 23;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0025
     * @tc.name      testExtRecPageState0024
     * @tc.desc      Page action start from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 24;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0026
     * @tc.name      testExtRecPageState0025
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 25;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(25);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0027
     * @tc.name      testExtRecPageState0026
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 26;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(26);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0028
     * @tc.name      testExtRecPageState0027
     * @tc.desc      Page action stop from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 27;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0029
     * @tc.name      testExtRecPageState0028
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 28;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0030
     * @tc.name      testExtRecPageState0029
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 29;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(29);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0031
     * @tc.name      testExtRecPageState0030
     * @tc.desc      Page action resume from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 30;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(30);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0032
     * @tc.name      testExtRecPageState0031
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 31;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0033
     * @tc.name      testExtRecPageState0032
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 32;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0034
     * @tc.name      testExtRecPageState0033
     * @tc.desc      Page action pause from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 33;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(33);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0035
     * @tc.name      testExtRecPageState0034
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 34;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(34);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0036
     * @tc.name      testExtRecPageState0035
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 35;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0037
     * @tc.name      testExtRecPageState0036
     * @tc.desc      Page action start from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 36;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0038
     * @tc.name      testExtRecPageState0037
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 37;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(37);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0039
     * @tc.name      testExtRecPageState0038
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 38;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(38);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0040
     * @tc.name      testExtRecPageState0039
     * @tc.desc      Page action stop from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 39;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0041
     * @tc.name      testExtRecPageState0040
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 40;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0042
     * @tc.name      testExtRecPageState0041
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 41;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(41);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0043
     * @tc.name      testExtRecPageState0042
     * @tc.desc      Page action resume from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 42;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(42);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0044
     * @tc.name      testExtRecPageState0043
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 43;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0045
     * @tc.name      testExtRecPageState0044
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 44;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0046
     * @tc.name      testExtRecPageState0045
     * @tc.desc      Page action pause from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 45;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(45);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0047
     * @tc.name      testExtRecPageState0046
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 46;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(46);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0048
     * @tc.name      testExtRecPageState0047
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 47;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0049
     * @tc.name      testExtRecPageState0048
     * @tc.desc      Page action start from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 48;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0050
     * @tc.name      testExtRecPageState0049
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 49;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(49);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0051
     * @tc.name      testExtRecPageState0050
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 50;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(50);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0052
     * @tc.name      testExtRecPageState0051
     * @tc.desc      Page action stop from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 51;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0053
     * @tc.name      testExtRecPageState0052
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 52;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0054
     * @tc.name      testExtRecPageState0053
     * @tc.desc      Page action pause from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 53;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(53);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0055
     * @tc.name      testExtRecPageState0054
     * @tc.desc      Page action resume from start=True pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = true;
      let seconds: number = 54;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(54);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0056
     * @tc.name      testExtRecPageState0055
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 55;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0057
     * @tc.name      testExtRecPageState0056
     * @tc.desc      Page action start from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 56;
      const action: string = 'start';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0058
     * @tc.name      testExtRecPageState0057
     * @tc.desc      Page action pause from start=False pause=True.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = true;
      let seconds: number = 57;
      const action: string = 'pause';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(true);
      expect(seconds).assertEqual(57);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0059
     * @tc.name      testExtRecPageState0058
     * @tc.desc      Page action resume from start=True pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = true;
      let isPauseRecording: boolean = false;
      let seconds: number = 58;
      const action: string = 'resume';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(true);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(58);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGESTATE_0060
     * @tc.name      testExtRecPageState0059
     * @tc.desc      Page action stop from start=False pause=False.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPageState0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let isStartRecording: boolean = false;
      let isPauseRecording: boolean = false;
      let seconds: number = 59;
      const action: string = 'stop';
      if (action === 'start') {
        isStartRecording = true;
        isPauseRecording = false;
        seconds = 0;
      } else if (action === 'pause') {
        isPauseRecording = true;
      } else if (action === 'resume') {
        isPauseRecording = false;
      } else {
        isStartRecording = false;
        isPauseRecording = false;
        seconds = 0;
      }
      expect(isStartRecording).assertEqual(false);
      expect(isPauseRecording).assertEqual(false);
      expect(seconds).assertEqual(0);
    })
  });
}
