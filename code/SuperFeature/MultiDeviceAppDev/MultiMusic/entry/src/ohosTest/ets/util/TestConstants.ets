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

/**
 * Identity values shared by the ohosTest suites.
 *
 * The bundle and module names are repeated on every resource lookup and every
 * ability launch, so they are declared once here instead of being copied as
 * literals into each suite.
 */

/** Bundle name declared in AppScope/app.json5. */
export const BUNDLE_NAME: string = 'com.sample.multimusic';

/**
 * Module name of the test hap. Resource.moduleName resolves to it for both the
 * test created and the main side Resources, because the test hap merges them.
 */
export const TEST_MODULE_NAME: string = 'entry_test';

/** Module name of the application hap that owns EntryAbility and its pages. */
export const MAIN_MODULE_NAME: string = 'entry';

/** Ability started by the UI suites before they look for components. */
export const ENTRY_ABILITY_NAME: string = 'EntryAbility';
