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

import { Available, deviceInfo, SuppressWarnings, SuppressWarningsType } from '@kit.BasicServicesKit';

export const AVAILABLE_MIN_API_VERSION: number = 22;
export const SUPPRESS_ANNOTATION_SINCE_API_VERSION: number = 23;
export const FUTURE_DEMO_API_VERSION: number = 27;
const MOCK_API_VERSION: number = 21;

@Available({ minApiVersion: '22' })
function runAvailableAnnotatedDemo(): boolean {
  return true;
}

@Available({ minApiVersion: '27' })
function runFutureAnnotatedDemo(): boolean {
  return true;
}

@SuppressWarnings({ rules: [SuppressWarningsType.COMPATIBILITY] })
function runSuppressedFutureDemo(): boolean {
  return runFutureAnnotatedDemo();
}

export class AnnotationService {
  public static getLocalApiVersion(): number {
    return deviceInfo.sdkApiVersion;
  }

  public static getMockApiVersion(): number {
    return MOCK_API_VERSION;
  }

  public static runAvailableDemo(): boolean {
    if (deviceInfo.sdkApiVersion >= AVAILABLE_MIN_API_VERSION) {
      return runAvailableAnnotatedDemo();
    }
    return false;
  }

  public static runMockAvailableDemo(): boolean {
    return MOCK_API_VERSION >= AVAILABLE_MIN_API_VERSION;
  }

  public static runSuppressWarningsDemo(): boolean {
    if (deviceInfo.sdkApiVersion >= FUTURE_DEMO_API_VERSION) {
      return runSuppressedFutureDemo();
    }
    return false;
  }

  public static runMockSuppressWarningsDemo(): boolean {
    return MOCK_API_VERSION >= FUTURE_DEMO_API_VERSION;
  }

  public static getSuppressionRules(): string[] {
    return [
      SuppressWarningsType.COMPATIBILITY,
      SuppressWarningsType.SYSCAP,
      SuppressWarningsType.PERMISSION
    ];
  }
}
