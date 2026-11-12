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
 * module.json5 里 type 为 distributed 的扩展实现。
 * 三个回调与 d.ts 一一对应：onCreate(want) / onDestroy() / onCollaborate(wantParam)。
 * onCollaborate 只能读 "ohos.extra.param.key.supportCollaborateIndex" 这一个键，
 * 因此这里的判断与 model/CollabModel 共用同一份纯函数，页面模拟与真回调不会出现两套规则。
 * onCreate 里还读一次 this.context（DistributedExtensionContext），把上下文契约落成日志。
 */

import { AbilityConstant, Want } from '@kit.AbilityKit';
import { DistributedExtensionAbility } from '@kit.DistributedServiceKit';
import { COLLABORATE_ACCEPT, COLLABORATE_REJECT, collaborateResultName } from '../model/ProbeState';
import { collaborateIndex, shouldAccept } from '../model/CollabModel';
import { ContextSnapshot, contextSnapshot, safeText } from '../model/ExtensionContextInfo';
import { bindResourceManager } from '../common/StringResource';
import { Logger } from '../utils/Logger';

const SOURCE: string = 'DistributedExtAbility';

export default class DistributedExtAbility extends DistributedExtensionAbility {
  onCreate(want: Want): void {
    // 扩展进程独立启动，同样要自己绑定 ResourceManager：onCollaborate 的结果文案靠它解析
    bindResourceManager(this.context.resourceManager);
    const bundle = want.bundleName === undefined ? 'n/a' : want.bundleName;
    const ability = want.abilityName === undefined ? 'n/a' : want.abilityName;
    Logger.info(SOURCE, 'onCreate', `bundleName=${bundle}, abilityName=${ability}`);
    this.logContext();
  }

  onDestroy(): void {
    Logger.info(SOURCE, 'onDestroy', 'distributed extension destroyed, release collaboration resources');
  }

  onCollaborate(wantParam: Record<string, Object>): AbilityConstant.CollaborateResult {
    const index = collaborateIndex(wantParam);
    const accepted = shouldAccept(index);
    const result = accepted ? COLLABORATE_ACCEPT : COLLABORATE_REJECT;
    const keyCount = Object.keys(wantParam).length;
    Logger.info(SOURCE, 'onCollaborate',
      `supportCollaborateIndex="${index}", ${keyCount} keys, result ${collaborateResultName(result)}`);
    return accepted ? AbilityConstant.CollaborateResult.ACCEPT : AbilityConstant.CollaborateResult.REJECT;
  }

  /**
   * 真正读取 this.context（DistributedExtensionContext → ExtensionContext）上的三个只读属性，
   * 把扩展自己的名称、类型、所属模块与语言写进 hilog。
   * 这段只在系统拉起扩展时执行；本工程是普通签名，系统不会拉起，所以另有一份同规则的纯函数用例
   * （model/ExtensionContextInfo）保证格式化与兜底逻辑正确。读失败不能影响 onCreate，单独兜住。
   */
  private logContext(): void {
    try {
      const info = this.context.extensionAbilityInfo;
      const snapshot: ContextSnapshot = contextSnapshot(info.name, info.extensionAbilityType,
        this.context.currentHapModuleInfo.name, safeText(this.context.config.language));
      Logger.info(SOURCE, 'onCreate.context', snapshot.describe());
    } catch (err) {
      Logger.warn(SOURCE, 'onCreate.context', `read context failed: ${err}`);
    }
  }
}
