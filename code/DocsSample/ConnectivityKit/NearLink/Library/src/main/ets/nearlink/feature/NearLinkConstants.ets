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

// NearLink advertising interval (units: 0.625ms, 160 = 100ms)
export const ADV_INTERVAL_DEFAULT: number = 160;

// Scan timeout duration (milliseconds)
export const SCAN_TIMEOUT_MS: number = 5000;

// Maximum scan results to display
export const MAX_SCAN_RESULTS: number = 20;

// Maximum scan results for full scan page
export const MAX_SCAN_RESULTS_FULL: number = 50;

// Maximum log messages to keep
export const MAX_LOG_MESSAGES: number = 30;

// Maximum received data entries to display
export const MAX_RECEIVED_DATA: number = 50;

// Shared SSAP service UUID (custom UUID, standard UUID is not allowed)
export const NEARLINK_SERVICE_UUID: string = 'FFFFFFFF-1234-5678-ABCD-000000001234';

// DataTransfer service UUID (custom UUID)
export const DATA_TRANSFER_SERVICE_UUID: string = 'FFFFFFFF-1234-5678-ABCD-000000001244';

// SSAP property UUIDs (custom UUIDs)
export const SSAP_PROPERTY_UUID_1: string = 'FFFFFFFF-1234-5678-ABCD-000000001235';
export const SSAP_PROPERTY_UUID_2: string = 'FFFFFFFF-1234-5678-ABCD-000000001236';

// Manufacturer IDs
export const SSAP_MANUFACTURER_ID: number = 0x5A50;
export const DT_MANUFACTURER_ID: number = 0x5A51;

// Advertising demo service UUID (custom UUID)
export const ADV_DEMO_SERVICE_UUID: string = 'FFFFFFFF-1234-5678-ABCD-000000001254';

// Advertising demo manufacturer ID
export const ADV_DEMO_MANUFACTURER_ID: number = 0x1234;

// Connection state constant (1 = connected)
export const CONNECTION_STATE_CONNECTED: number = 1;
