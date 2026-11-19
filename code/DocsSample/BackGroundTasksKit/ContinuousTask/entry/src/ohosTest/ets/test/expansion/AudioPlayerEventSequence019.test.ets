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
/**
 * @tc.number EXP_V2_CT_EVENT_019
 * @tc.name EVENT explicit contract sequence 19
 * @tc.desc EVENT:{"index":1,"prefixStates":["idle"],"prepareMode":"resolve","reentry":false,"sequence":"prefix-initialized-prepared-reprepared-error"}
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
      model.initAVPlayer();
      const stateCallback = f.player.stateListener;
      const errorCallback = f.player.errorListener;
      f.player.emit('idle');
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange');
      expect(model.isPlaying).assertEqual(true);
      expect(model.prepareCallback).assertNull();
      let firstCalls: number = 0;
      const firstCallback = (): void => {
        firstCalls++;
        expect(model.prepareCallback).assertNull();
      };
      model.prepareCallback = firstCallback;
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|prepare');
      expect(firstCalls).assertEqual(0);
      expect(model.prepareCallback === firstCallback).assertTrue();
      f.player.prepareGate.resolve();
      await drain();
      expect(f.errors.length).assertEqual(0);
      expect(firstCalls).assertEqual(0);
      expect(model.prepareCallback === firstCallback).assertTrue();
      f.player.emit('prepared');
      expect(firstCalls).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      expect(model.playlist === originalList).assertTrue();
      f.player.emit('prepared');
      expect(firstCalls).assertEqual(1);
      expect(model.prepareCallback).assertNull();
      f.player.emit('prepared');
      expect(firstCalls).assertEqual(1);
      f.player.emit('initialized');
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|prepare');
      expect(f.player.stateListener === stateCallback).assertTrue();
      expect(f.player.errorListener === errorCallback).assertTrue();
      expect(model.playerIndex).assertEqual(1);
      expect(model.isPlaying).assertEqual(true);
      expect(model.player === originalPlayer).assertTrue();
      expect(model.avSession === originalSession).assertTrue();
      expect(f.player.fdSrc === originalSource).assertTrue();
      expect(model.playlist.audioFiles[0].name).assertEqual('dynamic.wav');
      expect(model.playlist.audioFiles[1].name).assertEqual('demo.wav');
      expect(model.playlist.audioFiles[0].duration).assertEqual(0);
      expect(model.playlist.audioFiles[1].duration).assertEqual(0);
      f.player.errorListener(new Error('post-prepared decoder error'));
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0].includes('player error: post-prepared decoder error')).assertTrue();
      expect(firstCalls).assertEqual(1);
      expect(f.calls.join('|')).assertEqual('on:error|on:stateChange|prepare');
      expect(f.player.durationReads).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
