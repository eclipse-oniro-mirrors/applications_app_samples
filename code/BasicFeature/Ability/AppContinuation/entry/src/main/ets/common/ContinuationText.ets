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

/** Resource adapter for string-only platform diagnostics. Consumers may bind a context-backed resolver. */
export type ContinuationTextResolver = (key: string, values: (string | number | boolean)[]) => string;

const CLIENT_DEFAULTS: Map<string, string> = new Map<string, string>([
  ['ac_continueclient_001', '[Address hidden]'],
  ['ac_continueclient_002', '[Path hidden]'],
  ['ac_continueclient_004', '[Identifier hidden]'],
  ['ac_continueclient_005', '[Hardware address hidden]'],
  ['ac_continueclient_006', '[Network address hidden]'],
  ['ac_continueclient_008', '[Long identifier hidden]'],
  ['ac_continueclient_009', '[Long number hidden]'],
  ['ac_continueclient_010', '[Sensitive field hidden]'],
  ['ac_continueclient_011', '[Quoted content hidden]'],
  ['ac_continueclient_012', 'No readable error message was provided by the platform.'],
  ['ac_continueclient_013', 'Redacted: {0}'],
  ['ac_continueclient_015', 'Unknown'],
  ['ac_continueclient_017', 'Missing or not numeric'],
  ['ac_continueclient_018', 'No result description was provided by the platform.'],
  ['ac_continueclient_019', 'Result description (redacted): {0}'],
  ['ac_continueclient_020', 'Already listening, waiting for unregistration, or disposed; on was not called again.'],
  ['ac_continueclient_021', 'on returned synchronously; waiting for the prepareContinue event.'],
  ['ac_continueclient_022', 'on threw synchronously. Register again or try unregistering.'],
  ['ac_continueclient_023', 'Waiting for unregistration callback, up to 8 seconds.'],
  ['ac_continueclient_024', 'No native registration slot needs cleanup in this runtime.'],
  ['ac_continueclient_025', 'Not received yet'],
  ['ac_continueclient_026', 'Unregistration timed out after 8 seconds. Register again or retry unregistration.'],
  ['ac_continueclient_027', 'off returned synchronously; waiting for its independent completion callback.'],
  ['ac_continueclient_028', 'A synchronous exception followed the off completion notification; keeping the completed state.'],
  ['ac_continueclient_029', 'off threw synchronously. Local listening is disabled; register again or retry unregistration.']
]);
let resolver: ContinuationTextResolver | undefined = undefined;

/** Keep the provider free of UIAbility or entry business dependencies. */
export function setContinuationTextResolver(next: ContinuationTextResolver | undefined): void {
  resolver = next;
}

export function continuationText(key: string, values: (string | number | boolean)[] = []): string {
  const current = resolver;
  if (current !== undefined) {
    try {
      return current(key, values);
    } catch (error) {
      // A resource provider failure must not replace the platform operation result.
    }
  }
  const template: string = CLIENT_DEFAULTS.get(key) ?? key;
  return template.replace(/\{(\d+)\}/g, (token: string, index: string): string => {
    const value = values[Number(index)];
    return value === undefined ? token : String(value);
  });
}
