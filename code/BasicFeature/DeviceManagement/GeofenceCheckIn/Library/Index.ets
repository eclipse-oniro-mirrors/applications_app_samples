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

// Export the feature facade that owns the geofence checking business flow.
export { GeofenceFeature } from './src/main/ets/geofence/GeofenceFeature';
// Export the service that performs check-in actions inside a fence.
export { CheckInService } from './src/main/ets/geofence/feature/CheckInService';
// Export the service that manages fence creation and subscription.
export { FenceService } from './src/main/ets/geofence/feature/FenceService';
// Export the service that renders fence related notifications.
export { NotificationService } from './src/main/ets/geofence/feature/NotificationService';
// Export the store that persists check-in records locally.
export { RecordStore } from './src/main/ets/geofence/feature/RecordStore';
// Export the card component that shows the current fence status.
export { FenceStatusCard } from './src/main/ets/geofence/components/FenceStatusCard';
// Export the item component that renders one check-in record row.
export { CheckInRecordItem } from './src/main/ets/geofence/components/CheckInRecordItem';
// Export the unified logging utility used by all business modules.
export { Logger } from './src/main/ets/geofence/utils/Logger';
// Export the date and duration formatting helpers.
export { formatDateTime, formatDuration, formatTime, getDayStart, padTwo } from './src/main/ets/geofence/utils/TimeUtil';
// Export the shared helpers for strings, numbers, validation and arrays.
export { BasicUtil } from './src/main/ets/geofence/utils/BasicUtil';
// Export the sandbox file operation and MD5/SHA256/Base64/UUID security helpers.
export { FileSecurityUtil } from './src/main/ets/geofence/utils/FileSecurityUtil';
// Export the device info, bundle info, network status and HTTP helpers.
export { RuntimeNetUtil } from './src/main/ets/geofence/utils/RuntimeNetUtil';
// Export the shared model types, constants and factory helpers of the geofence domain.
export {
  createDefaultConfig,
  createEmptySummary,
  DEFAULT_RADIUS,
  FenceConfig,
  CheckInRecord,
  CheckInResult,
  DaySummary,
  FENCE_CAPABILITY_UNSUPPORTED,
  FenceOperationResult,
  FenceTransitionAction,
  INVALID_FENCE_ID,
  LocationResult,
  MAX_RADIUS,
  MIN_RADIUS,
  NO_ERROR,
  OPEN_END,
  PermissionSnapshot
} from './src/main/ets/geofence/model/GeofenceTypes';
