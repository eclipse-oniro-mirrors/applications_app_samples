import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry, Driver, MatchPattern, ON } from '@kit.TestKit';

/** Ownership is the test Ability's context, never whichever Ability happens to be on top. */
export class UiTestAbilitySession {
  private readonly context: common.UIAbilityContext;
  private readonly destroyedReply: Promise<void>;
  private resolveDestroyed: (() => void) | undefined = undefined;
  private destroyed: boolean = false;
  private closing: Promise<void> | undefined = undefined;
  private loadGeneration: number = 0;
  private pageState: string = 'onCreate; window stage not created';

  constructor(context: common.UIAbilityContext) {
    this.context = context;
    this.destroyedReply = new Promise<void>((resolve): void => { this.resolveDestroyed = resolve; });
  }

  beginLoad(page: string): number {
    this.pageState = `loading ${page}`;
    return ++this.loadGeneration;
  }

  finishLoad(generation: number, page: string, failure: string = ''): void {
    if (generation !== this.loadGeneration || this.destroyed) { return; }
    this.pageState = failure.length > 0 ? `loadContent failed (${page}): ${failure}` : `loaded ${page}`;
  }

  diagnostic(): string { return this.destroyed ? 'TestAbility already destroyed' : this.pageState; }

  markDestroyed(): void {
    this.destroyed = true;
    const resolve = this.resolveDestroyed;
    this.resolveDestroyed = undefined;
    if (resolve !== undefined) { resolve(); }
  }

  async close(): Promise<void> {
    if (this.destroyed) { return; }
    if (this.closing === undefined) { this.closing = this.terminate(); }
    await this.closing;
  }

  private terminate(): Promise<void> {
    return new Promise<void>((resolve, reject): void => {
      let settled: boolean = false;
      let timer: number = -1;
      const finish = (error: Error | undefined = undefined): void => {
        if (settled) { return; }
        settled = true;
        if (timer >= 0) { clearTimeout(timer); }
        if (error === undefined) { resolve(); } else { reject(error); }
      };
      timer = setTimeout((): void => {
        finish(new Error('Owned TestAbility did not reach onDestroy during cleanup'));
      }, 3000);
      this.destroyedReply.then((): void => { finish(); });
      try {
        this.context.terminateSelf().catch((error: Error): void => {
          if (this.destroyed) { finish(); } else { finish(error); }
        });
      } catch (error) {
        if (this.destroyed) { finish(); } else { finish(error as Error); }
      }
    });
  }
}

let activeAbility: UiTestAbilitySession | undefined = undefined;

export function attachUiTestAbility(context: common.UIAbilityContext): UiTestAbilitySession {
  const session = new UiTestAbilitySession(context);
  activeAbility = session;
  return session;
}

export function detachUiTestAbility(session: UiTestAbilitySession): void {
  session.markDestroyed();
  // An older destruction callback cannot clear a newer Ability's ownership.
  if (activeAbility === session) { activeAbility = undefined; }
}

export function currentUiTestAbility(): UiTestAbilitySession | undefined { return activeAbility; }

export async function finishUiTestAbility(): Promise<void> {
  const session = activeAbility;
  if (session !== undefined) { await session.close(); }
}

/** Hypium 1.0.25 can skip afterEach after a rejected body, so cleanup belongs inside the body. */
export function uiTestCase(body: () => Promise<void>, cleanup: () => Promise<void>): () => Promise<void> {
  return async (): Promise<void> => {
    let failed: boolean = false;
    try {
      await body();
    } catch (error) {
      failed = true;
      throw error as Error;
    } finally {
      try {
        await cleanup();
      } catch (error) {
        // Do not turn an original assertion/load failure into an unrelated cleanup failure.
        if (!failed) { throw error as Error; }
        console.error(`UI test cleanup also failed: ${(error as Error).message}`);
      }
    }
  };
}

async function credentialPrompt(driver: Driver): Promise<string> {
  const prompt = await driver.findComponent(ON.text(
    '.*(密码|口令|PIN|图案|password|pattern).*',
    MatchPattern.REG_EXP_ICASE).inWindow('com.ohos.systemui'));
  return prompt === undefined || prompt === null ? '' : await prompt.getText();
}

