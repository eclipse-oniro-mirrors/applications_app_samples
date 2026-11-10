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

// Import the Want type used to launch the application under test.
import { Want } from '@kit.AbilityKit';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the UI test driver primitives used to locate and drive components.
import { abilityDelegatorRegistry, Component, Driver, ON, Point, Rect } from '@kit.TestKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';
// The bundle name of the application under test.
const APP_BUNDLE: string = 'com.samples.fontandresource';
// The ability name of the application under test.
const ABILITY_NAME: string = 'EntryAbility';

// The wait time after launching the application before asserting on it.
const LAUNCH_WAIT_MS: number = 2000;
// The settle time after a single click interaction.
const CLICK_WAIT_MS: number = 300;
// The settle time after a business action such as prepare or convert.
const ACTION_WAIT_MS: number = 600;
// The settle time after a round trip conversion that crosses threads.
const ROUND_TRIP_WAIT_MS: number = 1500;
// The settle time after a scroll gesture so the layout tree can refresh.
const SCROLL_SETTLE_MS: number = 350;
// The number of swipe bands used while sweeping down the page sections.
const SWEEP_SWIPE_MAX: number = 8;
// The downward swipe speed in pixels per second, matched to the verified manual swipe.
const SWEEP_SWIPE_SPEED: number = 2000;
// The number of flings used to rewind the page back to the top.
const REWIND_SWIPE_MAX: number = 6;
// The rewind speed in pixels per second; the top edge clamps the overshoot.
const REWIND_SWIPE_SPEED: number = 4000;
// The wall clock budget for one scroll locate, kept below the hypium case timeout.
const LOCATE_BUDGET_MS: number = 10000;
// The short wait for a component that renders right after a business action.
const WAIT_RENDER_MS: number = 300;
// The fraction of the display height where the upward swipe starts.
const SWIPE_FROM_RATIO: number = 0.8;
// The fraction of the display height where the upward swipe ends.
const SWIPE_TO_RATIO: number = 0.2;
// The retry limit for transient uitest concurrent conflicts on find calls.
const FIND_RETRY_MAX: number = 5;
// The backoff wait between find retries against a busy uitest channel.
const FIND_RETRY_WAIT_MS: number = 1000;
// The short wait between find retries when the component is simply not in the tree yet.
const FIND_MISS_WAIT_MS: number = 200;

// The component id of the bottom font tab.
const TAB_FONT_ID: string = 'id_tab_font';
// The component id of the bottom resource tab.
const TAB_RESOURCE_ID: string = 'id_tab_resource';
// The component id of the side navigation font item.
const NAV_FONT_ID: string = 'id_nav_font';
// The component id of the side navigation resource item.
const NAV_RESOURCE_ID: string = 'id_nav_resource';
// The component id of the font page scroll container.
const FONT_SCROLL_ID: string = 'id_font_scroll';
// The component id of the resource page scroll container.
const RESOURCE_SCROLL_ID: string = 'id_resource_scroll';
// The topmost component of the font page, used to detect a scrolled away position.
const FONT_TOP_ANCHOR_ID: string = 'id_check_name_0';
// The topmost component of the resource page, used to detect a scrolled away position.
const RESOURCE_TOP_ANCHOR_ID: string = 'id_resource_list_card_title';
// The component id of the main page shell.
const MAIN_PAGE_ID: string = 'id_main_page';
// The component id of the main page title text.
const MAIN_TITLE_ID: string = 'id_main_title';
// The component id of the font page grid.
const FONT_VIEW_ID: string = 'id_font_view';
// The component id of the resource page grid.
const RESOURCE_VIEW_ID: string = 'id_resource_view';
// The component id of the prepare button.
const PREPARE_BUTTON_ID: string = 'id_btn_prepare';
// The component id of the asset state value row.
const ASSET_STATE_VALUE_ID: string = 'id_asset_state_value';
// The component id of the asset path value row.
const ASSET_PATH_VALUE_ID: string = 'id_asset_path_value';
// The component id of the preview toggle.
const PREVIEW_TOGGLE_ID: string = 'id_preview_toggle';
// The component id of the batch conversion button.
const CONVERT_ALL_BUTTON_ID: string = 'id_btn_convert_all';
// The component id of the media conversion button.
const CONVERT_MEDIA_BUTTON_ID: string = 'id_btn_convert_media';
// The component id of the color entry detail text.
const COLOR_DETAIL_ID: string = 'id_entry_detail_brand_color';
// The component id of the rendered media image.
const RENDER_MEDIA_ID: string = 'id_render_media';
// The component id of the taskpool route button.
const TASKPOOL_BUTTON_ID: string = 'id_btn_taskpool';
// The component id of the worker route button.
const WORKER_BUTTON_ID: string = 'id_btn_worker';
// The component id of the round trip path value row.
const ROUND_TRIP_PATH_VALUE_ID: string = 'id_roundtrip_path_value';
// The component id of the on-screen log list on the font page.
const FONT_LOG_LIST_ID: string = 'id_font_log_list';
// The component id of the empty state hint of the on-screen log panel.
const FONT_LOG_EMPTY_ID: string = 'id_font_log_empty';
// The component id of the clear button of the on-screen log panel.
const FONT_LOG_CLEAR_ID: string = 'id_font_log_clear';
// The component id of the header row of the on-screen log panel.
const FONT_LOG_HEADER_ID: string = 'id_font_log_header';

