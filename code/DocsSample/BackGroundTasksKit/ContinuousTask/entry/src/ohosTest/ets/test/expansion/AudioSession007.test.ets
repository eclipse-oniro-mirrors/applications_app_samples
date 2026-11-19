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
 * @tc.number EXP_CT_SESSION_007
 * @tc.name 真实AVSession封装参数、替换和销毁异常 CT_SESSION_007
 * @tc.desc Catalog oracle: {"storedSession":"B","destroyOldSessionCalls":0}
 * @tc.level Level 1
 */
const runExpansionCase: () => Promise<void> = async (): Promise<void> => {
    const f = await ContinuousFixture.open();
    let primaryFailed: boolean = false;
    try {
      model.createAVSession(f.context);
      expect(f.calls.join('|')).assertEqual('createSession');
      expect(f.sessionContexts[0] === f.context).assertTrue();
      expect(f.sessionNames.join('|')).assertEqual('player');
      expect(f.sessionTypes.join('|')).assertEqual('audio');
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      f.sessionGate.resolve(f.sessionA.asSdk());
      await drain();
      expect(model.avSession === f.sessionA.asSdk()).assertTrue();
      f.sessionGate = new Deferred<avSession.AVSession>();
      model.createAVSession(f.context);
      f.sessionGate.resolve(f.sessionB.asSdk());
      await drain();
      expect(model.avSession === f.sessionB.asSdk()).assertTrue();
      expect(f.calls.join('|')).assertEqual('createSession|createSession');
      expect(f.errors.length).assertEqual(0);
    } catch (error) {
      primaryFailed = true;
      throw error as Error;
    } finally {
      await f.close(primaryFailed);
    }
  };

export default runExpansionCase;
