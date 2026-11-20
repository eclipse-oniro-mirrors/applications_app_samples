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
import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { paceTurn } from './TestPace';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import AVRecorderService from '../../../main/ets/services/AVRecorderService';

const AUDIO_TARGET: string = 'audio_example.m4a';
const VIDEO_TARGET: string = 'video_example.mp4';

function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

function filesDir(): string {
  return appContext().filesDir;
}

function pathOf(name: string): string {
  return `${filesDir()}/${name}`;
}

function listNames(): string[] {
  return fileIo.listFileSync(filesDir());
}

function addedNames(before: string[]): string[] {
  return listNames().filter((name: string) => before.indexOf(name) < 0);
}

function removeQuietly(name: string): void {
  try {
    fileIo.unlinkSync(pathOf(name));
  } catch (error) {
    console.info(`cleanup skipped for ${name}`);
  }
}

function clearTargets(): void {
  removeQuietly(AUDIO_TARGET);
  removeQuietly(VIDEO_TARGET);
}

function waitOneSecond(): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, 1100);
  });
}

export default function recorderServicePairTest() {
  describe('recorderServicePairTest', () => {
    beforeEach(async () => {
      await paceTurn();
      clearTargets();
    });

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0100
     * @tc.name testServicePair0001
     * @tc.desc Verify two services preparing different targets keep both files after either close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioService: AVRecorderService = new AVRecorderService();
      const videoService: AVRecorderService = new AVRecorderService();
      await audioService.prepareAudioRecorder(appContext());
      await videoService.prepareVideoRecorder(appContext());
      expect(addedNames(before).length).assertEqual(2);
      await audioService.closeFd();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      await videoService.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0200
     * @tc.name testServicePair0002
     * @tc.desc Verify releasing recorders on two services never deletes prepared targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const audioService: AVRecorderService = new AVRecorderService();
      const videoService: AVRecorderService = new AVRecorderService();
      await audioService.prepareAudioRecorder(appContext());
      await videoService.prepareVideoRecorder(appContext());
      await audioService.releaseRecorder();
      await videoService.releaseRecorder();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      await audioService.closeFd();
      await videoService.closeFd();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0300
     * @tc.name testServicePair0003
     * @tc.desc Verify creating a recorder between prepare and close leaves the audio target intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.createRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.releaseRecorder();
      await service.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0400
     * @tc.name testServicePair0004
     * @tc.desc Verify stop, reset and release around a prepared target are harmless no-ops
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.stopRecorder();
      await service.resetRecorder();
      await service.releaseRecorder();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0500
     * @tc.name testServicePair0005
     * @tc.desc Verify double closing one service does not disturb the shared audio target of another
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const first: AVRecorderService = new AVRecorderService();
      const second: AVRecorderService = new AVRecorderService();
      await first.prepareAudioRecorder(appContext());
      await second.prepareAudioRecorder(appContext());
      expect(addedNames(before).length).assertEqual(1);
      await second.closeFd();
      await second.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      await first.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0600
     * @tc.name testServicePair0006
     * @tc.desc Verify closing after audio then video preparation targets the most recent descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.prepareVideoRecorder(appContext());
      removeQuietly(AUDIO_TARGET);
      await service.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0700
     * @tc.name testServicePair0007
     * @tc.desc Verify closing after video then audio preparation leaves the earlier video target alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      await service.prepareAudioRecorder(appContext());
      removeQuietly(VIDEO_TARGET);
      await service.closeFd();
      expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0800
     * @tc.name testServicePair0008
     * @tc.desc Verify the same service can close a video target and then prepare a fresh audio target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_0900
     * @tc.name testServicePair0009
     * @tc.desc Verify two services preparing audio moments apart still share one empty target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const first: AVRecorderService = new AVRecorderService();
      const second: AVRecorderService = new AVRecorderService();
      await first.prepareAudioRecorder(appContext());
      await waitOneSecond();
      await second.prepareAudioRecorder(appContext());
      expect(addedNames(before).length).assertEqual(1);
      expect(addedNames(before)[0]).assertEqual(AUDIO_TARGET);
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await first.closeFd();
      await second.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1000
     * @tc.name testServicePair0010
     * @tc.desc Verify preparing audio again after deleting the target recreates the same path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      removeQuietly(AUDIO_TARGET);
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1100
     * @tc.name testServicePair0011
     * @tc.desc Verify releasing before any preparation does not prevent later audio preparation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1200
     * @tc.name testServicePair0012
     * @tc.desc Verify preparing a twice-created recorder allocates exactly one empty video target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.createRecorder();
      await service.prepareVideoRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(VIDEO_TARGET);
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      await service.releaseRecorder();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1300
     * @tc.name testServicePair0013
     * @tc.desc Verify a registered callback is never invoked by preparation, stop or close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      let callbackCount: number = 0;
      service.setCallback(() => {
        callbackCount++;
      });
      await service.prepareAudioRecorder(appContext());
      await service.stopRecorder();
      await service.closeFd();
      expect(callbackCount).assertEqual(0);
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1400
     * @tc.name testServicePair0014
     * @tc.desc Verify two services preparing different targets and closing in reverse order keep both files
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const audioService: AVRecorderService = new AVRecorderService();
      const videoService: AVRecorderService = new AVRecorderService();
      await audioService.prepareAudioRecorder(appContext());
      await videoService.prepareVideoRecorder(appContext());
      await videoService.closeFd();
      await audioService.closeFd();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_PAIR_1500
     * @tc.name testServicePair0015
     * @tc.desc Verify the full guarded action chain around a prepared target neither throws nor changes the file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServicePair0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      const sizeBefore: number = fileIo.statSync(pathOf(AUDIO_TARGET)).size;
      await service.startRecorder();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.resetRecorder();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(sizeBefore);
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.releaseRecorder();
      await service.closeFd();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
    })
  })
}
