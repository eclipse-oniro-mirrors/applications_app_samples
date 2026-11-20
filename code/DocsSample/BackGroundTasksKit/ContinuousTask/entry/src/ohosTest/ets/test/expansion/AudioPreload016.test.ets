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
 * @tc.number EXP_CT_PRELOAD_016
 * @tc.name 重置、索引边界、系统文件和应用资源分流 CT_PRELOAD_016
 * @tc.desc Catalog oracle: {"return":0,"route":"resourceManager.getRawFd","failureHandled":true,"fdSrcUnchanged":true,"newPrepareCallbackRetained":true,"callbackNotCalled":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playlist.audioFiles[0].fileUri = 'audio/demo.wav';
      let callbacks: number = 0;
      const callback = (): void => { callbacks++; };
      const before = f.player.fdSrc;
      f.resources.throws = true;
      expect(model.preLoad(0, f.context, callback)).assertEqual(0);
      f.player.resetGate.resolve();
      await drain();
      expect(f.calls.join('|')).assertEqual('reset|raw:audio/demo.wav');
      expect(f.player.fdSrc === before).assertTrue();
      expect(model.prepareCallback === callback).assertTrue();
      expect(callbacks).assertEqual(0);
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0].includes('getRawFd exception:')).assertTrue();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
