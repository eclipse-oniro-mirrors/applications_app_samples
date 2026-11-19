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
import { ContinuousFixture, model, drain } from './ContinuousFixture';
import { Deferred } from './ContinuousExternal';
import { avSession } from '@kit.AVSessionKit';
/**
 * @tc.number EXP_V2_CT_SESSION_027
 * @tc.name SESSION explicit contract sequence 27
 * @tc.desc SESSION:{"createOutcome":"reject","destroyBeforeCreate":false,"destroyOutcome":"reject","index":1,"sequence":"optional-destroy-create-destroy-recover-create-destroy-twice"}
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
      const callback = (): void => {};
      model.prepareCallback = callback;
      model.createAVSession(f.context);
      expect(f.calls.join('|')).assertEqual('createSession');
      expect(f.sessionContexts[0] === f.context).assertTrue();
      expect(f.sessionNames[0]).assertEqual('player');
      expect(f.sessionTypes[0]).assertEqual('audio');
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      f.sessionGate.reject(new Error('create lifecycle rejected'));
      await drain();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(f.errors.length).assertEqual(1);
      f.sessionA.outcome = 'reject';
      model.destroyAVSession();
      await drain();
      expect(f.calls.join('|')).assertEqual('createSession|destroy');
      expect(f.errors.length).assertEqual(2);
      expect(model.playlist === originalList).assertTrue();
      expect(model.playlist.audioFiles[0] === originalFirst).assertTrue();
      expect(model.playlist.audioFiles[1] === originalSecond).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertEqual(true);
      expect(model.prepareCallback === callback).assertTrue();
      if (!f.sessionGate.settled) {
        f.sessionGate.resolve(f.sessionA.asSdk());
      }
      await drain();
      f.sessionThrows = false;
      f.sessionA.outcome = 'resolve';
      f.sessionB.outcome = 'resolve';
      f.sessionGate = new Deferred<avSession.AVSession>();
      model.createAVSession(f.context);
      expect(f.calls.join('|')).assertEqual('createSession|destroy|createSession');
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      f.sessionGate.resolve(f.sessionA.asSdk());
      await drain();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(f.sessionContexts.length).assertEqual(2);
      expect(f.sessionContexts[1] === f.context).assertTrue();
      expect(f.sessionNames.join('|')).assertEqual('player|player');
      expect(f.sessionTypes.join('|')).assertEqual('audio|audio');
      model.destroyAVSession();
      await drain();
      expect(f.calls.join('|')).assertEqual('createSession|destroy|createSession|destroy');
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      model.destroyAVSession();
      await drain();
      expect(f.calls.join('|')).assertEqual('createSession|destroy|createSession|destroy|destroy');
      expect(f.errors.length).assertEqual(2);
      expect(model.playlist === originalList).assertTrue();
      expect(model.playlist.audioFiles[0] === originalFirst).assertTrue();
      expect(model.playlist.audioFiles[1] === originalSecond).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertEqual(true);
      expect(model.prepareCallback === callback).assertTrue();
      expect(originalFirst.duration).assertEqual(0);
      expect(originalSecond.duration).assertEqual(0);
      expect(f.player.durationReads).assertEqual(0);
      expect(f.filePaths.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
