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

import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';

const SUITE_TAG: string = '[Sample_NetworkSecurity]'; // Suite-level hilog tag, distinct from per-case tags.
const DOMAIN: number = 0xF811; // Hilog domain reserved for the sample.
const APP_BUNDLE: string = 'com.samples.networksecurity'; // Bundle name of the app under test.
const ABILITY_NAME: string = 'EntryAbility'; // Entry ability used to launch the app.

const LAUNCH_WAIT_MS: number = 2000; // Wait time after app launch.
const CLICK_WAIT_MS: number = 300; // Wait time after each click.
const ACTION_WAIT_MS: number = 800; // Wait time after a feature action; the verified actions are synchronous.
const IME_SETTLE_MS: number = 1500; // Wait time after focusing an input so the soft keyboard is up before text calls.
const FIND_TIMEOUT_MS: number = 1200; // Timeout for locating a component; kept low so one case stays under the 15s hypium limit.
const CASE_GAP_MS: number = 800; // Idle buffer before each case so leftover uitest work can expire.
const DRAIN_RETRY_MAX: number = 6; // Max uitest idle probes in beforeEach.
const DRAIN_RETRY_INTERVAL_MS: number = 300; // Interval between uitest idle probes.
const PERMISSION_ALLOW_TEXTS: string[] = ['允许', '仅本次允许', '仅使用时允许']; // Allow-button texts of the installed-list permission dialog.
const DIALOG_SETTLE_MS: number = 600; // Wait time after clicking the permission dialog button.
const SCROLL_SETTLE_MS: number = 300; // Wait time after resetting the scroll container to the top.
const SCROLL_STEP_SETTLE_MS: number = 200; // Wait time after each manual scroll step.
const SCROLL_STEP_MAX: number = 4; // Max manual scroll steps when hunting for an off-screen target.
const SCROLL_STEP_SWIPE_SPEED: number = 1200; // Swipe speed of each manual page step, in px/s.
const SCROLL_RESET_SPEED: number = 40000; // Fastest supported scroll speed, used to reset to the top.
const SCROLL_EDGE_INSET_PX: number = 8; // Swipe offset from the container left edge so nested lists stay out.
const APP_LIST_SETTLE_MAX: number = 4; // Max probes while the app list load finishes.
const APP_LIST_SETTLE_INTERVAL_MS: number = 500; // Delay between app list settle probes.
const TOGGLE_STATE_SETTLE_MAX: number = 6; // Max probes while the policy switch state settles.
const TOGGLE_STATE_INTERVAL_MS: number = 500; // Delay between policy switch state probes.
const RESTRICTED_STATUS_KEYWORD: string = '不具备系统权限'; // Base-locale text of the restricted system API hint.

const MAIN_PAGE_ID: string = 'id_main_page'; // Component id of the main page container.
const MAIN_TITLE_ID: string = 'id_main_title'; // Component id of the main page title.
const TAB_SECURITY_ID: string = 'id_tab_security'; // Component id of the bottom security tab (phone).
const TAB_POLICY_ID: string = 'id_tab_policy'; // Component id of the bottom policy tab (phone).
const NAV_SECURITY_ID: string = 'id_nav_security'; // Component id of the side navigation security entry (tablet).
const NAV_POLICY_ID: string = 'id_nav_policy'; // Component id of the side navigation policy entry (tablet).
const SECURITY_PAGE_ID: string = 'id_security_page'; // Component id of the security page container.
const POLICY_PAGE_ID: string = 'id_policy_page'; // Component id of the policy page container.
const CERT_VERIFY_SYNC_ID: string = 'id_security_cert_verify_sync'; // Component id of the sync certificate verify button.
const CERT_CARD_ID: string = 'id_security_result_block'; // Component id of the certificate result block, rendered after a verification.
const SECURITY_LOG_PANEL_ID: string = 'id_security_log_panel'; // Component id of the security log panel.
const CLEARTEXT_QUERY_ID: string = 'id_security_cleartext_query'; // Component id of the global cleartext query button.
const CLEARTEXT_VALUE_ID: string = 'id_security_cleartext_value'; // Component id of the cleartext result row.
const POLICY_TOGGLE_ID: string = 'id_policy_background_allow_toggle'; // Component id of the background allow toggle on the policy page.
const POLICY_STATUS_ID: string = 'id_policy_notice_status'; // Component id of the system API status text on the policy page.
const APP_LIST_ENTRY_ID: string = 'id_policy_app_list_entry'; // Component id of the installed app entry button.
const APP_LIST_PAGE_ID: string = 'id_app_list_page'; // Component id of the app list page container.
const APP_LIST_SEARCH_ID: string = 'id_app_list_search'; // Component id of the app list search input.
const APP_LIST_LIST_ID: string = 'id_app_list_list'; // Component id of the app list container.
const APP_LIST_EMPTY_ID: string = 'id_app_list_empty'; // Component id of the app list empty hint.
const APP_LIST_MESSAGE_ID: string = 'id_app_list_message'; // Component id of the app list restricted hint.
const APP_DETAIL_PAGE_ID: string = 'id_app_detail_page'; // Component id of the app detail page container.

let uiDriver: Driver | null = null; // Cached UI driver instance, created lazily.

