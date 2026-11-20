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
import { expect } from '@ohos/hypium';
import { ContinuousFixture, model } from './ContinuousFixture';
/**
 * @tc.number EXP_V2_CT_DURATION_037
 * @tc.name DURATION explicit contract sequence 37
 * @tc.desc DURATION:{"index":1,"initialCache":0,"sdkDuration":0,"sequence":"read-change-read-rebuild-cap-cache-invalid-preload"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playerIndex = 1;
      model.isPlaying = true;
      const originalList = model.playlist;
      const originalFirst = originalList.audioFiles[0];
      const originalSecond = originalList.audioFiles[1];
      const originalPlayer = model.player;
      const originalSession = model.avSession;
      const originalSource = f.player.fdSrc;
      expect(originalList.audioFiles.length).assertEqual(2);
      expect(originalFirst.name).assertEqual('dynamic.wav');
      expect(originalFirst.fileUri).assertEqual('system/etc/dynamic.wav');
      expect(originalSecond.name).assertEqual('demo.wav');
      expect(originalSecond.fileUri).assertEqual('system/etc/demo.wav');
      expect(originalPlayer === f.player.asSdk()).assertTrue();
      expect(originalSession === f.sessionA.asSdk()).assertTrue();
      expect(f.calls.length).assertEqual(0);
      expect(f.errors.length).assertEqual(0);
      let callbackCalls: number = 0;
      const callback = (): void => { callbackCalls++; };
      model.prepareCallback = callback;
      originalList.audioFiles[1].duration = 0;
      originalList.audioFiles[0].duration = 91;
      f.player.duration = 0;
      expect(f.player.durationReads).assertEqual(0);
      expect(model.getDuration()).assertEqual(0);
      expect(originalList.audioFiles[1].duration).assertEqual(0);
      expect(f.player.durationReads).assertEqual(1);
      expect(callbackCalls).assertEqual(0);
      f.player.duration = 37;
      expect(model.getDuration()).assertEqual(37);
      expect(f.player.durationReads).assertEqual(2);
      expect(originalList.audioFiles[1].duration).assertEqual(37);
      expect(originalList.audioFiles[0].duration).assertEqual(91);
      expect(model.playlist === originalList).assertTrue();
      expect(model.playlist.audioFiles[0] === originalFirst).assertTrue();
      expect(model.playlist.audioFiles[1] === originalSecond).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertEqual(true);
      expect(model.prepareCallback === callback).assertTrue();
      let rebuildCallbacks: number = 0;
      model.getPlaylist((): void => {
        rebuildCallbacks++;
        expect(model.playlist.audioFiles.length).assertEqual(2);
        expect(model.playlist.audioFiles[0].duration).assertEqual(0);
        expect(model.playlist.audioFiles[1].duration).assertEqual(0);
      });
      expect(rebuildCallbacks).assertEqual(1);
      expect(model.playlist === originalList).assertFalse();
      expect(model.playlist.audioFiles[0] === originalFirst).assertFalse();
      expect(model.playlist.audioFiles[1] === originalSecond).assertFalse();
      expect(originalList.audioFiles[1].duration).assertEqual(37);
      expect(originalList.audioFiles[0].duration).assertEqual(91);
      f.player.duration = 97616;
      expect(model.getDuration()).assertEqual(97615);
      expect(f.player.durationReads).assertEqual(3);
      expect(model.playlist.audioFiles[1].duration).assertEqual(97615);
      expect(model.playlist.audioFiles[0].duration).assertEqual(0);
      f.player.duration = 1;
      expect(model.getDuration()).assertEqual(97615);
      expect(f.player.durationReads).assertEqual(3);
      const expectedGuardDiagnostics: string[] = [
        'BackgroundPlayerFeature|preLoad ignored',
        'BackgroundPlayerFeature|preLoad ignored'
      ];
      expect(model.preLoad(-1, f.context, callback)).assertEqual(0);
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0]).assertEqual(expectedGuardDiagnostics[0]);
      expect(model.preLoad(2, f.context, callback)).assertEqual(0);
      expect(model.prepareCallback === callback).assertTrue();
      expect(callbackCalls).assertEqual(0);
      expect(model.player === originalPlayer).assertTrue();
      expect(model.avSession === originalSession).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertEqual(true);
      expect(model.playlist.audioFiles[0].name).assertEqual('dynamic.wav');
      expect(model.playlist.audioFiles[1].name).assertEqual('demo.wav');
      expect(model.playlist.audioFiles[0].fileUri).assertEqual('system/etc/dynamic.wav');
      expect(model.playlist.audioFiles[1].fileUri).assertEqual('system/etc/demo.wav');
      expect(f.calls.length).assertEqual(0);
      expect(f.errors.length).assertEqual(expectedGuardDiagnostics.length);
      expect(f.errors[0]).assertEqual(expectedGuardDiagnostics[0]);
      expect(f.errors[1]).assertEqual(expectedGuardDiagnostics[1]);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
