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

const PAYLOAD: string = 'video-matrix';
const UNICODE_PAYLOAD: string = '中文素材';
const SWEEP_RADIUS_SECONDS: number = 5;

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

function readText(name: string, size: number): string {
  const file: fileIo.File = fileIo.openSync(pathOf(name), fileIo.OpenMode.READ_ONLY);
  const buffer: ArrayBuffer = new ArrayBuffer(size);
  const readLength: number = fileIo.readSync(file.fd, buffer);
  fileIo.closeSync(file);
  const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  return decoder.decodeToString(new Uint8Array(buffer.slice(0, readLength)));
}

function payloadOf(length: number): string {
  let text: string = '';
  for (let i = 0; i < length; i++) {
    text += 'a';
  }
  return text;
}

function sweepGeneratedTargets(): void {
  const utilDate: DateTimeUtil = new DateTimeUtil();
  const now: number = new Date().getTime();
  for (let offset = -SWEEP_RADIUS_SECONDS; offset <= 1; offset++) {
    const stamp: Date = new Date(now + offset * 1000);
    const datePart: string = utilDate.concatDate(stamp.getFullYear(), stamp.getMonth() + 1, stamp.getDate());
    const timePart: string = utilDate.concatTime(stamp.getHours(), stamp.getMinutes(), stamp.getSeconds());
    removeQuietly(`AUDIO_${datePart}_${timePart}.m4a`);
    removeQuietly(`VIDEO_${datePart}_${timePart}.mp4`);
  }
}

