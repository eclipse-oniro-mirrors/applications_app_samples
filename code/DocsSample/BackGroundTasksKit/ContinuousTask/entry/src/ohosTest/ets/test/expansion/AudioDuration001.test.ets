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
 * @tc.number EXP_CT_DURATION_001
 * @tc.name 时长缓存、上限、零负值和失效索引 CT_DURATION_001
 * @tc.desc Catalog oracle: {"return":500,"songDuration":500,"doesNotUseExternalDuration":true}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playlist.audioFiles[0].duration = 500;
      f.player.duration = 9999;
      expect(model.getDuration()).assertEqual(500);
      expect(model.playlist.audioFiles[0].duration).assertEqual(500);
      expect(f.calls.length).assertEqual(0);
      expect(f.player.durationReads).assertEqual(0);
      f.player.duration = 1;
      expect(model.getDuration()).assertEqual(500);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
