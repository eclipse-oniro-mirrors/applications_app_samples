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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import AVRecorderService from '../../../main/ets/services/AVRecorderService';
import { Resolution } from '../../../main/ets/services/CommonTypes';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

const TAG: string = '[Sample_avRecorderServiceIntegration]';
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

export default function avRecorderServiceIntegrationTest(): void {
  describe('avRecorderServiceIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout(() => resolve(), 10);
      });
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0001
     * @tc.name      testExtRecSvcInt0000
     * @tc.desc      Service create/release 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0002
     * @tc.name      testExtRecSvcInt0001
     * @tc.desc      Service create/release 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0003
     * @tc.name      testExtRecSvcInt0002
     * @tc.desc      Service create/release 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0004
     * @tc.name      testExtRecSvcInt0003
     * @tc.desc      Service create/release 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0005
     * @tc.name      testExtRecSvcInt0004
     * @tc.desc      Service create/release 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0006
     * @tc.name      testExtRecSvcInt0005
     * @tc.desc      Service create/release 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0007
     * @tc.name      testExtRecSvcInt0006
     * @tc.desc      Service create/release 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0008
     * @tc.name      testExtRecSvcInt0007
     * @tc.desc      Service create/release 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0009
     * @tc.name      testExtRecSvcInt0008
     * @tc.desc      Service create/release 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0010
     * @tc.name      testExtRecSvcInt0009
     * @tc.desc      Service create/release 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0011
     * @tc.name      testExtRecSvcInt0010
     * @tc.desc      Service create/release 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0012
     * @tc.name      testExtRecSvcInt0011
     * @tc.desc      Service create/release 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0013
     * @tc.name      testExtRecSvcInt0012
     * @tc.desc      Service create/release 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0014
     * @tc.name      testExtRecSvcInt0013
     * @tc.desc      Service create/release 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0015
     * @tc.name      testExtRecSvcInt0014
     * @tc.desc      Service create/release 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0016
     * @tc.name      testExtRecSvcInt0015
     * @tc.desc      Service create/release 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0017
     * @tc.name      testExtRecSvcInt0016
     * @tc.desc      Service create/release 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0018
     * @tc.name      testExtRecSvcInt0017
     * @tc.desc      Service create/release 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0019
     * @tc.name      testExtRecSvcInt0018
     * @tc.desc      Service create/release 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0020
     * @tc.name      testExtRecSvcInt0019
     * @tc.desc      Service create/release 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0021
     * @tc.name      testExtRecSvcInt0020
     * @tc.desc      Service create/release 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0022
     * @tc.name      testExtRecSvcInt0021
     * @tc.desc      Service create/release 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0023
     * @tc.name      testExtRecSvcInt0022
     * @tc.desc      Service create/release 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0024
     * @tc.name      testExtRecSvcInt0023
     * @tc.desc      Service create/release 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0025
     * @tc.name      testExtRecSvcInt0024
     * @tc.desc      Service create/release 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0026
     * @tc.name      testExtRecSvcInt0025
     * @tc.desc      Service create/release 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0027
     * @tc.name      testExtRecSvcInt0026
     * @tc.desc      Service create/release 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0028
     * @tc.name      testExtRecSvcInt0027
     * @tc.desc      Service create/release 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0029
     * @tc.name      testExtRecSvcInt0028
     * @tc.desc      Service create/release 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0030
     * @tc.name      testExtRecSvcInt0029
     * @tc.desc      Service create/release 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0031
     * @tc.name      testExtRecSvcInt0030
     * @tc.desc      Service create/release 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0032
     * @tc.name      testExtRecSvcInt0031
     * @tc.desc      Service create/release 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0033
     * @tc.name      testExtRecSvcInt0032
     * @tc.desc      Service create/release 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0034
     * @tc.name      testExtRecSvcInt0033
     * @tc.desc      Service create/release 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0035
     * @tc.name      testExtRecSvcInt0034
     * @tc.desc      Service create/release 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0036
     * @tc.name      testExtRecSvcInt0035
     * @tc.desc      Service create/release 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0037
     * @tc.name      testExtRecSvcInt0036
     * @tc.desc      Service create/release 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0038
     * @tc.name      testExtRecSvcInt0037
     * @tc.desc      Service create/release 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0039
     * @tc.name      testExtRecSvcInt0038
     * @tc.desc      Service create/release 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0040
     * @tc.name      testExtRecSvcInt0039
     * @tc.desc      Service create/release 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0041
     * @tc.name      testExtRecSvcInt0040
     * @tc.desc      Service create/release 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0042
     * @tc.name      testExtRecSvcInt0041
     * @tc.desc      Service create/release 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0043
     * @tc.name      testExtRecSvcInt0042
     * @tc.desc      Service create/release 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0044
     * @tc.name      testExtRecSvcInt0043
     * @tc.desc      Service create/release 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0045
     * @tc.name      testExtRecSvcInt0044
     * @tc.desc      Service create/release 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0046
     * @tc.name      testExtRecSvcInt0045
     * @tc.desc      Service create/release 8000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0047
     * @tc.name      testExtRecSvcInt0046
     * @tc.desc      Service create/release 22050Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0048
     * @tc.name      testExtRecSvcInt0047
     * @tc.desc      Service create/release 44100Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0049
     * @tc.name      testExtRecSvcInt0048
     * @tc.desc      Service create/release 48000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0050
     * @tc.name      testExtRecSvcInt0049
     * @tc.desc      Service create/release 96000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0051
     * @tc.name      testExtRecSvcInt0050
     * @tc.desc      Service create/release 8000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0052
     * @tc.name      testExtRecSvcInt0051
     * @tc.desc      Service create/release 22050Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0053
     * @tc.name      testExtRecSvcInt0052
     * @tc.desc      Service create/release 44100Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0054
     * @tc.name      testExtRecSvcInt0053
     * @tc.desc      Service create/release 48000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0055
     * @tc.name      testExtRecSvcInt0054
     * @tc.desc      Service create/release 96000Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0056
     * @tc.name      testExtRecSvcInt0055
     * @tc.desc      Service create/release 8000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(8000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0057
     * @tc.name      testExtRecSvcInt0056
     * @tc.desc      Service create/release 22050Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(22050);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0058
     * @tc.name      testExtRecSvcInt0057
     * @tc.desc      Service create/release 44100Hz 640x480.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(44100);
      service.configVideoResolution({ frameWidth: 640, frameHeight: 480 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0059
     * @tc.name      testExtRecSvcInt0058
     * @tc.desc      Service create/release 48000Hz 1280x720.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(48000);
      service.configVideoResolution({ frameWidth: 1280, frameHeight: 720 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
    /**
     * @tc.number    SUB_AUDIO_VIDEO_RECORDER_EXT_SVCINT_0060
     * @tc.name      testExtRecSvcInt0059
     * @tc.desc      Service create/release 96000Hz 1920x1080.
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testExtRecSvcInt0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const context: common.Context = delegator.getAppContext();
      const service: AVRecorderService = new AVRecorderService();
      service.configAudioSampleRate(96000);
      service.configVideoResolution({ frameWidth: 1920, frameHeight: 1080 } as Resolution);
      await service.createRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      expect(context.filesDir.length).assertLarger(0);
      expect(service !== null && service !== undefined).assertTrue();
    })
  });
}
