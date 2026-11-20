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

import { describe, expect, it } from '@ohos/hypium';
import { yieldToEventLoop } from '../common/YieldHelper';
import { PageOperation, PageStateModel } from '../common/PageStateModel';
import { TestLogger } from '../common/TestLogger';
import {
  CASE_PREFIX, TAG_SESSION, STRING_ATTACH, STRING_DETACH, STRING_SHOW, STRING_HIDE, STRING_ON, STRING_OFF,
  STRING_NO_ATTACH_TIP
} from '../common/TestConstant';

/**
 * Session lifecycle of the custom editor.
 *
 * The page flips three flags (isAttached, isShow, isOn) and the editor reacts to
 * each of them through an @Watch hook: attach/detach on the first, showTextInput/
 * hideTextInput on the second, initListener/off on the third. detach() itself
 * runs off() first, then clears isOn and isShow, then asks the controller to
 * detach, so the "hide and stop listening" side effects are part of the detach
 * path rather than of the two toggles. initTextInput() walks the same three
 * steps explicitly when the user taps the editor, which is why tapping an
 * already attached editor must not register the nine callbacks a second time.
 *
 * The runtime below pairs the page model with a listener registry and a call
 * log. It reports the explicit controller calls made by the sample code; the
 * extra re-entry that an ArkUI @Watch hook performs when a child assigns the
 * same @Provide value is a framework detail and is deliberately out of scope.
 */

const TOAST_NO_ATTACH: string = 'toast:' + STRING_NO_ATTACH_TIP;

/** The nine controller events registered by initListener() and removed by off(). */
export class ListenerRegistry {
  static readonly EVENTS: string[] = [
    'insertText', 'deleteLeft', 'deleteRight', 'moveCursor', 'selectByMovement', 'selectByRange',
    'sendFunctionKey', 'sendKeyboardStatus', 'handleExtendAction'
  ];

  private counts: number[] = [0, 0, 0, 0, 0, 0, 0, 0, 0];

  registerAll(): void {
    let index: number = 0;
    while (index < this.counts.length) {
      this.counts[index] = this.counts[index] + 1;
      index++;
    }
  }

  /** Drops every registration so a later on() starts from a clean registry. */
  clear(): void {
    let index: number = 0;
    while (index < this.counts.length) {
      this.counts[index] = 0;
      index++;
    }
  }

  unregisterAll(): void {
    let index: number = 0;
    while (index < this.counts.length) {
      this.counts[index] = 0;
      index++;
    }
  }

  indexOf(event: string): number {
    let index: number = 0;
    while (index < ListenerRegistry.EVENTS.length) {
      if (ListenerRegistry.EVENTS[index] === event) {
        return index;
      }
      index++;
    }
    return -1;
  }

  countOf(event: string): number {
    let index: number = this.indexOf(event);
    if (index < 0) {
      return 0;
    }
    return this.counts[index];
  }

  has(event: string): boolean {
    return this.countOf(event) > 0;
  }

  /** Number of distinct events with at least one listener. */
  size(): number {
    let size: number = 0;
    let index: number = 0;
    while (index < this.counts.length) {
      if (this.counts[index] > 0) {
        size++;
      }
      index++;
    }
    return size;
  }

  /** Sum of the registration counters. */
  total(): number {
    let total: number = 0;
    let index: number = 0;
    while (index < this.counts.length) {
      total += this.counts[index];
      index++;
    }
    return total;
  }

}

/**
 * Page flags plus the explicit controller calls the sample performs.
 * clickAttach/clickShow/clickOn mirror the three buttons; clickEditor mirrors
 * initTextInput(); stopSession mirrors aboutToDisappear().
 */
export class SessionRuntime {
  state: PageStateModel = new PageStateModel();
  listeners: ListenerRegistry = new ListenerRegistry();
  operations: string[] = [];
  toasts: string[] = [];
  attachCalls: number = 0;
  detachCalls: number = 0;
  showCalls: number = 0;
  hideCalls: number = 0;
  registerAllCalls: number = 0;
  unregisterAllCalls: number = 0;
  updateAttributeCalls: number = 0;
  stopSessionCalls: number = 0;

