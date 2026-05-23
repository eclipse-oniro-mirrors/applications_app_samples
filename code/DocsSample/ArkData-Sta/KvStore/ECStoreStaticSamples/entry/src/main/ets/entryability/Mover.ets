'use static'
/*
 * Copyright (c) 2025 - 2026 Huawei Device Co., Ltd.
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
// [Start kvstore_Mover]
import distributedKVStore from '@ohos.data.distributedKVStore';

export class Mover {
  async move(eStore: distributedKVStore.SingleKVStore, cStore: distributedKVStore.SingleKVStore): Promise<void> {
    if (eStore !== null && cStore !== null) {
      try {
        let entries = await cStore.getEntries('test_');
        for (let i: int = 0; i < entries.length; i++) {
          let entry = entries[i];
          await eStore.put(entry.key, entry.value.value as string);
        }
        console.info('ECDB_Encry move data success');
      } catch (e) {
        console.error('An unexpected error occurred in move');
      }
    }
  }
}
// [End kvstore_Mover]