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
import { colorSpaceManager, sendableColorSpaceManager } from '@kit.ArkGraphics2D';
import { collections } from '@kit.ArkTS';
import { display } from '@kit.ArkUI';
import { KeyCode } from '@kit.InputKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry, Component, Driver, ON, Rect } from '@kit.TestKit';
import { expect } from '@ohos/hypium';

const DOMAIN = 0xF811;
const TAG = '[Sample_SendableColorSpace]';
const COMPONENT_WAIT_TIMEOUT = 5000;
const TEXT_WAIT_TIMEOUT = 9000;
const UI_IDLE_TIME = 200;
const UI_IDLE_TIMEOUT = 2000;
// A page is swiped at most this many times before a missing component is reported: each swipe costs about a
// second, while uitest's own scrollSearch keeps the api locked for tens of seconds.
const SCROLL_SEARCH_SWIPES = 3;
// A case normally walks down the page, so the scan first continues from the current viewport for this many steps.
const SCROLL_CONTINUE_SWIPES = 2;
// scrollToTop/scrollToBottom move a whole page with a single call, while a swipe without an explicit speed
// reports completion seconds later.
const SCROLL_SPEED = 40000;
const VISIBLE_PROBE_TIMEOUT = 1200;
const FAST_PROBE_TIMEOUT = 280;
// A full-height gesture carries the page further than one viewport because of the fling, so a target between two
// probe positions can be skipped. The gesture therefore covers a little more than half of the container.
const SCROLL_GESTURE_RATIO = 0.55;
// UiTest reports a gesture as done before the fling settles, so every swipe is followed by a pause.
const SCROLL_BOTTOM_SWIPES = 4;
const SWIPE_SPEED = 2000;
const SWIPE_SETTLE_MS = 300;
// A slider snaps to its step, so the value is read back after every tap and corrected until it matches.
const SLIDER_ATTEMPTS = 8;
const SLIDER_SETTLE_MS = 150;
const SLIDER_VALUE_TOLERANCE = 0.005;
const INDEX_TITLE_ID = 'TitleText';
// Back buttons rendered at the bottom of every sub page.
const PAGE_BACK_IDS: string[] =
    ['StdBtnBack', 'CustomBtnBack', 'ConBtnBack', 'ExcBtnBack', 'ChromBtnBack', 'DiffBtnBack',
        'ConvBtnBack', 'BenchBtnBack', 'ReportBtnBack'];

// Color space properties reported by the system for a given enum value.
export interface ColorSpaceFacts {
    gamma: number;
    whitePoint: string;
}

const BUNDLE_NAME = 'com.samples.sendablecolorspace';
const ABILITY_NAME = 'EntryAbility';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();
let driver: Driver | undefined = undefined;

export function getDriver(): Driver {
    if (driver === undefined) {
        driver = Driver.create();
    }
    return driver;
}

export async function startApp(): Promise<void> {
    const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
    };
    await wakeScreen();
    await delegator.startAbility(want);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// A long suite can outlive the screen off timeout, which leaves the lock screen in front of the app.
async function screenLocked(): Promise<boolean> {
    try {
        const components: Component[] = await getDriver().findComponents(ON.type('Text'));
        for (let i = 0; i < components.length; i++) {
            const text: string = await components[i].getText();
            if (text.includes('解锁') || text.toLowerCase().includes('unlock')) {
                return true;
            }
        }
    } catch (error) {
        hilog.info(DOMAIN, TAG, 'screenLocked probe failed: %{public}s', String(error));
    }
    return false;
}

// Swipe up on the lock screen and wait until the foreground window is usable again.
export async function wakeScreen(): Promise<void> {
    if (!(await screenLocked())) {
        return;
    }
    hilog.info(DOMAIN, TAG, 'wakeScreen: lock screen detected, swiping up to unlock');
    const screen: display.Display = display.getDefaultDisplaySync();
    const centerX: number = screen.width / 2;
    await getDriver().swipe(Math.round(centerX), Math.round(screen.height * 0.9),
        Math.round(centerX), Math.round(screen.height * 0.3));
    await delay(1500);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'wakeScreen: unlock swipe finished, stillLocked=%{public}s', String(await screenLocked()));
}

export async function waitId(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
    return requireComponent(id, timeout);
}

export async function waitText(text: string, timeout: number = TEXT_WAIT_TIMEOUT): Promise<Component> {
    return getDriver().waitForComponent(ON.text(text), timeout);
}

