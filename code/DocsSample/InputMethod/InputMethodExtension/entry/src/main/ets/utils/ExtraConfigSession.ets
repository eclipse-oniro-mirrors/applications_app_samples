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
 * 扩展信息（@ohos.inputMethod.ExtraConfig）的演示会话。
 *
 * 真实链路：编辑框设置 InputMethodExtraConfig → 系统框架在拉起输入法时把它交给
 * 输入法应用的 EditorAttribute.extraConfig。本示例是 UIAbility，没有"被拉起"这一刻，
 * 所以这一层只做三件可复核的事：构造配置、按 UTF-8 算长度（32KB 额度）、
 * 用 StubEditorAttribute 复现输入法侧的读取路径。每一步都返回 CallOutcome，
 * 页面与用例读同一份结果，避免"页面说通过、用例断言另一种结论"。
 */

import { InputMethodExtraConfig } from '@kit.IMEKit';
import {
  ApiStatus,
  CallOutcome,
  ERROR_CODE_INVALID_PARAM,
  ERROR_CODE_LOCAL_UNEXPECTED_THROW,
  failedOutcome,
  okOutcome
} from '../model/CallOutcome';
import { EXTRA_CONFIG_MAX_BYTES } from '../common/AppConstants';
import { text } from '../common/L10n';
import {
  ConfigEntry,
  StubEditorAttribute,
  buildExtraConfig,
  configByteLength,
  configFromJson,
  configJson,
  defaultEntries,
  describeEntries,
  paddedEntries,
  readExtraConfig
} from '../model/ExtraConfigModel';

const API_BUILD: string = 'buildExtraConfig';
const API_READ: string = 'readExtraConfig';
const API_JSON: string = 'configFromJson';
const API_PADDED: string = 'paddedEntries';

const STUB_BUNDLE: string = 'com.example.inputmethodextension';
/** 打桩编辑框的输入类型：inputMethod.Pattern.PATTERN_TEXT 的值，只用于让形状更接近真实对象 */
const STUB_INPUT_PATTERN: number = 0;

/** 默认四组键值：构造成功即说明三种值类型都能放进 customSettings */
export function buildDefaultOutcome(): CallOutcome {
  const start = Date.now();
  const entries = defaultEntries();
  const config: InputMethodExtraConfig = buildExtraConfig(entries);
  const bytes = configByteLength(config);
  const keyCount = Object.keys(config.customSettings).length;
  const detail = text('session_detail_json', describeEntries(entries), bytes);
  return okOutcome(API_BUILD, text('session_summary_keys', keyCount, bytes), detail, Date.now() - start);
}

/** 输入法侧的读取路径：从打桩的 EditorAttribute 里取回 customSettings */
export function readStubOutcome(): CallOutcome {
  const start = Date.now();
  const entries = defaultEntries();
  const attribute = new StubEditorAttribute(STUB_INPUT_PATTERN, STUB_BUNDLE, buildExtraConfig(entries));
  const read = readExtraConfig(attribute);
  const expected = entries.slice().sort((left: ConfigEntry, right: ConfigEntry) => left.key.localeCompare(right.key));
  const sameCount = read.length === expected.length;
  const sameKeys = sameCount && read.every((item: ConfigEntry, index: number) => item.key === expected[index].key);
  const detail = sameCount && sameKeys ?
    describeEntries(read) :
    text('session_summary_read_counts', read.length, expected.length);
  if (!sameCount || !sameKeys) {
    return failedOutcome(API_READ, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      text('session_summary_mismatch'), detail, Date.now() - start);
  }
  return okOutcome(API_READ, text('session_summary_read', read.length), detail, Date.now() - start);
}

/** 编辑框没有设置扩展信息时的读取结果：应为空数组，不能凭空给默认值 */
export function readAbsentOutcome(): CallOutcome {
  const start = Date.now();
  const attribute = new StubEditorAttribute(STUB_INPUT_PATTERN, STUB_BUNDLE);
  const read = readExtraConfig(attribute);
  const detail = text('session_detail_absent');
  if (read.length !== 0) {
    return failedOutcome(API_READ, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      text('session_summary_unexpected_items', read.length), detail, Date.now() - start);
  }
  return okOutcome(API_READ, text('session_summary_absent'), detail, Date.now() - start);
}

/** 压线：正好 32768 字节，仍然在额度内 */
export function nearLimitOutcome(): CallOutcome {
  const start = Date.now();
  const config = buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES));
  const bytes = configByteLength(config);
  const detail = text('session_detail_budget', EXTRA_CONFIG_MAX_BYTES, bytes);
  if (bytes > EXTRA_CONFIG_MAX_BYTES) {
    return failedOutcome(API_PADDED, ApiStatus.INVALID_INPUT, ERROR_CODE_INVALID_PARAM,
      text('session_summary_over_budget', bytes - EXTRA_CONFIG_MAX_BYTES), detail, Date.now() - start);
  }
  return okOutcome(API_PADDED, text('session_summary_within_budget', bytes), detail, Date.now() - start);
}

/**
 * 故意越界 1 字节：官方文档写明“信息总长度不超过 32KB”，超出部分不会被传递。
 * 这里按“入参问题”在写入前先拦住，好让边界在页面上看得见。
 */
export function oversizedOutcome(): CallOutcome {
  const start = Date.now();
  const target = EXTRA_CONFIG_MAX_BYTES + 1;
  const config = buildExtraConfig(paddedEntries(target));
  const bytes = configByteLength(config);
  const detail = text('session_detail_oversized', bytes, EXTRA_CONFIG_MAX_BYTES);
  if (bytes <= EXTRA_CONFIG_MAX_BYTES) {
    return failedOutcome(API_PADDED, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      text('session_summary_undersized', bytes), detail, Date.now() - start);
  }
  return failedOutcome(API_PADDED, ApiStatus.INVALID_INPUT, ERROR_CODE_INVALID_PARAM,
    text('session_summary_oversized', bytes - EXTRA_CONFIG_MAX_BYTES), detail, Date.now() - start);
}

/** JSON 往返：输入法若要把配置转存，就得能原样还原 */
export function roundTripOutcome(): CallOutcome {
  const start = Date.now();
  const entries = defaultEntries();
  const config = buildExtraConfig(entries);
  const jsonText = configJson(config);
  const restored = configFromJson(jsonText);
  const detailText = jsonText.length > 80 ? `${jsonText.substring(0, 80)}…` : jsonText;
  if (restored === undefined) {
    return failedOutcome(API_JSON, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      text('session_summary_restore_failed'), text('session_detail_original', detailText), Date.now() - start);
  }
  const before = configByteLength(config);
  const after = configByteLength(restored);
  const same = configJson(restored) === jsonText;
  if (!same || before !== after) {
    return failedOutcome(API_JSON, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      text('session_summary_roundtrip_mismatch'), text('session_detail_roundtrip', before, after),
      Date.now() - start);
  }
  return okOutcome(API_JSON, text('session_summary_roundtrip_ok', before),
    text('session_detail_original', detailText), Date.now() - start);
}

/** 页面首屏直接铺开的一组结果，顺序与按钮顺序一致 */
export function defaultOutcomes(): CallOutcome[] {
  return [
    buildDefaultOutcome(),
    readStubOutcome(),
    readAbsentOutcome(),
    nearLimitOutcome(),
    oversizedOutcome(),
    roundTripOutcome()
  ];
}