  describe(): string {
    return 'attached=' + this.state.isAttached.toString() + ';show=' + this.state.isShow.toString() +
      ';on=' + this.state.isOn.toString() + ';listeners=' + this.listeners.size().toString() +
      ';attach=' + this.attachCalls.toString() + ';detach=' + this.detachCalls.toString() +
      ';showCalls=' + this.showCalls.toString() + ';hide=' + this.hideCalls.toString() +
      ';reg=' + this.registerAllCalls.toString() + ';unreg=' + this.unregisterAllCalls.toString();
  }

  /** Tap on btnAttach. A detach request runs the component detach path. */
  clickAttach(): string {
    let operation: string = this.state.toggleAttach();
    if (operation === PageOperation.ATTACH) {
      this.attachCalls++;
      this.operations.push('attach');
      return operation;
    }
    this.runDetachPath();
    return operation;
  }

  /**
   * detach(): off() first, then the two flags, then controller.detach().
   */
  runDetachPath(): void {
    this.unregisterAllCalls++;
    this.listeners.unregisterAll();
    this.operations.push('off');
    this.state.isOn = false;
    this.state.isShow = false;
    this.operations.push('isOn=false');
    this.operations.push('isShow=false');
    this.detachCalls++;
    this.operations.push('detach');
  }

  /** Tap on btnShow. Detached pages answer with the noattach toast. */
  clickShow(): string {
    let operation: string = this.state.toggleShow();
    if (operation === PageOperation.TOAST_NO_ATTACH) {
      this.toasts.push(STRING_NO_ATTACH_TIP);
      this.operations.push('toast:noattach');
      return operation;
    }
    if (operation === PageOperation.SHOW) {
      this.showCalls++;
      this.operations.push('showTextInput');
    } else {
      this.hideCalls++;
      this.operations.push('hideTextInput');
    }
    return operation;
  }

  /** Tap on btnOn. Detached pages answer with the noattach toast. */
  clickOn(): string {
    let operation: string = this.state.toggleOn();
    if (operation === PageOperation.TOAST_NO_ATTACH) {
      this.toasts.push(STRING_NO_ATTACH_TIP);
      this.operations.push('toast:noattach');
      return operation;
    }
    if (operation === PageOperation.LISTEN) {
      this.registerAllCalls++;
      this.listeners.registerAll();
      this.operations.push('initListener');
    } else {
      this.unregisterAllCalls++;
      this.listeners.unregisterAll();
      this.operations.push('off');
    }
    return operation;
  }

  /**
   * Tap on the editor (initTextInput): updateAttribute, attach, showTextInput,
   * then the three flags. The listener registration only happens when isOn was
   * false, so a second tap on an attached editor does not duplicate callbacks.
   */
  clickEditor(): void {
    this.updateAttributeCalls++;
    this.operations.push('updateAttribute');
    this.attachCalls++;
    this.operations.push('attach');
    this.showCalls++;
    this.operations.push('showTextInput');
    this.state.isAttached = true;
    this.state.isShow = true;
    if (!this.state.isOn) {
      this.state.isOn = true;
      this.registerAllCalls++;
      this.listeners.registerAll();
      this.operations.push('initListener');
    }
  }

  /** aboutToDisappear(): stopInputSession once per call. */
  stopSession(): void {
    this.stopSessionCalls++;
    this.operations.push('stopInputSession');
  }

  /** True when the flags and the registry agree with the page invariant. */
  isConsistent(): boolean {
    if (this.state.isShow && !this.state.isAttached) {
      return false;
    }
    if (this.state.isOn && !this.state.isAttached) {
      return false;
    }
    if (this.state.isOn && this.listeners.size() !== ListenerRegistry.EVENTS.length) {
      return false;
    }
    if (!this.state.isOn && this.listeners.size() !== 0) {
      return false;
    }
    return true;
  }

  operationText(): string {
    return this.operations.join(',');
  }
}

