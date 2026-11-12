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
 * 分布式扩展的上下文（DistributedExtensionContext）信息快照。
 *
 * 扩展被系统拉起后，扩展本体用 this.context 读继承自 ExtensionContext 的三个只读属性：
 * extensionAbilityInfo（name / extensionAbilityType）、currentHapModuleInfo（name）、config（language）。
 * 这几个字段只在扩展进程里有效，页面拿不到，所以把「取值兜底 + 文案」拆成纯函数：
 * 扩展运行时传真实字段，用例里传同形状的值，两边走同一份规则。
 *
 * 占位符 CONTEXT_UNKNOWN 存的是资源名：模块级常量在 import 求值时定型，那时还拿不到
 * ResourceManager，因此字段写入时统一经 contextUnknownText() 解析。
 */

import { EXTENSION_TYPE_DISTRIBUTED } from '../common/AppConstants';
import { text, text1, text4 } from '../common/StringResource';

/** 字段读不到时的占位符：日志里不出现 undefined，也便于用例断言 */
export const CONTEXT_UNKNOWN: string = 'ctx_unknown';

/** 占位符在当前语言下的文本 */
export function contextUnknownText(): string {
  return text(CONTEXT_UNKNOWN);
}

export class ContextSnapshot {
  public abilityName: string;
  public abilityType: number;
  public moduleName: string;
  public language: string;

  constructor(abilityName: string, abilityType: number, moduleName: string, language: string) {
    this.abilityName = abilityName.length > 0 ? abilityName : contextUnknownText();
    this.abilityType = abilityType;
    this.moduleName = moduleName.length > 0 ? moduleName : contextUnknownText();
    this.language = language.length > 0 ? language : contextUnknownText();
  }

  /** 28 是 bundleManager.ExtensionAbilityType.DISTRIBUTED，与 module.json5 的 type: distributed 对应 */
  typeName(): string {
    return this.abilityType === EXTENSION_TYPE_DISTRIBUTED
      ? text1('ctx_type_distributed', `${this.abilityType}`)
      : text1('ctx_type_other', `${this.abilityType}`);
  }

  describe(): string {
    return text4('ctx_describe', this.abilityName, this.typeName(), this.moduleName, this.language);
  }
}

export function contextSnapshot(abilityName: string, abilityType: number, moduleName: string,
  language: string): ContextSnapshot {
  return new ContextSnapshot(abilityName, abilityType, moduleName, language);
}

/** Configuration.language 在 d.ts 里是可选字段，读到 undefined 时按空串处理，交给构造函数兜底 */
export function safeText(value: string | undefined): string {
  return value === undefined ? '' : value;
}
