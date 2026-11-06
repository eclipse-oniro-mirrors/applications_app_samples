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
import { util } from '@kit.ArkTS';
import recorderFile from '../../../main/ets/utils/RecorderFileUtil';
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';

const PAYLOAD: string = 'avrecorder-file-probe-content';
const READ_BUFFER_SIZE: number = 128;

function appContext(): common.Context {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
}

function listNames(): string[] {
  return fileIo.listFileSync(appContext().filesDir);
}

function pathOf(name: string): string {
  return `${appContext().filesDir}/${name}`;
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

export default function recorderFileDeviceTest() {
  describe('recorderFileDeviceTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0100
     * @tc.name testRecorderFile0001
     * @tc.desc Verify createAudioFile opens a new .m4a file under filesDir and returns a positive fd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0001', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      expect(fd > 0).assertTrue();
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(/^AUDIO_\d{6,8}_\d{6}\.m4a$/.test(created[0])).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0200
     * @tc.name testRecorderFile0002
     * @tc.desc Verify createVideoFile opens a new .mp4 file under filesDir and returns a positive fd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0002', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      expect(fd > 0).assertTrue();
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(/^VIDEO_\d{6,8}_\d{6}\.mp4$/.test(created[0])).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0300
     * @tc.name testRecorderFile0003
     * @tc.desc Verify the returned fd can persist content that is readable from the created file path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0003', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      const written: number = fileIo.writeSync(fd, PAYLOAD);
      expect(written).assertEqual(PAYLOAD.length);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(PAYLOAD.length);

      const readFile: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      const buffer: ArrayBuffer = new ArrayBuffer(READ_BUFFER_SIZE);
      const readLength: number = fileIo.readSync(readFile.fd, buffer);
      fileIo.closeSync(readFile);
      expect(readLength).assertEqual(PAYLOAD.length);
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(decoder.decodeToString(new Uint8Array(buffer.slice(0, readLength)))).assertEqual(PAYLOAD);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0400
     * @tc.name testRecorderFile0004
     * @tc.desc Verify audio and video recording targets differ in both name prefix and extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0004', 0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      expect(audioFd > 0).assertTrue();
      expect(videoFd > 0).assertTrue();
      fileIo.closeSync(audioFd);
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      const audioNames: string[] = created.filter((name: string) => name.startsWith('AUDIO_'));
      const videoNames: string[] = created.filter((name: string) => name.startsWith('VIDEO_'));
      expect(audioNames.length).assertEqual(1);
      expect(videoNames.length).assertEqual(1);
      expect(audioNames[0].endsWith('.m4a')).assertTrue();
      expect(videoNames[0].endsWith('.mp4')).assertTrue();
      removeQuietly(audioNames[0]);
      removeQuietly(videoNames[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0500
     * @tc.name testRecorderFile0005
     * @tc.desc Verify audio files created in different seconds receive distinct names and usable descriptors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0005', 0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createAudioFile(appContext());
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          resolve();
        }, 1100);
      });
      const secondFd: number = await recorderFile.createAudioFile(appContext());
      expect(firstFd > 0).assertTrue();
      expect(secondFd > 0).assertTrue();
      expect(fileIo.writeSync(firstFd, 'first')).assertEqual(5);
      expect(fileIo.writeSync(secondFd, 'second')).assertEqual(6);
      fileIo.closeSync(firstFd);
      fileIo.closeSync(secondFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created[0] === created[1]).assertFalse();
      for (let i = 0; i < created.length; i++) {
        expect(/^AUDIO_\d{6,8}_\d{6}\.m4a$/.test(created[i])).assertTrue();
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0600
     * @tc.name testRecorderFile0006
     * @tc.desc Verify a descriptor closed after creation can no longer be written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0006', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      const created: string[] = addedNames(before);
      fileIo.closeSync(fd);
      let rejected: boolean = false;
      try {
        fileIo.writeSync(fd, PAYLOAD);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      const reopened: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0700
     * @tc.name testRecorderFile0007
     * @tc.desc Verify the generated name carries the unpadded date and the six-digit time before the extension
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0007', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      const parts: string[] = created[0].replace('.mp4', '').split('_');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual('VIDEO');
      expect(/^\d{6,8}$/.test(parts[1])).assertTrue();
      expect(/^\d{6}$/.test(parts[2])).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_DEVICE_0800
     * @tc.name testRecorderFile0008
     * @tc.desc Verify the date segment of a new audio target equals the current clock date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRecorderFile0008', 0, async () => {
      const util: DateTimeUtil = new DateTimeUtil();
      const beforeNames: string[] = listNames();
      const beforeDate: string = util.getDate();
      const fd: number = await recorderFile.createAudioFile(appContext());
      const afterDate: string = util.getDate();
      expect(fd > 0).assertTrue();
      fileIo.closeSync(fd);
      const created: string[] = addedNames(beforeNames);
      expect(created.length).assertEqual(1);
      const parts: string[] = created[0].replace('.m4a', '').split('_');
      expect(parts[0]).assertEqual('AUDIO');
      expect(parts[1] === beforeDate || parts[1] === afterDate).assertTrue();
      expect(parts[2].length).assertEqual(6);
      removeQuietly(created[0]);
    })
  })
}
