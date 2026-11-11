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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import recorderFileUtil from '../../../main/ets/utils/RecorderFileUtil';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG: string = '[Sample_avRecorderFileUtilIntegration]';
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

export default function avRecorderFileUtilIntegrationTest(): void {
  describe('avRecorderFileUtilIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0001
     * @tc.name      testExtRecFileIo0000
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0002
     * @tc.name      testExtRecFileIo0001
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0003
     * @tc.name      testExtRecFileIo0002
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0004
     * @tc.name      testExtRecFileIo0003
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0005
     * @tc.name      testExtRecFileIo0004
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0006
     * @tc.name      testExtRecFileIo0005
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0007
     * @tc.name      testExtRecFileIo0006
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0008
     * @tc.name      testExtRecFileIo0007
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0009
     * @tc.name      testExtRecFileIo0008
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0010
     * @tc.name      testExtRecFileIo0009
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0011
     * @tc.name      testExtRecFileIo0010
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0012
     * @tc.name      testExtRecFileIo0011
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0013
     * @tc.name      testExtRecFileIo0012
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0014
     * @tc.name      testExtRecFileIo0013
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0015
     * @tc.name      testExtRecFileIo0014
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0016
     * @tc.name      testExtRecFileIo0015
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0017
     * @tc.name      testExtRecFileIo0016
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0018
     * @tc.name      testExtRecFileIo0017
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0019
     * @tc.name      testExtRecFileIo0018
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0020
     * @tc.name      testExtRecFileIo0019
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0021
     * @tc.name      testExtRecFileIo0020
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0022
     * @tc.name      testExtRecFileIo0021
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0023
     * @tc.name      testExtRecFileIo0022
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0024
     * @tc.name      testExtRecFileIo0023
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0025
     * @tc.name      testExtRecFileIo0024
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0026
     * @tc.name      testExtRecFileIo0025
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0027
     * @tc.name      testExtRecFileIo0026
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0028
     * @tc.name      testExtRecFileIo0027
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0029
     * @tc.name      testExtRecFileIo0028
     * @tc.desc      RecorderFileUtil createAudioFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createAudioFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_FILEIO_0030
     * @tc.name      testExtRecFileIo0029
     * @tc.desc      RecorderFileUtil createVideoFile returns valid fd.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecFileIo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const fd: number = await recorderFileUtil.createVideoFile(context);
      expect(fd).assertLargerOrEqual(0);
      await fileIo.close(fd);
      expect(typeof fd).assertEqual('number');
    })
  });
}
