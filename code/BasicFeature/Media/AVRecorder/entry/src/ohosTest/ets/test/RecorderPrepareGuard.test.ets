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
import { describe, beforeEach, it, expect } from '@ohos/hypium';
import { paceTurn } from './TestPace';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import AVRecorderService from '../../../main/ets/services/AVRecorderService';

const AUDIO_SCRATCH: string = 'audio_example.m4a';
const VIDEO_SCRATCH: string = 'video_example.mp4';

function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

function listNames(): string[] {
  return fileIo.listFileSync(appContext().filesDir);
}

function pathOf(name: string): string {
  return `${appContext().filesDir}/${name}`;
}

function resetScratch(name: string): void {
  if (listNames().indexOf(name) >= 0) {
    fileIo.unlinkSync(pathOf(name));
  }
}

function removeQuietly(name: string): void {
  try {
    fileIo.unlinkSync(pathOf(name));
  } catch (error) {
    console.info(`cleanup skipped for ${name}`);
  }
}

function sortedNames(): string[] {
  return listNames().sort();
}

export default function recorderPrepareGuardTest() {
  describe('recorderPrepareGuardTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0100
     * @tc.name testPrepareGuard0001
     * @tc.desc Verify a fresh service has no input surface because no recorder has been created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0001', 0, async () => {
      const service: AVRecorderService = new AVRecorderService();
      const surfaceId: string | undefined = await service.getInputSurface();
      expect(surfaceId === undefined).assertTrue();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0200
     * @tc.name testPrepareGuard0002
     * @tc.desc Verify prepareAudioRecorder without a recorder still creates the target file and closeFd releases it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0002', 0, async () => {
      resetScratch(AUDIO_SCRATCH);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_SCRATCH) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_SCRATCH)).size).assertEqual(0);
      await service.closeFd();
      expect(fileIo.statSync(pathOf(AUDIO_SCRATCH)).size).assertEqual(0);
      removeQuietly(AUDIO_SCRATCH);
    })

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0300
     * @tc.name testPrepareGuard0003
     * @tc.desc Verify prepareVideoRecorder without a recorder creates the video target file with no content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0003', 0, async () => {
      resetScratch(VIDEO_SCRATCH);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      expect(listNames().indexOf(VIDEO_SCRATCH) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_SCRATCH)).size).assertEqual(0);
      await service.closeFd();
      const reopened: fileIo.File = fileIo.openSync(pathOf(VIDEO_SCRATCH), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(VIDEO_SCRATCH);
    })

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0400
     * @tc.name testPrepareGuard0004
     * @tc.desc Verify start, pause, resume, stop, reset and release are safe no-ops before a recorder exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0004', 0, async () => {
      const before: string[] = sortedNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.startRecorder();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.stopRecorder();
      await service.resetRecorder();
      await service.releaseRecorder();
      await service.closeFd();
      const after: string[] = sortedNames();
      expect(after.length).assertEqual(before.length);
      expect(after.join(',')).assertEqual(before.join(','));
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0500
     * @tc.name testPrepareGuard0005
     * @tc.desc Verify closing the prepared audio target twice keeps the file readable and does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0005', 0, async () => {
      resetScratch(AUDIO_SCRATCH);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.closeFd();
      await service.closeFd();
      expect(listNames().indexOf(AUDIO_SCRATCH) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_SCRATCH)).size).assertEqual(0);
      const reopened: fileIo.File = fileIo.openSync(pathOf(AUDIO_SCRATCH), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(AUDIO_SCRATCH);
    })

    /**
     * @tc.number SUB_AVRECORDER_PREPARE_GUARD_0600
     * @tc.name testPrepareGuard0006
     * @tc.desc Verify a freshly created recorder still has no surface and creates no file until it is prepared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPrepareGuard0006', 0, async () => {
      const before: string[] = sortedNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      const surfaceId: string | undefined = await service.getInputSurface();
      expect(surfaceId === undefined).assertTrue();
      expect(sortedNames().join(',')).assertEqual(before.join(','));
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      expect(sortedNames().length).assertEqual(before.length);
    })
  })
}
