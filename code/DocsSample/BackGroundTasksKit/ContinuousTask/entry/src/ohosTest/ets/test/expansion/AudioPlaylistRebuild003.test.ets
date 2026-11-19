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
 * @tc.number EXP_V2_CT_PLAYLIST_003
 * @tc.name PLAYLIST explicit contract sequence 3
 * @tc.desc PLAYLIST:{"callbackMode":"mutate-in-callback","index":0,"mutation":"name","sequence":"mutate-old-rebuild-callback-reentry-or-mutation-invalid-preload-rebuild-duration"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playerIndex = 0;
      model.isPlaying = false;
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
      let callbacks: number = 0;
      const callback = (): void => {};
      model.prepareCallback = callback;
      originalList.audioFiles[0].name = 'private-name-0';
      model.getPlaylist((): void => {
        callbacks++;
        expect(model.playlist.audioFiles.length).assertEqual(2);
        expect(model.playlist.audioFiles[0].name).assertEqual('dynamic.wav');
        expect(model.playlist.audioFiles[1].name).assertEqual('demo.wav');
        expect(model.playlist.audioFiles[0].duration).assertEqual(0);
        expect(model.playlist.audioFiles[1].duration).assertEqual(0);
        model.playlist.audioFiles[0].duration = 123;
        model.playlist.audioFiles[0].name = 'callback-owned';
      });
      expect(callbacks).assertEqual(1);
      const rebuiltList = model.playlist;
      const rebuiltFirst = rebuiltList.audioFiles[0];
      const rebuiltSecond = rebuiltList.audioFiles[1];
      expect(rebuiltList === originalList).assertFalse();
      expect(rebuiltFirst === originalFirst).assertFalse();
      expect(rebuiltSecond === originalSecond).assertFalse();
      expect(rebuiltList.audioFiles.length).assertEqual(2);
      expect(rebuiltFirst.fileUri).assertEqual('system/etc/dynamic.wav');
      expect(rebuiltSecond.fileUri).assertEqual('system/etc/demo.wav');
      expect(rebuiltFirst.name).assertEqual('callback-owned');
      expect(rebuiltSecond.name).assertEqual('demo.wav');
      expect(rebuiltFirst.duration).assertEqual(123);
      expect(rebuiltSecond.duration).assertEqual(0);
      expect(originalList.audioFiles.length).assertEqual(2);
      expect(model.player === originalPlayer).assertTrue();
      expect(model.avSession === originalSession).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.playerIndex).assertEqual(0);
      expect(model.isPlaying).assertEqual(false);
      expect(model.prepareCallback === callback).assertTrue();
      const expectedGuardDiagnostics: string[] = [
        'BackgroundPlayerFeature|preLoad ignored',
        'BackgroundPlayerFeature|preLoad ignored'
      ];
      expect(f.errors.length).assertEqual(0);
      expect(model.preLoad(-1, f.context, callback)).assertEqual(0);
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0]).assertEqual(expectedGuardDiagnostics[0]);
      expect(model.preLoad(2, f.context, callback)).assertEqual(0);
      expect(f.errors.length).assertEqual(expectedGuardDiagnostics.length);
      expect(f.errors[1]).assertEqual(expectedGuardDiagnostics[1]);
      expect(f.calls.length).assertEqual(0);
      let finalCallbacks: number = 0;
      model.getPlaylist((): void => { finalCallbacks++; });
      expect(finalCallbacks).assertEqual(1);
      expect(model.playlist === rebuiltList).assertFalse();
      expect(model.playlist.audioFiles[0] === rebuiltFirst).assertFalse();
      expect(model.playlist.audioFiles[1] === rebuiltSecond).assertFalse();
      expect(model.playlist.audioFiles.length).assertEqual(2);
      expect(model.playlist.audioFiles[0].name).assertEqual('dynamic.wav');
      expect(model.playlist.audioFiles[1].name).assertEqual('demo.wav');
      expect(model.playlist.audioFiles[0].duration).assertEqual(0);
      expect(model.playlist.audioFiles[1].duration).assertEqual(0);
      f.player.duration = 99;
      expect(model.getDuration()).assertEqual(99);
      expect(model.playlist.audioFiles[0].duration).assertEqual(99);
      expect(model.playlist.audioFiles[1].duration).assertEqual(0);
      expect(f.player.durationReads).assertEqual(1);
      expect(callbacks).assertEqual(1);
      expect(model.playerIndex).assertEqual(0);
      expect(model.isPlaying).assertEqual(false);
      expect(model.prepareCallback === callback).assertTrue();
      expect(f.calls.length).assertEqual(0);
      expect(f.errors.length).assertEqual(expectedGuardDiagnostics.length);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