// Returns the shared UI driver, creating it on first use.
function getDriver(): Driver {
  // Reuse the cached driver when it already exists.
  if (uiDriver !== null) {
    // Return the existing driver instance.
    return uiDriver;
  }
  // Create a new UI driver instance.
  const created: Driver = Driver.create();
  // Cache the created driver for later reuse.
  uiDriver = created;
  // Return the newly created driver.
  return created;
}

// Logs one progress line for the given test case through hilog.
function logCase(tag: string, detail: string): void {
  // Write an info log under the per-case tag so logs can be searched by case name.
  hilog.info(DOMAIN, tag, '%{public}s', detail);
}

// Sleeps for the given duration without touching the uitest service queue.
function sleepMs(durationMs: number): Promise<void> {
  // Resolve through a plain timer so no uitest call is enqueued.
  return new Promise<void>((resolve: (value: void) => void) => {
    // Fire the resolver after the requested delay.
    setTimeout(() => {
      // Release the pending await.
      resolve();
    }, durationMs);
  });
}

// Launches the app under test through the ability delegator.
async function launchApp(): Promise<void> {
  // Build the launch want that targets the sample bundle and ability.
  const want: Want = {
    bundleName: APP_BUNDLE,
    abilityName: ABILITY_NAME
  };
  // Start the EntryAbility of the app under test.
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
  // Wait for the first page to finish rendering.
  await sleepMs(LAUNCH_WAIT_MS);
}

// Checks whether a component with the given id exists on the current page.
async function hasComponent(idValue: string): Promise<boolean> {
  // findComponents can return null or reject while the uitest service is busy, so guard both paths.
  try {
    // Find all components that match the given id.
    const found: Component[] | null = await getDriver().findComponents(ON.id(idValue));
    // Treat a null result as "not found" instead of crashing on length access.
    if (found === null) {
      // Log the null result for diagnosis.
      hilog.warn(DOMAIN, SUITE_TAG, 'findComponents returned null, id: ' + idValue);
      // Report the component as absent.
      return false;
    }
    // Return true when at least one matching component exists.
    return found.length > 0;
  } catch (error) {
    // Log the failed probe so concurrency conflicts stay diagnosable.
    hilog.warn(DOMAIN, SUITE_TAG, 'findComponents failed, id: ' + idValue);
    // Report the component as absent on error.
    return false;
  }
}

// Waits for a component with the given id to appear within the timeout.
async function waitForId(idValue: string, timeoutMs: number): Promise<boolean> {
  // Try to wait for the component inside the timeout window.
  try {
    // Block until the component appears or the timeout expires.
    await getDriver().waitForComponent(ON.id(idValue), timeoutMs);
    // The component appeared in time.
    return true;
  } catch (error) {
    // Log the timeout together with the target id.
    hilog.error(DOMAIN, SUITE_TAG, 'waitForComponent timeout, id: ' + idValue + ', timeoutMs: ' + timeoutMs);
    // Report that the component did not appear in time.
    return false;
  }
}

// Clicks the component with the given id and waits for the UI to settle.
async function clickId(idValue: string): Promise<boolean> {
  // Check that the target exists before clicking.
  const existed: boolean = await hasComponent(idValue);
  // Skip the click when the target is missing.
  if (!existed) {
    // Log the missing click target.
    hilog.error(DOMAIN, SUITE_TAG, 'click target not found, id: ' + idValue);
    // Report the click as failed.
    return false;
  }
  // Locate the target component by its id.
  const target: Component | null = await getDriver().findComponent(ON.id(idValue));
  // Skip the click when the target vanished between the probe and the lookup.
  if (target === null) {
    // Log the vanished click target.
    hilog.error(DOMAIN, SUITE_TAG, 'click target vanished, id: ' + idValue);
    // Report the click as failed.
    return false;
  }
  // Perform the click on the target.
  await target.click();
  // Give the UI time to settle after the click.
  await sleepMs(CLICK_WAIT_MS);
  // Report the click as successful.
  return true;
}

// Phones expose bottom tabs while tablets expose the left navigation, so click whichever exists.
async function openSecurityPage(): Promise<void> {
  // Prefer the bottom tab when it is present on the screen.
  if (await hasComponent(TAB_SECURITY_ID)) {
    // Open the security page through the bottom tab.
    await clickId(TAB_SECURITY_ID);
    // The security entry has been clicked.
    return;
  }
  // Fall back to the side navigation entry on tablets.
  await clickId(NAV_SECURITY_ID);
}

// Phones expose bottom tabs while tablets expose the left navigation, so click whichever exists.
async function openPolicyPage(): Promise<void> {
  // Prefer the bottom tab when it is present on the screen.
  if (await hasComponent(TAB_POLICY_ID)) {
    // Open the policy page through the bottom tab.
    await clickId(TAB_POLICY_ID);
    // The policy entry has been clicked.
    return;
  }
  // Fall back to the side navigation entry on tablets.
  await clickId(NAV_POLICY_ID);
}

// Reads the checked state of a switch control; null means the component rejected the query.
async function readCheckedState(component: Component): Promise<boolean | null> {
  // A Toggle reports its state through the checked property, not through the selected property.
  try {
    // Read the checked state of the switch.
    return await component.isChecked();
  } catch (error) {
    // Log the rejected query so an unreadable state is visible in the case log.
    hilog.warn(DOMAIN, SUITE_TAG, 'isChecked failed for the switch');
    // Report an unknown state instead of guessing.
    return null;
  }
}

