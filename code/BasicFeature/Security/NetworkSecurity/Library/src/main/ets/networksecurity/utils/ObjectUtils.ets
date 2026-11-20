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

import { Logger } from './Logger';

// Success marker stored in JsonParseResult when parsing worked.
const FLAG_SUCCESS: boolean = true;
// Failure marker stored in JsonParseResult and JsonStringifyResult.
const FLAG_FAILURE: boolean = false;

/**
 * Outcome of a guarded JSON.parse call: either parsed data or a message.
 */
export interface JsonParseResult {
  success: boolean;
  data: Object | null;
  message: string;
}

/**
 * Outcome of a guarded JSON.stringify call: either serialized text or a
 * message describing the failure.
 */
export interface JsonStringifyResult {
  success: boolean;
  text: string;
  message: string;
}

/**
 * Object helpers covering null checks, deep comparison and copying, runtime
 * type naming and guarded JSON conversion. Guarded variants return result
 * objects instead of throwing so callers never need try/catch for them.
 */
export class ObjectUtils {
  /**
   * Check whether a reference-typed value is undefined or null.
   * @param value object reference, may be undefined or null.
   * @returns true when the value holds no reference.
   */
  static isNull(value: Object | undefined | null): boolean {
    const tag: string = '[ObjectUtils#isNull]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.isNull', 1);
    // Both undefined and null mean "no value" for reference types.
    const result: boolean = value === undefined || value === null;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isNull', 1);
    return result;
  }

  /**
   * Check whether a reference-typed value holds an actual object.
   * @param value object reference, may be undefined or null.
   * @returns true when the value holds a usable reference.
   */
  static isNonNull(value: Object | undefined | null): boolean {
    const tag: string = '[ObjectUtils#isNonNull]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.isNonNull', 1);
    // Simply invert the null check to keep one source of truth.
    const result: boolean = !(value === undefined || value === null);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isNonNull', 1);
    return result;
  }

  /**
   * Compare two objects by their JSON text form. This avoids dynamic
   * property access, which ArkTS forbids, at the cost of being sensitive
   * to member order and skipping functions and undefined fields.
   * @param first left-hand object to compare.
   * @param second right-hand object to compare.
   * @returns true when both objects serialize to identical text.
   */
  static deepEqual(first: Object, second: Object): boolean {
    const tag: string = '[ObjectUtils#deepEqual]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.deepEqual', 1);
    // Serialize both sides once and compare the resulting text.
    const firstText: string = JSON.stringify(first);
    const secondText: string = JSON.stringify(second);
    const result: boolean = firstText === secondText;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.deepEqual', 1);
    return result;
  }

  /**
   * Parse a JSON text without throwing; failures are reported in the
   * returned result object instead.
   * @param text JSON text to parse.
   * @returns a JsonParseResult carrying data on success or a message on failure.
   */
  static safeJsonParse(text: string): JsonParseResult {
    const tag: string = '[ObjectUtils#safeJsonParse]';
    Logger.enter(tag, 'chars: ' + text.length.toString());
    Logger.beginTrace('NetworkSecurity.utils.safeJsonParse', 1);
    // Prepare a failure-shaped result so the happy path only overwrites data.
    let result: JsonParseResult = { success: FLAG_FAILURE, data: null, message: 'Invalid JSON text' };
    try {
      // Parse and wrap the outcome in the explicit result interface.
      const data: Object | null = JSON.parse(text);
      result = { success: FLAG_SUCCESS, data: data, message: 'Parsed' };
    } catch (error) {
      // Report the parser complaint instead of letting it escape. JSON.parse throws a
      // plain SyntaxError without a code, so the message is the useful detail here.
      const err: Error = error as Error;
      const detail: string = typeof err.message === 'string' ? err.message : 'unknown error';
      Logger.error(tag + ' parse failed: ' + detail);
      result = { success: FLAG_FAILURE, data: null, message: 'Invalid JSON text, ' + detail };
    }
    Logger.exit(tag, 'success: ' + result.success.toString());
    Logger.endTrace('NetworkSecurity.utils.safeJsonParse', 1);
    return result;
  }

  /**
   * Serialize an object to JSON text without throwing; failures are
   * reported in the returned result object instead.
   * @param value object to serialize, null serializes to the text "null".
   * @returns a JsonStringifyResult carrying text on success or a message on failure.
   */
  static safeJsonStringify(value: Object | null): JsonStringifyResult {
    const tag: string = '[ObjectUtils#safeJsonStringify]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.safeJsonStringify', 1);
    // Prepare a failure-shaped result for the guard clause below.
    let result: JsonStringifyResult = { success: FLAG_FAILURE, text: '', message: 'Not serialized' };
    try {
      // Serialize with the standard writer; null becomes the text "null".
      const text: string = JSON.stringify(value);
      result = { success: FLAG_SUCCESS, text: text, message: 'Serialized' };
    } catch (error) {
      // Cyclic structures or BigInt values land here as a plain TypeError without
      // a code, so the thrown message is the useful detail here.
      const err: Error = error as Error;
      const detail: string = typeof err.message === 'string' ? err.message : 'unknown error';
      Logger.error(tag + ' stringify failed: ' + detail);
      result = { success: FLAG_FAILURE, text: '', message: 'Not serialized, ' + detail };
    }
    Logger.exit(tag, 'success: ' + result.success.toString());
    Logger.endTrace('NetworkSecurity.utils.safeJsonStringify', 1);
    return result;
  }

  /**
   * Return the runtime type name of a value, including "null" and
   * "undefined" as dedicated names.
   * @param value value of any supported runtime type.
   * @returns one of: null, undefined, string, number, boolean, object.
   */
  static getType(value: Object | string | number | boolean | null | undefined): string {
    const tag: string = '[ObjectUtils#getType]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.getType', 1);
    // typeof null reports "object", so name null explicitly first.
    let result: string = 'undefined';
    if (value === null) {
      result = 'null';
    } else if (value !== undefined) {
      // Runtime typeof is allowed; only type-level typeof queries are not.
      result = typeof value;
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.getType', 1);
    return result;
  }

  /**
   * Copy an object through one JSON round trip. Functions, prototypes and
   * undefined fields are dropped, which is acceptable for plain data.
   * @param value object to copy, null is returned unchanged.
   * @returns an independent copy, or null for null input.
   */
  static deepCopy(value: Object | null): Object | null {
    const tag: string = '[ObjectUtils#deepCopy]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.deepCopy', 1);
    // Null input stays null so callers can chain the check.
    let result: Object | null = null;
    if (value !== null) {
      // Serialize then parse again to break all references.
      const outcome: JsonStringifyResult = ObjectUtils.safeJsonStringify(value);
      if (outcome.success) {
        const parsed: JsonParseResult = ObjectUtils.safeJsonParse(outcome.text);
        result = parsed.success ? parsed.data : null;
      }
    }
    Logger.exit(tag, 'copied: ' + (result !== null).toString());
    Logger.endTrace('NetworkSecurity.utils.deepCopy', 1);
    return result;
  }
}
