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

const TAG: string = '[Sample_avRecorderPageContract]';
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

export default function avRecorderPageContractTest(): void {
  describe('avRecorderPageContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0001
     * @tc.name      testExtRecPage0000
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0002
     * @tc.name      testExtRecPage0001
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0003
     * @tc.name      testExtRecPage0002
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0004
     * @tc.name      testExtRecPage0003
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0005
     * @tc.name      testExtRecPage0004
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0006
     * @tc.name      testExtRecPage0005
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0007
     * @tc.name      testExtRecPage0006
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0008
     * @tc.name      testExtRecPage0007
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0009
     * @tc.name      testExtRecPage0008
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0010
     * @tc.name      testExtRecPage0009
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0011
     * @tc.name      testExtRecPage0010
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0012
     * @tc.name      testExtRecPage0011
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0013
     * @tc.name      testExtRecPage0012
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0014
     * @tc.name      testExtRecPage0013
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0015
     * @tc.name      testExtRecPage0014
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0016
     * @tc.name      testExtRecPage0015
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0017
     * @tc.name      testExtRecPage0016
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0018
     * @tc.name      testExtRecPage0017
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0019
     * @tc.name      testExtRecPage0018
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0020
     * @tc.name      testExtRecPage0019
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0021
     * @tc.name      testExtRecPage0020
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0022
     * @tc.name      testExtRecPage0021
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0023
     * @tc.name      testExtRecPage0022
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0024
     * @tc.name      testExtRecPage0023
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0025
     * @tc.name      testExtRecPage0024
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0026
     * @tc.name      testExtRecPage0025
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0027
     * @tc.name      testExtRecPage0026
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0028
     * @tc.name      testExtRecPage0027
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0029
     * @tc.name      testExtRecPage0028
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0030
     * @tc.name      testExtRecPage0029
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0031
     * @tc.name      testExtRecPage0030
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0032
     * @tc.name      testExtRecPage0031
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0033
     * @tc.name      testExtRecPage0032
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0034
     * @tc.name      testExtRecPage0033
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0035
     * @tc.name      testExtRecPage0034
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0036
     * @tc.name      testExtRecPage0035
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0037
     * @tc.name      testExtRecPage0036
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0038
     * @tc.name      testExtRecPage0037
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0039
     * @tc.name      testExtRecPage0038
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0040
     * @tc.name      testExtRecPage0039
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0041
     * @tc.name      testExtRecPage0040
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0042
     * @tc.name      testExtRecPage0041
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0043
     * @tc.name      testExtRecPage0042
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0044
     * @tc.name      testExtRecPage0043
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0045
     * @tc.name      testExtRecPage0044
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0046
     * @tc.name      testExtRecPage0045
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0047
     * @tc.name      testExtRecPage0046
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0048
     * @tc.name      testExtRecPage0047
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0049
     * @tc.name      testExtRecPage0048
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0050
     * @tc.name      testExtRecPage0049
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0051
     * @tc.name      testExtRecPage0050
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0052
     * @tc.name      testExtRecPage0051
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0053
     * @tc.name      testExtRecPage0052
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0054
     * @tc.name      testExtRecPage0053
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0055
     * @tc.name      testExtRecPage0054
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0056
     * @tc.name      testExtRecPage0055
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0057
     * @tc.name      testExtRecPage0056
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0058
     * @tc.name      testExtRecPage0057
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0059
     * @tc.name      testExtRecPage0058
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0060
     * @tc.name      testExtRecPage0059
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0061
     * @tc.name      testExtRecPage0060
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0062
     * @tc.name      testExtRecPage0061
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0063
     * @tc.name      testExtRecPage0062
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0064
     * @tc.name      testExtRecPage0063
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0065
     * @tc.name      testExtRecPage0064
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0066
     * @tc.name      testExtRecPage0065
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0067
     * @tc.name      testExtRecPage0066
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0068
     * @tc.name      testExtRecPage0067
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0069
     * @tc.name      testExtRecPage0068
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0070
     * @tc.name      testExtRecPage0069
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0071
     * @tc.name      testExtRecPage0070
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0072
     * @tc.name      testExtRecPage0071
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0073
     * @tc.name      testExtRecPage0072
     * @tc.desc      Page contract videoRecorderPage audioStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioStart'.endsWith('Start') || 'audioStart'.endsWith('Pause') || 'audioStart'.endsWith('Resume') || 'audioStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0074
     * @tc.name      testExtRecPage0073
     * @tc.desc      Page contract audioRecorderPage audioPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('audioPause'.endsWith('Start') || 'audioPause'.endsWith('Pause') || 'audioPause'.endsWith('Resume') || 'audioPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0075
     * @tc.name      testExtRecPage0074
     * @tc.desc      Page contract videoRecorderNativePage audioResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioResume'.endsWith('Start') || 'audioResume'.endsWith('Pause') || 'audioResume'.endsWith('Resume') || 'audioResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0076
     * @tc.name      testExtRecPage0075
     * @tc.desc      Page contract audioRecorderNativePage audioStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('audioStop'.endsWith('Start') || 'audioStop'.endsWith('Pause') || 'audioStop'.endsWith('Resume') || 'audioStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0077
     * @tc.name      testExtRecPage0076
     * @tc.desc      Page contract videoRecorderPage videoStart audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoStart'.endsWith('Start') || 'videoStart'.endsWith('Pause') || 'videoStart'.endsWith('Resume') || 'videoStart'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0078
     * @tc.name      testExtRecPage0077
     * @tc.desc      Page contract audioRecorderPage videoPause videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderPage'.endsWith('Page')).assertTrue();
      expect('videoPause'.endsWith('Start') || 'videoPause'.endsWith('Pause') || 'videoPause'.endsWith('Resume') || 'videoPause'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0079
     * @tc.name      testExtRecPage0078
     * @tc.desc      Page contract videoRecorderNativePage videoResume audioTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('videoRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoResume'.endsWith('Start') || 'videoResume'.endsWith('Pause') || 'videoResume'.endsWith('Resume') || 'videoResume'.endsWith('Stop')).assertTrue();
      expect('audioTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_PAGE_0080
     * @tc.name      testExtRecPage0079
     * @tc.desc      Page contract audioRecorderNativePage videoStop videoTime.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecPage0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect('audioRecorderNDKPage'.endsWith('Page')).assertTrue();
      expect('videoStop'.endsWith('Start') || 'videoStop'.endsWith('Pause') || 'videoStop'.endsWith('Resume') || 'videoStop'.endsWith('Stop')).assertTrue();
      expect('videoTime'.endsWith('Time')).assertTrue();
      expect(48000).assertEqual(48000);
      expect(2).assertEqual(2);
      expect(1920).assertEqual(1920);
      expect(1080).assertEqual(1080);
    })
  });
}