// The file extension expected on the prepared sandbox font path.
const FONT_SUFFIX: string = '.ttf';
// The expected route label of the taskpool path.
const TASKPOOL_TEXT: string = 'TaskPool';
// The expected route label of the worker path.
const WORKER_TEXT: string = 'Worker';

// The lazily created UI driver instance shared by every case.
let uiDriver: Driver | null = null;

// Returns the shared UI driver, creating it on first use.
function getDriver(): Driver {
  // Reuse the cached driver when it already exists.
  if (uiDriver !== null) {
    // Return the cached driver instance.
    return uiDriver;
  }
  // Create a fresh driver on the first call.
  const created: Driver = Driver.create();
  // Cache the driver for the following cases.
  uiDriver = created;
  // Return the newly created driver.
  return created;
}

// Waits on the local event loop so a retry never occupies the single uitest channel.
function sleep(ms: number): Promise<void> {
  // Resolve the promise after the requested delay expires.
  return new Promise<void>((resolve: (value: void) => void) => {
    // Schedule the resolution on the local timer queue.
    setTimeout(() => {
      // Hand control back to the awaiting case.
      resolve();
    }, ms);
  });
}

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Launches the application under test and waits for the first frame.
async function launchApp(): Promise<void> {
  // Build the launch want targeting the entry ability.
  const want: Want = {
    bundleName: APP_BUNDLE,
    abilityName: ABILITY_NAME
  };
  // Start the ability through the delegator.
  await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
  // Wait for the application to settle after the launch.
  await sleep(LAUNCH_WAIT_MS);
}

// Returns the matching components with a single query so a plain miss stays cheap.
async function findOnce(idValue: string): Promise<Component[]> {
  // Query the current layout tree for matching components.
  const found: Component[] | null = await getDriver().findComponents(ON.id(idValue));
  // Normalize the null result into an empty list.
  return found !== null && found !== undefined ? found : [];
}

// Finds every component matching the id, retrying only a busy uitest channel.
async function findWithRetry(idValue: string): Promise<Component[]> {
  // Try the query up to the retry limit.
  for (let attempt: number = 0; attempt < FIND_RETRY_MAX; attempt++) {
    try {
      // Return the matches as soon as the query succeeds, even when empty.
      return await findOnce(idValue);
    } catch (err) {
      // Log the transient failure before backing off.
      hilog.warn(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'find retry ' + attempt + ', id: ' + idValue);
      // Stop once the retry budget is exhausted.
      if (attempt === FIND_RETRY_MAX - 1) {
        // Return an empty result after the last failure.
        return [];
      }
      // Back off on the local timer so the pending uitest call can settle.
      await sleep(FIND_RETRY_WAIT_MS);
    }
  }
  // Return an empty result once the retries are exhausted.
  return [];
}