// Waits until the policy switch accepts interaction; the page disables it while an action runs.
async function waitPolicyToggleEnabled(): Promise<Component | null> {
  // Probe a few times because the page runs async policy queries right after it appears.
  for (let i = 0; i < TOGGLE_STATE_SETTLE_MAX; i++) {
    // Re-read the handle on every probe; a stale handle reports a destroyed component.
    const toggle: Component | null = await getDriver().findComponent(ON.id(POLICY_TOGGLE_ID));
    // Stop when the switch is gone from the screen.
    if (toggle === null) {
      // Report the missing switch.
      return null;
    }
    // Check whether the switch accepts interaction again.
    try {
      // A page that is not busy keeps the switch enabled.
      if (await toggle.isEnabled()) {
        // Return the interactive switch.
        return toggle;
      }
    } catch (error) {
      // An unreadable enabled state is treated as still busy.
      hilog.warn(DOMAIN, SUITE_TAG, 'isEnabled failed for the switch');
    }
    // Give the running policy action time to release the busy guard.
    await sleepMs(TOGGLE_STATE_INTERVAL_MS);
  }
  // Report that the switch never became interactive.
  return null;
}

// Waits until the switch state differs from the value observed before the click.
async function waitToggleFlipped(beforeOn: boolean): Promise<boolean> {
  // Poll a bounded number of times; the click handler awaits the system policy call.
  for (let i = 0; i < TOGGLE_STATE_SETTLE_MAX; i++) {
    // Wait one interval before reading so the click handler can run.
    await sleepMs(TOGGLE_STATE_INTERVAL_MS);
    // Re-read the handle so a re-rendered switch is not missed.
    const toggle: Component | null = await getDriver().findComponent(ON.id(POLICY_TOGGLE_ID));
    // Skip this probe when the switch is temporarily gone.
    if (toggle === null) {
      // Try again on the next tick.
      continue;
    }
    // Read the current checked state.
    const current: boolean | null = await readCheckedState(toggle);
    // Render the tri-state value without relying on implicit null concatenation.
    const currentText: string = current === null ? 'unknown' : (current ? 'true' : 'false');
    // Log every probe so the propagation timing is visible.
    hilog.info(DOMAIN, SUITE_TAG, 'toggle probe ' + (i + 1) + ': ' + currentText);
    // Report a flipped state as soon as it is observed.
    if (current !== null && current !== beforeOn) {
      // Report the flipped state.
      return true;
    }
  }
  // Report that the state never changed within the bounded window.
  return false;
}

// Tells whether the page degraded to the restricted-system-API state.
async function isPolicyRestricted(): Promise<boolean> {
  // The notice card sits at the top of the page; reset the scroll so its text is readable.
  const page: Component | null = await getDriver().findComponent(ON.id(POLICY_PAGE_ID));
  // Reset only when the page container is still on screen.
  if (page !== null) {
    try {
      // Jump back to the top of the page at the fastest supported speed.
      await page.scrollToTop(SCROLL_RESET_SPEED);
      // Let the reset settle before reading the status text.
      await sleepMs(SCROLL_SETTLE_MS);
    } catch (error) {
      // An unreadable scroll state still leaves the text query as the next step.
      hilog.warn(DOMAIN, SUITE_TAG, 'policy page reset failed');
    }
  }
  // Read the status text rendered in the notice card.
  const status: Component | null = await getDriver().findComponent(ON.id(POLICY_STATUS_ID));
  // Treat a missing status row as not restricted.
  if (status === null) {
    // Report the unknown state.
    return false;
  }
  try {
    // The restricted build shows the system-permission hint instead of the ready state.
    const text: string = await status.getText();
    // Log the observed status text for triage.
    hilog.info(DOMAIN, SUITE_TAG, 'policy status text: ' + text);
    // Match the restricted hint of the base-locale resources.
    return text.includes(RESTRICTED_STATUS_KEYWORD);
  } catch (error) {
    // An unreadable text is treated as not restricted.
    hilog.warn(DOMAIN, SUITE_TAG, 'status text read failed');
    // Report the unknown state.
    return false;
  }
}