export default function recorderFileMatrixTest() {
  describe('recorderFileMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
      sweepGeneratedTargets();
    });

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0100
     * @tc.name testFileMatrix0001
     * @tc.desc Verify a new audio target is a regular empty file with a positive descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0001', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      expect(fd > 0).assertTrue();
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(fileIo.statSync(pathOf(created[0])).isFile()).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      fileIo.closeSync(fd);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0200
     * @tc.name testFileMatrix0002
     * @tc.desc Verify a new video target is a regular empty file with a positive descriptor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0002', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      expect(fd > 0).assertTrue();
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0].endsWith('.mp4')).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      fileIo.closeSync(fd);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0300
     * @tc.name testFileMatrix0003
     * @tc.desc Verify the audio target name is a flat file name with the audio prefix and suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0003', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0].startsWith('AUDIO_')).assertTrue();
      expect(created[0].includes('/')).assertFalse();
      expect(created[0].endsWith('.m4a')).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0400
     * @tc.name testFileMatrix0004
     * @tc.desc Verify the video target name is a flat file name with the video prefix and suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0004', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0].startsWith('VIDEO_')).assertTrue();
      expect(created[0].includes('/')).assertFalse();
      expect(created[0].endsWith('.mp4')).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0500
     * @tc.name testFileMatrix0005
     * @tc.desc Verify content written through a video descriptor is readable from the created path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0005', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      expect(fileIo.writeSync(fd, PAYLOAD)).assertEqual(PAYLOAD.length);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(PAYLOAD.length);
      expect(readText(created[0], PAYLOAD.length + 8)).assertEqual(PAYLOAD);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0600
     * @tc.name testFileMatrix0006
     * @tc.desc Verify a unicode payload is written in UTF-8 bytes and decodes back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0006', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      const written: number = fileIo.writeSync(fd, UNICODE_PAYLOAD);
      expect(written).assertEqual(12);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(12);
      expect(readText(created[0], 32)).assertEqual(UNICODE_PAYLOAD);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0700
     * @tc.name testFileMatrix0007
     * @tc.desc Verify sequential writes advance the file offset and append content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0007', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      expect(fileIo.writeSync(fd, 'abc')).assertEqual(3);
      expect(fileIo.writeSync(fd, 'de')).assertEqual(2);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(5);
      expect(readText(created[0], 8)).assertEqual('abcde');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0800
     * @tc.name testFileMatrix0008
     * @tc.desc Verify a zero-length write leaves the created target empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0008', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      expect(fileIo.writeSync(fd, '')).assertEqual(0);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      expect(readText(created[0], 4).length).assertEqual(0);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_0900
     * @tc.name testFileMatrix0009
     * @tc.desc Verify two audio descriptors opened in quick succession stay distinct and usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0009', 0, async () => {
      const before: string[] = listNames();
      const first: number = await recorderFile.createAudioFile(appContext());
      const second: number = await recorderFile.createAudioFile(appContext());
      expect(first > 0).assertTrue();
      expect(second > 0).assertTrue();
      expect(first === second).assertFalse();
      fileIo.closeSync(first);
      fileIo.closeSync(second);
      const created: string[] = addedNames(before);
      expect(created.length > 0).assertTrue();
      expect(created.length <= 2).assertTrue();
      for (let i = 0; i < created.length; i++) {
        expect(/^AUDIO_\d{6,8}_\d{6}\.m4a$/.test(created[i])).assertTrue();
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1000
     * @tc.name testFileMatrix0010
     * @tc.desc Verify two video descriptors opened in quick succession stay distinct and usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0010', 0, async () => {
      const before: string[] = listNames();
      const first: number = await recorderFile.createVideoFile(appContext());
      const second: number = await recorderFile.createVideoFile(appContext());
      expect(first > 0).assertTrue();
      expect(second > 0).assertTrue();
      expect(first === second).assertFalse();
      fileIo.closeSync(first);
      fileIo.closeSync(second);
      const created: string[] = addedNames(before);
      expect(created.length > 0).assertTrue();
      expect(created.length <= 2).assertTrue();
      for (let i = 0; i < created.length; i++) {
        expect(created[i].endsWith('.mp4')).assertTrue();
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1100
     * @tc.name testFileMatrix0011
     * @tc.desc Verify three rapid audio creations allocate three distinct descriptors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0011', 0, async () => {
      const before: string[] = listNames();
      const fds: number[] = [];
      for (let i = 0; i < 3; i++) {
        fds.push(await recorderFile.createAudioFile(appContext()));
      }
      expect(fds[0] > 0).assertTrue();
      expect(fds[1] > 0).assertTrue();
      expect(fds[2] > 0).assertTrue();
      expect(fds[0] === fds[1] || fds[1] === fds[2] || fds[0] === fds[2]).assertFalse();
      for (let i = 0; i < fds.length; i++) {
        fileIo.closeSync(fds[i]);
      }
      const created: string[] = addedNames(before);
      expect(created.length > 0).assertTrue();
      expect(created.length <= 3).assertTrue();
      for (let i = 0; i < created.length; i++) {
        expect(created[i].startsWith('AUDIO_')).assertTrue();
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1200
     * @tc.name testFileMatrix0012
     * @tc.desc Verify an audio and a video creation produce two differently prefixed targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0012', 0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      expect(audioFd === videoFd).assertFalse();
      fileIo.closeSync(audioFd);
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created.filter((name: string) => name.startsWith('AUDIO_')).length).assertEqual(1);
      expect(created.filter((name: string) => name.startsWith('VIDEO_')).length).assertEqual(1);
      for (let i = 0; i < created.length; i++) {
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1300
     * @tc.name testFileMatrix0013
     * @tc.desc Verify an audio target can be reopened read-only after its descriptor is closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0013', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(fd, 'audio');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      const reopened: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      fileIo.closeSync(reopened);
      expect(readText(created[0], 8)).assertEqual('audio');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1400
     * @tc.name testFileMatrix0014
     * @tc.desc Verify a video target can be reopened read-only with its content intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0014', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(fd, 'video');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const reopened: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      expect(reopened.fd > 0).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(5);
      fileIo.closeSync(reopened);
      expect(readText(created[0], 8)).assertEqual('video');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1500
     * @tc.name testFileMatrix0015
     * @tc.desc Verify a closed video descriptor rejects further writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0015', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      const created: string[] = addedNames(before);
      fileIo.closeSync(fd);
      let rejected: boolean = false;
      try {
        fileIo.writeSync(fd, 'late');
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      expect(listNames().indexOf(created[0]) >= 0).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1600
     * @tc.name testFileMatrix0016
     * @tc.desc Verify two sequential reads split a six-byte payload at the requested boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0016', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(fd, 'abcdef');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const file: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      const first: ArrayBuffer = new ArrayBuffer(3);
      const second: ArrayBuffer = new ArrayBuffer(3);
      const firstLength: number = fileIo.readSync(file.fd, first);
      const secondLength: number = fileIo.readSync(file.fd, second);
      fileIo.closeSync(file);
      const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(firstLength).assertEqual(3);
      expect(secondLength).assertEqual(3);
      expect(decoder.decodeToString(new Uint8Array(first))).assertEqual('abc');
      expect(decoder.decodeToString(new Uint8Array(second))).assertEqual('def');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1700
     * @tc.name testFileMatrix0017
     * @tc.desc Verify a read buffer larger than the payload returns only the written bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0017', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(fd, 'tiny');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const file: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      const buffer: ArrayBuffer = new ArrayBuffer(64);
      const length: number = fileIo.readSync(file.fd, buffer);
      fileIo.closeSync(file);
      expect(length).assertEqual(4);
      expect(length < 64).assertTrue();
      expect(readText(created[0], 4)).assertEqual('tiny');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1800
     * @tc.name testFileMatrix0018
     * @tc.desc Verify deleting a created target removes it from the sandbox listing and path lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0018', 0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      fileIo.unlinkSync(pathOf(created[0]));
      expect(listNames().indexOf(created[0])).assertEqual(-1);
      let missing: boolean = false;
      try {
        fileIo.statSync(pathOf(created[0]));
      } catch (error) {
        missing = true;
      }
      expect(missing).assertTrue();
      expect(addedNames(before).length).assertEqual(0);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_1900
     * @tc.name testFileMatrix0019
     * @tc.desc Verify recreating a target after deletion yields a fresh empty file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0019', 0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(firstFd, 'stale');
      fileIo.closeSync(firstFd);
      const firstCreated: string[] = addedNames(before);
      removeQuietly(firstCreated[0]);
      const secondFd: number = await recorderFile.createAudioFile(appContext());
      expect(secondFd > 0).assertTrue();
      fileIo.closeSync(secondFd);
      const secondCreated: string[] = addedNames(before);
      expect(secondCreated.length).assertEqual(1);
      expect(fileIo.statSync(pathOf(secondCreated[0])).size).assertEqual(0);
      expect(fileIo.statSync(pathOf(secondCreated[0])).isFile()).assertTrue();
      removeQuietly(secondCreated[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_2000
     * @tc.name testFileMatrix0020
     * @tc.desc Verify the video name date segment matches the current clock date
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0020', 0, async () => {
      const utilDate: DateTimeUtil = new DateTimeUtil();
      const beforeDate: string = utilDate.getDate();
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      const afterDate: string = utilDate.getDate();
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const fields: string[] = created[0].replace('.mp4', '').split('_');
      expect(fields.length).assertEqual(3);
      expect(fields[1] === beforeDate || fields[1] === afterDate).assertTrue();
      expect(/^\d{6,8}$/.test(fields[1])).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_2100
     * @tc.name testFileMatrix0021
     * @tc.desc Verify the audio name time segment matches the current clock time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0021', 0, async () => {
      const utilDate: DateTimeUtil = new DateTimeUtil();
      const beforeTime: string = utilDate.getTime();
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      const afterTime: string = utilDate.getTime();
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const fields: string[] = created[0].replace('.m4a', '').split('_');
      expect(fields.length).assertEqual(3);
      expect(fields[2] === beforeTime || fields[2] === afterTime).assertTrue();
      expect(/^\d{6}$/.test(fields[2])).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_2200
     * @tc.name testFileMatrix0022
     * @tc.desc Verify a one-kilobyte payload is stored and read back at full length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0022', 0, async () => {
      const payload: string = payloadOf(1024);
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      expect(fileIo.writeSync(fd, payload)).assertEqual(1024);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(1024);
      expect(readText(created[0], 1024).length).assertEqual(1024);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_2300
     * @tc.name testFileMatrix0023
     * @tc.desc Verify audio and video targets keep their own content without cross-contamination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0023', 0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(audioFd, 'left');
      fileIo.writeSync(videoFd, 'right');
      fileIo.closeSync(audioFd);
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      const audioName: string = created.filter((name: string) => name.startsWith('AUDIO_'))[0];
      const videoName: string = created.filter((name: string) => name.startsWith('VIDEO_'))[0];
      expect(readText(audioName, 8)).assertEqual('left');
      expect(readText(videoName, 8)).assertEqual('right');
      expect(fileIo.statSync(pathOf(audioName)).size).assertEqual(4);
      expect(fileIo.statSync(pathOf(videoName)).size).assertEqual(5);
      removeQuietly(audioName);
      removeQuietly(videoName);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_MTX_2400
     * @tc.name testFileMatrix0024
     * @tc.desc Verify video targets created in different seconds receive distinct names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFileMatrix0024', 0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createVideoFile(appContext());
      await new Promise<void>((resolve: (value: void) => void) => {
        setTimeout(() => {
          resolve();
        }, 1100);
      });
      const secondFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(firstFd);
      fileIo.closeSync(secondFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created[0] === created[1]).assertFalse();
      expect(created.filter((name: string) => name.startsWith('VIDEO_')).length).assertEqual(2);
      for (let i = 0; i < created.length; i++) {
        removeQuietly(created[i]);
      }
    })
  })
}
