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
import { bleTarget, rethrowCaught } from './SdkInterop';
import { runCleanup } from './Cleanup';
import { MockKit, when } from '@ohos/hypium';
import { ble } from '@kit.ConnectivityKit';
import { ServerPort } from './ServerSdk';

/** Runs during dependency evaluation, before the next ServerSubject production import. */
class ServerImportBootstrap {
  private kit: MockKit = new MockKit();
  public createCount: number = 0;
  public restored: boolean = false;
  constructor() {
    try {
      when(this.kit.mockFunc(bleTarget, ble.createGattServer))().afterAction((): ble.GattServer => {
        this.createCount++;
        // The production singleton receives an external resource-free SDK port; cases use fresh real managers.
        return new ServerPort() as ble.GattServer;
      });
    } catch (error) {
      runCleanup((): void => { this.restore(); }, true); rethrowCaught(error);
    }
  }
  public restore(): void {
    this.kit.clear(bleTarget); this.kit.clearAll(); this.restored = true;
  }
}
export const serverBootstrap: ServerImportBootstrap = new ServerImportBootstrap();
