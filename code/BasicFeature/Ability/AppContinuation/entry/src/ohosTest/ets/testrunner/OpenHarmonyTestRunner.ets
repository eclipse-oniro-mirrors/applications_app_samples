import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';

export default class OpenHarmonyTestRunner implements TestRunner {
  public onPrepare(): void {}

  public async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    // Register the delegator before importing suites that load the native UiTest exporter.
    // Preserve timeout/class arguments supplied by DevEco or aa test.
    try {
      const suite = await import('../test/List.test');
      Hypium.hypiumTest(delegator, args, suite.default);
    } catch (error) {
      const message = `Test initialization failed: ${(error as Error).message}`;
      console.error(message);
      await delegator.finishTest(message, 1);
    }
  }
}