// Component.scrollSearch drives a container until the target shows up, but a target it cannot reach that way
// keeps it busy for tens of seconds (it then reports "The offset is too large and exceeds the widget size"),
// and every uitest call issued meanwhile fails with code 17000002, which breaks the rest of the run. The page
// is therefore swiped one step at a time and probed after each step, so a miss costs a swipe instead.
async function swipePageUpIn(scroll: Component): Promise<boolean> {
    const bounds: Rect = await scroll.getBounds();
    const height: number = bounds.bottom - bounds.top;
    if (height <= 0) {
        return false;
    }
    const centerX: number = Math.round((bounds.left + bounds.right) / 2);
    const fromY: number = Math.round(bounds.bottom - height * 0.08);
    const toY: number = Math.round(fromY - height * SCROLL_GESTURE_RATIO);
    await getDriver().swipe(centerX, fromY, centerX, toY, SWIPE_SPEED);
    await delay(SWIPE_SETTLE_MS);
    return true;
}

// Rows are built lazily, so a probe can miss a target that has just been scrolled into view. The probe asks the
// current tree once instead of waiting, which keeps a miss cheap while the scan is running.
async function probeId(id: string): Promise<Component | null> {
    try {
        const component: Component | null = await getDriver().findComponent(ON.id(id));
        if (component === null || component === undefined) {
            return null;
        }
        return component;
    } catch (error) {
        return null;
    }
}

async function findScroll(): Promise<Component | null> {
    try {
        const component: Component | null = await getDriver().findComponent(ON.type('Scroll'));
        if (component === null || component === undefined) {
            return null;
        }
        return component;
    } catch (error) {
        return null;
    }
}

async function scrollSearchId(id: string): Promise<Component | null> {
    const scroll: Component | null = await findScroll();
    if (scroll === null) {
        return null;
    }
    // A case normally walks down the page, so the scan continues from the current viewport first: one swipe is
    // cheaper than a scrollToTop round trip, which alone costs over a second.
    const probeStart: number = Date.now();
    let found: Component | null = await probeId(id);
    const probeDone: number = Date.now();
    let steps: number = 0;
    for (let attempt = 0; found === null && attempt < SCROLL_CONTINUE_SWIPES; attempt++) {
        if (!(await swipePageUpIn(scroll))) {
            break;
        }
        steps++;
        found = await probeId(id);
    }
    if (found === null) {
        // The component may also sit above the viewport, so the scan is then repeated from the top of the page.
        await scrollPageToTop();
        found = await probeId(id);
        for (let attempt = 0; found === null && attempt < SCROLL_SEARCH_SWIPES; attempt++) {
            if (!(await swipePageUpIn(scroll))) {
                break;
            }
            steps++;
            found = await probeId(id);
        }
        hilog.info(DOMAIN, TAG, 'scrollSearch %{public}s: probe=%{public}dms, anchored scan=%{public}dms',
            id, probeDone - probeStart, Date.now() - probeDone);
    }
    if (found === null) {
        hilog.info(DOMAIN, TAG, 'scrollSearch %{public}s: not found after %{public}d swipes', id, steps);
    } else {
        hilog.info(DOMAIN, TAG, 'scrollSearch %{public}s: found after %{public}d swipes', id, steps);
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    return found;
}

// Scroll the page back to the top so components above the viewport become reachable again.
export async function scrollPageToTop(): Promise<void> {
    const started: number = Date.now();
    const scroll: Component | null = await findScroll();
    if (scroll === null) {
        return;
    }
    const probed: number = Date.now();
    try {
        await scroll.scrollToTop(SCROLL_SPEED);
    } catch (error) {
        hilog.info(DOMAIN, TAG, 'scrollPageToTop: %{public}s', String(error));
    }
    const moved: number = Date.now();
    await delay(SWIPE_SETTLE_MS);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'scrollPageToTop: probe=%{public}dms, scroll=%{public}dms, settle=%{public}dms',
        probed - started, moved - probed, Date.now() - moved);
}