async function lockDiagnostic(driver: Driver): Promise<string> {
  const credential = await credentialPrompt(driver);
  if (credential.length > 0) {
    return `Credential lock visible (${credential}); unlock the device manually, then rerun. ` +
      'No credentials are entered by tests.';
  }
  const swipe = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
  return swipe === undefined || swipe === null ? '' :
    'System swipe lock is still visible; unlock the device manually, then rerun.';
}

async function wakeAndCheckDisplay(driver: Driver): Promise<void> {
  // SDK26 Driver.wakeUpDisplay wakes the display; it does not promise to unlock it.
  await driver.wakeUpDisplay();
  if (!await driver.waitForIdle(100, 2000)) {
    throw new Error('Display did not become idle after wakeUpDisplay; unlock the device manually, then rerun.');
  }
  const credential = await credentialPrompt(driver);
  if (credential.length > 0) {
    throw new Error(`Credential lock visible (${credential}); unlock the device manually, then rerun. ` +
      'No credentials are entered by tests.');
  }
  // This exact system-window/text pair is confirmed by the device's ordinary swipe-lock dump.
  // Never guess coordinates on an unknown lock screen, retry a swipe, or use privileged unlock APIs.
  const swipe = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
  if (swipe === undefined || swipe === null) { return; }
  const size = await driver.getDisplaySize();
  if (size.x <= 0 || size.y <= 0) { throw new Error('Invalid display size; unlock the device manually, then rerun.'); }
  const x = Math.floor(size.x / 2);
  await driver.swipe(x, Math.floor(size.y * 0.8), x, Math.floor(size.y * 0.2), 1200);
  // Idle can be reported before the system's asynchronous unlock acknowledgement hides its window.
  // Observe disappearance within the existing 2s display-readiness budget; never swipe again.
  const deadline = Date.now() + 2000;
  while (true) {
    const credentialAfterSwipe = await credentialPrompt(driver);
    if (credentialAfterSwipe.length > 0) {
      throw new Error(`Credential lock visible (${credentialAfterSwipe}); unlock the device manually, then rerun. ` +
        'No credentials are entered by tests.');
    }
    const remainingLock = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
    if (remainingLock === undefined || remainingLock === null) { return; }
    const remaining = deadline - Date.now();
    if (remaining <= 0) {
      throw new Error('System swipe lock is still visible after one swipe; unlock the device manually, then rerun.');
    }
    await new Promise<void>((resolve): void => {
      setTimeout((): void => { resolve(); }, Math.min(100, remaining));
    });
  }
}

export async function launchUiTestAbility(parameters: Record<string, Object> = {}): Promise<Driver> {
  await finishUiTestAbility();
  // Obtain native test APIs only inside a running test/hook, never at module evaluation.
  const driver = Driver.create();
  if (driver === undefined || driver === null) {
    throw new Error('UiTest Driver.create() returned null; native IPC initialization failed. ' +
      'Check deferred Runner imports and device UiTest logs.');
  }
  await wakeAndCheckDisplay(driver);
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility({
    bundleName: 'com.example.appperformance', moduleName: 'entry_test', abilityName: 'TestAbility',
    parameters: parameters
  });
  return driver;
}

/** Diagnostics run only after an existing wait fails; they never retry or extend its 3000 ms budget. */
export async function uiTestFailure(driver: Driver, reason: string,
  initializationErrorId: string = ''): Promise<Error> {
  const session = activeAbility;
  let detail = session === undefined ? 'TestAbility lifecycle ownership was not registered' : session.diagnostic();
  try {
    if (initializationErrorId.length > 0) {
      const initialization = await driver.findComponent(ON.id(initializationErrorId));
      if (initialization !== undefined && initialization !== null) {
        detail += `; page initialization failed: ${await initialization.getText()}`;
      }
    }
    const locked = await lockDiagnostic(driver);
    if (locked.length > 0) { detail += `; ${locked}`; }
  } catch (error) {
    detail += `; UI diagnostics unavailable: ${(error as Error).message}`;
  }
  return new Error(`${reason}; ${detail}. If the page is obscured, unlock the device manually and rerun.`);
}
