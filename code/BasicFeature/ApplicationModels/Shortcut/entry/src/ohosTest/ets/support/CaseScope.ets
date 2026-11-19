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

import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { runWithCleanup } from './CaseLifecycle';

export const BUNDLE: string = 'com.samples.shortcut';

export const CASE_TIMEOUT_MS: number = 10000;
export type Cleanup = () => void;
export type Subscribe = (changed: () => void) => Cleanup;

export class CaseScope {
  private actions: Cleanup[] = [];
  private ended: boolean = false;

  cleanup(action: Cleanup): void {
    if (this.ended) {
      action();
    } else {
      this.actions.push(action);
    }
  }

  until(check: () => boolean, subscribe: Subscribe): Promise<void> {
    return new Promise<void>((resolve, reject) => {
      let settled: boolean = false;
      let unsubscribe: Cleanup = (): void => {};
      const changed = (): void => {
        if (!settled && check()) {
          settled = true;
          unsubscribe();
          resolve();
        }
      };
      this.cleanup((): void => {
        unsubscribe();
        if (!settled) {
          settled = true;
          reject(new Error('用例已结束'));
        }
      });
      if (this.ended) { return; }
      unsubscribe = subscribe(changed);
      changed();
    });
  }

  finish(): void {
    if (this.ended) { return; }
    this.ended = true;
    let failed: boolean = false;
    let failure: Error | undefined = undefined;
    for (let index = this.actions.length - 1; index >= 0; index--) {
      try {
        this.actions[index]();
      } catch (error) {
        if (!failed) {
          failed = true;
          failure = error as Error;
        }
      }
    }
    this.actions = [];
    if (failed) { throw failure as Error; }
  }
}

export async function runCase(caseName: string, body: (scope: CaseScope) => Promise<void>,
  timeoutMs: number = CASE_TIMEOUT_MS): Promise<void> {
  const scope: CaseScope = new CaseScope();
  let timer: number = -1;
  const timeout: Promise<void> = new Promise<void>((_, reject) => {
    timer = setTimeout((): void => reject(new Error('case-watchdog-timeout')), timeoutMs);
  });
  await runWithCleanup(caseName, async (): Promise<void> => {
    await Promise.race([body(scope), timeout]);
  }, [(): void => { clearTimeout(timer); }, (): void => { scope.finish(); }]);
}

export function getTestContext(): common.ApplicationContext {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
}
