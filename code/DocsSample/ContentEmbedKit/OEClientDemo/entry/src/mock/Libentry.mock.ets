/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { Context } from '@kit.AbilityKit';

// Return shape mirroring Result<T> declared in entry/src/main/cpp/types/libentry/Index.d.ts;
// declared locally so the mock stays self-contained (it replaces the module at
// mock time and cannot import types from the module it stands in for).
interface MockResult {
  errCode: number,
  data: Array<Object> | undefined
}

// Minimal offline mocks for the libentry.so NAPI exports. The real signatures
// are declared in entry/src/main/cpp/types/libentry/Index.d.ts; these stubs keep
// the same export names and call shapes so mock-enabled debugging does not hit
// "undefined is not a function". Querying succeeds with empty data; creation
// calls report CE_ERR_PARAM_INVALID (401) because no native runtime exists.
const NativeMock: Record<string, Object> = {
  'queryAll': (locale: string): MockResult => {
    return { errCode: 0, data: [] };
  },
  'query': (oeid: string, locale: string): MockResult => {
    return { errCode: 401, data: undefined };
  },
  'createByOEid': (ctx: Context, oeid: string, sandboxPath: string): MockResult => {
    return { errCode: 401, data: undefined };
  },
  'createFromLocal': (ctx: Context, srcPath: string, sandboxPath: string, fileUri: string,
    isLinking?: boolean): MockResult => {
    return { errCode: 401, data: undefined };
  },
  'createDormant': (ctx: Context, name: string, path: string, snapshotPath: string): MockResult => {
    return { errCode: 401, data: undefined };
  },
};

export default NativeMock;
