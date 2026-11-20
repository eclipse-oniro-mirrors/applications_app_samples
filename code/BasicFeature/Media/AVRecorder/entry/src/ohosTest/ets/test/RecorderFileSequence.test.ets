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
import recorderFile from '../../../main/ets/utils/RecorderFileUtil';
import DateTimeUtil from '../../../main/ets/utils/DateTimeUtil';

const SWEEP_RADIUS_SECONDS: number = 5;
const READ_BUFFER_SIZE: number = 64;

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

function readText(name: string): string {
  const file: fileIo.File = fileIo.openSync(pathOf(name), fileIo.OpenMode.READ_ONLY);
  const buffer: ArrayBuffer = new ArrayBuffer(READ_BUFFER_SIZE);
  const readLength: number = fileIo.readSync(file.fd, buffer);
  fileIo.closeSync(file);
  const decoder: util.TextDecoder = util.TextDecoder.create('utf-8');
  return decoder.decodeToString(new Uint8Array(buffer.slice(0, readLength)));
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

function waitOneSecond(): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void) => {
    setTimeout(() => {
      resolve();
    }, 1100);
  });
}

export default function recorderFileSequenceTest() {
  describe('recorderFileSequenceTest', () => {
    beforeEach(async () => {
      await paceTurn();
      sweepGeneratedTargets();
    });

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0100
     * @tc.name testFileSequence0001
     * @tc.desc Verify two writes through one descriptor accumulate in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      expect(fileIo.writeSync(fd, 'first')).assertEqual(5);
      expect(fileIo.writeSync(fd, '-second')).assertEqual(7);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(12);
      expect(readText(created[0])).assertEqual('first-second');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0200
     * @tc.name testFileSequence0002
     * @tc.desc Verify audio and video descriptors written back-to-back keep separate contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      expect(fileIo.writeSync(audioFd, 'microphone')).assertEqual(10);
      expect(fileIo.writeSync(videoFd, 'camera')).assertEqual(6);
      fileIo.closeSync(audioFd);
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      const audioName: string = created.filter((name: string) => name.startsWith('AUDIO_'))[0];
      const videoName: string = created.filter((name: string) => name.startsWith('VIDEO_'))[0];
      expect(readText(audioName)).assertEqual('microphone');
      expect(readText(videoName)).assertEqual('camera');
      expect(fileIo.statSync(pathOf(audioName)).size).assertEqual(10);
      expect(fileIo.statSync(pathOf(videoName)).size).assertEqual(6);
      removeQuietly(audioName);
      removeQuietly(videoName);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0300
     * @tc.name testFileSequence0003
     * @tc.desc Verify both targets remain readable after they are created and closed in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(audioFd, 'audio-first');
      fileIo.closeSync(audioFd);
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(videoFd, 'video-second');
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      const audioName: string = created.filter((name: string) => name.startsWith('AUDIO_'))[0];
      const videoName: string = created.filter((name: string) => name.startsWith('VIDEO_'))[0];
      expect(readText(audioName)).assertEqual('audio-first');
      expect(readText(videoName)).assertEqual('video-second');
      expect(audioName.endsWith('.m4a')).assertTrue();
      expect(videoName.endsWith('.mp4')).assertTrue();
      removeQuietly(audioName);
      removeQuietly(videoName);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0400
     * @tc.name testFileSequence0004
     * @tc.desc Verify deleting an audio target before creating a video target leaves only the video file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(audioFd, 'discard');
      fileIo.closeSync(audioFd);
      const audioName: string = addedNames(before)[0];
      removeQuietly(audioName);
      expect(listNames().indexOf(audioName) < 0).assertTrue();
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created[0].startsWith('VIDEO_')).assertTrue();
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(0);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0500
     * @tc.name testFileSequence0005
     * @tc.desc Verify audio targets created in different seconds are distinct while both stay empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.closeSync(firstFd);
      await waitOneSecond();
      const secondFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.closeSync(secondFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      expect(created[0] === created[1]).assertFalse();
      expect(created.filter((name: string) => name.startsWith('AUDIO_')).length).assertEqual(2);
      for (let i = 0; i < created.length; i++) {
        expect(fileIo.statSync(pathOf(created[i])).size).assertEqual(0);
        removeQuietly(created[i]);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0600
     * @tc.name testFileSequence0006
     * @tc.desc Verify a four-byte symbol payload is stored at its encoded byte length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      const written: number = fileIo.writeSync(fd, '🎬');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(written).assertEqual(4);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(4);
      expect(readText(created[0])).assertEqual('🎬');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0700
     * @tc.name testFileSequence0007
     * @tc.desc Verify three consecutive writes concatenate exactly in write order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      expect(fileIo.writeSync(fd, 'a')).assertEqual(1);
      expect(fileIo.writeSync(fd, 'bb')).assertEqual(2);
      expect(fileIo.writeSync(fd, 'ccc')).assertEqual(3);
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(6);
      expect(readText(created[0])).assertEqual('abbccc');
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0800
     * @tc.name testFileSequence0008
     * @tc.desc Verify creating an audio target adds one file and no video target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createAudioFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created.filter((name: string) => name.endsWith('.mp4')).length).assertEqual(0);
      expect(created[0].startsWith('AUDIO_')).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_0900
     * @tc.name testFileSequence0009
     * @tc.desc Verify creating a video target adds one file and no audio target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(1);
      expect(created.filter((name: string) => name.endsWith('.m4a')).length).assertEqual(0);
      expect(created[0].startsWith('VIDEO_')).assertTrue();
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_1000
     * @tc.name testFileSequence0010
     * @tc.desc Verify removing both created targets restores the original sandbox listing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.closeSync(audioFd);
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      expect(created.length).assertEqual(2);
      for (let i = 0; i < created.length; i++) {
        removeQuietly(created[i]);
      }
      expect(addedNames(before).length).assertEqual(0);
      expect(listNames().join(',')).assertEqual(before.join(','));
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_1100
     * @tc.name testFileSequence0011
     * @tc.desc Verify audio targets from different seconds keep their own payloads after both are closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(firstFd, 'older');
      fileIo.closeSync(firstFd);
      await waitOneSecond();
      const secondFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(secondFd, 'newer');
      fileIo.closeSync(secondFd);
      const created: string[] = addedNames(before).sort();
      expect(created.length).assertEqual(2);
      expect(readText(created[0])).assertEqual('older');
      expect(readText(created[1])).assertEqual('newer');
      removeQuietly(created[0]);
      removeQuietly(created[1]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_1200
     * @tc.name testFileSequence0012
     * @tc.desc Verify recreating a video target after deletion produces a new empty file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const firstFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(firstFd, 'obsolete');
      fileIo.closeSync(firstFd);
      const firstCreated: string[] = addedNames(before);
      removeQuietly(firstCreated[0]);
      const secondFd: number = await recorderFile.createVideoFile(appContext());
      expect(secondFd > 0).assertTrue();
      fileIo.closeSync(secondFd);
      const secondCreated: string[] = addedNames(before);
      expect(secondCreated.length).assertEqual(1);
      expect(fileIo.statSync(pathOf(secondCreated[0])).size).assertEqual(0);
      expect(readText(secondCreated[0])).assertEqual('');
      removeQuietly(secondCreated[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_1300
     * @tc.name testFileSequence0013
     * @tc.desc Verify a partial read returns only the requested leading bytes of a video target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(fd, 'framepayload');
      fileIo.closeSync(fd);
      const created: string[] = addedNames(before);
      const file: fileIo.File = fileIo.openSync(pathOf(created[0]), fileIo.OpenMode.READ_ONLY);
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      const readLength: number = fileIo.readSync(file.fd, buffer);
      fileIo.closeSync(file);
      expect(readLength).assertEqual(2);
      const prefix: util.TextDecoder = util.TextDecoder.create('utf-8');
      expect(prefix.decodeToString(new Uint8Array(buffer))).assertEqual('fr');
      expect(fileIo.statSync(pathOf(created[0])).size).assertEqual(12);
      removeQuietly(created[0]);
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_SEQ_1400
     * @tc.name testFileSequence0014
     * @tc.desc Verify deleting the audio target does not affect the payload of a previously created video target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileSequence0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await recorderFile.createAudioFile(appContext());
      fileIo.writeSync(audioFd, 'temp');
      fileIo.closeSync(audioFd);
      const videoFd: number = await recorderFile.createVideoFile(appContext());
      fileIo.writeSync(videoFd, 'survivor');
      fileIo.closeSync(videoFd);
      const created: string[] = addedNames(before);
      const audioName: string = created.filter((name: string) => name.startsWith('AUDIO_'))[0];
      const videoName: string = created.filter((name: string) => name.startsWith('VIDEO_'))[0];
      removeQuietly(audioName);
      expect(readText(videoName)).assertEqual('survivor');
      expect(listNames().indexOf(audioName) < 0).assertTrue();
      expect(fileIo.statSync(pathOf(videoName)).size).assertEqual(8);
      removeQuietly(videoName);
    })
  })
}
