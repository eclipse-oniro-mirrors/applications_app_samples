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
// ES module requested-module order is significant. Do not sort or bypass these imports.
// 1. Bootstrap dependency evaluates and intercepts only the external createGattServer SDK API.
import { serverBootstrap } from './ServerBootstrap';
// 2. Real production module evaluates its eager singleton against that SDK interception.
import { GattServerManager } from '../../../../../main/ets/bluetoothService/GattServerManager';
// 3. This module body executes only after both dependencies; synchronously restore the SDK.
serverBootstrap.restore();
if (serverBootstrap.createCount !== 1 || !serverBootstrap.restored) {
  throw new Error('GattServerManager bootstrap order failed: expected exactly one intercepted singleton creation');
}
// Export the identical production constructor, never a proxy or business copy.
export { GattServerManager };