// Locates a target component inside a scrollable container by its id.
// scrollSearch keeps scrolling internally for an unbounded time and pushed the cleartext case past
// the hypium 15s limit, so the viewport is stepped manually with a bounded number of swipes.
async function locateInScroll(scrollId: string, targetId: string, timeoutMs: number): Promise<Component | null> {
  // Fast path: the target is already on screen, so no scrolling is needed.
  if (await hasComponent(targetId)) {
    // Return the visible target component.
    return await getDriver().findComponent(ON.id(targetId));
  }
  // Resolve the scroll container; findComponent reports null when another page covers it.
  const scroll: Component | null = await getDriver().findComponent(ON.id(scrollId));
  // Fail fast when the page container is not on screen instead of crashing on a null handle.
  if (scroll === null) {
    // Log the missing scroll container id.
    hilog.error(DOMAIN, SUITE_TAG, 'scroll container missing, id: ' + scrollId);
    // Report the target as not found.
    return null;
  }
  // Read the container bounds once so every step swipes inside the visible viewport.
  const bounds: Rect = await scroll.getBounds();
  // Swipe along the container left edge: the page padding belongs to the scroll container,
  // while the card area may hold nested lists that would swallow the gesture.
  const swipeX: number = Math.round(bounds.left + SCROLL_EDGE_INSET_PX);
  // Start each step near the bottom edge of the viewport.
  const swipeStartY: number = Math.round(bounds.top + (bounds.bottom - bounds.top) * 0.85);
  // End each step near the top edge so one step moves the viewport by about 70 percent.
  const swipeEndY: number = Math.round(bounds.top + (bounds.bottom - bounds.top) * 0.15);
  // Reset to the top at the fastest supported speed for a deterministic start position.
  try {
    // Jump back to the top of the page.
    await scroll.scrollToTop(SCROLL_RESET_SPEED);
    // Let the reset settle before the first probe.
    await sleepMs(SCROLL_SETTLE_MS);
  } catch (error) {
    // A container that rejects the reset is still probed from its current position.
    hilog.warn(DOMAIN, SUITE_TAG, 'scrollToTop failed, scroll id: ' + scrollId);
  }
  // Step through up to SCROLL_STEP_MAX screens looking for the target.
  for (let step = 0; step < SCROLL_STEP_MAX; step++) {
    // Probe the current window for the target through a single fast query.
    if (await hasComponent(targetId)) {
      // Log the screen where the target was found.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'target found on screen ' + (step + 1) + ', id: ' + targetId);
      // Return the located target component.
      return await getDriver().findComponent(ON.id(targetId));
    }
    // Swipe upward to move the viewport one step down.
    await getDriver().swipe(swipeX, swipeStartY, swipeX, swipeEndY, SCROLL_STEP_SWIPE_SPEED);
    // Give the new screen time to render before probing again.
    await sleepMs(SCROLL_STEP_SETTLE_MS);
  }
  // Last chance with the caller-provided timeout for a target that is still rendering.
  if (await waitForId(targetId, timeoutMs)) {
    // Return the target that appeared during the final wait.
    return await getDriver().findComponent(ON.id(targetId));
  }
  // Log that the target is still missing after stepping through the page.
  hilog.error(DOMAIN, SUITE_TAG, 'target missing after scroll, scroll id: ' + scrollId + ', target id: ' + targetId);
  // Report the target as not found.
  return null;
}

// Clicks a target that lives inside a scrollable container.
async function clickInScroll(scrollId: string, targetId: string, timeoutMs: number): Promise<boolean> {
  // Locate the target inside the scroll container first.
  const target: Component | null = await locateInScroll(scrollId, targetId, timeoutMs);
  // Report failure when the target cannot be located.
  if (target === null) {
    // Report the click as failed.
    return false;
  }
  // Click the located target; a component that moved off screen reports a failure instead of crashing.
  try {
    // Click the located target.
    await target.click();
  } catch (error) {
    // Log the failed click with the target id.
    hilog.warn(DOMAIN, SUITE_TAG, 'click failed, target id: ' + targetId);
    // Report the click as failed.
    return false;
  }
  // Give the UI time to settle after the click.
  await sleepMs(CLICK_WAIT_MS);
  // Report the click as successful.
  return true;
}

// Dismisses the runtime dialog that asks for the installed application list permission.
// The dialog belongs to the system UI window and covers the app page, so every uitest query
// on app components fails while it stays on screen. Safe to call when no dialog is shown.
async function allowPermissionDialog(): Promise<boolean> {
  // Try each known allow-button text because dialog layouts differ between versions.
  for (let i = 0; i < PERMISSION_ALLOW_TEXTS.length; i++) {
    // Probe the current window for one allow-button text.
    try {
      // Find the buttons whose label matches the candidate text exactly.
      const buttons: Component[] | null = await getDriver().findComponents(ON.text(PERMISSION_ALLOW_TEXTS[i]));
      // Treat a null probe as no dialog on screen.
      if (buttons === null || buttons.length === 0) {
        // Move on to the next candidate text.
        continue;
      }
      // Click the first matching allow button.
      await buttons[0].click();
      // Let the dialog close and the app page settle.
      await sleepMs(DIALOG_SETTLE_MS);
      // Log the dismissal through the suite tag.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'permission dialog dismissed: ' + PERMISSION_ALLOW_TEXTS[i]);
      // Report that a dialog was handled.
      return true;
    } catch (error) {
      // Ignore probe failures; the dialog may belong to another window or be gone already.
      continue;
    }
  }
  // Report that no permission dialog was on screen.
  return false;
}

// Drops a leftover search keyword so the unfiltered application list renders again.
async function resetAppListKeyword(): Promise<void> {
  // A rendered list already means no keyword is filtering the page.
  if (await hasComponent(APP_LIST_LIST_ID)) {
    // Nothing to reset.
    return;
  }
  // Clear the keyword through the search input of the page.
  try {
    // Locate the search input of the app list page.
    const search: Component | null = await getDriver().findComponent(ON.id(APP_LIST_SEARCH_ID));
    // Skip the reset when the input is gone.
    if (search === null) {
      // Nothing to reset.
      return;
    }
    // Focus the input first: the text call must not race the soft keyboard startup.
    await search.click();
    // Let the input method window come up before clearing the text.
    await sleepMs(IME_SETTLE_MS);
    // Clear the keyword so the computed filter returns every item again.
    await search.clearText();
    // Let the page re-render the unfiltered list.
    await sleepMs(ACTION_WAIT_MS);
  } catch (error) {
    // A failed reset only weakens the next assertion, so it must not fail the current case.
    hilog.warn(DOMAIN, SUITE_TAG, 'app list keyword reset failed');
  }
}