// Resolve a component by id, scrolling the page when it is currently outside the viewport.
export async function findComponent(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component | null> {
    const started: number = Date.now();
    let component: Component | null = await probeId(id);
    const probed: number = Date.now();
    if (component !== null) {
        return component;
    }
    // scrollSearchId already anchors the page at the top before it scans down, so one call covers both directions.
    component = await scrollSearchId(id);
    hilog.info(DOMAIN, TAG, 'findComponent %{public}s: probe=%{public}dms, search=%{public}dms, found=%{public}s',
        id, probed - started, Date.now() - probed, String(component !== null));
    if (component !== null) {
        return component;
    }
    return await getDriver().waitForComponent(ON.id(id), timeout);
}

export async function requireComponent(id: string, timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<Component> {
    const component: Component | null = await findComponent(id, timeout);
    if (component === null || component === undefined) {
        throw new Error(`Component ${id} is not visible after scrolling`);
    }
    return component;
}

export async function clickId(id: string): Promise<void> {
    hilog.info(DOMAIN, TAG, 'UI step: wait for id %{public}s', id);
    const component: Component = await requireComponent(id, 10000);
    await component.click();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'UI step: clicked id %{public}s', id);
}

export async function scrollToId(id: string): Promise<Component> {
    const component: Component | null = await findComponent(id);
    if (component === null || component === undefined) {
        throw new Error(`Component ${id} is not found by scrolling`);
    }
    return component;
}

// UiTest also reports components that sit outside the viewport, while a List builds its rows only once it
// is on screen, so the page is scrolled by the missing distance until the component is fully visible.
export async function scrollIntoView(id: string): Promise<Component> {
    const component: Component = await scrollToId(id);
    const screen: display.Display = display.getDefaultDisplaySync();
    const centerX: number = Math.round(screen.width / 2);
    const fromY: number = Math.round(screen.height / 2);
    for (let attempt = 0; attempt < 4; attempt++) {
        const bounds: Rect = await component.getBounds();
        if (bounds.top >= 0 && bounds.bottom <= screen.height) {
            return component;
        }
        // A positive distance moves the content up, a negative one moves it down.
        const missing: number = bounds.top < 0 ? bounds.top - 24 : bounds.bottom - screen.height + 24;
        const toY: number = Math.round(Math.max(60, Math.min(screen.height - 60, fromY - missing)));
        hilog.info(DOMAIN, TAG, 'scrollIntoView %{public}s: bounds=[%{public}d,%{public}d,%{public}d,%{public}d] ' +
          'swipe %{public}d->%{public}d',
            id, bounds.left, bounds.top, bounds.right, bounds.bottom, fromY, toY);
        await getDriver().swipe(centerX, fromY, centerX, toY, SWIPE_SPEED);
        await delay(SWIPE_SETTLE_MS);
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    return component;
}

export async function clickScrolledId(id: string): Promise<void> {
    hilog.info(DOMAIN, TAG, 'UI step: scroll and click id %{public}s', id);
    const component: Component = await scrollToId(id);
    await component.click();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// Rows inside a List are created lazily, so a list placed below the viewport only gets its rows once
// the page has been scrolled down to it.
export async function scrollPageToBottom(): Promise<void> {
    const scroll: Component | null = await findScroll();
    if (scroll === null) {
        hilog.info(DOMAIN, TAG, 'scrollPageToBottom: no scroll container on this page');
        return;
    }
    try {
        await scroll.scrollToBottom(SCROLL_SPEED);
    } catch (error) {
        hilog.info(DOMAIN, TAG, 'scrollPageToBottom: %{public}s', String(error));
    }
    await delay(SWIPE_SETTLE_MS);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

// Repeat a click through a single component reference so long interaction loops stay cheap.
export async function clickRepeatedly(id: string, times: number): Promise<void> {
    hilog.info(DOMAIN, TAG, 'UI step: click id %{public}s for %{public}d times', id, times);
    const component: Component = await scrollToId(id);
    for (let i = 0; i < times; i++) {
        await component.click();
        await delay(80);
    }
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function inputText(id: string, value: string): Promise<void> {
    hilog.info(DOMAIN, TAG, 'UI step: input %{public}s into id %{public}s', value, id);
    const component: Component = await requireComponent(id, 10000);
    await component.click();
    await delay(200);
    await component.clearText();
    await delay(100);
    await component.inputText(value);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    let actual: string = await component.getText();
    if (actual !== value) {
        await component.click();
        await delay(200);
        await component.clearText();
        await delay(100);
        await component.inputText(value);
        await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
        actual = await component.getText();
    }
    // Typing opens the soft keyboard, which covers the lower part of the page and swallows the taps aimed at it,
    // so it is closed again with the back key. The back key goes to the keyboard first while it is shown.
    await getDriver().triggerKey(KeyCode.KEYCODE_BACK);
    await delay(400);
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    hilog.info(DOMAIN, TAG, 'UI input id %{public}s: actual=%{public}s, expected=%{public}s', id, actual, value);
    if (actual !== value) {
        throw new Error(`Input of ${id} does not match; actual: ${actual}; expected: ${value}`);
    }
}

// UiTest rejects gestures whose coordinates are not whole numbers.
async function tapSlider(x: number, centerY: number): Promise<void> {
    await getDriver().click(Math.round(x), Math.round(centerY));
    await delay(SLIDER_SETTLE_MS);
}

// A tap on the track moves the thumb to the tapped pixel, while a short drag is swallowed by the touch
// slop and can leave the value one step away from the requested one.
export async function setSliderValue(id: string, value: number, min: number, max: number,
    currentValue: number, valueLabelId: string = ''): Promise<void> {
    const component: Component = await requireComponent(id, 10000);
    const bounds: Rect = await component.getBounds();
    const left: number = bounds.left;
    const width: number = bounds.right - bounds.left;
    const centerY: number = (bounds.top + bounds.bottom) / 2;
    const pixelOf = (v: number): number => left + width * (v - min) / (max - min);
    // Tap the end of the track farthest from the requested value when the current thumb has to be moved.
    const parkX: number = (value - min) <= (max - value) ? bounds.right - 4 : left + 4;
    hilog.info(DOMAIN, TAG, 'UI step: set slider %{public}s %{public}s -> %{public}s (left=%{public}s ' +
      'width=%{public}s)',
        id, String(currentValue), String(value), String(left), String(width));
    let targetX: number = pixelOf(value);
    let lastX: number = pixelOf(currentValue);
    let lastValue: number = currentValue;
    for (let attempt = 0; attempt < SLIDER_ATTEMPTS; attempt++) {
        await tapSlider(targetX, centerY);
        if (valueLabelId === '') {
            return;
        }
        let shown: number = numberAfter(await textOrEmpty(valueLabelId), '');
        if (!isCloseTo(shown, value, SLIDER_VALUE_TOLERANCE) && isCloseTo(shown, lastValue, 0.0001)) {
            // A tap landing on the thumb starts a drag instead of moving to the tapped pixel, so the value
            // stays unchanged and the tap is applied again once the thumb has been parked elsewhere.
            await tapSlider(parkX, centerY);
            lastX = parkX;
            lastValue = numberAfter(await textOrEmpty(valueLabelId), '');
            await tapSlider(targetX, centerY);
            shown = numberAfter(await textOrEmpty(valueLabelId), '');
        }
        hilog.info(DOMAIN, TAG, 'UI slider %{public}s attempt %{public}d: x=%{public}d shown=%{public}s ' +
          'target=%{public}s',
            id, attempt + 1, Math.round(targetX), String(shown), String(value));
        if (isCloseTo(shown, value, SLIDER_VALUE_TOLERANCE)) {
            hilog.info(DOMAIN, TAG, 'UI slider %{public}s reached %{public}s', id, String(shown));
            return;
        }
        // The track is inset by the thumb radius, so the pixels per unit are measured from taps that are
        // far enough apart to carry a usable slope.
        let slope: number = (max - min) / width;
        if (Math.abs(targetX - lastX) > 60 && Math.abs(shown - lastValue) > 0.001) {
            slope = (shown - lastValue) / (targetX - lastX);
        }
        const correction: number = (value - shown) / slope;
        hilog.info(DOMAIN, TAG, 'UI slider %{public}s correcting by %{public}s px (slope=%{public}s)',
            id, String(Math.round(correction)), String(slope));
        lastX = targetX;
        lastValue = shown;
        targetX = targetX + (Math.abs(correction) < 1 ? (value > shown ? 1 : -1) : correction);
        targetX = Math.max(left + 2, Math.min(bounds.right - 2, targetX));
    }
    hilog.error(DOMAIN, TAG, 'UI slider %{public}s did not reach %{public}s', id, String(value));
}

export async function textOfId(id: string): Promise<string> {
    const component: Component = await requireComponent(id);
    return component.getText();
}

// A result area that was cleared is reported as absent by UiTest, which means the same empty content.
// Only a direct probe is used here: scrollSearch blocks for tens of seconds on a Scroll that cannot find
// the target, which then breaks every later uitest call in the suite.
export async function textOrEmpty(id: string): Promise<string> {
    try {
        const component: Component | null = await getDriver().waitForComponent(ON.id(id), VISIBLE_PROBE_TIMEOUT);
        if (component === null || component === undefined) {
            return '';
        }
        return await component.getText();
    } catch (error) {
        hilog.info(DOMAIN, TAG, 'textOrEmpty %{public}s: %{public}s', id, String(error));
        return '';
    }
}

export async function waitTextContains(id: string, expected: string,
    timeout: number = COMPONENT_WAIT_TIMEOUT): Promise<string> {
    const deadline: number = Date.now() + timeout;
    let actual: string = '';
    let found: boolean = false;
    while (!found && Date.now() < deadline) {
        const component: Component | null = await findComponent(id, VISIBLE_PROBE_TIMEOUT);
        if (component !== null) {
            actual = await component.getText();
            found = actual.includes(expected);
        }
        if (!found) {
            await delay(200);
        }
    }
    if (!found) {
        throw new Error(`Text of ${id} does not contain ${expected}; actual: ${actual}`);
    }
    return actual;
}

export async function existsId(id: string): Promise<boolean> {
    try {
        await getDriver().assertComponentExist(ON.id(id));
        return true;
    } catch (error) {
        return false;
    }
}

export async function existsText(text: string): Promise<boolean> {
    try {
        await getDriver().assertComponentExist(ON.text(text));
        return true;
    } catch (error) {
        return false;
    }
}

async function swipePageUp(): Promise<void> {
    const screen: display.Display = display.getDefaultDisplaySync();
    const centerX: number = Math.round(screen.width / 2);
    await getDriver().swipe(centerX, Math.round(screen.height * 0.75), centerX,
        Math.round(screen.height * 0.35), SWIPE_SPEED);
    await delay(SWIPE_SETTLE_MS);
}

// A List builds its rows only while it is on screen, and the bounds reported for an off-screen component
// cannot be trusted, so the row is looked for while the page is swiped down, first from the current position
// and then from the top of the page.
export async function existsTextByScrollingDown(text: string,
    swipes: number = SCROLL_BOTTOM_SWIPES + 2): Promise<boolean> {
    for (let pass = 0; pass < 2; pass++) {
        for (let step = 0; step < swipes; step++) {
            if (await existsText(text)) {
                hilog.info(DOMAIN, TAG, 'existsTextByScrollingDown: found at pass %{public}d step %{public}d',
                    pass, step);
                return true;
            }
            await swipePageUp();
        }
        await scrollPageToTop();
    }
    const found: boolean = await existsText(text);
    hilog.info(DOMAIN, TAG, 'existsTextByScrollingDown: found=%{public}s', String(found));
    return found;
}

// The bottom edge of the screen belongs to the system gesture area, so a gesture aimed at a component is
// only reliable once that component sits in the middle of the page.
async function centerComponent(component: Component): Promise<Rect> {
    const screen: display.Display = display.getDefaultDisplaySync();
    const centerX: number = Math.round(screen.width / 2);
    const fromY: number = Math.round(screen.height / 2);
    let bounds: Rect = await component.getBounds();
    for (let attempt = 0; attempt < 3; attempt++) {
        const center: number = Math.round((bounds.top + bounds.bottom) / 2);
        const delta: number = center - fromY;
        if (Math.abs(delta) < 60) {
            break;
        }
        const toY: number = Math.round(Math.max(80, Math.min(screen.height - 80, fromY - delta)));
        hilog.info(DOMAIN, TAG, 'centerComponent: center=%{public}d delta=%{public}d swipe %{public}d->%{public}d',
            center, delta, fromY, toY);
        await getDriver().swipe(centerX, fromY, centerX, toY, SWIPE_SPEED);
        await delay(SWIPE_SETTLE_MS);
        await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
        bounds = await component.getBounds();
    }
    return bounds;
}

// A list with a fixed height only builds the rows inside its own viewport, so a row further down is
// created after the list itself has been scrolled. A swipe that starts inside the list moves that list
// instead of the page around it.
export async function listHasTextBySwiping(listId: string, text: string,
    swipes: number = SCROLL_BOTTOM_SWIPES * 3): Promise<boolean> {
    if (await existsText(text)) {
        return true;
    }
    const list: Component = await requireComponent(listId);
    const bounds: Rect = await centerComponent(list);
    const centerX: number = Math.round((bounds.left + bounds.right) / 2);
    const inset: number = Math.min(12, (bounds.bottom - bounds.top) / 4);
    const fromY: number = Math.round(bounds.bottom - inset);
    const toY: number = Math.round(bounds.top + inset);
    hilog.info(DOMAIN, TAG, 'listHasTextBySwiping %{public}s: swipe %{public}d->%{public}d on [%{public}d,%{public}d]',
        listId, fromY, toY, bounds.top, bounds.bottom);
    for (let attempt = 0; attempt < swipes; attempt++) {
        await getDriver().swipe(centerX, fromY, centerX, toY, SWIPE_SPEED);
        await delay(SWIPE_SETTLE_MS);
        if (await existsText(text)) {
            hilog.info(DOMAIN, TAG, 'listHasTextBySwiping %{public}s: found after %{public}d swipes',
                listId, attempt + 1);
            return true;
        }
    }
    hilog.info(DOMAIN, TAG, 'listHasTextBySwiping %{public}s: text not built after scrolling', listId);
    return false;
}

// Some values are formatted by the page from floating point arithmetic, so only the stable prefix of a
// generated line is compared.
export async function existsTextStartingWith(prefix: string): Promise<boolean> {
    const texts: string[] = await visibleTexts();
    for (let i = 0; i < texts.length; i++) {
        if (texts[i].startsWith(prefix)) {
            return true;
        }
    }
    return false;
}

export async function visibleTexts(): Promise<string[]> {
    const components: Component[] = await getDriver().findComponents(ON.type('Text'));
    const texts: string[] = [];
    for (let i = 0; i < components.length; i++) {
        texts.push(await components[i].getText());
    }
    return texts;
}

export async function findVisibleTextContains(expected: string): Promise<string> {
    const texts: string[] = await visibleTexts();
    for (let i = 0; i < texts.length; i++) {
        if (texts[i].includes(expected)) {
            return texts[i];
        }
    }
    throw new Error(`Visible text does not contain ${expected}`);
}

function logEntriesFrom(texts: string[]): string[] {
    const entries: string[] = [];
    const timestamp: RegExp = new RegExp('^\\[\\d{2}:\\d{2}:\\d{2}\\] ');
    for (let i = 0; i < texts.length; i++) {
        if (timestamp.test(texts[i])) {
            entries.push(texts[i]);
        }
    }
    return entries;
}

// The log area sits below the viewport, and a List only creates its rows once it is on screen.
async function showLogList(): Promise<void> {
    if (logEntriesFrom(await visibleTexts()).length > 0) {
        return;
    }
    for (let attempt = 0; attempt < 3; attempt++) {
        await scrollPageToBottom();
        if (logEntriesFrom(await visibleTexts()).length > 0) {
            return;
        }
    }
    hilog.info(DOMAIN, TAG, 'showLogList: no log row became visible after scrolling');
}

// Log rows carry no id, so they are recognised by the timestamp prefix the page writes.
export async function visibleLogEntries(): Promise<string[]> {
    await showLogList();
    const entries: string[] = logEntriesFrom(await visibleTexts());
    hilog.info(DOMAIN, TAG, 'visibleLogEntries: entries=%{public}d first=%{public}s',
        entries.length, entries.length > 0 ? entries[0] : '<none>');
    return entries;
}

// The page keys its rows by index, so an existing row keeps the text it was first built with. The
// row count is therefore the only reliable signal, which makes the row format the second checkable fact.
export function allRowsTimestamped(entries: string[]): boolean {
    if (entries.length === 0) {
        return false;
    }
    const timestamp: RegExp = new RegExp('^\\[\\d{2}:\\d{2}:\\d{2}\\] ');
    for (let i = 0; i < entries.length; i++) {
        if (!timestamp.test(entries[i])) {
            return false;
        }
    }
    return true;
}

export async function pressBack(): Promise<void> {
    await getDriver().pressBack();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
}

export async function delay(ms: number): Promise<void> {
    await getDriver().delayMs(ms);
}

export async function runCase(name: string, action: () => Promise<void>, done: Function): Promise<void> {
    hilog.info(DOMAIN, TAG, '%{public}s begin', name);
    try {
        await action();
    } catch (error) {
        hilog.error(DOMAIN, TAG, '%{public}s failed: %{public}s', name, JSON.stringify(error));
        hilog.error(DOMAIN, TAG, '%{public}s error: %{public}s', name, String(error));
        // assertFail() cannot carry a message, so the reason is reported through a failing equality instead.
        expect(`case failed: ${String(error)}`).assertEqual('');
    } finally {
        hilog.info(DOMAIN, TAG, '%{public}s end', name);
        done();
    }
}

export async function addLog(format: string, ...args: string[]): Promise<void> {
    hilog.info(DOMAIN, TAG, format, ...args);
}

export function matchesLocalizedText(actual: string, english: string, chinese: string): boolean {
    return actual === english || actual === chinese;
}

// Parse the first numeric token that follows the given key, e.g. numberAfter('Gamma: 2.4', 'Gamma: ') === 2.4.
export function numberAfter(text: string, key: string): number {
    const at: number = text.indexOf(key);
    if (at < 0) {
        return Number.NaN;
    }
    let index: number = at + key.length;
    while (index < text.length && text.charAt(index) === ' ') {
        index++;
    }
    const start: number = index;
    while (index < text.length) {
        const ch: string = text.charAt(index);
        const isDigit: boolean = ch >= '0' && ch <= '9';
        if (isDigit || ch === '.' || ch === '-' || ch === '+') {
            index++;
        } else {
            break;
        }
    }
    if (index === start) {
        return Number.NaN;
    }
    return parseFloat(text.substring(start, index));
}

export function isCloseTo(actual: number, expected: number, tolerance: number = 0.01): boolean {
    return Math.abs(actual - expected) <= tolerance;
}

// The pages print PASS or FAIL after comparing a platform value against a documented constant.
export function verdict(actual: number, expected: number, tolerance: number = 0.01): string {
    return isCloseTo(actual, expected, tolerance) ? 'PASS' : 'FAIL';
}

// The exception page summarises every property check in one line, so the expected line follows the gamma verdict.
export function overallText(actual: number, expected: number, tolerance: number = 0.01): string {
    return `Overall: ${verdict(actual, expected, tolerance) === 'PASS' ? 'ALL PASS' : 'HAS FAILURES'}`;
}

// The pages print the raw gamma reported by the system, so expectations are built from the same source.
export function gammaText(cs: colorSpaceManager.ColorSpace): string {
    return String(factsOf(cs).gamma);
}

// Text the standard page prints after creating a color space.
export function standardInfoText(label: string, apiName: string, cs: colorSpaceManager.ColorSpace): string {
    const facts: ColorSpaceFacts = factsOf(cs);
    return `Type: ${label}\nColorSpaceName: ${apiName}\nWhitePoint: ${facts.whitePoint}\nGamma: ${facts.gamma}`;
}

// Summary line the standard page prints after a TaskPool read.
export function standardTaskPoolText(name: string, cs: colorSpaceManager.ColorSpace): string {
    const facts: ColorSpaceFacts = factsOf(cs);
    return `[TaskPool] name=${name}, wp=${facts.whitePoint}, gamma=${facts.gamma}`;
}

// Multi-line result the concurrency page prints for one channel.
export function channelResultText(channel: string, name: string, cs: colorSpaceManager.ColorSpace): string {
    const facts: ColorSpaceFacts = factsOf(cs);
    return `[${channel}] name=${name}\n[${channel}] whitePoint=${facts.whitePoint}\n[${channel}] gamma=${facts.gamma}`;
}

// Combined TaskPool and Worker comparison printed by the reference verification button.
export function referenceResultText(name: string, cs: colorSpaceManager.ColorSpace): string {
    const facts: ColorSpaceFacts = factsOf(cs);
    return `[TaskPool] name=${name}, wp=${facts.whitePoint}, gamma=${facts.gamma}\n` +
        `[Worker]  name=${name}, wp=${facts.whitePoint}, gamma=${facts.gamma}\n` +
        'Same reference: YES (name:true wp:true gamma:true)';
}

// Read the properties the system reports for an enum value so assertions stay platform independent.
export function factsOf(cs: colorSpaceManager.ColorSpace): ColorSpaceFacts {
    const manager: sendableColorSpaceManager.ColorSpaceManager = sendableColorSpaceManager.create(cs);
    const whitePoint: collections.Array<number> = manager.getWhitePoint();
    let whitePointText: string = '[]';
    if (whitePoint.length >= 2) {
        whitePointText = `[${whitePoint[0].toFixed(4)}, ${whitePoint[1].toFixed(4)}]`;
    }
    const facts: ColorSpaceFacts = { gamma: manager.getGamma(), whitePoint: whitePointText };
    return facts;
}

// Compare the gamma printed by the page against the value the system reports for this color space.
export function gammaMatches(info: string, cs: colorSpaceManager.ColorSpace): boolean {
    const expected: number = factsOf(cs).gamma;
    const actual: number = numberAfter(info, 'Gamma: ');
    hilog.info(DOMAIN, TAG, 'gamma check: actual=%{public}s, expected=%{public}s',
        String(actual), String(expected));
    return isCloseTo(actual, expected, 0.001);
}

// Same check, asserted in place for callers that only need the failure to be raised here.
export function assertGammaMatches(info: string, cs: colorSpaceManager.ColorSpace): void {
    expect(gammaMatches(info, cs)).assertTrue();
}

// Verify the white point printed by the page matches the value the system reports for this color space.
export function assertWhitePointMatches(info: string, cs: colorSpaceManager.ColorSpace): void {
    const expected: string = factsOf(cs).whitePoint;
    hilog.info(DOMAIN, TAG, 'white point check: expected=%{public}s', expected);
    expect(info.includes(`WhitePoint: ${expected}`)).assertTrue();
}

// ==================== Navigation Helpers ====================

interface PageRoute {
    titleId: string;
    backId: string;
    navId: string;
}

const ROUTE_STANDARD: PageRoute = { titleId: 'StdPageTitle', backId: 'StdBtnBack', navId: 'NavStandard' };
const ROUTE_CUSTOM: PageRoute = { titleId: 'CustomPageTitle', backId: 'CustomBtnBack', navId: 'NavCustom' };
const ROUTE_CONCURRENCY: PageRoute =
    { titleId: 'ConPageTitle', backId: 'ConBtnBack', navId: 'NavConcurrency' };
const ROUTE_EXCEPTION: PageRoute = { titleId: 'ExcPageTitle', backId: 'ExcBtnBack', navId: 'NavException' };
const ROUTE_CHROMATICITY: PageRoute =
    { titleId: 'ChromPageTitle', backId: 'ChromBtnBack', navId: 'NavChromaticity' };
const ROUTE_DIFFERENCE: PageRoute = { titleId: 'DiffPageTitle', backId: 'DiffBtnBack', navId: 'NavDifference' };
const ROUTE_CONVERSION: PageRoute = { titleId: 'ConvPageTitle', backId: 'ConvBtnBack', navId: 'NavConversion' };
const ROUTE_BENCHMARK: PageRoute = { titleId: 'BenchPageTitle', backId: 'BenchBtnBack', navId: 'NavBenchmark' };
const ROUTE_REPORT: PageRoute = { titleId: 'ReportPageTitle', backId: 'ReportBtnBack', navId: 'NavReport' };

// Sub page the driver left the app on. Checking that one page again costs a single probe, while scanning
// every page for its back button costs a probe per page on each case.
let currentRoute: PageRoute | null = null;

async function isVisible(id: string, timeout: number): Promise<boolean> {
    const component: Component | null = await getDriver().waitForComponent(ON.id(id), timeout);
    return component !== null && component !== undefined;
}

async function navigateToRoute(route: PageRoute): Promise<void> {
    // Most cases of a suite work on the page the previous case left open, so the reset and the navigation
    // round trip are skipped once the page title is already on screen.
    if (await isVisible(route.titleId, FAST_PROBE_TIMEOUT)) {
        currentRoute = route;
        return;
    }
    await resetToIndex();
    await clickId(route.navId);
    await waitId(route.titleId);
    currentRoute = route;
}

export async function navigateToStandard(): Promise<void> {
    await navigateToRoute(ROUTE_STANDARD);
}

export async function navigateToCustom(): Promise<void> {
    await navigateToRoute(ROUTE_CUSTOM);
}

export async function navigateToConcurrency(): Promise<void> {
    await navigateToRoute(ROUTE_CONCURRENCY);
}

export async function navigateToException(): Promise<void> {
    await navigateToRoute(ROUTE_EXCEPTION);
}

export async function navigateToChromaticity(): Promise<void> {
    await navigateToRoute(ROUTE_CHROMATICITY);
}

export async function navigateToDifference(): Promise<void> {
    await navigateToRoute(ROUTE_DIFFERENCE);
}

export async function navigateToConversion(): Promise<void> {
    await navigateToRoute(ROUTE_CONVERSION);
}

export async function navigateToBenchmark(): Promise<void> {
    await navigateToRoute(ROUTE_BENCHMARK);
}

export async function navigateToReport(): Promise<void> {
    await navigateToRoute(ROUTE_REPORT);
}

// Log what is currently on screen so navigation failures can be diagnosed from hilog alone.
export async function dumpVisibleState(tag: string): Promise<void> {
    const components: Component[] = await getDriver().findComponents(ON.type('Text'));
    hilog.info(DOMAIN, TAG, '%{public}s: visible text count=%{public}d', tag, components.length);
    for (let i = 0; i < components.length && i < 15; i++) {
        const id: string = await components[i].getId();
        const text: string = await components[i].getText();
        hilog.info(DOMAIN, TAG, '%{public}s: text[%{public}d] id=%{public}s text=%{public}s', tag, i, id, text);
    }
}

async function indexVisible(timeout: number): Promise<boolean> {
    return isVisible(INDEX_TITLE_ID, timeout);
}

// Leave the current sub page through its own back button, which does not depend on global key focus.
async function clickBackId(backId: string): Promise<boolean> {
    const component: Component | null = await getDriver().waitForComponent(ON.id(backId), FAST_PROBE_TIMEOUT);
    if (component === null || component === undefined) {
        return false;
    }
    hilog.info(DOMAIN, TAG, 'resetToIndex: clicking %{public}s', backId);
    await component.click();
    await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
    return true;
}

async function clickPageBack(): Promise<boolean> {
    for (let i = 0; i < PAGE_BACK_IDS.length; i++) {
        const component: Component | null =
            await getDriver().waitForComponent(ON.id(PAGE_BACK_IDS[i]), FAST_PROBE_TIMEOUT);
        if (component !== null && component !== undefined) {
            hilog.info(DOMAIN, TAG, 'resetToIndex: clicking %{public}s', PAGE_BACK_IDS[i]);
            await component.click();
            await getDriver().waitForIdle(UI_IDLE_TIME, UI_IDLE_TIMEOUT);
            return true;
        }
    }
    return false;
}

export async function resetToIndex(): Promise<void> {
    if (await indexVisible(VISIBLE_PROBE_TIMEOUT)) {
        currentRoute = null;
        return;
    }
    // The page the driver navigated to last is the one that has to be left, so its own back button is tried
    // first: probing every page instead costs several seconds on each case.
    const known: PageRoute | null = currentRoute;
    currentRoute = null;
    if (known !== null && await clickBackId(known.backId) && await indexVisible(VISIBLE_PROBE_TIMEOUT)) {
        return;
    }
    // A lock screen stops every probe from answering and is the only case that needs a wake up, so it is
    // checked once the cheap exit did not work.
    await wakeScreen();
    if (await indexVisible(VISIBLE_PROBE_TIMEOUT)) {
        return;
    }
    hilog.info(DOMAIN, TAG, 'resetToIndex: starting navigation reset');
    const maxAttempts: number = 3;
    for (let attempts: number = 0; attempts < maxAttempts; attempts++) {
        const clicked: boolean = await clickPageBack();
        if (!clicked) {
            hilog.info(DOMAIN, TAG, 'resetToIndex: no page back button, pressing back, attempt %{public}d',
                attempts + 1);
            await pressBack();
        }
        if (await indexVisible(3000)) {
            hilog.info(DOMAIN, TAG, 'resetToIndex: reset complete');
            return;
        }
        await dumpVisibleState('resetToIndex');
        hilog.info(DOMAIN, TAG, 'resetToIndex: index not reached, restarting ability');
        await startApp();
        if (await indexVisible(5000)) {
            hilog.info(DOMAIN, TAG, 'resetToIndex: reset complete after restart');
            return;
        }
    }
    await dumpVisibleState('resetToIndexFailed');
    throw new Error('Unable to reset navigation to index');
}
