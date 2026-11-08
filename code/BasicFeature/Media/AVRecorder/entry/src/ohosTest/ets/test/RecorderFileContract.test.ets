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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import RecorderFileUtil from '../../../main/ets/utils/RecorderFileUtil';
import { paceTurn } from './TestPace';

const AUDIO_TARGET: string = 'audio_example.m4a';
const VIDEO_TARGET: string = 'video_example.mp4';

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

function clearTargets(): void {
  removeQuietly(AUDIO_TARGET);
  removeQuietly(VIDEO_TARGET);
}

export default function recorderFileContractTest() {
  describe('recorderFileContractTest', () => {
    beforeEach(async () => {
      await paceTurn();
      clearTargets();
    });

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0100
     * @tc.name testFileContract0001
     * @tc.desc Verify createAudioFile returns a descriptor and an empty m4a file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createAudioFile(appContext());
      const added: string[] = addedNames(before);
      try {
        expect(fd >= 0).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added[0].startsWith('AUDIO_')).assertTrue();
        expect(/^AUDIO_\d{6,8}_\d{6}\.m4a$/.test(added[0])).assertTrue();
        expect(fileIo.statSync(pathOf(added[0])).size).assertEqual(0);
      } finally {
        fileIo.closeSync(fd);
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0200
     * @tc.name testFileContract0002
     * @tc.desc Verify createVideoFile returns a descriptor and an empty mp4 file
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createVideoFile(appContext());
      const added: string[] = addedNames(before);
      try {
        expect(fd >= 0).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added[0].startsWith('VIDEO_')).assertTrue();
        expect(/^VIDEO_\d{6,8}_\d{6}\.mp4$/.test(added[0])).assertTrue();
        expect(fileIo.statSync(pathOf(added[0])).size).assertEqual(0);
      } finally {
        fileIo.closeSync(fd);
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0300
     * @tc.name testFileContract0003
     * @tc.desc Verify an audio file keeps zero bytes after its descriptor is closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createAudioFile(appContext());
      fileIo.closeSync(fd);
      const added: string[] = addedNames(before);
      try {
        expect(added.length).assertEqual(1);
        expect(listNames().indexOf(added[0]) >= 0).assertTrue();
        expect(fileIo.statSync(pathOf(added[0])).size).assertEqual(0);
      } finally {
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0400
     * @tc.name testFileContract0004
     * @tc.desc Verify a video file keeps zero bytes after its descriptor is closed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createVideoFile(appContext());
      fileIo.closeSync(fd);
      const added: string[] = addedNames(before);
      try {
        expect(added.length).assertEqual(1);
        expect(added[0].endsWith('.mp4')).assertTrue();
        expect(fileIo.statSync(pathOf(added[0])).size).assertEqual(0);
      } finally {
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0500
     * @tc.name testFileContract0005
     * @tc.desc Verify an audio file can be reopened read-only after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createAudioFile(appContext());
      fileIo.closeSync(fd);
      const added: string[] = addedNames(before);
      let reader: fileIo.File | undefined = undefined;
      try {
        expect(added.length).assertEqual(1);
        reader = fileIo.openSync(pathOf(added[0]), fileIo.OpenMode.READ_ONLY);
        expect(reader.fd >= 0).assertTrue();
        expect(fileIo.statSync(pathOf(added[0])).size).assertEqual(0);
      } finally {
        if (reader !== undefined) {
          fileIo.closeSync(reader.fd);
        }
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0600
     * @tc.name testFileContract0006
     * @tc.desc Verify a video file can be reopened read-only after creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createVideoFile(appContext());
      fileIo.closeSync(fd);
      const added: string[] = addedNames(before);
      let reader: fileIo.File | undefined = undefined;
      try {
        expect(added.length).assertEqual(1);
        reader = fileIo.openSync(pathOf(added[0]), fileIo.OpenMode.READ_ONLY);
        expect(reader.fd >= 0).assertTrue();
        expect(added[0].endsWith('.mp4')).assertTrue();
      } finally {
        if (reader !== undefined) {
          fileIo.closeSync(reader.fd);
        }
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0700
     * @tc.name testFileContract0007
     * @tc.desc Verify the audio and video creators allocate two distinct targets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const audioFd: number = await RecorderFileUtil.createAudioFile(appContext());
      const videoFd: number = await RecorderFileUtil.createVideoFile(appContext());
      const added: string[] = addedNames(before);
      try {
        expect(audioFd >= 0).assertTrue();
        expect(videoFd >= 0).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.filter((name: string) => name.startsWith('AUDIO_')).length).assertEqual(1);
        expect(added.filter((name: string) => name.startsWith('VIDEO_')).length).assertEqual(1);
      } finally {
        fileIo.closeSync(audioFd);
        fileIo.closeSync(videoFd);
        added.forEach((name: string) => removeQuietly(name));
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_FILE_CONTRACT_0800
     * @tc.name testFileContract0008
     * @tc.desc Verify the audio name carries both unpadded date and padded time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL0
     */
    it('testFileContract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const before: string[] = listNames();
      const fd: number = await RecorderFileUtil.createAudioFile(appContext());
      const added: string[] = addedNames(before);
      try {
        expect(added.length).assertEqual(1);
        const stamp: string[] = added[0].substring(6, added[0].length - 4).split('_');
        expect(stamp.length).assertEqual(2);
        expect(stamp[0].length >= 6).assertTrue();
        expect(stamp[1].length).assertEqual(6);
      } finally {
        fileIo.closeSync(fd);
        added.forEach((name: string) => removeQuietly(name));
      }
    })
  })
}
