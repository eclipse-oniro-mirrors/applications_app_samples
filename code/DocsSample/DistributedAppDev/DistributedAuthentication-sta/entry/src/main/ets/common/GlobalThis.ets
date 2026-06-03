'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file or copy of the License.
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export class GlobalContext {
  private constructor() {
  }

  private static instance: GlobalContext = new GlobalContext();
  private objects: Map<string, Object> = new Map<string, Object>();

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getObject(value: string): Object | undefined {
    return this.objects.get(value);
  }

  setObject(key: string, objectClass: Object): void {
    this.objects.set(key, objectClass);
  }
}

export function getGlobalObject(key: string): Object {
  if (GlobalContext.getContext().getObject(key) === undefined) {
    return '' as Object;
  }
  return GlobalContext.getContext().getObject(key)!;
}

export function setGlobalObject(key: string, value: Object): void {
  GlobalContext.getContext().setObject(key, value);
}