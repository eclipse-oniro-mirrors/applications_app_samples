import { it } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { systemDateTime } from '@kit.BasicServicesKit';

export const CASE_TIMEOUT_MS: number = 10000;
export const RUNNER_TIMEOUT_MS: number = 12000;
export type ScenarioBody = () => void | Promise<void>;

export interface CaseResult {
  name: string;
  status: string;
  durationMs: number;
  error: string;
}

const results: CaseResult[] = [];

export function caseResults(): CaseResult[] {
  return results.slice();
}

export function boundedIt(name: string, _level: number, body: ScenarioBody): void {
  scenario(name, body);
}

export function scenario(name: string, body: ScenarioBody): void {
  it(name, 0, async (): Promise<void> => {
    const started = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false);
    let timer: number = -1;
    let failure: Error | undefined = undefined;
    const deadline = new Promise<void>((_resolve, reject): void => {
      timer = setTimeout((): void => {
        reject(new Error(`Case exceeded ${CASE_TIMEOUT_MS} ms: ${name}`));
      }, CASE_TIMEOUT_MS);
    });
    try {
      await Promise.race([Promise.resolve().then(body), deadline]);
    } catch (error) {
      failure = error as Error;
    } finally {
      clearTimeout(timer);
    }
    const duration = systemDateTime.getUptime(systemDateTime.TimeType.STARTUP, false) - started;
    if (duration > CASE_TIMEOUT_MS && failure === undefined) {
      failure = new Error(`Case exceeded ${CASE_TIMEOUT_MS} ms: ${name}`);
    }
    const result: CaseResult = {
      name: name,
      status: failure === undefined ? 'passed' : 'failed',
      durationMs: duration,
      error: failure === undefined ? '' : failure.message
    };
    results.push(result);
    try {
      await abilityDelegatorRegistry.getAbilityDelegator().print(`[AP_CASE] ${JSON.stringify(result)}`);
    } catch (error) {
      console.info(`[AP_CASE] ${JSON.stringify(result)}`);
    }
    if (failure !== undefined) {
      throw failure;
    }
  });
}
