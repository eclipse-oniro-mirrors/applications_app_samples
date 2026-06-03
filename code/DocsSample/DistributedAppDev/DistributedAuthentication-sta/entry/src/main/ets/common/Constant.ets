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

export interface DistributedFilterOptionListType {
  isOnlineItemList: string[],
  isTrustedItemList: string[],
  authFormItemList: string[],
  rangeItemList: string[]
}

export const DISTRIBUTED_FILTER_OPTION_LIST: DistributedFilterOptionListType = {
  isOnlineItemList: [
    'No filter',
    'Online',
    'Offline',
  ],
  isTrustedItemList: [
    'No filter',
    'Trusted',
    'Untrusted',
  ],
  authFormItemList: [
    'No filter',
    'Same account',
    'Different account',
    'No account',
  ],
  rangeItemList: [
    'No filter',
    '50',
    '80',
    '100'
  ]
};