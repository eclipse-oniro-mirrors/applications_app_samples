import { abilityDelegatorRegistry, TestRunner } from '@kit.TestKit';
import { Hypium } from '@ohos/hypium';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void { console.info('[AppStartupTests] prepare'); }

  async onRun(): Promise<void> {
    const delegator = abilityDelegatorRegistry.getAbilityDelegator();
    const args = abilityDelegatorRegistry.getArguments();
    // UiTest's native exporter must see the registered delegator, not run while loading this Runner.
    // Leave the caller's timeout and class filters untouched.
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
