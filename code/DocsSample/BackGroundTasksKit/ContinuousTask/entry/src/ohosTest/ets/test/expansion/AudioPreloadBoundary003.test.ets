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
import { ExternalFile, ContinuousFixture, model, drain } from './ContinuousFixture';
import { Deferred } from './ContinuousExternal';
import { fileIo } from '@kit.CoreFileKit';
import { resourceManager } from '@kit.LocalizationKit';
/**
 * @tc.number EXP_V2_CT_PRELOAD_003
 * @tc.name PRELOAD explicit contract sequence 3
 * @tc.desc PRELOAD:{"fileOutcome":"sync-throw","index":0,"path":"system/etc/dynamic.wav","recoveryIndex":1,"recoveryPath":"audio/recovered.wav","sequence":"reset-route-initialized-prepared-duration-preload-inverse-route"}
 * @tc.size MediumTest
 * @tc.type Function
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playerIndex = 1;
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
      model.initAVPlayer();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
      originalList.audioFiles[0].fileUri = 'system/etc/dynamic.wav';
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
      f.fileThrows = true;
      expect(model.preLoad(0, f.context, firstCallback)).assertEqual(0);
      expect(model.playerIndex).assertEqual(0);
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset');
      expect(model.prepareCallback).assertNull();
      expect(f.player.fdSrc === originalSource).assertTrue();
      f.player.resetGate.resolve();
      await drain();
      expect(model.prepareCallback === firstCallback).assertTrue();
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset|open:/system/etc/dynamic.wav');
      expect(firstCallbacks).assertEqual(0);
      expect(secondCallbacks).assertEqual(0);
      expect(f.filePaths[0]).assertEqual('/system/etc/dynamic.wav');
      expect(f.fileModes[0]).assertEqual(262144);
      await drain();
      expect(f.errors.length).assertEqual(1);
      expect(model.prepareCallback === firstCallback).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(f.errors[0].includes('fileIo.open exception:')).assertTrue();
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|reset|open:/system/etc/dynamic.wav|prepare');
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
      expect(originalList.audioFiles[0].duration).assertEqual(42);
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
      originalList.audioFiles[1].fileUri = 'audio/recovered.wav';
      expect(model.preLoad(1, f.context, secondCallback)).assertEqual(0);
      expect(model.playerIndex).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      expect(f.player.fdSrc === afterFirstSource).assertTrue();
      f.player.resetGate.resolve();
      await drain();
      expect(model.prepareCallback === secondCallback).assertTrue();
      expect(f.calls.join('|')).assertEqual(
        'on:error|on:stateChange|reset|open:/system/etc/dynamic.wav|prepare|reset|raw:audio/recovered.wav'
      );
      f.resources.gate.resolve({ fd: 45, offset: 9, length: 222 });
      await drain();
      expect(f.player.fdSrc.fd).assertEqual(45);
      expect(f.player.fdSrc.offset).assertEqual(9);
      expect(f.player.fdSrc.length).assertEqual(222);
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual(
        'on:error|on:stateChange|reset|open:/system/etc/dynamic.wav|prepare|reset|raw:audio/recovered.wav|prepare'
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
      expect(originalList.audioFiles[1].duration).assertEqual(43);
      expect(originalList.audioFiles[0].duration).assertEqual(42);
      expect(model.playlist === originalList).assertTrue();
      expect(model.player === originalPlayer).assertTrue();
      expect(model.avSession === originalSession).assertTrue();
      expect(model.isPlaying).assertEqual(false);
      expect(f.errors.length).assertEqual(1);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
