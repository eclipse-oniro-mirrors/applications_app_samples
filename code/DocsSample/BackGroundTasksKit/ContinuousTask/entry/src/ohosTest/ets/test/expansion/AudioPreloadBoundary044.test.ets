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
import { ContinuousFixture, model, drain, ExternalFile } from './ContinuousFixture';
import { Deferred } from './ContinuousExternal';
import { fileIo } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
/**
 * @tc.number EXP_V2_CT_PRELOAD_044
 * @tc.name PRELOAD explicit contract sequence 44
 * @tc.desc PRELOAD:{"fileOutcome":"reject","index":1,"path":"SYSTEM/demo.wav","recoveryIndex":0,"recoveryPath":"system/etc/recovered.wav","sequence":"reset-route-initialized-prepared-duration-preload-inverse-route"}
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
      model.initAVPlayer();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
      originalList.audioFiles[1].fileUri = 'SYSTEM/demo.wav';
      let firstCallbacks: number = 0;
      let secondCallbacks: number = 0;
      const firstCallback = (): void => {
        firstCallbacks++;
        expect(model.prepareCallback).assertNull();
      };
      const secondCallback = (): void => {
        secondCallbacks++;
        expect(model.prepareCallback).assertNull();
      };
      expect(model.preLoad(1, f.context, firstCallback)).assertEqual(0);
      expect(model.playerIndex).assertEqual(1);
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset');
      expect(model.prepareCallback).assertNull();
      expect(f.player.fdSrc === originalSource).assertTrue();
      f.player.resetGate.resolve();
      await drain();
      expect(model.prepareCallback === firstCallback).assertTrue();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset|raw:SYSTEM/demo.wav');
      expect(firstCallbacks).assertEqual(0);
      expect(secondCallbacks).assertEqual(0);
      expect(f.filePaths.length).assertEqual(0);
      f.resources.gate.reject(new Error('first descriptor rejected'));
      await drain();
      expect(f.errors.length).assertEqual(1);
      expect(model.prepareCallback === firstCallback).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(f.errors[0].includes('getRawFd failed:')).assertTrue();
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset|raw:SYSTEM/demo.wav|prepare');
      f.player.prepareGate.resolve();
      await drain();
      expect(firstCallbacks).assertEqual(0);
      f.player.emit('prepared');
      expect(firstCallbacks).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      f.player.emit('prepared');
      expect(firstCallbacks).assertEqual(1);
      f.player.duration = 42;
      expect(model.getDuration()).assertEqual(42);
      expect(originalList.audioFiles[1].duration).assertEqual(42);
      const afterFirstSource = f.player.fdSrc;
      f.player.settle();
      if (!f.fileGate.settled) {
        f.fileGate.resolve(new ExternalFile() as fileIo.File);
      }
      if (!f.resources.gate.settled) {
        f.resources.gate.resolve({ fd: 33, offset: 7, length: 101 });
      }
      await drain();
      f.player.resetGate = new Deferred<void>();
      f.player.prepareGate = new Deferred<void>();
      f.fileGate = new Deferred<fileIo.File>();
      f.resources.gate = new Deferred<resourceManager.RawFileDescriptor>();
      f.fileThrows = false;
      f.resources.throws = false;
      originalList.audioFiles[0].fileUri = 'system/etc/recovered.wav';
      expect(model.preLoad(0, f.context, secondCallback)).assertEqual(0);
      expect(model.playerIndex).assertEqual(0);
      expect(model.prepareCallback).assertNull();
      expect(f.player.fdSrc === afterFirstSource).assertTrue();
      f.player.resetGate.resolve();
      await drain();
      expect(model.prepareCallback === secondCallback).assertTrue();
      expect(f.calls.join('|')).assertEqual(
        'on:error|on:stateChange|reset|raw:SYSTEM/demo.wav|prepare|reset|open:/system/etc/recovered.wav'
      );
      f.fileGate.resolve(new ExternalFile() as fileIo.File);
      await drain();
      expect(f.player.fdSrc.fd).assertEqual(33);
      expect(f.player.fdSrc.offset).assertEqual(0);
      expect(f.player.fdSrc.length).assertEqual(-1);
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual(
        'on:error|on:stateChange|reset|raw:SYSTEM/demo.wav|prepare|reset|open:/system/etc/recovered.wav|prepare'
      );
      f.player.prepareGate.resolve();
      await drain();
      f.player.emit('prepared');
      expect(firstCallbacks).assertEqual(1);
      expect(secondCallbacks).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      f.player.emit('prepared');
      expect(secondCallbacks).assertEqual(1);
      f.player.duration = 43;
      expect(model.getDuration()).assertEqual(43);
      expect(originalList.audioFiles[0].duration).assertEqual(43);
      expect(originalList.audioFiles[1].duration).assertEqual(42);
      expect(model.playlist === originalList).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(model.avSession === originalSession).assertTrue();
      expect(model.isPlaying).assertEqual(true);
      expect(f.errors.length).assertEqual(1);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
