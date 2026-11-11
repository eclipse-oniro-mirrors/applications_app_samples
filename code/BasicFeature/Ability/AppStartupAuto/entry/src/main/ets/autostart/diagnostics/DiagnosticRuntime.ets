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

import { AutoStartupApi, NativeStatusSnapshot, QueryClock, SystemQueryClock,
  systemAutoStartupApi, elapsedNow } from '../AutoStartupRuntime';
import { AutoStartupProbePort, CapabilityDiagnostic } from './CapabilityProbe';

/** The two independent entries call exactly the two public query APIs. */
export class RuntimeProbePort implements AutoStartupProbePort {
  private api: AutoStartupApi;
  constructor(api: AutoStartupApi = systemAutoStartupApi) {
    this.api = api;
  }
  async isSupported(): Promise<boolean> { return this.api.isAutoStartupSupported(); }
  isEnabledForSelf(): Promise<boolean> { return this.api.getAutoStartupStatusForSelf(); }
  nativeStatus(): NativeStatusSnapshot {
    return this.api.nativeStatus === undefined ? new NativeStatusSnapshot() : this.api.nativeStatus();
  }
}
const diagnosticClock: QueryClock = new SystemQueryClock();
export const capabilityDiagnostic: CapabilityDiagnostic = new CapabilityDiagnostic(new RuntimeProbePort(),
  (): number => elapsedNow(diagnosticClock), 3000, diagnosticClock);
