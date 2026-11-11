/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { onConnectCallback } from './idl/IDeviceConnectListener';
import { onDisconnectCallback } from './idl/IDeviceConnectListener';
import { onPlayCallback } from './idl/IDeviceConnectListener';
import { onPauseCallback } from './idl/IDeviceConnectListener';
import { onStoppedCallback } from './idl/IDeviceConnectListener';
import DeviceConnectListenerStub from './idl/DeviceConnectListenerStub';

class DeviceConnectListener extends DeviceConnectListenerStub {
}

export {
  onConnectCallback,
  onDisconnectCallback,
  onPlayCallback,
  onPauseCallback,
  onStoppedCallback,
  DeviceConnectListener
}
