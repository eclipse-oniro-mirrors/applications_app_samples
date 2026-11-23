import { Core, ExpectExtend, OhReport, SysTestKit } from '@ohos/hypium';

export function yieldToMainThread() {
  return new Promise(resolve => setTimeout(resolve, 10));
}

export async function registerTestBatches(registrations) {
  for (const register of registrations) {
    await yieldToMainThread();
    register();
  }
}

export async function runHypiumSession(delegator, args, register) {
  const core = Core.getInstance();
  const report = new OhReport({ delegator, abilityDelegatorArguments: args });
  core.addService('expect', new ExpectExtend({ id: 'extend' }));
  core.addService('report', report);
  SysTestKit.delegator = delegator;
  await SysTestKit.print('\nstart ability successfully.\n');
  core.init();
  core.subscribeEvent('spec', report);
  core.subscribeEvent('suite', report);
  core.subscribeEvent('task', report);
  const config = core.getDefaultService('config');
  config.setConfig(config.translateParams(args.parameters));
  core.subscribeEvent('spec', {
    specStart() {
      return yieldToMainThread();
    },
    specDone() {}
  });
  await register();
  await yieldToMainThread();
  core.execute(delegator);
}

export function registerUiTests(register) {
  const config = Core.getInstance().getDefaultService('config');
  const previous = config.timeout;
  config.timeout = String(Math.max(Number(previous) || 0, 90000));
  try {
    register();
  } finally {
    config.timeout = previous;
  }
}