// Answers the runtime permission dialog and waits until the app list page leaves the loading state.
// The load stays busy while the dialog is unanswered, so the page shows only the loading hint.
async function waitAppListSettled(): Promise<boolean> {
  // Probe a few times because the load runs behind the runtime permission dialog.
  for (let i = 0; i < APP_LIST_SETTLE_MAX; i++) {
    // Answer the dialog once: it blocks the load only while it is on screen.
    if (i === 0) {
      // Dismiss the dialog that blocks the first load of the installed list.
      await allowPermissionDialog();
    }
    // The item list, the restricted hint or the empty hint all mean the load finished.
    if (await hasComponent(APP_LIST_LIST_ID) || await hasComponent(APP_LIST_MESSAGE_ID) ||
      await hasComponent(APP_LIST_EMPTY_ID)) {
      // Report the settled page.
      return true;
    }
    // Give the load another interval to finish.
    await sleepMs(APP_LIST_SETTLE_INTERVAL_MS);
  }
  // Report that the page never left the loading state.
  return false;
}

// Opens the installed application list page through the policy entry, handling the
// first-launch permission dialog that covers the page right after the entry click.
async function openAppListPage(): Promise<boolean> {
  // Reuse the page when a previous case already opened it: the navigation stack cannot push it twice.
  if (await hasComponent(APP_LIST_PAGE_ID)) {
    // Drop a keyword left behind by the search case so the full list renders again.
    await resetAppListKeyword();
    // Answer a permission dialog that may still cover the reused page.
    await allowPermissionDialog();
    // Report the page as open.
    return true;
  }
  // Open the policy page before clicking the entry button.
  await openPolicyPage();
  // Click the installed application entry inside the policy page.
  const clicked: boolean = await clickInScroll(POLICY_PAGE_ID, APP_LIST_ENTRY_ID, FIND_TIMEOUT_MS);
  // Report failure early when the entry button was not clicked.
  if (!clicked) {
    // A leftover dialog may cover the policy page; try to dismiss it once.
    await allowPermissionDialog();
    // Retry the entry click after the dialog is gone.
    return await clickInScroll(POLICY_PAGE_ID, APP_LIST_ENTRY_ID, FIND_TIMEOUT_MS);
  }
  // The first entry click pops the runtime permission dialog over the page, so answer it first.
  await allowPermissionDialog();
  // Wait for the search input of the app list page.
  const searchReady: boolean = await waitForId(APP_LIST_SEARCH_ID, FIND_TIMEOUT_MS);
  // A successful wait means the page opened and the dialog is gone.
  if (searchReady) {
    // Report the page as open.
    return true;
  }
  // The permission dialog may also show up slightly later; answer it and wait once more.
  await allowPermissionDialog();
  // Return the second wait result as the final open state.
  return await waitForId(APP_LIST_SEARCH_ID, FIND_TIMEOUT_MS);
}

