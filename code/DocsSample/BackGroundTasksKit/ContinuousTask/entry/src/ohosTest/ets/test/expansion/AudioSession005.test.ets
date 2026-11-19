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
 * @tc.number EXP_CT_SESSION_005
 * @tc.name 真实AVSession封装参数、替换和销毁异常 CT_SESSION_005
 * @tc.desc Catalog oracle: {"sessionDestroyCalls":1,"handled":true,"sessionReferenceRetained":"A"}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      f.sessionA.outcome = 'reject';
      model.destroyAVSession();
      await drain();
      expect(f.calls.join('|')).assertEqual('destroy');
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      expect(f.errors.length).assertEqual(1);
      expect(f.errors[0].includes('destroyAVSession failed: controlled session destroy failure')).assertTrue();
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
