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
 * Existing schema-1 data values, not UI labels. Do not localize these values:
 * comparisons, archived evidence keys and old persisted records depend on them.
 * User-facing rendering resolves them through the separate resource mapping.
 */
export enum RecordValue {
  ENABLED = '已开启',
  DISABLED = '未开启',
  UNSUPPORTED = '设备不支持',
  QUERY_UNSUPPORTED = '查询不支持',
  TIMEOUT = '等待超时',
  PROBE_FAILED = '检测失败',
  QUERY_FAILED = '查询失败',
  NOT_QUERIED = '未获取',
  PENDING = '待调用',
  NOT_CALLED = '未调用',
  CALLING = '调用中',
  ERROR = '异常'
}

/** Historical string filters remain accepted, but UI selection uses outcome IDs. */
export enum LegacyHistoryFilter {
  ALL = '全部',
  SUCCESS = '成功',
  FAILURE = '失败',
  UNSUPPORTED = '不支持',
  TIMEOUT = '超时'
}
