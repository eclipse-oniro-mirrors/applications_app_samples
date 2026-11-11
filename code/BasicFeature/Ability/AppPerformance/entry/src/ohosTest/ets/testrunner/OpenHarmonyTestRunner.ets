import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';
import { RUNNER_TIMEOUT_MS } from '../support/BoundedCase';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void { console.info('[AP_RUNNER] prepare'); }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    if (args.parameters['-s timeout'] === undefined && args.parameters['timeout'] === undefined) {
      args.parameters['-s timeout'] = `${RUNNER_TIMEOUT_MS}`;
    }
    console.info(`[AP_RUNNER] init class=${args.parameters['class'] ?? args.parameters['-s class'] ?? '<all>'}` +
      ` dryRun=${args.parameters['dryRun'] ?? args.parameters['-s dryRun'] ?? 'false'}` +
      ` timeout=${args.parameters['timeout'] ?? args.parameters['-s timeout'] ?? '<default>'}`);
    let stage: string = 'import-list';
    try {
      const suite = await import('../test/List.test');
      stage = 'register-suites';
      console.info('[AP_RUNNER] List imported; registering leaf describe names');
      Hypium.hypiumTest(delegator, args, suite.default);
      console.info('[AP_RUNNER] Hypium scheduled; test result requires framework summary');
    } catch (error) {
      const message: string = `Test initialization failed at ${stage}: ${(error as Error).message}`;
      console.error(`[AP_RUNNER] ${message}`);
      await delegator.finishTest(message, 1);
    }
  }
}