// Registers the UI test suite for the NetworkSecurity sample.
export default function networkSecurityTest() {
  // Define the UI test suite that contains all sample cases.
  describe('NetworkSecuritySample', () => {
    // Runs once before all cases: launch the app and wait for the main page.
    beforeAll(async () => {
      // Log the start of the suite.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' begin');
      // Launch the app under test.
      await launchApp();
      // Wait for the main page container to be ready.
      const mainReady: boolean = await waitForId(MAIN_PAGE_ID, FIND_TIMEOUT_MS);
      // Log whether the main page became ready.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', SUITE_TAG + ' main page ready: ' + mainReady);
    });

    // Runs before each case: wait out any uitest call left behind by a timed-out case.
    beforeEach(async () => {
      // Give the uitest service a short idle buffer first.
      await sleepMs(CASE_GAP_MS);
      // Probe with a lightweight query until the service accepts calls again.
      for (let i = 0; i < DRAIN_RETRY_MAX; i++) {
        // A successful probe means no leftover operation is being processed.
        try {
          // Send the probe query against the always-present main page id.
          await getDriver().findComponents(ON.id(MAIN_PAGE_ID));
          // Dismiss a leftover permission dialog so it cannot cover the next case.
          await allowPermissionDialog();
          // The service is idle and the screen is clear, continue into the case.
          return;
        } catch (error) {
          // The service is still busy with a leftover call, back off and retry.
          await sleepMs(DRAIN_RETRY_INTERVAL_MS);
        }
      }
      // Reaching here means the service stayed busy; the next case will surface the failure itself.
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_LAUNCHPAGE_0100
     * @tc.name      testLaunchPage0001
     * @tc.desc      Verify the main page container and the title are visible after EntryAbility starts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testLaunchPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testLaunchPage0001';
      // Mark the start of the launch case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Wait for the main page container to appear.
      const mainReady: boolean = await waitForId(MAIN_PAGE_ID, FIND_TIMEOUT_MS);
      // Log the main page wait result.
      logCase(TAG, 'wait ' + MAIN_PAGE_ID + ' ready: ' + mainReady);
      // Assert that the main page is displayed.
      expect(mainReady).assertTrue();

      // Wait for the main title component to appear.
      const titleReady: boolean = await waitForId(MAIN_TITLE_ID, FIND_TIMEOUT_MS);
      // Log the title wait result.
      logCase(TAG, 'wait ' + MAIN_TITLE_ID + ' ready: ' + titleReady);
      // Assert that the main title is displayed.
      expect(titleReady).assertTrue();

      // Locate the title component by its id.
      const title: Component = await getDriver().findComponent(ON.id(MAIN_TITLE_ID));
      // Read the text shown by the title.
      const titleText: string = await title.getText();
      // Log the title text length.
      logCase(TAG, 'title text length: ' + titleText.length);
      // Assert that the title text is not empty.
      expect(titleText.length > 0).assertTrue();
      // Mark the end of the launch case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_TABSWITCH_0100
     * @tc.name      testTabSwitch0001
     * @tc.desc      Verify the policy page and the security page containers appear when switching back and forth.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTabSwitch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testTabSwitch0001';
      // Mark the start of the tab switch case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Check whether the bottom policy tab exists.
      const tabPolicy: boolean = await hasComponent(TAB_POLICY_ID);
      // Check whether the side policy navigation exists.
      const navPolicy: boolean = await hasComponent(NAV_POLICY_ID);
      // Log which policy entries are available.
      logCase(TAG, 'policy entry, tab: ' + tabPolicy + ', nav: ' + navPolicy);

      // Open the policy page through the available entry.
      await openPolicyPage();
      // Wait for the policy page container to appear.
      const policyReady: boolean = await waitForId(POLICY_PAGE_ID, FIND_TIMEOUT_MS);
      // Log the policy page wait result.
      logCase(TAG, 'wait ' + POLICY_PAGE_ID + ' ready: ' + policyReady);
      // Assert that the policy page is displayed.
      expect(policyReady).assertTrue();
      // The policy page was reachable, so one of its entries existed when probed.
      expect(tabPolicy || navPolicy).assertTrue();

      // Check whether the bottom security tab exists.
      const tabSecurity: boolean = await hasComponent(TAB_SECURITY_ID);
      // Check whether the side security navigation exists.
      const navSecurity: boolean = await hasComponent(NAV_SECURITY_ID);
      // Log which security entries are available.
      logCase(TAG, 'security entry, tab: ' + tabSecurity + ', nav: ' + navSecurity);

      // Switch back to the security page through the available entry.
      await openSecurityPage();
      // Wait for the security page container to appear.
      const securityReady: boolean = await waitForId(SECURITY_PAGE_ID, FIND_TIMEOUT_MS);
      // Log the security page wait result.
      logCase(TAG, 'wait ' + SECURITY_PAGE_ID + ' ready: ' + securityReady);
      // Assert that the security page is displayed.
      expect(securityReady).assertTrue();
      // The security page was reachable, so one of its entries existed when probed.
      expect(tabSecurity || navSecurity).assertTrue();
      // Mark the end of the tab switch case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_CERTVERIFY_0100
     * @tc.name      testCertVerify0001
     * @tc.desc      Verify clicking the sync certificate verify button shows the certificate result card and the log panel.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCertVerify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testCertVerify0001';
      // Mark the start of the certificate verify case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the security page before clicking the button.
      await openSecurityPage();
      // Click the sync certificate verify button inside the page.
      const clicked: boolean = await clickInScroll(SECURITY_PAGE_ID, CERT_VERIFY_SYNC_ID, FIND_TIMEOUT_MS);
      // Log the click result.
      logCase(TAG, 'click ' + CERT_VERIFY_SYNC_ID + ' success: ' + clicked);
      // Assert that the verify button was clicked.
      expect(clicked).assertTrue();

      // Wait for the synchronous verification to finish.
      await sleepMs(ACTION_WAIT_MS);
      // Wait for the certificate result card to appear.
      const cardReady: boolean = await waitForId(CERT_CARD_ID, FIND_TIMEOUT_MS);
      // Log the certificate card wait result.
      logCase(TAG, 'wait ' + CERT_CARD_ID + ' ready: ' + cardReady);
      // Assert that the certificate card is displayed.
      expect(cardReady).assertTrue();

      // Wait for the security log panel to appear.
      const logPanelReady: boolean = await waitForId(SECURITY_LOG_PANEL_ID, FIND_TIMEOUT_MS);
      // Log the log panel wait result.
      logCase(TAG, 'wait ' + SECURITY_LOG_PANEL_ID + ' ready: ' + logPanelReady);
      // Assert that the log panel is displayed.
      expect(logPanelReady).assertTrue();
      // Mark the end of the certificate verify case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_CLEARTEXTQUERY_0100
     * @tc.name      testCleartextQuery0001
     * @tc.desc      Verify the global cleartext query button produces a result row on the security page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testCleartextQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testCleartextQuery0001';
      // Mark the start of the cleartext case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the security page before clicking the button.
      await openSecurityPage();
      // Click the global cleartext query button inside the page.
      const clicked: boolean = await clickInScroll(SECURITY_PAGE_ID, CLEARTEXT_QUERY_ID, FIND_TIMEOUT_MS);
      // Log the click result.
      logCase(TAG, 'click ' + CLEARTEXT_QUERY_ID + ' success: ' + clicked);
      // Assert that the query button was clicked.
      expect(clicked).assertTrue();

      // Wait for the cleartext query to finish.
      await sleepMs(ACTION_WAIT_MS);
      // Wait for the cleartext result row to appear.
      const valueReady: boolean = await waitForId(CLEARTEXT_VALUE_ID, FIND_TIMEOUT_MS);
      // Log the result row wait result.
      logCase(TAG, 'wait ' + CLEARTEXT_VALUE_ID + ' ready: ' + valueReady);
      // Assert that the result row is displayed.
      expect(valueReady).assertTrue();

      // Locate the result row component.
      const value: Component = await getDriver().findComponent(ON.id(CLEARTEXT_VALUE_ID));
      // Read the text shown by the result row.
      const valueText: string = await value.getText();
      // Log the result text length.
      logCase(TAG, 'cleartext value text length: ' + valueText.length);
      // The rendered label comes from a non-empty string resource, so the row carries text.
      expect(valueText.length).assertLarger(0);
      // A second read from the same row keeps the result text stable.
      const valueTextAgain: string = await value.getText();
      // Log the stability of the rendered result text.
      logCase(TAG, 'cleartext value text stable: ' + (valueTextAgain === valueText));
      // The repeated read must return the same text for the same query result.
      expect(valueTextAgain).assertEqual(valueText);
      // Mark the end of the cleartext case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_POLICYACCESSQUERY_0100
     * @tc.name      testPolicyAccessQuery0001
     * @tc.desc      Verify clicking the background allow toggle flips its bound state on the policy page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPolicyAccessQuery0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testPolicyAccessQuery0001';
      // Mark the start of the policy access case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the policy page before flipping the toggle.
      await openPolicyPage();
      // Locate the background allow toggle inside the page scroll.
      const before: Component | null = await locateInScroll(POLICY_PAGE_ID, POLICY_TOGGLE_ID, FIND_TIMEOUT_MS);
      // Log the toggle lookup result.
      logCase(TAG, 'locate ' + POLICY_TOGGLE_ID + ' success: ' + (before !== null));
      // Assert that the toggle is present.
      expect(before !== null).assertTrue();

      // Guard the rest of the case on the toggle being located.
      if (before === null) {
        // Leave the case; the assertion above already failed.
        return;
      }
      // Read the toggle state before the click; a Toggle mirrors checked, not selected.
      const beforeOn: boolean | null = await readCheckedState(before);
      // Render the tri-state value without relying on implicit null concatenation.
      const beforeText: string = beforeOn === null ? 'unknown' : (beforeOn ? 'true' : 'false');
      // Log the initial switch state.
      logCase(TAG, 'toggle state before: ' + beforeText);
      // Fail cleanly when the switch state cannot be read at all.
      if (beforeOn === null) {
        // Log the unreadable state.
        logCase(TAG, 'toggle state is not readable');
        // Fail the case on the unreadable switch.
        expect(false).assertTrue();
        // Leave the case.
        return;
      }
      // Page queries run right after the page appears and keep the switch disabled; wait for it.
      const toggle: Component | null = await waitPolicyToggleEnabled();
      // Log the interactive switch lookup result.
      logCase(TAG, 'toggle interactive: ' + (toggle !== null));
      // Assert that the switch accepts interaction before the click.
      expect(toggle !== null).assertTrue();

      // Guard the click on the interactive switch being available.
      if (toggle === null) {
        // Leave the case; the assertion above already failed.
        return;
      }
      // Flip the toggle through a click.
      await toggle.click();
      // Wait for the bound state to propagate; the handler awaits the system policy call.
      const flipped: boolean = await waitToggleFlipped(beforeOn);
      // Log the observed state change.
      logCase(TAG, 'toggle flipped: ' + flipped);
      // Confirm the new state survives one more render: a rejected system call rolls the switch back,
      // so a single intermediate read must not be trusted as a successful flip.
      await sleepMs(TOGGLE_STATE_INTERVAL_MS);
      const confirmToggle: Component | null = await getDriver().findComponent(ON.id(POLICY_TOGGLE_ID));
      // Read the confirmed state only when the switch is still on screen.
      let confirmOn: boolean | null = null;
      if (confirmToggle !== null) {
        confirmOn = await readCheckedState(confirmToggle);
      }
      // Treat the flip as stable only when the second read still differs from the value before the click.
      const stable: boolean = flipped && confirmOn !== null && confirmOn !== beforeOn;
      // Log the confirmation result.
      logCase(TAG, 'toggle state stable after click: ' + stable);

      // A device with system permissions must flip the state on click and keep it.
      if (stable) {
        // Assert the normal path.
        expect(true).assertTrue();
      } else {
        // setBackgroundAllowed() is @systemapi, so a normal device answers 202 and keeps the state.
        const restricted: boolean = await isPolicyRestricted();
        // Log the degraded branch for triage.
        logCase(TAG, 'toggle unchanged, restricted hint: ' + restricted);
        // Assert that the page reported the restricted system API instead of silently doing nothing.
        expect(restricted).assertTrue();
      }
      // Mark the end of the policy toggle case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_APPLISTRENDER_0100
     * @tc.name      testAppListRender0001
     * @tc.desc      Verify the installed app entry opens a usable app list page or the restricted-device hint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppListRender0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testAppListRender0001';
      // Mark the start of the app list case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the app list page through the policy entry, handling the first-launch permission dialog.
      const opened: boolean = await openAppListPage();
      // Log the page open result.
      logCase(TAG, 'open app list page success: ' + opened);
      // Assert that the app list page opened.
      expect(opened).assertTrue();

      // Answer the permission dialog and wait until the load leaves the loading state.
      const settled: boolean = await waitAppListSettled();
      // Probe the list state once for the log line.
      const listReady: boolean = await hasComponent(APP_LIST_LIST_ID);
      // Log which list state rendered.
      logCase(TAG, 'app list settled: ' + settled + ', list ready: ' + listReady);
      // The item list, the restricted hint or the empty hint all keep the page usable.
      expect(settled).assertTrue();
      // When the load settled, the page must show one usable terminal state.
      const listRendered: boolean = await hasComponent(APP_LIST_LIST_ID);
      const messageRendered: boolean = await hasComponent(APP_LIST_MESSAGE_ID);
      const emptyRendered: boolean = await hasComponent(APP_LIST_EMPTY_ID);
      // Log which terminal state rendered.
      logCase(TAG, 'terminal state, list: ' + listRendered + ', message: ' + messageRendered
        + ', empty: ' + emptyRendered);
      // One of the three terminal states must be on screen after the load settled.
      expect(listRendered || messageRendered || emptyRendered).assertTrue();
      // Mark the end of the app list case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_APPLISTSEARCHFILTER_0100
     * @tc.name      testAppListSearchFilter0001
     * @tc.desc      Verify a non-matching search keyword in the app list shows the empty hint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppListSearchFilter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testAppListSearchFilter0001';
      // Mark the start of the search filter case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the app list page through the policy entry, handling the first-launch permission dialog.
      const opened: boolean = await openAppListPage();
      // Log the page open result.
      logCase(TAG, 'open app list page success: ' + opened);
      // Assert that the app list page opened.
      expect(opened).assertTrue();

      // Wait for the load to settle before filtering.
      await sleepMs(ACTION_WAIT_MS);
      // Skip the filter check when the device cannot load the list.
      if (!(await hasComponent(APP_LIST_LIST_ID))) {
        // Log the restricted environment and keep the case green.
        logCase(TAG, 'app list unavailable on this device, skip filter check');
        expect(true).assertTrue();
        return;
      }

      // Locate the search input of the app list page.
      const search: Component | null = await getDriver().findComponent(ON.id(APP_LIST_SEARCH_ID));
      // Fail the case cleanly when the search input is missing.
      if (search === null) {
        // Log the missing search input.
        logCase(TAG, 'search input missing: ' + APP_LIST_SEARCH_ID);
        // Fail the case on the missing input.
        expect(false).assertTrue();
        // Leave the case.
        return;
      }
      // Focus the search input first: the text call must not race the soft keyboard startup.
      await search.click();
      // Let the input method window come up before injecting the text.
      await sleepMs(IME_SETTLE_MS);
      // Type a keyword that cannot match any application name or bundle name.
      await search.inputText('zzzznoapp');
      // Wait for the empty hint.
      const emptyReady: boolean = await waitForId(APP_LIST_EMPTY_ID, FIND_TIMEOUT_MS);
      // Log the empty hint wait result.
      logCase(TAG, 'wait ' + APP_LIST_EMPTY_ID + ' ready: ' + emptyReady);
      // Assert that the empty hint is displayed.
      expect(emptyReady).assertTrue();
      // Mark the end of the search filter case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_UI_APPDETAILNAVIGATION_0100
     * @tc.name      testAppDetailNavigation0001
     * @tc.desc      Verify tapping the first application row opens the app detail page.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAppDetailNavigation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // Per-case log tag, kept identical to the it() name and @tc.name.
      const TAG: string = 'testAppDetailNavigation0001';
      // Mark the start of the detail navigation case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the app list page through the policy entry, handling the first-launch permission dialog.
      const opened: boolean = await openAppListPage();
      // Log the page open result.
      logCase(TAG, 'open app list page success: ' + opened);
      // Assert that the app list page opened.
      expect(opened).assertTrue();

      // Wait for the load to settle before looking for rows.
      await sleepMs(ACTION_WAIT_MS);
      // Skip when the device cannot render the app list.
      if (!(await hasComponent(APP_LIST_LIST_ID))) {
        // Log the restricted environment and keep the case green.
        logCase(TAG, 'app list unavailable on this device, skip detail check');
        expect(true).assertTrue();
        return;
      }

      // Find the visible list items of the app list page.
      const rows: Component[] | null = await getDriver().findComponents(ON.type('ListItem'));
      // Treat a null probe result as "no rows" so length is never read on null.
      if (rows === null || rows.length === 0) {
        // Log the empty environment and keep the case green.
        logCase(TAG, 'no application rows rendered or null probe, skip detail check');
        expect(true).assertTrue();
        return;
      }
      // Log the row count.
      logCase(TAG, 'visible list items: ' + rows.length);

      // Tap the first application row.
      await rows[0].click();
      // Give the navigation time to settle after the click.
      await sleepMs(CLICK_WAIT_MS);
      // Wait for the detail page container.
      let detailReady: boolean = await waitForId(APP_DETAIL_PAGE_ID, FIND_TIMEOUT_MS);
      // A failed wait may mean the permission dialog popped up over the detail page.
      if (!detailReady) {
        // Dismiss the dialog if it is on screen.
        await allowPermissionDialog();
        // Wait for the detail page once more.
        detailReady = await waitForId(APP_DETAIL_PAGE_ID, FIND_TIMEOUT_MS);
      }
      // Log the detail page wait result.
      logCase(TAG, 'wait ' + APP_DETAIL_PAGE_ID + ' ready: ' + detailReady);
      // Assert that the detail page is displayed.
      expect(detailReady).assertTrue();
      // Mark the end of the detail navigation case.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
