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
 * 输入法扩展信息（@ohos.inputMethod.ExtraConfig）的数据模型与纯函数。
 *
 * 这一层不碰设备：构造 customSettings、按 UTF-8 估算 32KB 上限、JSON 往返，
 * 以及"打桩编辑框属性"的读取，全部是纯逻辑。真实的扩展信息由 ArkUI 编辑框在
 * 拉起输入法时交给系统框架，输入法应用在 EditorAttribute.extraConfig 里取到；
 * 三方进程拿不到那个时刻，所以演示页用 StubEditorAttribute 复现同样的数据形状。
 */

import { InputMethodExtraConfig } from '@kit.IMEKit';
import { text } from '../common/StringResource';

/** 扩展信息允许的三种值类型，与 d.ts 的 CustomValueType（number | string | boolean）一致 */
export type ConfigValue = number | string | boolean;

export class ConfigEntry {
  public key: string;
  public value: ConfigValue;

  constructor(key: string, value: ConfigValue) {
    this.key = key;
    this.value = value;
  }

  typeName(): string {
    if (typeof this.value === 'number') {
      return 'number';
    }
    if (typeof this.value === 'boolean') {
      return 'boolean';
    }
    return 'string';
  }

  display(): string {
    return text('config_entry_display', this.key, `${this.value}`, this.typeName());
  }
}

/** 页面与用例共用的一份默认键值：number、string、boolean 三种类型都出现 */
export function defaultEntries(): ConfigEntry[] {
  return [
    new ConfigEntry('theme.color', '#0A59F7'),
    new ConfigEntry('input.habit', text('config_demo_habit')),
    new ConfigEntry('voice.enabled', false),
    new ConfigEntry('candidate.limit', 8)
  ];
}

export function settingsOf(entries: ConfigEntry[]): Record<string, ConfigValue> {
  const settings: Record<string, ConfigValue> = {};
  entries.forEach((entry: ConfigEntry) => {
    settings[entry.key] = entry.value;
  });
  return settings;
}

export function buildExtraConfig(entries: ConfigEntry[]): InputMethodExtraConfig {
  const config: InputMethodExtraConfig = { customSettings: settingsOf(entries) };
  return config;
}

/** UTF-8 字节数：JSON 里可能有中文，不能拿 string.length 当长度 */
export function utf8Bytes(text: string): number {
  let bytes = 0;
  for (let i = 0; i < text.length; i++) {
    const code = text.charCodeAt(i);
    if (code < 0x80) {
      bytes += 1;
    } else if (code < 0x800) {
      bytes += 2;
    } else if (code >= 0xD800 && code <= 0xDBFF) {
      bytes += 4;
      i++;
    } else {
      bytes += 3;
    }
  }
  return bytes;
}

export function configJson(config: InputMethodExtraConfig): string {
  return JSON.stringify(config);
}

export function configByteLength(config: InputMethodExtraConfig): number {
  return utf8Bytes(configJson(config));
}

/** 从 JSON 还原；结构不对时返回 undefined，由调用方决定怎么报错 */
export function configFromJson(text: string): InputMethodExtraConfig | undefined {
  try {
    const parsed = JSON.parse(text) as InputMethodExtraConfig;
    const settings = parsed.customSettings;
    if (settings === undefined || settings === null) {
      return undefined;
    }
    const entries: ConfigEntry[] = [];
    const keys = Object.keys(settings);
    keys.forEach((key: string) => {
      entries.push(new ConfigEntry(key, settings[key]));
    });
    return buildExtraConfig(entries);
  } catch (err) {
    return undefined;
  }
}

/**
 * 把键值对"撑"到指定字节数：先按默认键值构造，再补一个 padding 字符串键。
 * 用于页面演示 32KB 额度：目标 32768 是压线，32769 起越界。
 * 补齐长度按 UTF-8 字节算，'x' 恰好 1 字节，所以字节数与字符数一致。
 */
export function paddedEntries(targetBytes: number): ConfigEntry[] {
  const base = defaultEntries();
  const baseBytes = configByteLength(buildExtraConfig([...base, new ConfigEntry('padding', '')]));
  const padding = targetBytes - baseBytes;
  const result = [...base];
  result.push(new ConfigEntry('padding', padding > 0 ? 'x'.repeat(padding) : ''));
  return result;
}

/** 编辑框属性的最小形状：真实类型是 inputMethodEngine.EditorAttribute，这里只取需要的字段 */
export interface EditorAttributeLike {
  bundleName?: string;
  inputPattern: number;
  extraConfig?: InputMethodExtraConfig;
}

/** 打桩对象：输入法侧看到的编辑框属性由系统提供，三方进程只能复现同样的数据形状 */
export class StubEditorAttribute implements EditorAttributeLike {
  public bundleName?: string;
  public inputPattern: number;
  public extraConfig?: InputMethodExtraConfig;

  constructor(inputPattern: number, bundleName: string, extraConfig?: InputMethodExtraConfig) {
    this.inputPattern = inputPattern;
    this.bundleName = bundleName;
    this.extraConfig = extraConfig;
  }
}

/** 与输入法侧读取方式一致：不存在时返回空数组，不编造默认值 */
export function readExtraConfig(attribute: EditorAttributeLike | undefined): ConfigEntry[] {
  const config = attribute !== undefined ? attribute.extraConfig : undefined;
  if (config === undefined) {
    return [];
  }
  const settings = config.customSettings;
  if (settings === undefined || settings === null) {
    return [];
  }
  return Object.keys(settings).sort().map((key: string) => new ConfigEntry(key, settings[key]));
}

export function describeEntries(entries: ConfigEntry[], limit: number = 6): string {
  const shown = entries.slice(0, limit).map((entry: ConfigEntry) => entry.display());
  const rest = entries.length - shown.length;
  const joined = shown.join(text('config_join'));
  return rest > 0 ? text('config_entries_more', joined, entries.length) : joined;
}
