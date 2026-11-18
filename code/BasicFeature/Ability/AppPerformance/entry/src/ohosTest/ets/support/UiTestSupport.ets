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

import { abilityDelegatorRegistry, MatchPattern } from '@kit.TestKit';
import { BUNDLE } from './TestLog';
import { currentTextResourceResolver, setTextContext, setTextResourceResolver } from '../../../main/ets/core/TextMessages';
import { UiTestDriver as Driver, UiTestSession, ON } from './UiTestRuntime';

async function credentialPrompt(driver: Driver): Promise<string> {
  const prompt = await driver.findComponent(ON.text(
    '.*(密码|口令|PIN|图案|password|pattern).*', MatchPattern.REG_EXP_ICASE).inWindow('com.ohos.systemui'));
  return prompt === undefined ? '' : await prompt.getText();
}

async function lockDiagnostic(driver: Driver): Promise<string> {
  const credential = await credentialPrompt(driver);
  if (credential.length > 0) {
    return `Credential lock visible (${credential}); unlock the device manually, then rerun. ` +
      'No credentials are entered by tests.';
  }
  const swipe = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
  return swipe === undefined ? '' : 'System swipe lock is still visible; unlock the device manually, then rerun.';
}

async function wakeAndCheckDisplay(driver: Driver): Promise<void> {
  await driver.wakeUpDisplay();
  if (!await driver.waitForIdle(100, 2000)) {
    throw new Error('Display did not become idle after wakeUpDisplay; unlock the device manually, then rerun.');
  }
  const credential = await credentialPrompt(driver);
  if (credential.length > 0) {
    throw new Error(`Credential lock visible (${credential}); unlock the device manually, then rerun. ` +
      'No credentials are entered by tests.');
  }
  // Keep the original one-shot, observed ordinary swipe-lock behavior; never enter credentials.
  const swipe = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
  if (swipe === undefined) { return; }
  const size = await driver.getDisplaySize();
  if (size.x <= 0 || size.y <= 0) { throw new Error('Invalid display size; unlock the device manually, then rerun.'); }
  const x = Math.floor(size.x / 2);
  await driver.swipe(x, Math.floor(size.y * 0.8), x, Math.floor(size.y * 0.2), 1200);
  const deadline = Date.now() + 2000;
  while (true) {
    const credentialAfterSwipe = await credentialPrompt(driver);
    if (credentialAfterSwipe.length > 0) {
      throw new Error(`Credential lock visible (${credentialAfterSwipe}); unlock the device manually, then rerun. ` +
        'No credentials are entered by tests.');
    }
    const remainingLock = await driver.findComponent(ON.text('上滑解锁').inWindow('com.ohos.systemui'));
    if (remainingLock === undefined) { return; }
    const remaining = deadline - Date.now();
    if (remaining <= 0) {
      throw new Error('System swipe lock is still visible after one swipe; unlock the device manually, then rerun.');
    }
    await driver.session.pause(Math.min(100, remaining));
  }
}

export async function launchUiTestAbility(session: UiTestSession,
  parameters: Record<string, Object> = {}): Promise<Driver> {
  session.requireLive();
  const previous = currentTextResourceResolver();
  session.ownDestroyCleanup((): void => { setTextResourceResolver(previous); });
  setTextContext(abilityDelegatorRegistry.getAbilityDelegator().getAppContext());
  let phase: string = 'Driver.create';
  try {
    const driver = session.createDriver();
    phase = 'display-readiness';
    await wakeAndCheckDisplay(driver);
    phase = 'startAbility';
    await session.startAbility(BUNDLE, 'TestAbility', parameters);
    if (parameters['testPage'] !== 'SeriesUiQa') {
      phase = 'reactive-page-ready';
      const ready = await driver.waitForComponent(ON.id(`reactive-ui-ready-${session.id}`), 3000);
      if (ready === undefined) { throw new Error('The owned reactive UI page did not become ready'); }
    }
    session.requireLive();
    return driver;
  } catch (error) {
    session.failInitialization(phase);
    throw error as Error;
  }
}

/** Diagnostics use the same lease/gate, and cannot dispatch after the original call is quarantined. */
export async function uiTestFailure(driver: Driver, reason: string,
  initializationErrorId: string = ''): Promise<Error> {
  const session = driver.session;
  let detail = session.diagnostic();
  try {
    session.requireLive();
    if (initializationErrorId.length > 0) {
      const initialization = await driver.findComponent(ON.id(`${initializationErrorId}-${session.id}`));
      if (initialization !== undefined) { detail += `; page initialization failed: ${await initialization.getText()}`; }
    }
    const locked = await lockDiagnostic(driver);
    if (locked.length > 0) { detail += `; ${locked}`; }
  } catch (error) {
    detail += `; UI diagnostics unavailable: ${(error as Error).message}`;
  }
  return new Error(`${reason}; ${detail}. If the page is obscured, unlock the device manually and rerun.`);
}
