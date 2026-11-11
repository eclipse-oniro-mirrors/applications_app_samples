import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';

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
    let failure: Error | undefined = undefined;
    for (let index = this.actions.length - 1; index >= 0; index--) {
      try {
        this.actions[index]();
      } catch (error) {
        failure = error as Error;
      }
    }
    this.actions = [];
    if (failure !== undefined) { throw failure; }
  }
}

export async function runCase(body: (scope: CaseScope) => Promise<void>): Promise<void> {
  const scope: CaseScope = new CaseScope();
  let timer: number = -1;
  const timeout: Promise<void> = new Promise<void>((_, reject) => {
    timer = setTimeout((): void => reject(new Error('用例超过10秒')), CASE_TIMEOUT_MS);
  });
  try {
    await Promise.race([body(scope), timeout]);
  } finally {
    clearTimeout(timer);
    scope.finish();
  }
}

export function getTestContext(): common.ApplicationContext {
  return abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
}
