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
  const detail = `${describeEntries(entries)}；JSON 共 ${bytes} 字节`;
  return okOutcome(API_BUILD, `${keyCount} 个键，${bytes} 字节`, detail, Date.now() - start);
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
    `读取到 ${read.length} 项，构造时写入 ${expected.length} 项`;
  if (!sameCount || !sameKeys) {
    return failedOutcome(API_READ, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      '读取结果与写入不一致', detail, Date.now() - start);
  }
  return okOutcome(API_READ, `${read.length} 项`, detail, Date.now() - start);
}

/** 编辑框没有设置扩展信息时的读取结果：应为空数组，不能凭空给默认值 */
export function readAbsentOutcome(): CallOutcome {
  const start = Date.now();
  const attribute = new StubEditorAttribute(STUB_INPUT_PATTERN, STUB_BUNDLE);
  const read = readExtraConfig(attribute);
  const detail = 'StubEditorAttribute 未携带 extraConfig，读取结果应为空';
  if (read.length !== 0) {
    return failedOutcome(API_READ, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      `意外读到 ${read.length} 项`, detail, Date.now() - start);
  }
  return okOutcome(API_READ, '0 项（未提供扩展信息）', detail, Date.now() - start);
}

/** 压线：正好 32768 字节，仍然在额度内 */
export function nearLimitOutcome(): CallOutcome {
  const start = Date.now();
  const config = buildExtraConfig(paddedEntries(EXTRA_CONFIG_MAX_BYTES));
  const bytes = configByteLength(config);
  const detail = `目标 ${EXTRA_CONFIG_MAX_BYTES} 字节，实测 ${bytes} 字节；d.ts 约定总长不超过 32KB`;
  if (bytes > EXTRA_CONFIG_MAX_BYTES) {
    return failedOutcome(API_PADDED, ApiStatus.INVALID_INPUT, ERROR_CODE_INVALID_PARAM,
      `压线构造反而超出 ${bytes - EXTRA_CONFIG_MAX_BYTES} 字节`, detail, Date.now() - start);
  }
  return okOutcome(API_PADDED, `${bytes} 字节，未越界`, detail, Date.now() - start);
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
  const detail = `构造到 ${bytes} 字节，上限 ${EXTRA_CONFIG_MAX_BYTES} 字节；` +
    '文档约定超出部分不传递，这里在写入前按入参问题拦下';
  if (bytes <= EXTRA_CONFIG_MAX_BYTES) {
    return failedOutcome(API_PADDED, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      `未达到越界目标（${bytes} 字节）`, detail, Date.now() - start);
  }
  return failedOutcome(API_PADDED, ApiStatus.INVALID_INPUT, ERROR_CODE_INVALID_PARAM,
    `超出 ${bytes - EXTRA_CONFIG_MAX_BYTES} 字节`, detail, Date.now() - start);
}

/** JSON 往返：输入法若要把配置转存，就得能原样还原 */
export function roundTripOutcome(): CallOutcome {
  const start = Date.now();
  const entries = defaultEntries();
  const config = buildExtraConfig(entries);
  const text = configJson(config);
  const restored = configFromJson(text);
  const detailText = text.length > 80 ? `${text.substring(0, 80)}…` : text;
  if (restored === undefined) {
    return failedOutcome(API_JSON, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      '还原失败', `原文 ${detailText}`, Date.now() - start);
  }
  const before = configByteLength(config);
  const after = configByteLength(restored);
  const same = configJson(restored) === text;
  if (!same || before !== after) {
    return failedOutcome(API_JSON, ApiStatus.INTERNAL, ERROR_CODE_LOCAL_UNEXPECTED_THROW,
      '往返后内容不一致', `往返前 ${before} 字节，往返后 ${after} 字节`, Date.now() - start);
  }
  return okOutcome(API_JSON, `${before} 字节，内容一致`, `原文 ${detailText}`, Date.now() - start);
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
