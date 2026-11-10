import { it } from '@ohos/hypium';

export const CASE_TIMEOUT_MS: number = 10000;
export const RUNNER_TIMEOUT_MS: number = 12000;
export type ScenarioBody = () => void | Promise<void>;

/** Register one scenario with a real-time deadline and release its watchdog. */
export function scenario(name: string, body: ScenarioBody): void {
  it(name, 0, async (): Promise<void> => {
    let watchdog: number = -1;
    const deadline = new Promise<void>((_resolve, reject): void => {
      watchdog = setTimeout((): void => {
        reject(new Error(`Scenario exceeded ${CASE_TIMEOUT_MS} ms: ${name}`));
      }, CASE_TIMEOUT_MS);
    });
    try {
      await Promise.race([Promise.resolve().then(body), deadline]);
    } finally {
      if (watchdog >= 0) {
        clearTimeout(watchdog);
      }
    }
  });
}
