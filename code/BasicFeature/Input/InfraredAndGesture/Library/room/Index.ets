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

// Domain model types and label helpers.
export {
  DeviceType,
  KeySemantic,
  PowerState,
  StateSource,
  Room,
  Device,
  RoomKey,
  RemoteTemplate,
  Scene,
  SceneStep,
  DeviceExpectedState,
  SendLog,
  SceneValidation,
  SceneRunResult,
  ConfigExportResult,
  ConfigImportReport,
  MigrationResult,
  getDeviceTypeLabel,
  getKeySemanticLabel
} from './src/main/ets/model/RoomTypes';

export { AppDatabase } from './src/main/ets/data/AppDatabase';
export { SchemaMigration } from './src/main/ets/data/SchemaMigration';
export { RoomDao } from './src/main/ets/data/RoomDao';
export { DeviceDao } from './src/main/ets/data/DeviceDao';
export { KeyDao } from './src/main/ets/data/KeyDao';
export { IrCodeDao } from './src/main/ets/data/IrCodeDao';
export { RemoteTemplateDao } from './src/main/ets/data/RemoteTemplateDao';
export { SceneDao } from './src/main/ets/data/SceneDao';
export { SceneStepDao } from './src/main/ets/data/SceneStepDao';
export { ExpectedStateDao } from './src/main/ets/data/ExpectedStateDao';
export { SendLogDao } from './src/main/ets/data/SendLogDao';

export { DefaultConfigSeeder } from './src/main/ets/data/DefaultConfigSeeder';
export { ExpectedStateService } from './src/main/ets/service/ExpectedStateService';
export { SceneValidator } from './src/main/ets/service/SceneValidator';
export { ConfigPackageSchema, ConfigPackageData } from './src/main/ets/service/ConfigPackageSchema';
export { ConfigPackageService } from './src/main/ets/service/ConfigPackageService';
export { IrLibraryImporter } from './src/main/ets/service/IrLibraryImporter';
export { RemoteTemplateSeeder } from './src/main/ets/service/RemoteTemplateSeeder';
