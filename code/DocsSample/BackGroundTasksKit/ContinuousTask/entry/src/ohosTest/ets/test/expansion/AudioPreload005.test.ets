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
import { fileIo } from '@kit.CoreFileKit';

/**
 * @tc.number EXP_CT_PRELOAD_005
 * @tc.name 重置、索引边界、系统文件和应用资源分流 CT_PRELOAD_005
 * @tc.desc Catalog oracle: {"return":0,"playerIndex":0,"route":"fileIo.open","routeArgument":"/system/etc/dynamic.wav","openMode":262144,"fdSrc":{"fd":33,"offset":0,"length":-1},"callbackStoredBeforeFileCompletion":true,"callbackNotYetCalled":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playlist.audioFiles[0].fileUri = 'system/etc/dynamic.wav';
      let callbacks: number = 0;
      const callback = (): void => { callbacks++; };
      const oldSource = f.player.fdSrc;
      expect(model.preLoad(0, f.context, callback)).assertEqual(0);
      expect(model.playerIndex).assertEqual(0);
      expect(f.calls.join('|')).assertEqual('reset');
      expect(model.prepareCallback).assertNull();
      f.player.resetGate.resolve();
      await drain();
      expect(model.prepareCallback === callback).assertTrue();
      expect(callbacks).assertEqual(0);
      expect(f.player.fdSrc === oldSource).assertTrue();
      expect(f.calls.join('|')).assertEqual('reset|open:/system/etc/dynamic.wav');
      expect(f.filePaths[0]).assertEqual('/system/etc/dynamic.wav');
      expect(f.fileModes[0]).assertEqual(262144);
      f.fileGate.resolve(new ExternalFile() as fileIo.File);
      await drain();
      expect(f.player.fdSrc.fd).assertEqual(33);
      expect(f.player.fdSrc.offset).assertEqual(0);
      expect(f.player.fdSrc.length).assertEqual(-1);
      expect(callbacks).assertEqual(0);
      expect(model.prepareCallback === callback).assertTrue();
      expect(f.errors.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