// Waits a short while for a component that renders right after a business action.
async function waitForComponent(idValue: string, timeoutMs: number): Promise<Component[] | null> {
  // Record the start of the wait so the loop stays bounded.
  const startedAt: number = Date.now();
  // Poll until the component appears or the wait budget expires.
  while (Date.now() - startedAt < timeoutMs) {
    // Read the current matches with a single query.
    const found: Component[] = await findWithRetry(idValue);
    // Return the match as soon as the tree contains the component.
    if (found.length > 0) {
      // Return the matched components.
      return found;
    }
    // Wait briefly before the next poll.
    await sleep(FIND_MISS_WAIT_MS);
  }
  // Report the miss so the caller can fall back to scrolling.
  hilog.warn(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'find miss, id: ' + idValue);
  // Return null to signal the timeout.
  return null;
}

// Returns the first component matching the id in the current tree, or null when absent.
async function findAnywhere(idValue: string): Promise<Component | null> {
  // Read the matching components from the current tree.
  const found: Component[] = await findWithRetry(idValue);
  // Return the first match or null when nothing matched.
  return found.length > 0 ? found[0] : null;
}

// Returns the first component matching the id, throwing a clear error when absent.
async function requireComponent(idValue: string): Promise<Component> {
  // Resolve the component from the current tree first.
  const direct: Component | null = await findAnywhere(idValue);
  // Throw with the id when the component is missing.
  if (direct === null) {
    // Include the missing id in the case failure.
    throw new Error('component not found: ' + idValue);
  }
  // Return the resolved component.
  return direct;
}

// Reports whether a component with the given id exists in the current tree.
async function hasComponent(idValue: string): Promise<boolean> {
  // Reuse the retried finder and check for any match.
  const found: Component[] = await findWithRetry(idValue);
  // The component exists when the result is not empty.
  return found.length > 0;
}

// Clicks the component with the given id and waits for the click to settle.
async function clickComponent(idValue: string): Promise<void> {
  // Locate the target component by id.
  const target: Component = await requireComponent(idValue);
  // Click the located component.
  await target.click();
  // Wait for the click side effects to settle.
  await sleep(CLICK_WAIT_MS);
}

// Flings the page back to the top until the anchor component is rendered again.
async function scrollToTop(anchorId: string): Promise<void> {
  // Skip the gesture when the page already sits at the top.
  if (await findAnywhere(anchorId) !== null) {
    return;
  }
  // Read the display size to place the downward fling band.
  const size: Point = await getDriver().getDisplaySize();
  // Compute the fling band at the horizontal center of the page.
  const centerX: number = Math.round(size.x * 0.5);
  const fromY: number = Math.round(size.y * SWIPE_TO_RATIO);
  const toY: number = Math.round(size.y * SWIPE_FROM_RATIO);
  // Fling downward until the anchor component is visible again.
  for (let sweep: number = 0; sweep < REWIND_SWIPE_MAX; sweep++) {
    // Swipe downward so the content moves back toward the top.
    await getDriver().swipe(centerX, fromY, centerX, toY, REWIND_SWIPE_SPEED);
    // Wait for the scroll to settle after the fling.
    await sleep(SCROLL_SETTLE_MS);
    // Stop as soon as the anchor component is rendered again.
    if (await findAnywhere(anchorId) !== null) {
      return;
    }
  }
}

// Locates a component inside a scrollable container, sweeping the page downward.
async function locateInScroll(scrollId: string, targetId: string): Promise<Component> {
  // Record the start time so the sweep cannot outlive the case timeout.
  const startedAt: number = Date.now();
  // Try the current viewport first.
  const initial: Component | null = await findAnywhere(targetId);
  // Return the direct hit when the target is already on screen.
  if (initial !== null) {
    return initial;
  }
  // Read the display size to place the vertical swipe band.
  const size: Point = await getDriver().getDisplaySize();
  // Log the display size once so a mismatched swipe band stays diagnosable.
  hilog.info(DOMAIN, SUITE_TAG, '%{public}s',
    BUNDLE + 'locate ' + targetId + ' display ' + size.x + 'x' + size.y);
  // Compute the swipe band at the horizontal center of the page.
  const centerX: number = Math.round(size.x * 0.5);
  // Compute the swipe start and end heights.
  const fromY: number = Math.round(size.y * SWIPE_FROM_RATIO);
  const toY: number = Math.round(size.y * SWIPE_TO_RATIO);
  // Swipe upward through the page sections one band at a time.
  for (let sweep: number = 0; sweep < SWEEP_SWIPE_MAX; sweep++) {
    // Stop before a hard case timeout can leave a pending uitest call behind.
    if (Date.now() - startedAt > LOCATE_BUDGET_MS) {
      // Fail with a clear message instead of being killed mid call.
      throw new Error('component locate budget exceeded: ' + targetId);
    }
    // Swipe one band upward to reveal the next section.
    await getDriver().swipe(centerX, fromY, centerX, toY, SWEEP_SWIPE_SPEED);
    // Wait for the scroll to settle after the swipe.
    await sleep(SCROLL_SETTLE_MS);
    // Look for the target in the refreshed viewport.
    const hit: Component | null = await findAnywhere(targetId);
    // Return the hit while the target stays on screen for the caller.
    if (hit !== null) {
      // Return the component found during the sweep.
      return hit;
    }
  }
  // Fail with a clear message when the target never appeared.
  throw new Error('component not found in scroll: ' + targetId);
}

