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

import { Core, ExpectExtend, OhReport, SysTestKit, beforeEachIt } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG: string = 'ChunkedTestRunner';
const DOMAIN: number = 0x0000;
// ponytail: registration costs ~2.4ms per it() on this device; ~2000 specs in one task blow the
// 2500ms lifecycle budget. 150 specs per task keeps every task well under the 3s watchdog.
const CHUNK_SIZE: number = 150;

interface HypiumConfigService {
  translateParams(parameters: Object): Object;
  setConfig(config: Object): void;
}

interface HypiumCore {
  addService(name: string, service: Object): void;
  init(): void;
  subscribeEvent(name: string, handler: Object): void;
  getDefaultService(name: string): HypiumConfigService;
  execute(delegator: Object): void;
}

interface ServiceAttr {
  id: string;
}

interface ReportAttr {
  delegator: Object;
  abilityDelegatorArguments: Object;
}

interface DelegatorArgs {
  parameters: Object;
}

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve) => {
    setTimeout(() => resolve(), 1);
  });
}

export function runSuitesInChunks(delegator: Object, args: Object, suites: Array<() => void>): void {
  const core: HypiumCore = Core.getInstance();
  const expectAttr: ServiceAttr = { id: 'extend' };
  const expectExtend: Object = new ExpectExtend(expectAttr);
  core.addService('expect', expectExtend);
  const reportAttr: ReportAttr = { delegator: delegator, abilityDelegatorArguments: args };
  const ohReport: Object = new OhReport(reportAttr);
  const delegatorSet: boolean = Reflect.set(SysTestKit, 'delegator', delegator);
  hilog.info(DOMAIN, TAG, 'SysTestKit.delegator set: %{public}s', `${delegatorSet}`);
  core.addService('report', ohReport);
  core.init();
  core.subscribeEvent('spec', ohReport);
  core.subscribeEvent('suite', ohReport);
  core.subscribeEvent('task', ohReport);
  const configService: HypiumConfigService = core.getDefaultService('config');
  const delegatorArgs: DelegatorArgs = args as DelegatorArgs;
  configService.setConfig(configService.translateParams(delegatorArgs.parameters));
  beforeEachIt(yieldToEventLoop);

  let index: number = 0;
  const registerNext = (): void => {
    const end: number = Math.min(index + CHUNK_SIZE, suites.length);
    for (; index < end; index++) {
      suites[index]();
    }
    if (index < suites.length) {
      setTimeout(registerNext, 1);
    } else {
      hilog.info(DOMAIN, TAG, '%{public}s', `registered ${suites.length} suites, executing`);
      core.execute(delegator);
    }
  };
  setTimeout(registerNext, 1);
}
