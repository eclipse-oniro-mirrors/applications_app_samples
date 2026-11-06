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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import AVRecorderService from '../../../main/ets/services/AVRecorderService';
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

export default function recorderServiceSequenceTest() {
  describe('recorderServiceSequenceTest', () => {
    beforeEach(async () => {
      await paceTurn();
      removeQuietly(AUDIO_TARGET);
      removeQuietly(VIDEO_TARGET);
    });

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0100
     * @tc.name testServiceSequence0001
     * @tc.desc Verify the sequence prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0001', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0200
     * @tc.name testServiceSequence0002
     * @tc.desc Verify the sequence start-prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0002', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.startRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0300
     * @tc.name testServiceSequence0003
     * @tc.desc Verify the sequence prepareAudio-closeFd-stop leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0003', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
        await service.stopRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0400
     * @tc.name testServiceSequence0004
     * @tc.desc Verify the sequence prepareVideo-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0004', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0500
     * @tc.name testServiceSequence0005
     * @tc.desc Verify the sequence pause-prepareVideo-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0005', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.pauseRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0600
     * @tc.name testServiceSequence0006
     * @tc.desc Verify the sequence prepareVideo-closeFd-reset leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0006', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0700
     * @tc.name testServiceSequence0007
     * @tc.desc Verify the sequence prepareAudio leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0007', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0800
     * @tc.name testServiceSequence0008
     * @tc.desc Verify the sequence resume-prepareAudio leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0008', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resumeRecorder();
        await service.prepareAudioRecorder(appContext());
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_0900
     * @tc.name testServiceSequence0009
     * @tc.desc Verify the sequence prepareAudio-release leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0009', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
        await service.releaseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1000
     * @tc.name testServiceSequence0010
     * @tc.desc Verify the sequence prepareVideo leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0010', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1100
     * @tc.name testServiceSequence0011
     * @tc.desc Verify the sequence stop-prepareVideo leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0011', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.stopRecorder();
        await service.prepareVideoRecorder(appContext());
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1200
     * @tc.name testServiceSequence0012
     * @tc.desc Verify the sequence prepareVideo-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0012', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1300
     * @tc.name testServiceSequence0013
     * @tc.desc Verify the sequence prepareAudio-prepareVideo-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0013', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1400
     * @tc.name testServiceSequence0014
     * @tc.desc Verify the sequence reset-prepareAudio-prepareVideo-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0014', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resetRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1500
     * @tc.name testServiceSequence0015
     * @tc.desc Verify the sequence prepareAudio-prepareVideo-closeFd-reset leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0015', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareAudioRecorder(appContext());
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1600
     * @tc.name testServiceSequence0016
     * @tc.desc Verify the sequence prepareVideo-prepareAudio-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0016', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1700
     * @tc.name testServiceSequence0017
     * @tc.desc Verify the sequence release-prepareVideo-prepareAudio-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0017', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.releaseRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1800
     * @tc.name testServiceSequence0018
     * @tc.desc Verify the sequence prepareVideo-prepareAudio-closeFd-pause leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0018', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.prepareVideoRecorder(appContext());
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
        await service.pauseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_1900
     * @tc.name testServiceSequence0019
     * @tc.desc Verify the sequence create-prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0019', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2000
     * @tc.name testServiceSequence0020
     * @tc.desc Verify the sequence closeFd-create-prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0020', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.closeFd();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2100
     * @tc.name testServiceSequence0021
     * @tc.desc Verify the sequence create-prepareAudio-closeFd-resume leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0021', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
        await service.resumeRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2200
     * @tc.name testServiceSequence0022
     * @tc.desc Verify the sequence create-prepareVideo-stop-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0022', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.stopRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2300
     * @tc.name testServiceSequence0023
     * @tc.desc Verify the sequence start-create-prepareVideo-stop-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0023', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.startRecorder();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.stopRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2400
     * @tc.name testServiceSequence0024
     * @tc.desc Verify the sequence create-prepareVideo-stop-closeFd-stop leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0024', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.stopRecorder();
        await service.closeFd();
        await service.stopRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2500
     * @tc.name testServiceSequence0025
     * @tc.desc Verify the sequence create-prepareAudio-pause-resume-stop-release-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0025', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.pauseRecorder();
        await service.resumeRecorder();
        await service.stopRecorder();
        await service.releaseRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2600
     * @tc.name testServiceSequence0026
     * @tc.desc Verify the sequence pause-create-prepareAudio-pause-resume-stop-release-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0026', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.pauseRecorder();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.pauseRecorder();
        await service.resumeRecorder();
        await service.stopRecorder();
        await service.releaseRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2700
     * @tc.name testServiceSequence0027
     * @tc.desc Verify the sequence create-prepareAudio-pause-resume-stop-release-closeFd-reset leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0027', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.pauseRecorder();
        await service.resumeRecorder();
        await service.stopRecorder();
        await service.releaseRecorder();
        await service.closeFd();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2800
     * @tc.name testServiceSequence0028
     * @tc.desc Verify the sequence create-prepareVideo-reset-release-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0028', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.resetRecorder();
        await service.releaseRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_2900
     * @tc.name testServiceSequence0029
     * @tc.desc Verify the sequence resume-create-prepareVideo-reset-release-closeFd leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0029', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resumeRecorder();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.resetRecorder();
        await service.releaseRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3000
     * @tc.name testServiceSequence0030
     * @tc.desc Verify the sequence create-prepareVideo-reset-release-closeFd-release leaves video_example.mp4 and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0030', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.resetRecorder();
        await service.releaseRecorder();
        await service.closeFd();
        await service.releaseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('video_example.mp4')).isFile()).assertTrue();
        expect(listNames().indexOf('video_example.mp4') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3100
     * @tc.name testServiceSequence0031
     * @tc.desc Verify the sequence create-release-prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0031', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.releaseRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3200
     * @tc.name testServiceSequence0032
     * @tc.desc Verify the sequence stop-create-release-prepareAudio-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0032', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.stopRecorder();
        await service.createRecorder();
        await service.releaseRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3300
     * @tc.name testServiceSequence0033
     * @tc.desc Verify the sequence create-release-prepareAudio-closeFd-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0033', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.releaseRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3400
     * @tc.name testServiceSequence0034
     * @tc.desc Verify the sequence create-prepareAudio-create-prepareVideo-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0034', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3500
     * @tc.name testServiceSequence0035
     * @tc.desc Verify the sequence reset-create-prepareAudio-create-prepareVideo-closeFd leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0035', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resetRecorder();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3600
     * @tc.name testServiceSequence0036
     * @tc.desc Verify the sequence create-prepareAudio-create-prepareVideo-closeFd-reset leaves both recorder targets and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0036', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.createRecorder();
        await service.prepareVideoRecorder(appContext());
        await service.closeFd();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(2);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(added.indexOf('video_example.mp4') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3700
     * @tc.name testServiceSequence0037
     * @tc.desc Verify the sequence start leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0037', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.startRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3800
     * @tc.name testServiceSequence0038
     * @tc.desc Verify the sequence pause leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0038', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.pauseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_3900
     * @tc.name testServiceSequence0039
     * @tc.desc Verify the sequence resume leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0039', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resumeRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4000
     * @tc.name testServiceSequence0040
     * @tc.desc Verify the sequence stop leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0040', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.stopRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4100
     * @tc.name testServiceSequence0041
     * @tc.desc Verify the sequence reset leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0041', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4200
     * @tc.name testServiceSequence0042
     * @tc.desc Verify the sequence release leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0042', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.releaseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4300
     * @tc.name testServiceSequence0043
     * @tc.desc Verify the sequence closeFd leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0043', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4400
     * @tc.name testServiceSequence0044
     * @tc.desc Verify the sequence create-start leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0044', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.startRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4500
     * @tc.name testServiceSequence0045
     * @tc.desc Verify the sequence create-pause leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0045', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.pauseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4600
     * @tc.name testServiceSequence0046
     * @tc.desc Verify the sequence create-resume leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0046', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.resumeRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4700
     * @tc.name testServiceSequence0047
     * @tc.desc Verify the sequence create-stop leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0047', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.stopRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4800
     * @tc.name testServiceSequence0048
     * @tc.desc Verify the sequence create-reset leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0048', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_4900
     * @tc.name testServiceSequence0049
     * @tc.desc Verify the sequence create-release leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0049', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.releaseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5000
     * @tc.name testServiceSequence0050
     * @tc.desc Verify the sequence create-closeFd leaves no recorder target and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0050', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(0);
        expect(listNames().indexOf(AUDIO_TARGET) < 0).assertTrue();
        expect(listNames().indexOf(VIDEO_TARGET) < 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5100
     * @tc.name testServiceSequence0051
     * @tc.desc Verify the sequence create-prepareAudio-reset-pause leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0051', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.resetRecorder();
        await service.pauseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5200
     * @tc.name testServiceSequence0052
     * @tc.desc Verify the sequence create-prepareAudio-pause-resume leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0052', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.pauseRecorder();
        await service.resumeRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5300
     * @tc.name testServiceSequence0053
     * @tc.desc Verify the sequence create-prepareAudio-resume-stop leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0053', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.resumeRecorder();
        await service.stopRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5400
     * @tc.name testServiceSequence0054
     * @tc.desc Verify the sequence create-prepareAudio-stop-reset leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0054', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.stopRecorder();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5500
     * @tc.name testServiceSequence0055
     * @tc.desc Verify the sequence create-prepareAudio-reset-release leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0055', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.resetRecorder();
        await service.releaseRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5600
     * @tc.name testServiceSequence0056
     * @tc.desc Verify the sequence create-prepareAudio-release-closeFd leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0056', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.releaseRecorder();
        await service.closeFd();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })

    /**
     * @tc.number SUB_AVRECORDER_SVC_SEQ_5700
     * @tc.name testServiceSequence0057
     * @tc.desc Verify the sequence create-prepareAudio-closeFd-reset leaves audio_example.m4a and completes without exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testServiceSequence0057', 0, async () => {
      const before: string[] = listNames();
      const service: AVRecorderService = new AVRecorderService();
      let ok: boolean = true;
      try {
        await paceTurn();
        await service.createRecorder();
        await service.prepareAudioRecorder(appContext());
        await service.closeFd();
        await service.resetRecorder();
      } catch (error) {
        ok = false;
      } finally {
        await service.releaseRecorder();
        await service.closeFd();
      }
      const added: string[] = addedNames(before);
      try {
        expect(ok).assertTrue();
        expect(added.length).assertEqual(1);
        expect(added.indexOf('audio_example.m4a') >= 0).assertTrue();
        expect(fileIo.statSync(pathOf('audio_example.m4a')).isFile()).assertTrue();
        expect(listNames().indexOf('audio_example.m4a') >= 0).assertTrue();
      } finally {
        removeQuietly(AUDIO_TARGET);
        removeQuietly(VIDEO_TARGET);
      }
    })
  })
}
