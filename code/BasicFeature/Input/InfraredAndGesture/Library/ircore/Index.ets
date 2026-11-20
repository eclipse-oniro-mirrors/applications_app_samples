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

export {
  IrProtocol,
  IrCode,
  IrFrame,
  IrCompileError,
  IrCompileResult,
  IrCapability,
  TransmitResultCode,
  TransmitResult,
  SendState,
  SendProgress,
  SendSource,
  SendFrame,
  SendStep,
  SendJob,
  SendTicket,
  IrBrandEntry,
  IrLibraryIndex,
  IrLibraryCode
} from './src/main/ets/model/IrTypes';

export { IrCapabilityProbe } from './src/main/ets/service/IrCapabilityProbe';
export { IrCodeCompiler } from './src/main/ets/service/IrCodeCompiler';
export { IrTransmitter } from './src/main/ets/service/IrTransmitter';
export { IrSendQueue } from './src/main/ets/service/IrSendQueue';
export { KeyTester } from './src/main/ets/service/KeyTester';
export { TransmitErrorMapper } from './src/main/ets/service/TransmitErrorMapper';
export { IrLibraryRepository } from './src/main/ets/data/IrLibraryRepository';
