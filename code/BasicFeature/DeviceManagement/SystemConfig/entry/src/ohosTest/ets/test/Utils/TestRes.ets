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
import { ResourceHelper } from 'library';

/**
 * Resource-based expectation helper for ohosTest cases.
 *
 * Text shown by the sample is resolved from string.json at runtime, so its concrete wording
 * depends on the device locale. Comparing an assertion against a hard-coded literal would make
 * the case pass or fail only by accident of the language setting, therefore expected values are
 * resolved from the same resource name that the production code uses. The resource name itself is
 * what the case verifies, which keeps the assertion stable for every locale.
 */
export class TestRes {
  /**
   * Resolves a string resource into the localized text used as an expected value.
   * @param {string} name - Resource name defined in string.json
   * @returns {string} Localized text of the resource
   */
  static str(name: string): string {
    return ResourceHelper.getStringByName(name);
  }

  /**
   * Resolves a formatted string resource with one placeholder filled in.
   * @param {string} name - Resource name defined in string.json
   * @param {string | number} arg - Argument of the first placeholder
   * @returns {string} Localized text of the resource with the placeholder replaced
   */
  static str1(name: string, arg: string | number): string {
    return ResourceHelper.getStringByName(name, arg);
  }

  /**
   * Resolves a formatted string resource with two placeholders filled in.
   * @param {string} name - Resource name defined in string.json
   * @param {string | number} first - Argument of the first placeholder
   * @param {string | number} second - Argument of the second placeholder
   * @returns {string} Localized text of the resource with the placeholders replaced
   */
  static str2(name: string, first: string | number, second: string | number): string {
    return ResourceHelper.getStringByName(name, first, second);
  }
}
