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
import { ContinuousFixture, model, thrownBy } from './ContinuousFixture';

/**
 * @tc.number EXP_CT_DURATION_010
 * @tc.name 时长缓存、上限、零负值和失效索引 CT_DURATION_010
 * @tc.desc Catalog oracle: {"throws":"TypeError reading duration on undefined Song"}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.playerIndex = 2;
      const error = thrownBy((): void => { model.getDuration(); });
      expect(error instanceof TypeError).assertTrue();
      expect(f.calls.length).assertEqual(0);
      expect(f.player.durationReads).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