// Clicks a component located inside a scrollable container.
async function clickInScroll(scrollId: string, targetId: string): Promise<void> {
  // Prefer the direct tree hit which avoids a scroll round trip.
  const direct: Component | null = await findAnywhere(targetId);
  // Click directly when the component is already present.
  if (direct !== null) {
    // Click the directly found component.
    await direct.click();
    // Wait for the click side effects to settle.
    await sleep(CLICK_WAIT_MS);
    // Stop after the direct click.
    return;
  }
  // Locate the target inside the scroll container.
  const target: Component = await locateInScroll(scrollId, targetId);
  // Click the located target.
  await target.click();
  // Wait for the click side effects to settle.
  await sleep(CLICK_WAIT_MS);
}

// Reads the displayed text of a component, scrolling the container only as a fallback.
async function readText(scrollId: string, targetId: string): Promise<string> {
  // Prefer the direct tree hit and allow a short render delay after the action.
  const direct: Component[] | null = await waitForComponent(targetId, WAIT_RENDER_MS);
  // Read the text directly when the component is already present.
  if (direct !== null) {
    // Return the displayed text of the direct match.
    return await direct[0].getText();
  }
  // Locate the target inside the scroll container.
  const target: Component = await locateInScroll(scrollId, targetId);
  // Return the displayed text of the target.
  return await target.getText();
}

// Reads the bounds of a component, scrolling the container only as a fallback.
async function readBounds(scrollId: string, targetId: string): Promise<Rect> {
  // Prefer the direct tree hit and allow a short render delay after the action.
  const direct: Component[] | null = await waitForComponent(targetId, WAIT_RENDER_MS);
  // Read the bounds directly when the component is already present.
  if (direct !== null) {
    // Return the bounds of the direct match.
    return await direct[0].getBounds();
  }
  // Locate the target inside the scroll container.
  const target: Component = await locateInScroll(scrollId, targetId);
  // Return the bounds of the target.
  return await target.getBounds();
}

// Opens the font page using the tab bar or the side navigation.
async function openFontPage(): Promise<void> {
  // Prefer the bottom tab on the phone layout.
  if (await hasComponent(TAB_FONT_ID)) {
    // Click the bottom font tab.
    await clickComponent(TAB_FONT_ID);
    // Rewind the reused page so the sweep always starts from the top.
    await scrollToTop(FONT_TOP_ANCHOR_ID);
    // Stop after selecting through the tab bar.
    return;
  }
  // Fall back to the side navigation on the tablet layout.
  // Click the navigation font item.
  await clickComponent(NAV_FONT_ID);
  // Rewind the reused page so the sweep always starts from the top.
  await scrollToTop(FONT_TOP_ANCHOR_ID);
}

