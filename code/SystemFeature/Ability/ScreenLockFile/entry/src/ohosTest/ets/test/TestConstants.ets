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

/*
 * TestConstants - Centralized constant management for ScreenLockFile test suites.
 * All test files should import constants from here instead of defining locally.
 */

// ==================== Hilog Constants ====================
export const DOMAIN: number = 0xF811;
export const TAG: string = '[Sample_ScreenLockFile]';

// ==================== Application Constants ====================
export const BUNDLE_NAME: string = 'com.samples.screenlockfile';
export const ABILITY_NAME: string = 'EntryAbility';
export const TEST_BUNDLE_PREFIX: string = 'ScreenLockFile_';

// ==================== Timing Constants ====================
export const UI_IDLE_TIME: number = 200;
export const UI_IDLE_TIMEOUT: number = 2000;
export const COMPONENT_WAIT_TIMEOUT: number = 5000;
export const API_CALL_INTERVAL: number = 50;
export const RAPID_CLICK_INTERVAL: number = 100;
export const STRESS_TEST_ITERATIONS: number = 10;
export const LONG_WAIT_TIMEOUT: number = 5000;

// ==================== Component IDs ====================
export const ID_QUERY_BUTTON: string = 'queryKeyStateButton';
export const ID_ACQUIRE_BUTTON: string = 'acquireAccessButton';
export const ID_RELEASE_BUTTON: string = 'releaseAccessButton';
export const ID_QUERY_ALL_BUTTON: string = 'queryAllStatesButton';
export const ID_CLEAR_HISTORY_BUTTON: string = 'clearHistoryButton';
export const ID_OPERATION_RESULT: string = 'operationResult';
export const ID_PAIRING_STATUS: string = 'pairingStatus';
export const ID_NO_HISTORY_TEXT: string = 'noHistoryText';

// ==================== UI Layout Constants ====================
export const PAGE_PADDING: number = 24;
export const SECTION_SPACING: number = 16;
export const ITEM_SPACING: number = 12;
export const TITLE_FONT_SIZE: number = 28;
export const SUBTITLE_FONT_SIZE: number = 20;
export const BODY_FONT_SIZE: number = 16;
export const SMALL_FONT_SIZE: number = 14;
export const CONTENT_MAX_WIDTH: number = 720;
export const BUTTON_HEIGHT: number = 48;
export const CARD_RADIUS: number = 12;
export const CARD_PADDING: number = 20;
export const MAX_HISTORY_SIZE: number = 10;

// ==================== Expected Text Fragments ====================
export const TEXT_KEY_STATE: string = 'KeyState';
export const TEXT_ACQUIRE: string = 'Acquire';
export const TEXT_RELEASE: string = 'Release';
export const TEXT_PENDING: string = 'Pending';
export const TEXT_QUERY_RESULT: string = 'queryAppKeyState';
export const TEXT_ACQUIRE_RESULT: string = 'acquireAccess';
export const TEXT_RELEASE_RESULT: string = 'releaseAccess';
export const TEXT_ERROR: string = 'Error';

// ==================== Test Metadata Constants ====================
export const TC_TYPE_FUNCTION: string = 'FUNCTION';
export const LEVEL_0: string = 'Level0';
export const LEVEL_1: string = 'Level1';
export const LEVEL_2: string = 'Level2';
export const SIZE_SMALL: string = 'SmallTest';
export const SIZE_MEDIUM: string = 'MediumTest';
export const SIZE_LARGE: string = 'LargeTest';

// ==================== Assertion Thresholds ====================
export const MIN_ASSERTIONS_PER_CASE: number = 3;
export const TARGET_ASSERTIONS_PER_CASE: number = 3.2;
export const TARGET_A_LEVEL_RATIO: number = 0.6;
export const MAX_LATENCY_MS: number = 1000;
export const PERFORMANCE_THRESHOLD_MS: number = 500;

// ==================== Enum Value Maps ====================
export interface EnumNamePair {
  name: string;
  value: number;
}

export const KEY_STATUS_NOT_EXIST: number = 0;
export const KEY_STATUS_RELEASED: number = 1;
export const KEY_STATUS_EXIST: number = 2;

export const ACCESS_STATUS_GRANTED: number = 0;
export const ACCESS_STATUS_DENIED: number = -1;

export const RELEASE_STATUS_GRANTED: number = 0;
export const RELEASE_STATUS_DENIED: number = 1;

// ==================== Test Suite Categories ====================
export const CATEGORY_ABILITY: string = 'Ability';
export const CATEGORY_API: string = 'API';
export const CATEGORY_UI: string = 'UI';
export const CATEGORY_STATE: string = 'State';
export const CATEGORY_EDGE: string = 'Edge';
export const CATEGORY_HISTORY: string = 'History';
export const CATEGORY_SECURITY: string = 'Security';
export const CATEGORY_PERFORMANCE: string = 'Performance';
export const CATEGORY_COMPAT: string = 'Compatibility';
export const CATEGORY_ACCESSIBLE: string = 'Accessible';
export const CATEGORY_I18N: string = 'I18N';
export const CATEGORY_CONFIG: string = 'Config';
export const CATEGORY_E2E: string = 'E2E';
export const CATEGORY_REGRESSION: string = 'Regression';

// ==================== Error Code Constants ====================
export interface ErrorCodeEntry {
  code: number;
  description: string;
}

export const ERROR_CODE_MIN: number = 1;
export const ERROR_CODE_BUSINESS_BASE: number = 10001;

// ==================== Resource Keys ====================
export const RESOURCE_KEY_PAGE_TITLE: string = 'page_title';
export const RESOURCE_KEY_PAGE_DESC: string = 'page_description';
export const RESOURCE_KEY_PRECONDITION_TITLE: string = 'precondition_title';
export const RESOURCE_KEY_OPERATION_READY: string = 'operation_ready';
export const RESOURCE_KEY_RESULT_TITLE: string = 'result_title';
export const RESOURCE_KEY_PAIRING_TITLE: string = 'pairing_status_title';
export const RESOURCE_KEY_HISTORY_TITLE: string = 'operation_history_title';
export const RESOURCE_KEY_CLEAR_HISTORY: string = 'clear_history';
export const RESOURCE_KEY_NO_HISTORY: string = 'no_history';
export const RESOURCE_KEY_QUERY_BUTTON: string = 'query_key_state';
export const RESOURCE_KEY_ACQUIRE_BUTTON: string = 'acquire_access';
export const RESOURCE_KEY_RELEASE_BUTTON: string = 'release_access';
export const RESOURCE_KEY_QUERY_ALL_BUTTON: string = 'query_all_states';
