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
import { ContinuousFixture, model, drain, thrownBy } from './ContinuousFixture';
import { Deferred } from './ContinuousExternal';
import { avSession } from '@kit.AVSessionKit';
/**
 * @tc.number EXP_V2_CT_CONTROL_028
 * @tc.name CONTROL explicit contract sequence 28
 * @tc.desc CONTROL:{"flag":9,"isPlaying":true,"playOutcome":"reject","recoveryGate":false,"sequence":"play-pause-stop-inverse-gate-successful-replay","sessionOutcome":"reject","stopOutcome":"reject"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playerIndex = 0;
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
      const callback = (): void => {};
      model.prepareCallback = callback;
      const playError = thrownBy((): void => { model.playMusic(9, true, f.context); });
      expect(playError).assertNull();
      expect(f.player.playGate.settled).assertEqual(false);
      expect(f.calls.join('|')).assertEqual('play|createSession');
      expect(f.sessionContexts[0] === f.context).assertTrue();
      expect(f.sessionNames[0]).assertEqual('player');
      expect(f.sessionTypes[0]).assertEqual('audio');
      f.player.playGate.reject(f.player.failure);
      f.sessionGate.reject(new Error('session creation rejected'));
      await drain();
      expect(f.errors.length).assertEqual(2);
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.isPlaying).assertEqual(true);
      model.pauseMusic();
      f.player.pauseGate.resolve();
      await drain();
      expect(f.calls.join('|')).assertEqual('play|createSession|pause');
      model.stopMusic();
      expect(f.calls.join('|')).assertEqual('play|createSession|pause|stop');
      f.player.stopGate.reject(f.player.failure);
      await drain();
      expect(f.calls.join('|')).assertEqual('play|createSession|pause|stop');
      expect(f.errors.length).assertEqual(3);
      expect(model.playlist === originalList).assertTrue();
      expect(model.playlist.audioFiles[0] === originalFirst).assertTrue();
      expect(model.playlist.audioFiles[1] === originalSecond).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.playerIndex).assertEqual(0);
      expect(model.isPlaying).assertEqual(true);
      expect(model.prepareCallback === callback).assertTrue();
      f.player.settle();
      if (!f.sessionGate.settled) {
        f.sessionGate.resolve(f.sessionA.asSdk());
      }
      await drain();
      f.player.playThrows = false;
      f.sessionThrows = false;
      f.player.playGate = new Deferred<void>();
      f.player.pauseGate = new Deferred<void>();
      f.player.stopGate = new Deferred<void>();
      f.sessionGate = new Deferred<avSession.AVSession>();
      model.isPlaying = false;
      model.playMusic(0, false, f.context);
      expect(f.calls.join('|')).assertEqual('play|createSession|pause|stop');
      model.playMusic(0, true, f.context);
      expect(f.calls.join('|')).assertEqual('play|createSession|pause|stop|play|createSession');
      expect(f.player.playGate.settled).assertEqual(false);
      f.player.playGate.resolve();
      f.sessionGate.resolve(f.sessionA.asSdk());
      await drain();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.isPlaying).assertEqual(false);
      model.pauseMusic();
      await drain();
      model.stopMusic();
      await drain();
      expect(f.calls.join('|')).assertEqual('play|createSession|pause|stop|play|createSession');
      expect(f.errors.length).assertEqual(3);
      expect(model.playlist === originalList).assertTrue();
      expect(model.playlist.audioFiles[0] === originalFirst).assertTrue();
      expect(model.playlist.audioFiles[1] === originalSecond).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.playerIndex).assertEqual(0);
      expect(model.isPlaying).assertEqual(false);
      expect(model.prepareCallback === callback).assertTrue();
      expect(originalFirst.duration).assertEqual(0);
      expect(originalSecond.duration).assertEqual(0);
      expect(originalFirst.name).assertEqual('dynamic.wav');
      expect(originalSecond.name).assertEqual('demo.wav');
      expect(f.player.durationReads).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
