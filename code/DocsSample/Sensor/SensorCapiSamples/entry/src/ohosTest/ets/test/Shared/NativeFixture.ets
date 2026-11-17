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

import nativeTest from 'libsensor_test.so';

export interface NativeObservation {
  trace: string;
  errors: string;
  messages: string;
  liveResources: number;
  activeSubscriptions: number;
  violations: number;
  waitMs: number;
  configuredType: number;
  configuredInterval: number;
  callbacks: number;
}

export function runNativeScenario(input: string): NativeObservation {
  const encoded: string = nativeTest.runScenario(input);
  const result: NativeObservation = JSON.parse(encoded) as NativeObservation;
  if (typeof result.trace !== 'string' || typeof result.violations !== 'number') {
    throw new Error('Native scenario returned an invalid observation');
  }
  return result;
}
