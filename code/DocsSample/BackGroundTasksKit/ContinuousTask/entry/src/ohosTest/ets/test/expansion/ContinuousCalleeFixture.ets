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
import BgTaskAbility from '../../../../main/ets/MainAbility/BgTaskAbility';
import { MockKit, ArgumentMatchers } from '@ohos/hypium';
import { common, AbilityConstant, wantAgent, WantAgent } from '@kit.AbilityKit';
import { backgroundTaskManager } from '@kit.BackgroundTasksKit';
import { Callee } from '@ohos.app.ability.UIAbility';
import { Deferred, ExternalCallee, ExternalResources, ExternalContext, drain, sdkMock } from './ContinuousExternal';
import { ContinuousCleanup } from './ContinuousCleanup';
import { wantAgentMockTarget, backgroundMockTarget, consoleMockTarget } from './ContinuousCalleeMockTargets';

class ExternalWantAgent {
  public marker: string = 'test-want-agent';
}
export class ContinuousCalleeFixture {
  public ability: BgTaskAbility = new BgTaskAbility();
  public callee: ExternalCallee = new ExternalCallee();
  public calls: string[] = [];
  public errors: string[] = [];
  public context: common.UIAbilityContext = new ExternalContext(new ExternalResources([])).asSdk();
  public token: WantAgent = new ExternalWantAgent() as WantAgent;
  public wantInfo: wantAgent.WantAgentInfo | null = null;
  public startContext: common.Context | null = null;
  public stopContext: common.Context | null = null;
  public startMode: number = -1;
  public startToken: WantAgent | null = null;
  public wantGate: Deferred<WantAgent> = new Deferred<WantAgent>();
  public operationGate: Deferred<void> = new Deferred<void>();
  private mock: MockKit = new MockKit();
  constructor() {
    sdkMock(this.mock, wantAgentMockTarget, wantAgent.getWantAgent).stub(ArgumentMatchers.anyObj).afterAction(
      (info: wantAgent.WantAgentInfo): Promise<WantAgent> => {
        this.calls.push('getWantAgent');
        this.wantInfo = info;
        return this.wantGate.promise;
      }
    );
    sdkMock(this.mock, backgroundMockTarget, backgroundTaskManager.startBackgroundRunning)
      .stub(ArgumentMatchers.anyObj, ArgumentMatchers.anyNumber, ArgumentMatchers.anyObj).afterAction(
      (context: common.Context, mode: number, token: WantAgent): Promise<void> => {
        this.calls.push('start');
        this.startContext = context;
        this.startMode = mode;
        this.startToken = token;
        return this.operationGate.promise;
      }
    );
    sdkMock(this.mock, backgroundMockTarget, backgroundTaskManager.stopBackgroundRunning)
      .stub(ArgumentMatchers.anyObj).afterAction(
      (context: common.Context): Promise<void> => {
        this.calls.push('stop');
        this.stopContext = context;
        return this.operationGate.promise;
      }
    );
    sdkMock(
      this.mock, consoleMockTarget, console.error
    ).stub(ArgumentMatchers.anyString).afterAction((message: string): void => {
      this.errors.push(message);
    });
    this.ability.context = this.context;
    this.ability.callee = this.callee as Callee;
  }
  register(): void {
    this.ability.onCreate({}, {
      launchReason: AbilityConstant.LaunchReason.START_ABILITY,
      lastExitReason: AbilityConstant.LastExitReason.UNKNOWN,
      lastExitMessage: ''
    });
  }
  async close(primaryFailed: boolean = false): Promise<void> {
    const cleanup = new ContinuousCleanup(primaryFailed);
    try {
      if (!this.wantGate.settled) {
        this.wantGate.resolve(this.token);
      }
      if (!this.operationGate.settled) {
        this.operationGate.resolve();
      }
      await drain();
      this.ability.onDestroy();
    } catch (error) {
      cleanup.capture(error as Error);
    } finally {
      cleanup.run((): void => {
        this.mock.ignoreMock(wantAgentMockTarget, wantAgent.getWantAgent);
      });
      cleanup.run((): void => {
        this.mock.ignoreMock(backgroundMockTarget, backgroundTaskManager.startBackgroundRunning);
      });
      cleanup.run((): void => {
        this.mock.ignoreMock(backgroundMockTarget, backgroundTaskManager.stopBackgroundRunning);
      });
      cleanup.run((): void => {
        this.mock.ignoreMock(consoleMockTarget, console.error);
      });
    }
    cleanup.finish();
  }
}