// Opens the resource page using the tab bar or the side navigation.
async function openResourcePage(): Promise<void> {
  // Prefer the bottom tab on the phone layout.
  if (await hasComponent(TAB_RESOURCE_ID)) {
    // Click the bottom resource tab.
    await clickComponent(TAB_RESOURCE_ID);
    // Rewind the reused page so the sweep always starts from the top.
    await scrollToTop(RESOURCE_TOP_ANCHOR_ID);
    // Stop after selecting through the tab bar.
    return;
  }
  // The tab lookup may fail while the uitest channel recovers from a transient
  // concurrent conflict; wait once and retry the tab lookup before falling
  // back to the side navigation which only exists on the tablet layout.
  await sleep(FIND_RETRY_WAIT_MS);
  // Retry the bottom resource tab lookup.
  if (await hasComponent(TAB_RESOURCE_ID)) {
    // Click the bottom resource tab on the retried lookup.
    await clickComponent(TAB_RESOURCE_ID);
    // Rewind the reused page so the sweep always starts from the top.
    await scrollToTop(RESOURCE_TOP_ANCHOR_ID);
    // Stop after selecting through the tab bar.
    return;
  }
  // Fall back to the side navigation on the tablet layout.
  // Click the navigation resource item.
  await clickComponent(NAV_RESOURCE_ID);
  // Rewind the reused page so the sweep always starts from the top.
  await scrollToTop(RESOURCE_TOP_ANCHOR_ID);
}

// Prepares the demo font by opening the font page and pressing the prepare button.
async function prepareFont(): Promise<void> {
  // Open the font page first.
  await openFontPage();
  // Press the prepare button inside the font scroll container.
  await clickInScroll(FONT_SCROLL_ID, PREPARE_BUTTON_ID);
  // Wait for the sandbox copy to finish.
  await sleep(ACTION_WAIT_MS);
}