export default function pageSessionLifecycleTest002(): void {
  describe('CustomInputTextPageSessionLifecycleTest002', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0660
     * @tc.name sessionConsistentAfterDetach066
     * @tc.desc A full detach leaves the runtime consistent with empty flags and registry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentAfterDetach_066', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentAfterDetach_066');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionConsistentAfterDetach_066');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0670
     * @tc.name sessionInconsistentShowWithoutAttach067
     * @tc.desc A show flag without an attach flag is reported inconsistent by the invariant probe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionInconsistentShowWithoutAttach_067', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInconsistentShowWithoutAttach_067');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.isShow = true;
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertFalse();
      expect(runtime.state.isAttached).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionInconsistentShowWithoutAttach_067');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0680
     * @tc.name sessionInconsistentOnWithoutAttach068
     * @tc.desc An on flag without an attach flag is reported inconsistent by the invariant probe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionInconsistentOnWithoutAttach_068', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInconsistentOnWithoutAttach_068');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.isOn = true;
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionInconsistentOnWithoutAttach_068');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0690
     * @tc.name sessionInconsistentOnWithoutRegistry069
     * @tc.desc An on flag with an empty registry is reported inconsistent by the invariant probe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionInconsistentOnWithoutRegistry_069', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInconsistentOnWithoutRegistry_069');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.isAttached = true;
      runtime.state.isOn = true;
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionInconsistentOnWithoutRegistry_069');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0700
     * @tc.name sessionInconsistentRegistryWithoutOn070
     * @tc.desc A populated registry with an off flag is reported inconsistent by the invariant probe
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionInconsistentRegistryWithoutOn_070', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInconsistentRegistryWithoutOn_070');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.isAttached = true;
      runtime.listeners.registerAll();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertFalse();
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionInconsistentRegistryWithoutOn_070');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0710
     * @tc.name sessionConsistentFullCycle071
     * @tc.desc A full attach-show-listen-hide-stop-detach cycle ends consistent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentFullCycle_071', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentFullCycle_071');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionConsistentFullCycle_071');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0720
     * @tc.name sessionAttachShowCounters072
     * @tc.desc Attaching then showing issues one attach and one show call and leaves the registry empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachShowCounters_072', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachShowCounters_072');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(0);
      expect(runtime.state.isShow).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionAttachShowCounters_072');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0730
     * @tc.name sessionAttachOnCounters073
     * @tc.desc Attaching then listening issues one attach and one registration pass without a show call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachOnCounters_073', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachOnCounters_073');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionAttachOnCounters_073');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0740
     * @tc.name sessionAttachShowOnAll074
     * @tc.desc The three taps together set every flag and issue one call for each subsystem
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachShowOnAll_074', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachShowOnAll_074');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isShow).assertTrue();
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionAttachShowOnAll_074');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0750
     * @tc.name sessionOnThenShow075
     * @tc.desc Listening before showing yields the same flags and counters as the opposite order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnThenShow_075', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnThenShow_075');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isShow).assertTrue();
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionOnThenShow_075');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0760
     * @tc.name sessionShowFourToggles076
     * @tc.desc Four show taps alternate show and hide twice and end hidden
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionShowFourToggles_076', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionShowFourToggles_076');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.showCalls).assertEqual(2);
      expect(runtime.hideCalls).assertEqual(2);
      expect(runtime.state.isShow).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionShowFourToggles_076');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0770
     * @tc.name sessionOnFourToggles077
     * @tc.desc Four on taps alternate registration and removal twice and end silent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnFourToggles_077', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnFourToggles_077');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.unregisterAllCalls).assertEqual(2);
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionOnFourToggles_077');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0780
     * @tc.name sessionDetachThenShowBlocked078
     * @tc.desc A show tap after detaching answers with the toast and does not repeat the earlier show call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachThenShowBlocked_078', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenShowBlocked_078');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickAttach();
      let operation: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.state.isShow).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionDetachThenShowBlocked_078');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0790
     * @tc.name sessionDetachThenOnBlocked079
     * @tc.desc An on tap after detaching answers with the toast and does not register again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachThenOnBlocked_079', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenOnBlocked_079');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      let operation: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.toasts.length).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachThenOnBlocked_079');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0800
     * @tc.name sessionDetachReattachLabels080
     * @tc.desc Re-attaching after a detach restores the detach label while show and on stay idle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachReattachLabels_080', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachReattachLabels_080');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'labels', runtime.state.attachLabel() + '/' + runtime.state.showLabel() + '/' +
        runtime.state.onLabel());
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionDetachReattachLabels_080');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0810
     * @tc.name sessionFourAttachToggles081
     * @tc.desc Four attach taps produce two attach and two detach calls and end detached
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionFourAttachToggles_081', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionFourAttachToggles_081');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.detachCalls).assertEqual(2);
      expect(runtime.state.isAttached).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionFourAttachToggles_081');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0820
     * @tc.name sessionShowAfterReattach082
     * @tc.desc Showing after a detach and re-attach issues a second show call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionShowAfterReattach_082', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionShowAfterReattach_082');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'show calls', runtime.showCalls.toString());
      expect(runtime.showCalls).assertEqual(2);
      expect(runtime.state.isShow).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionShowAfterReattach_082');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0830
     * @tc.name sessionOnAfterReattach083
     * @tc.desc Listening after a detach and re-attach registers nine callbacks for the second time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnAfterReattach_083', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnAfterReattach_083');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionOnAfterReattach_083');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0840
     * @tc.name sessionDetachCountersAfterListen084
     * @tc.desc Detaching after one registration yields one unregistration and one detach call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachCountersAfterListen_084', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachCountersAfterListen_084');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachCountersAfterListen_084');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0850
     * @tc.name sessionDetachClearsShownFlag085
     * @tc.desc Detaching a shown editor clears isShow without an explicit hide call from the detach path
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachClearsShownFlag_085', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachClearsShownFlag_085');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.hideCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachClearsShownFlag_085');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0860
     * @tc.name sessionDetachClearsEverything086
     * @tc.desc Detaching a fully opened editor clears all flags, empties the registry and keeps show/hide counters
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachClearsEverything_086', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachClearsEverything_086');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.hideCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachClearsEverything_086');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0870
     * @tc.name sessionDetachKeepsToasts087
     * @tc.desc The detach path does not clear the recorded toast list
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachKeepsToasts_087', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachKeepsToasts_087');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.state.isAttached).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionDetachKeepsToasts_087');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0880
     * @tc.name sessionDetachAppendsOneOff088
     * @tc.desc One detach path appends exactly one off step to an empty log
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachAppendsOneOff_088', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachAppendsOneOff_088');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.operations = [];
      runtime.clickAttach();
      let offCount: number = 0;
      let index: number = 0;
      while (index < runtime.operations.length) {
        if (runtime.operations[index] === 'off') {
          offCount++;
        }
        index++;
      }
      TestLogger.value(TAG_SESSION, 'operations', runtime.operationText());
      expect(offCount).assertEqual(1);
      expect(runtime.operations.length).assertEqual(4);
      TestLogger.end(TAG_SESSION, 'sessionDetachAppendsOneOff_088');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0890
     * @tc.name sessionDetachUnregistersEvenEmpty089
     * @tc.desc The detach path performs one off pass even when the registry was already empty
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachUnregistersEvenEmpty_089', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachUnregistersEvenEmpty_089');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.runDetachPath();
      TestLogger.value(TAG_SESSION, 'unreg calls', runtime.unregisterAllCalls.toString());
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachUnregistersEvenEmpty_089');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0900
     * @tc.name sessionFullCycleReattach090
     * @tc.desc A detach in the middle of a full cycle leaves the second attach silent until on is tapped again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionFullCycleReattach_090', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionFullCycleReattach_090');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.hideCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionFullCycleReattach_090');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0910
     * @tc.name sessionEditorDetachEditor091
     * @tc.desc An editor tap, a detach and another editor tap issue two attach and two show calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorDetachEditor_091', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorDetachEditor_091');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickAttach();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.showCalls).assertEqual(2);
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEditorDetachEditor_091');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0920
     * @tc.name sessionEditorOffEditor092
     * @tc.desc An editor tap, an off tap and another editor tap register twice and unregister once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorOffEditor_092', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorOffEditor_092');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickOn();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionEditorOffEditor_092');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0930
     * @tc.name sessionEditorHideOffDetach093
     * @tc.desc An editor tap followed by hide, off and detach leaves no listener and counts each call once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorHideOffDetach_093', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorHideOffDetach_093');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.hideCalls).assertEqual(1);
      expect(runtime.unregisterAllCalls).assertEqual(2);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionEditorHideOffDetach_093');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0940
     * @tc.name sessionEditorTwiceDetachEditor094
     * @tc.desc Two editor taps, a detach and a third editor tap issue three attach and three show calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorTwiceDetachEditor_094', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorTwiceDetachEditor_094');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickEditor();
      runtime.clickAttach();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(3);
      expect(runtime.showCalls).assertEqual(3);
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEditorTwiceDetachEditor_094');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0950
     * @tc.name sessionThreeEditorClicks095
     * @tc.desc Three editor taps issue three attach and three show calls but only one registration pass
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionThreeEditorClicks_095', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionThreeEditorClicks_095');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickEditor();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(3);
      expect(runtime.showCalls).assertEqual(3);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.total()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionThreeEditorClicks_095');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0960
     * @tc.name sessionEditorStopDetach096
     * @tc.desc An editor tap, a stop call and a detach leave one stop call and a closed session
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorStopDetach_096', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorStopDetach_096');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.stopSession();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.stopSessionCalls).assertEqual(1);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionEditorStopDetach_096');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0970
     * @tc.name sessionLabelsFullCycle097
     * @tc.desc The three labels follow the flags at four points of a full cycle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionLabelsFullCycle_097', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionLabelsFullCycle_097');
      let runtime: SessionRuntime = new SessionRuntime();
      expect(runtime.state.attachLabel()).assertEqual(STRING_ATTACH);
      runtime.clickAttach();
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      runtime.clickShow();
      runtime.clickOn();
      expect(runtime.state.showLabel()).assertEqual(STRING_HIDE);
      expect(runtime.state.onLabel()).assertEqual(STRING_OFF);
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'labels', runtime.state.attachLabel() + '/' + runtime.state.showLabel() + '/' +
        runtime.state.onLabel());
      expect(runtime.state.attachLabel()).assertEqual(STRING_ATTACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionLabelsFullCycle_097');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0980
     * @tc.name sessionConsistentAtSixPoints098
     * @tc.desc The invariant probe stays true after each of six transitions of a mixed flow
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentAtSixPoints_098', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentAtSixPoints_098');
      let runtime: SessionRuntime = new SessionRuntime();
      let checks: number = 0;
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      runtime.clickAttach();
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      runtime.clickShow();
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      runtime.clickOn();
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      runtime.clickOn();
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      runtime.clickAttach();
      expect(runtime.isConsistent()).assertTrue();
      checks++;
      TestLogger.value(TAG_SESSION, 'checks', checks.toString());
      expect(checks).assertEqual(6);
      TestLogger.end(TAG_SESSION, 'sessionConsistentAtSixPoints_098');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0990
     * @tc.name sessionLabelMatrix099
     * @tc.desc Every combination of attach, show and on produces the matching button labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionLabelMatrix_099', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionLabelMatrix_099');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      runtime.clickShow();
      expect(runtime.state.showLabel()).assertEqual(STRING_HIDE);
      runtime.clickOn();
      expect(runtime.state.onLabel()).assertEqual(STRING_OFF);
      runtime.clickShow();
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      runtime.clickOn();
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionLabelMatrix_099');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1000
     * @tc.name sessionOnCounterTwoOne100
     * @tc.desc Three on taps yield two registration passes and one removal pass
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnCounterTwoOne_100', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnCounterTwoOne_100');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'reg/unreg', runtime.registerAllCalls.toString() + '/' +
        runtime.unregisterAllCalls.toString());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionOnCounterTwoOne_100');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1010
     * @tc.name sessionAttachToggleFour101
     * @tc.desc Four attach taps alternate attached and detached and end detached
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionAttachToggleFour_101', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachToggleFour_101');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      let first: boolean = runtime.state.isAttached;
      runtime.clickAttach();
      let second: boolean = runtime.state.isAttached;
      runtime.clickAttach();
      let third: boolean = runtime.state.isAttached;
      runtime.clickAttach();
      let fourth: boolean = runtime.state.isAttached;
      TestLogger.value(TAG_SESSION, 'flags', first.toString() + ',' + second.toString() + ',' + third.toString() +
        ',' + fourth.toString());
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(third).assertTrue();
      expect(fourth).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionAttachToggleFour_101');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1020
     * @tc.name sessionAttachToggleCounters102
     * @tc.desc Four attach taps produce two attach and two detach calls in total
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionAttachToggleCounters_102', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachToggleCounters_102');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.detachCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionAttachToggleCounters_102');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1030
     * @tc.name sessionRegistryThroughToggles103
     * @tc.desc The registry empties after every detach even when attach and detach alternate
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionRegistryThroughToggles_103', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionRegistryThroughToggles_103');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      expect(runtime.listeners.size()).assertEqual(9);
      runtime.clickAttach();
      expect(runtime.listeners.size()).assertEqual(0);
      runtime.clickAttach();
      expect(runtime.listeners.size()).assertEqual(0);
      runtime.clickAttach();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionRegistryThroughToggles_103');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1040
     * @tc.name sessionToastThroughAttachToggles104
     * @tc.desc Attach and detach cycles do not add or remove recorded toasts
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionToastThroughAttachToggles_104', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionToastThroughAttachToggles_104');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.detachCalls).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionToastThroughAttachToggles_104');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1050
     * @tc.name sessionAttachAfterToastsKeepsList105
     * @tc.desc Attaching after three blocked taps preserves the toast history
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionAttachAfterToastsKeepsList_105', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachAfterToastsKeepsList_105');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(3);
      expect(runtime.state.isAttached).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionAttachAfterToastsKeepsList_105');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1060
     * @tc.name sessionNoToastWhenAttached106
     * @tc.desc Two show taps on an attached page record no toast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionNoToastWhenAttached_106', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionNoToastWhenAttached_106');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(0);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.hideCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionNoToastWhenAttached_106');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1070
     * @tc.name sessionToastMessageConstant107
     * @tc.desc Every blocked tap records the same noattach resource name
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionToastMessageConstant_107', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionToastMessageConstant_107');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.join(','));
      expect(runtime.toasts.length).assertEqual(3);
      expect(runtime.toasts[0]).assertEqual(STRING_NO_ATTACH_TIP);
      expect(runtime.toasts[1]).assertEqual(STRING_NO_ATTACH_TIP);
      expect(runtime.toasts[2]).assertEqual(STRING_NO_ATTACH_TIP);
      TestLogger.end(TAG_SESSION, 'sessionToastMessageConstant_107');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1080
     * @tc.name sessionOperationLogToastEntry108
     * @tc.desc A blocked show tap appends exactly one toast entry to the operation log
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOperationLogToastEntry_108', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOperationLogToastEntry_108');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operations', runtime.operationText());
      expect(runtime.operations.length).assertEqual(1);
      expect(runtime.operations[0]).assertEqual('toast:noattach');
      TestLogger.end(TAG_SESSION, 'sessionOperationLogToastEntry_108');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1090
     * @tc.name sessionPendingSelectionAcrossAttach109
     * @tc.desc The selection command flag is independent of the attach transition
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionPendingSelectionAcrossAttach_109', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionPendingSelectionAcrossAttach_109');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.clickChangeSelection();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'pending', runtime.state.isChangeSelection.toString());
      expect(runtime.state.isChangeSelection).assertTrue();
      expect(runtime.state.consumeChangeSelection()).assertTrue();
      expect(runtime.state.isChangeSelection).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionPendingSelectionAcrossAttach_109');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1100
     * @tc.name sessionPendingSelectionAfterDetach110
     * @tc.desc A pending selection command survives a detach and is consumed once
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionPendingSelectionAfterDetach_110', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionPendingSelectionAfterDetach_110');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.clickChangeSelection();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'pending', runtime.state.isChangeSelection.toString());
      expect(runtime.state.isChangeSelection).assertTrue();
      expect(runtime.state.consumeChangeSelection()).assertTrue();
      expect(runtime.state.consumeChangeSelection()).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionPendingSelectionAfterDetach_110');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1110
     * @tc.name sessionPendingSelectionSurvivesShow111
     * @tc.desc Two show toggles leave the pending selection command untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionPendingSelectionSurvivesShow_111', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionPendingSelectionSurvivesShow_111');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.clickChangeSelection();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'pending', runtime.state.isChangeSelection.toString());
      expect(runtime.state.isChangeSelection).assertTrue();
      expect(runtime.hideCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionPendingSelectionSurvivesShow_111');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1120
     * @tc.name sessionStopAfterDetach112
     * @tc.desc A stop call after a detach leaves the detach counters and flags unchanged
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopAfterDetach_112', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopAfterDetach_112');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.stopSessionCalls).assertEqual(1);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.state.isAttached).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionStopAfterDetach_112');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1130
     * @tc.name sessionStopBetweenAttachAndOn113
     * @tc.desc A stop call between attach and on does not block the later registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopBetweenAttachAndOn_113', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopBetweenAttachAndOn_113');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.stopSession();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.stopSessionCalls).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionStopBetweenAttachAndOn_113');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1140
     * @tc.name sessionStopAfterEditorKeepsRegistry114
     * @tc.desc A stop call after an editor tap leaves the nine listeners installed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopAfterEditorKeepsRegistry_114', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopAfterEditorKeepsRegistry_114');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'registry size', runtime.listeners.size().toString());
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionStopAfterEditorKeepsRegistry_114');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1150
     * @tc.name sessionRegistryTotalsAfterDouble115
     * @tc.desc Two direct registration passes yield eighteen callbacks over nine events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionRegistryTotalsAfterDouble_115', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionRegistryTotalsAfterDouble_115');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      runtime.listeners.registerAll();
      TestLogger.value(TAG_SESSION, 'total/size', runtime.listeners.total().toString() + '/' +
        runtime.listeners.size().toString());
      expect(runtime.listeners.total()).assertEqual(18);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionRegistryTotalsAfterDouble_115');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1160
     * @tc.name sessionClearEqualsOff116
     * @tc.desc clear() removes every registration just like off()
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionClearEqualsOff_116', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionClearEqualsOff_116');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      runtime.listeners.clear();
      TestLogger.value(TAG_SESSION, 'total', runtime.listeners.total().toString());
      expect(runtime.listeners.total()).assertEqual(0);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionClearEqualsOff_116');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1170
     * @tc.name sessionUnknownEventIndex117
     * @tc.desc An event name outside the nine registered callbacks maps to index -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionUnknownEventIndex_117', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionUnknownEventIndex_117');
      let runtime: SessionRuntime = new SessionRuntime();
      let index: number = runtime.listeners.indexOf('sendKeyboardStatusX');
      TestLogger.value(TAG_SESSION, 'index', index.toString());
      expect(index).assertEqual(-1);
      TestLogger.end(TAG_SESSION, 'sessionUnknownEventIndex_117');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1180
     * @tc.name sessionUnknownEventCount118
     * @tc.desc An unknown event reports a zero callback count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionUnknownEventCount_118', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionUnknownEventCount_118');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      let count: number = runtime.listeners.countOf('unknownEvent');
      TestLogger.value(TAG_SESSION, 'count', count.toString());
      expect(count).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionUnknownEventCount_118');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1190
     * @tc.name sessionUnknownEventHas119
     * @tc.desc An unknown event never reports a listener even after a full registration pass
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionUnknownEventHas_119', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionUnknownEventHas_119');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      TestLogger.value(TAG_SESSION, 'has', runtime.listeners.has('keyboardStatus').toString());
      expect(runtime.listeners.has('keyboardStatus')).assertFalse();
      expect(runtime.listeners.has('sendKeyboardStatus')).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionUnknownEventHas_119');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1200
     * @tc.name sessionEventListLength120
     * @tc.desc The listener contract covers exactly nine controller events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionEventListLength_120', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEventListLength_120');
      TestLogger.value(TAG_SESSION, 'length', ListenerRegistry.EVENTS.length.toString());
      expect(ListenerRegistry.EVENTS.length).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEventListLength_120');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1210
     * @tc.name sessionEventListEnds121
     * @tc.desc The event list starts with insertText and ends with handleExtendAction
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEventListEnds_121', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEventListEnds_121');
      let first: string = ListenerRegistry.EVENTS[0];
      let last: string = ListenerRegistry.EVENTS[ListenerRegistry.EVENTS.length - 1];
      TestLogger.value(TAG_SESSION, 'first/last', first + '/' + last);
      expect(first).assertEqual('insertText');
      expect(last).assertEqual('handleExtendAction');
      TestLogger.end(TAG_SESSION, 'sessionEventListEnds_121');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1220
     * @tc.name sessionEventIndexMatchesPosition122
     * @tc.desc indexOf returns the declared position of every one of the nine events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEventIndexMatchesPosition_122', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEventIndexMatchesPosition_122');
      let runtime: SessionRuntime = new SessionRuntime();
      let matches: number = 0;
      let index: number = 0;
      while (index < ListenerRegistry.EVENTS.length) {
        if (runtime.listeners.indexOf(ListenerRegistry.EVENTS[index]) === index) {
          matches++;
        }
        index++;
      }
      TestLogger.value(TAG_SESSION, 'matches', matches.toString());
      expect(matches).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEventIndexMatchesPosition_122');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1230
     * @tc.name sessionFinalLabelsMixed123
     * @tc.desc A mixed toggle sequence ends attached but hidden and silent with the matching labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionFinalLabelsMixed_123', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionFinalLabelsMixed_123');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickShow();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'labels', runtime.state.attachLabel() + '/' + runtime.state.showLabel() + '/' +
        runtime.state.onLabel());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionFinalLabelsMixed_123');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1240
     * @tc.name sessionDetachTwiceThenAttachOn124
     * @tc.desc Two detach paths followed by attach and on leave one listener set and two detach calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachTwiceThenAttachOn_124', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachTwiceThenAttachOn_124');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.runDetachPath();
      runtime.runDetachPath();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.detachCalls).assertEqual(2);
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionDetachTwiceThenAttachOn_124');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1250
     * @tc.name sessionDetachThenEditor125
     * @tc.desc An editor tap after a detach registers the callbacks a second time
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachThenEditor_125', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenEditor_125');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isAttached).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionDetachThenEditor_125');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1260
     * @tc.name sessionShowAfterDetachToast126
     * @tc.desc A show tap after a detach answers with one toast and does not hide anything
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionShowAfterDetachToast_126', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionShowAfterDetachToast_126');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.hideCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionShowAfterDetachToast_126');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1270
     * @tc.name sessionOnAfterDetachToast127
     * @tc.desc An on tap after a detach answers with one toast and does not register again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnAfterDetachToast_127', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnAfterDetachToast_127');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionOnAfterDetachToast_127');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1280
     * @tc.name sessionToastThenAttachShowWorks128
     * @tc.desc A blocked show followed by attach and show records one toast and one show call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionToastThenAttachShowWorks_128', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionToastThenAttachShowWorks_128');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.state.isShow).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionToastThenAttachShowWorks_128');
      await yieldToEventLoop();
      done();
    });
  });
}
