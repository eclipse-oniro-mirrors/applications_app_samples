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
import { util } from '@kit.ArkTS';
import AVRecorderService from '../../../main/ets/services/AVRecorderService';

const AUDIO_TARGET: string = 'audio_example.m4a';
const VIDEO_TARGET: string = 'video_example.mp4';
const KEEP_PAYLOAD: string = 'keep-me';
const READ_BUFFER_SIZE: number = 64;

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

function clearTarget(name: string): void {
  try {
    fileIo.unlinkSync(pathOf(name));
  } catch (error) {
    console.info(`no file to remove for ${name}`);
  }
  try {
    fileIo.rmdirSync(pathOf(name));
  } catch (error) {
    console.info(`no directory to remove for ${name}`);
  }
}

function removeQuietly(name: string): void {
  try {
    fileIo.unlinkSync(pathOf(name));
  } catch (error) {
    console.info(`cleanup skipped for ${name}`);
  }
}

function writeKeep(name: string): void {
  const file: fileIo.File =
    fileIo.openSync(pathOf(name), fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE | fileIo.OpenMode.TRUNC);
  fileIo.writeSync(file.fd, KEEP_PAYLOAD);
  fileIo.closeSync(file);
}

function readAll(name: string): string {
  const file: fileIo.File = fileIo.openSync(pathOf(name), fileIo.OpenMode.READ_ONLY);
  const buffer: ArrayBuffer = new ArrayBuffer(READ_BUFFER_SIZE);
  const readLength: number = fileIo.readSync(file.fd, buffer);
  fileIo.closeSync(file);
  const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  return decoder.decodeToString(new Uint8Array(buffer.slice(0, readLength)));
}