// Registers every on-device test case of the font resource demo.
export default function fontResourceTest() {
  // Group the cases under the "FontResourceSample" describe block.
  describe('FontResourceSample', () => {
    // Launch the application once before all cases run.
    beforeAll(async () => {
      // Log the suite start line.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'Suite, begin');
      // Launch the application under test.
      await launchApp();
      // Log the successful application start.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'Suite, application started');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_MAINPAGE_0100
     * @tc.name      testMainPage0001
     * @tc.desc      Verify the main page shell and the title text are rendered after launch.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMainPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testMainPage0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Check that the main page shell is present.
      const mainPageExists: boolean = await hasComponent(MAIN_PAGE_ID);
      // Log the shell presence check result.
      logCase(TAG, 'main page exists: ' + mainPageExists);
      // Expect the main page shell to exist.
      expect(mainPageExists).assertTrue();

      // Locate the main title text through the retried finder.
      const title: Component = await requireComponent(MAIN_TITLE_ID);
      // Read the displayed title text.
      const titleText: string = await title.getText();
      // Log the captured title text.
      logCase(TAG, 'title text: ' + titleText);
      // Expect the title text to be non-empty.
      expect(titleText.length > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_TABSWITCH_0200
     * @tc.name      testTabSwitch0001
     * @tc.desc      Verify switching between the font and resource pages through the tab bar or the side navigation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testTabSwitch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testTabSwitch0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the resource page first.
      await openResourcePage();
      // Check that the resource page grid is present.
      const resourceVisible: boolean = await hasComponent(RESOURCE_VIEW_ID);
      // Log the resource page presence check result.
      logCase(TAG, 'resource page exists: ' + resourceVisible);
      // Expect the resource page to be reachable.
      expect(resourceVisible).assertTrue();

      // Switch back to the font page.
      await openFontPage();
      // Check that the font page grid is present.
      const fontVisible: boolean = await hasComponent(FONT_VIEW_ID);
      // Log the font page presence check result.
      logCase(TAG, 'font page exists: ' + fontVisible);
      // Expect the font page to be reachable.
      expect(fontVisible).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_PREPAREFONT_0300
     * @tc.name      testPrepareFont0001
     * @tc.desc      Verify preparing the bundled font fills the asset state row and the sandbox .ttf path row.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testPrepareFont0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testPrepareFont0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the prepare action on the font page.
      await prepareFont();
      // Read the asset state row text.
      const stateText: string = await readText(FONT_SCROLL_ID, ASSET_STATE_VALUE_ID);
      // Log the captured asset state text.
      logCase(TAG, 'asset state: ' + stateText);
      // Expect the state row to be non-empty.
      expect(stateText.length > 0).assertTrue();

      // Read the asset path row text.
      const pathText: string = await readText(FONT_SCROLL_ID, ASSET_PATH_VALUE_ID);
      // Log the captured asset path text.
      logCase(TAG, 'asset path: ' + pathText);
      // Expect the path to end with the font extension.
      expect(pathText.endsWith(FONT_SUFFIX)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_PREVIEWTOGGLE_0400
     * @tc.name      testPreviewToggle0001
     * @tc.desc      Verify toggling the preview switch registers the font and leaves the switch checked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreviewToggle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPreviewToggle0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the prepare action before toggling the preview.
      await prepareFont();
      // Locate the preview toggle, scrolling it into view by gestures if needed.
      const toggle: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      // Click the located toggle to switch the preview on.
      await toggle.click();
      // Wait for the registration to finish.
      await sleep(ACTION_WAIT_MS);
      // Re-read the toggle state from the located component.
      const checked: boolean = await toggle.isChecked();
      // Log the captured toggle state.
      logCase(TAG, 'preview toggle checked: ' + checked);
      // Expect the toggle to be checked after the switch.
      expect(checked).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_CONVERTALL_0500
     * @tc.name      testConvertAll0001
     * @tc.desc      Verify the batch conversion fills every non-media entry with a result detail.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConvertAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConvertAll0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the resource page for this case.
      await openResourcePage();
      // Press the batch conversion button.
      await clickInScroll(RESOURCE_SCROLL_ID, CONVERT_ALL_BUTTON_ID);
      // Wait for the batch conversion to finish.
      await sleep(ACTION_WAIT_MS);
      // Read the color entry detail text, scrolling only as a fallback.
      const detailText: string = await readText(RESOURCE_SCROLL_ID, COLOR_DETAIL_ID);
      // Log the captured detail text.
      logCase(TAG, 'color detail: ' + detailText);
      // Expect the detail text to be non-empty.
      expect(detailText.length > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_CONVERTMEDIA_0600
     * @tc.name      testConvertMedia0001
     * @tc.desc      Verify the media conversion renders the restored image on screen.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testConvertMedia0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testConvertMedia0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the resource page for this case.
      await openResourcePage();
      // Press the media conversion button.
      await clickInScroll(RESOURCE_SCROLL_ID, CONVERT_MEDIA_BUTTON_ID);
      // Wait for the media conversion to finish.
      await sleep(ACTION_WAIT_MS);
      // Read the bounds of the rendered media image.
      const mediaBounds: Rect = await readBounds(RESOURCE_SCROLL_ID, RENDER_MEDIA_ID);
      // Compute the horizontal size of the media image.
      const mediaWidth: number = mediaBounds.right - mediaBounds.left;
      // Log the captured media width.
      logCase(TAG, 'media width: ' + mediaWidth);
      // Expect the media image to be laid out with a positive width.
      expect(mediaWidth > 0).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_TASKPOOL_0700
     * @tc.name      testTaskPool0001
     * @tc.desc      Verify the taskpool route completes the round trip and echoes its label.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTaskPool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testTaskPool0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Open the resource page for this case.
      await openResourcePage();
      // Press the taskpool route button.
      await clickInScroll(RESOURCE_SCROLL_ID, TASKPOOL_BUTTON_ID);
      // Wait for the thread crossing conversion to finish.
      await sleep(ROUND_TRIP_WAIT_MS);
      // Read the round trip path row text.
      const pathText: string = await readText(RESOURCE_SCROLL_ID, ROUND_TRIP_PATH_VALUE_ID);
      // Log the captured path label.
      logCase(TAG, 'round trip path: ' + pathText);
      // Expect the label to name the taskpool route.
      expect(pathText).assertEqual(TASKPOOL_TEXT);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_PREVIEWTOGGLE_0800
     * @tc.name      testPreviewFlip0001
     * @tc.desc      Verify every click on the preview toggle flips the checked state in both directions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPreviewFlip0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testPreviewFlip0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the prepare action so the preview on path stays reachable.
      await prepareFont();
      // Park the toggle on the checked state using at most three click rounds.
      let parked: boolean = false;
      for (let attempt: number = 0; attempt < 3; attempt++) {
        // Read the current toggle state through a fresh tree query.
        let probe: Component | null = await findAnywhere(PREVIEW_TOGGLE_ID);
        // Sweep the page when the toggle sits below the fold after the rewind.
        if (probe === null) {
          // Locate the toggle with gestures so it renders into the viewport.
          probe = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
        }
        // Stop parking as soon as the toggle reports checked.
        if (await probe.isChecked()) {
          // Mark the parked state and leave the loop.
          parked = true;
          // Break out of the parking loop.
          break;
        }
        // Click the unchecked toggle so it flips to the checked state.
        await probe.click();
        // Wait for the registration and the rerender to settle.
        await sleep(ACTION_WAIT_MS);
      }
      // Log the parking outcome.
      logCase(TAG, 'toggle parked on checked: ' + parked);
      // Expect the parking loop to reach the checked state.
      expect(parked).assertTrue();
      // Re-read the parked state through a scroll-aware query as an independent check.
      const parkedToggle: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      const checkedAfterPark: boolean = await parkedToggle.isChecked();
      // Expect the parked state to read back as checked.
      expect(checkedAfterPark).assertTrue();

      // Click the checked toggle so it flips to the unchecked state.
      const offToggle: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      await offToggle.click();
      // Wait for the preview switch off to settle.
      await sleep(ACTION_WAIT_MS);
      // Re-read the toggle state through a scroll-aware query.
      const offProbe: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      const checkedAfterOff: boolean = await offProbe.isChecked();
      // Log the state after the first flip.
      logCase(TAG, 'checked after first flip: ' + checkedAfterOff);
      // Expect the toggle to be unchecked after the first flip.
      expect(checkedAfterOff).assertFalse();

      // Click the unchecked toggle so it flips back to the checked state.
      const onToggle: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      await onToggle.click();
      // Wait for the font registration to settle.
      await sleep(ACTION_WAIT_MS);
      // Re-read the toggle state through a scroll-aware query.
      const onProbe: Component = await locateInScroll(FONT_SCROLL_ID, PREVIEW_TOGGLE_ID);
      const checkedAfterOn: boolean = await onProbe.isChecked();
      // Log the state after the second flip.
      logCase(TAG, 'checked after second flip: ' + checkedAfterOn);
      // Expect the toggle to be checked again after the second flip.
      expect(checkedAfterOn).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_UI_LOGCLEAR_0900
     * @tc.name      testLogClear0001
     * @tc.desc      Verify clearing the log panel swaps the log list for the empty state hint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLogClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLogClear0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Run the prepare action so the on-screen log collects entries.
      await prepareFont();
      // Probe the log list in the current tree after the action.
      let listBefore: Component | null = await findAnywhere(FONT_LOG_LIST_ID);
      // Sweep the page when the log panel sits below the fold after the rewind.
      if (listBefore === null) {
        // Locate the log list with gestures so the panel renders into the viewport.
        listBefore = await locateInScroll(FONT_SCROLL_ID, FONT_LOG_LIST_ID);
      }
      // Log the pre-clear list presence.
      logCase(TAG, 'log list before clear: ' + (listBefore !== null));
      // Expect the log list to exist while entries are present.
      expect(listBefore !== null).assertTrue();

      // Press the clear button inside the font scroll container.
      await clickInScroll(FONT_SCROLL_ID, FONT_LOG_CLEAR_ID);
      // Wait for the log panel rerender to settle.
      await sleep(ACTION_WAIT_MS);

      // Wait for the empty state hint to render after the clear.
      const emptyAfter: Component[] | null = await waitForComponent(FONT_LOG_EMPTY_ID, WAIT_RENDER_MS);
      // Log the post-clear empty state presence.
      logCase(TAG, 'empty hint after clear: ' + (emptyAfter !== null));
      // Expect the empty state hint to replace the list.
      expect(emptyAfter !== null).assertTrue();
      // Verify the log list left the tree after the clear.
      const listGone: boolean = await hasComponent(FONT_LOG_LIST_ID);
      // Expect the log list to be absent once the entries are cleared.
      expect(listGone).assertFalse();
      // Verify the panel header survived the clear.
      const headerKept: boolean = await hasComponent(FONT_LOG_HEADER_ID);
      // Expect the panel header to stay rendered after the clear.
      expect(headerKept).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