export default function recorderServiceLifecycleTest() {
  describe('recorderServiceLifecycleTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0100
     * @tc.name testServiceLife0001
     * @tc.desc Verify preparing audio without a recorder creates exactly one empty audio target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(AUDIO_TARGET);
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).isFile()).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0200
     * @tc.name testServiceLife0002
     * @tc.desc Verify preparing video without a recorder creates exactly one empty video target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(VIDEO_TARGET);
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).isFile()).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0300
     * @tc.name testServiceLife0003
     * @tc.desc Verify a prepared audio target does not imply an input surface and survives stop and close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.stopRecorder();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      const reopened: fileIo.File = fileIo.openSync(pathOf(AUDIO_TARGET), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0400
     * @tc.name testServiceLife0004
     * @tc.desc Verify preparing audio over an existing file keeps its content instead of truncating it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      writeKeep(AUDIO_TARGET);
      const sizeBefore: number = fileIo.statSync(pathOf(AUDIO_TARGET)).size;
      expect(sizeBefore).assertEqual(KEEP_PAYLOAD.length);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(sizeBefore);
      expect(readAll(AUDIO_TARGET)).assertEqual(KEEP_PAYLOAD);
      await service.closeFd();
      expect(readAll(AUDIO_TARGET)).assertEqual(KEEP_PAYLOAD);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0500
     * @tc.name testServiceLife0005
     * @tc.desc Verify preparing video over an existing file keeps its content instead of truncating it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      writeKeep(VIDEO_TARGET);
      const sizeBefore: number = fileIo.statSync(pathOf(VIDEO_TARGET)).size;
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(sizeBefore);
      expect(readAll(VIDEO_TARGET)).assertEqual(KEEP_PAYLOAD);
      await service.closeFd();
      expect(readAll(VIDEO_TARGET)).assertEqual(KEEP_PAYLOAD);
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0600
     * @tc.name testServiceLife0006
     * @tc.desc Verify preparing audio twice reuses the same single target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.closeFd();
      await service.prepareAudioRecorder(appContext());
      expect(addedNames(before).length).assertEqual(1);
      expect(addedNames(before)[0]).assertEqual(AUDIO_TARGET);
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0700
     * @tc.name testServiceLife0007
     * @tc.desc Verify preparing video twice reuses the same single target file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      await service.closeFd();
      await service.prepareVideoRecorder(appContext());
      expect(addedNames(before).length).assertEqual(1);
      expect(addedNames(before)[0]).assertEqual(VIDEO_TARGET);
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0800
     * @tc.name testServiceLife0008
     * @tc.desc Verify closing a prepared video target twice keeps the file readable and does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      await service.closeFd();
      await service.closeFd();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      const reopened: fileIo.File = fileIo.openSync(pathOf(VIDEO_TARGET), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_0900
     * @tc.name testServiceLife0009
     * @tc.desc Verify preparing audio rejects when the audio target path is occupied by a directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      fileIo.mkdirSync(pathOf(AUDIO_TARGET));
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let rejected: boolean = false;
      try {
        await service.prepareAudioRecorder(appContext());
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).isDirectory()).assertTrue();
      expect(addedNames(before).length).assertEqual(0);
      await service.closeFd();
      fileIo.rmdirSync(pathOf(AUDIO_TARGET));
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1000
     * @tc.name testServiceLife0010
     * @tc.desc Verify preparing video rejects when the video target path is occupied by a directory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      fileIo.mkdirSync(pathOf(VIDEO_TARGET));
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let rejected: boolean = false;
      try {
        await service.prepareVideoRecorder(appContext());
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).isDirectory()).assertTrue();
      expect(addedNames(before).length).assertEqual(0);
      await service.closeFd();
      fileIo.rmdirSync(pathOf(VIDEO_TARGET));
      expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1100
     * @tc.name testServiceLife0011
     * @tc.desc Verify one service can prepare audio then video and both targets stay empty after close
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.prepareVideoRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created.indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(created.indexOf(VIDEO_TARGET) >= 0).assertTrue();
      await service.closeFd();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1200
     * @tc.name testServiceLife0012
     * @tc.desc Verify preparing video before audio produces the same two independent targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      await service.prepareAudioRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created.indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(created.indexOf(AUDIO_TARGET) >= 0).assertTrue();
      await service.closeFd();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1300
     * @tc.name testServiceLife0013
     * @tc.desc Verify two services preparing different targets keep both files after one descriptor is closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const audioService: AVRecorderService = new AVRecorderService();
      const videoService: AVRecorderService = new AVRecorderService();
      await audioService.prepareAudioRecorder(appContext());
      await videoService.prepareVideoRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      await audioService.closeFd();
      expect(listNames().indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      await videoService.closeFd();
      removeQuietly(AUDIO_TARGET);
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1400
     * @tc.name testServiceLife0014
     * @tc.desc Verify repeated audio preparation on one service leaves a second service without a surface
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const before: string[] = listNames();
      const worker: AVRecorderService = new AVRecorderService();
      const observer: AVRecorderService = new AVRecorderService();
      await worker.prepareAudioRecorder(appContext());
      await worker.closeFd();
      await worker.prepareAudioRecorder(appContext());
      expect(addedNames(before).length).assertEqual(1);
      expect((await observer.getInputSurface()) === undefined).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await worker.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1500
     * @tc.name testServiceLife0015
     * @tc.desc Verify creating a recorder twice yields no surface and creates no files
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.createRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      expect(listNames().join(',')).assertEqual(before.join(','));
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1600
     * @tc.name testServiceLife0016
     * @tc.desc Verify three create and release cycles leave the file list and surface untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      for (let i = 0; i < 3; i++) {
        await service.createRecorder();
        expect((await service.getInputSurface()) === undefined).assertTrue();
        await service.releaseRecorder();
      }
      expect(listNames().join(',')).assertEqual(before.join(','));
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1700
     * @tc.name testServiceLife0017
     * @tc.desc Verify stopping a freshly created recorder is a no-op that creates no file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.stopRecorder();
      expect(listNames().join(',')).assertEqual(before.join(','));
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.releaseRecorder();
      expect(listNames().join(',')).assertEqual(before.join(','));
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1800
     * @tc.name testServiceLife0018
     * @tc.desc Verify pause, resume and start are ignored while the recorder is only created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.pauseRecorder();
      await service.resumeRecorder();
      await service.startRecorder();
      expect(listNames().join(',')).assertEqual(before.join(','));
      expect((await service.getInputSurface()) === undefined).assertTrue();
      await service.releaseRecorder();
      expect(listNames().join(',')).assertEqual(before.join(','));
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_1900
     * @tc.name testServiceLife0019
     * @tc.desc Verify resetting a freshly created recorder keeps it surface-less and release still works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.resetRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      expect(listNames().join(',')).assertEqual(before.join(','));
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2000
     * @tc.name testServiceLife0020
     * @tc.desc Verify releasing a freshly created recorder twice is safe and creates no file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.createRecorder();
      await service.releaseRecorder();
      await service.releaseRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      expect(listNames().join(',')).assertEqual(before.join(','));
      expect(listNames().length).assertEqual(before.length);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2100
     * @tc.name testServiceLife0021
     * @tc.desc Verify registering a callback before a recorder exists is deferred and never fires spuriously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let callbackCount: number = 0;
      service.setCallback(() => {
        callbackCount++;
      });
      expect(callbackCount).assertEqual(0);
      await service.createRecorder();
      await service.releaseRecorder();
      expect(callbackCount).assertEqual(0);
      expect(listNames().join(',')).assertEqual(before.join(','));
      expect((await service.getInputSurface()) === undefined).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2200
     * @tc.name testServiceLife0022
     * @tc.desc Verify creating a recorder after audio preparation keeps the prepared target and descriptor usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.createRecorder();
      expect((await service.getInputSurface()) === undefined).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.releaseRecorder();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      await service.closeFd();
      const reopened: fileIo.File = fileIo.openSync(pathOf(AUDIO_TARGET), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2300
     * @tc.name testServiceLife0023
     * @tc.desc Verify releasing a recorder never removes a previously prepared audio target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      await service.releaseRecorder();
      await service.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      const reopened: fileIo.File = fileIo.openSync(pathOf(AUDIO_TARGET), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2400
     * @tc.name testServiceLife0024
     * @tc.desc Verify resetting a recorder that was never created does not disturb the prepared audio target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.resetRecorder();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2500
     * @tc.name testServiceLife0025
     * @tc.desc Verify closing a prepared audio descriptor after its file was unlinked does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      fileIo.unlinkSync(pathOf(AUDIO_TARGET));
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
      await service.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
      let statRejected: boolean = false;
      try {
        fileIo.statSync(pathOf(AUDIO_TARGET));
      } catch (error) {
        statRejected = true;
      }
      expect(statRejected).assertTrue();
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2600
     * @tc.name testServiceLife0026
     * @tc.desc Verify audio preparation recreates a target that was closed and then deleted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.closeFd();
      fileIo.unlinkSync(pathOf(AUDIO_TARGET));
      expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
      await service.prepareAudioRecorder(appContext());
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2700
     * @tc.name testServiceLife0027
     * @tc.desc Verify preparing video after the audio target was deleted leaves only the video target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      clearTarget(VIDEO_TARGET);
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      await service.closeFd();
      fileIo.unlinkSync(pathOf(AUDIO_TARGET));
      await service.prepareVideoRecorder(appContext());
      const names: string[] = listNames();
      expect(names.indexOf(VIDEO_TARGET) >= 0).assertTrue();
      expect(names.indexOf(AUDIO_TARGET) < 0).assertTrue();
      expect(fileIo.statSync(pathOf(VIDEO_TARGET)).size).assertEqual(0);
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2800
     * @tc.name testServiceLife0028
     * @tc.desc Verify the audio target keeps its documented name and container extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareAudioRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(AUDIO_TARGET);
      expect(created[0].endsWith('.m4a')).assertTrue();
      expect(created[0].startsWith('audio_example')).assertTrue();
      await service.closeFd();
      removeQuietly(AUDIO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_2900
     * @tc.name testServiceLife0029
     * @tc.desc Verify the video target keeps its documented name and container extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(VIDEO_TARGET);
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      await service.prepareVideoRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(VIDEO_TARGET);
      expect(created[0].endsWith('.mp4')).assertTrue();
      expect(created[0].startsWith('video_example')).assertTrue();
      await service.closeFd();
      removeQuietly(VIDEO_TARGET);
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_LIFE_3000
     * @tc.name testServiceLife0030
     * @tc.desc Verify two services preparing the same audio target share one file that survives both closes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testServiceLife0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      clearTarget(AUDIO_TARGET);
      const before: string[] = listNames();
      const first: AVRecorderService = new AVRecorderService();
      const second: AVRecorderService = new AVRecorderService();
      await first.prepareAudioRecorder(appContext());
      await second.prepareAudioRecorder(appContext());
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0]).assertEqual(AUDIO_TARGET);
      await first.closeFd();
      await second.closeFd();
      expect(listNames().indexOf(AUDIO_TARGET) >= 0).assertTrue();
      expect(fileIo.statSync(pathOf(AUDIO_TARGET)).size).assertEqual(0);
      removeQuietly(AUDIO_TARGET);
    })
  })
}
