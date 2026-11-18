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

function eventCount(runtime: SessionRuntime, event: string): number {
  return runtime.listeners.countOf(event);
}

function allEventsCount(runtime: SessionRuntime, expected: number): boolean {
  let index: number = 0;
  while (index < ListenerRegistry.EVENTS.length) {
    if (runtime.listeners.countOf(ListenerRegistry.EVENTS[index]) !== expected) {
      return false;
    }
    index++;
  }
  return true;
}

export default function pageSessionLifecycleTest001(): void {
  describe('CustomInputTextPageSessionLifecycleTest001', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0010
     * @tc.name sessionInitialFlags001
     * @tc.desc A page that never attached reports the three idle labels and keeps every flag false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionInitialFlags_001', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInitialFlags_001');
      let runtime: SessionRuntime = new SessionRuntime();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.state.attachLabel()).assertEqual(STRING_ATTACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionInitialFlags_001');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0020
     * @tc.name sessionInitialCallCounters002
     * @tc.desc An untouched runtime has issued no controller call and owns no listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionInitialCallCounters_002', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionInitialCallCounters_002');
      let runtime: SessionRuntime = new SessionRuntime();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(0);
      expect(runtime.detachCalls).assertEqual(0);
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.hideCalls).assertEqual(0);
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.operations.length).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionInitialCallCounters_002');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0030
     * @tc.name sessionFirstAttach003
     * @tc.desc The first attach tap flips only the attach flag, relabels the button and issues one attach call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionFirstAttach_003', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionFirstAttach_003');
      let runtime: SessionRuntime = new SessionRuntime();
      let operation: string = runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.ATTACH);
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.operations.length).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionFirstAttach_003');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0040
     * @tc.name sessionAttachLeavesShowAndOnUntouched004
     * @tc.desc Attaching does not show the keyboard and does not register listeners by itself
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachLeavesShowAndOnUntouched_004', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachLeavesShowAndOnUntouched_004');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.registerAllCalls).assertEqual(0);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionAttachLeavesShowAndOnUntouched_004');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0050
     * @tc.name sessionDetachClearsShowAndOn005
     * @tc.desc Detaching after showing and listening cascades isShow/isOn to false and empties the registry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachClearsShowAndOn_005', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachClearsShowAndOn_005');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickOn();
      let operation: string = runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.DETACH);
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.detachCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachClearsShowAndOn_005');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0060
     * @tc.name sessionDetachOperationOrder006
     * @tc.desc The detach path unregisters before clearing isOn, clearing isShow and calling controller.detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachOperationOrder_006', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachOperationOrder_006');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.operations = [];
      runtime.clickAttach();
      let text: string = runtime.operationText();
      TestLogger.value(TAG_SESSION, 'operations', text);
      expect(text).assertEqual('off,isOn=false,isShow=false,detach');
      TestLogger.end(TAG_SESSION, 'sessionDetachOperationOrder_006');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0070
     * @tc.name sessionAttachDetachAttachCounters007
     * @tc.desc Two attach taps around one detach produce two attach calls and one detach call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachDetachAttachCounters_007', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachDetachAttachCounters_007');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.state.isAttached).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionAttachDetachAttachCounters_007');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0080
     * @tc.name sessionDetachTwiceIdempotent008
     * @tc.desc A second detach path leaves every flag false and only advances the detach counter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachTwiceIdempotent_008', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachTwiceIdempotent_008');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.runDetachPath();
      runtime.runDetachPath();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.detachCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachTwiceIdempotent_008');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0090
     * @tc.name sessionLabelsFollowFlags009
     * @tc.desc Each flag flip rewrites exactly one button label and leaves the other two idle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionLabelsFollowFlags_009', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionLabelsFollowFlags_009');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'labels', runtime.state.attachLabel() + '/' + runtime.state.showLabel() + '/' +
        runtime.state.onLabel());
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_HIDE);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      runtime.clickOn();
      expect(runtime.state.onLabel()).assertEqual(STRING_OFF);
      TestLogger.end(TAG_SESSION, 'sessionLabelsFollowFlags_009');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0100
     * @tc.name sessionDetachKeepsUnrelatedState010
     * @tc.desc Detaching leaves the dropdown indices, selection command flag and cursor rectangle intact
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachKeepsUnrelatedState_010', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachKeepsUnrelatedState_010');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.state.selectInputType(2);
      runtime.state.selectEnterKey(3);
      runtime.state.clickChangeSelection();
      runtime.state.setCursorField('left', '12');
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.inputTypeIndex).assertEqual(2);
      expect(runtime.state.enterKeyIndex).assertEqual(3);
      expect(runtime.state.isChangeSelection).assertTrue();
      expect(runtime.state.cursorInfo.left).assertEqual(12);
      TestLogger.end(TAG_SESSION, 'sessionDetachKeepsUnrelatedState_010');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0110
     * @tc.name sessionDetachedShowSingleToast011
     * @tc.desc One show tap on a detached page records one noattach toast and does not call showTextInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachedShowSingleToast_011', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachedShowSingleToast_011');
      let runtime: SessionRuntime = new SessionRuntime();
      let operation: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(operation).assertEqual(TOAST_NO_ATTACH);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.state.isShow).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionDetachedShowSingleToast_011');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0120
     * @tc.name sessionDetachedShowThreeToast012
     * @tc.desc Three show taps before attaching record three toasts and keep isShow false
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachedShowThreeToast_012', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachedShowThreeToast_012');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(3);
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      TestLogger.end(TAG_SESSION, 'sessionDetachedShowThreeToast_012');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0130
     * @tc.name sessionDetachedOnSingleToast013
     * @tc.desc One on tap on a detached page records one noattach toast and registers no listener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachedOnSingleToast_013', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachedOnSingleToast_013');
      let runtime: SessionRuntime = new SessionRuntime();
      let operation: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(0);
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.state.isOn).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionDetachedOnSingleToast_013');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0140
     * @tc.name sessionDetachedOnTwiceNoListener014
     * @tc.desc Two on taps before attaching never reach initListener
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachedOnTwiceNoListener_014', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachedOnTwiceNoListener_014');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.toasts.length).assertEqual(2);
      expect(runtime.registerAllCalls).assertEqual(0);
      expect(runtime.listeners.total()).assertEqual(0);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionDetachedOnTwiceNoListener_014');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0150
     * @tc.name sessionToastDoesNotTouchRegistry015
     * @tc.desc The noattach toast path leaves an existing registry untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionToastDoesNotTouchRegistry_015', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionToastDoesNotTouchRegistry_015');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.operations = [];
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionToastDoesNotTouchRegistry_015');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0160
     * @tc.name sessionAttachThenShowWorks016
     * @tc.desc Attaching first lets a show tap reach showTextInput instead of the toast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachThenShowWorks_016', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachThenShowWorks_016');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.clickAttach();
      let operation: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.SHOW);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.state.isShow).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionAttachThenShowWorks_016');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0170
     * @tc.name sessionAttachThenOnWorks017
     * @tc.desc Attaching first lets an on tap register the nine callbacks instead of the toast
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionAttachThenOnWorks_017', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionAttachThenOnWorks_017');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickOn();
      runtime.clickAttach();
      let operation: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.LISTEN);
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionAttachThenOnWorks_017');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0180
     * @tc.name sessionShowTwiceHides018
     * @tc.desc Two show taps on an attached page call showTextInput then hideTextInput
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionShowTwiceHides_018', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionShowTwiceHides_018');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      let first: string = runtime.clickShow();
      let second: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operations', first + ',' + second);
      expect(first).assertEqual(PageOperation.SHOW);
      expect(second).assertEqual(PageOperation.HIDE);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.hideCalls).assertEqual(1);
      expect(runtime.state.isShow).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionShowTwiceHides_018');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0190
     * @tc.name sessionOnTwiceUnregisters019
     * @tc.desc Two on taps on an attached page register then unregister all nine callbacks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionOnTwiceUnregisters_019', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnTwiceUnregisters_019');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      let first: string = runtime.clickOn();
      let second: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operations', first + ',' + second);
      expect(first).assertEqual(PageOperation.LISTEN);
      expect(second).assertEqual(PageOperation.UNLISTEN);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionOnTwiceUnregisters_019');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0200
     * @tc.name sessionOnLabelToggles020
     * @tc.desc The on button label follows the flag across an attach, an on tap and an off tap
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionOnLabelToggles_020', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnLabelToggles_020');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      runtime.clickOn();
      expect(runtime.state.onLabel()).assertEqual(STRING_OFF);
      runtime.clickOn();
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionOnLabelToggles_020');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0210
     * @tc.name sessionRegistersAllEvents021
     * @tc.desc After initListener each of the nine documented events owns exactly one callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionRegistersAllEvents_021', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionRegistersAllEvents_021');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      let index: number = 0;
      while (index < ListenerRegistry.EVENTS.length) {
        let event: string = ListenerRegistry.EVENTS[index];
        TestLogger.value(TAG_SESSION, 'event', event);
        expect(eventCount(runtime, event)).assertEqual(1);
        expect(runtime.listeners.has(event)).assertTrue();
        index++;
      }
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionRegistersAllEvents_021');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0220
     * @tc.name sessionUnregistersAllEvents022
     * @tc.desc After off() none of the nine documented events keeps a callback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionUnregistersAllEvents_022', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionUnregistersAllEvents_022');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      let index: number = 0;
      while (index < ListenerRegistry.EVENTS.length) {
        let event: string = ListenerRegistry.EVENTS[index];
        TestLogger.value(TAG_SESSION, 'event', event);
        expect(eventCount(runtime, event)).assertEqual(0);
        expect(runtime.listeners.has(event)).assertFalse();
        index++;
      }
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionUnregistersAllEvents_022');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0230
     * @tc.name sessionDetachUnregisterOnce023
     * @tc.desc One detach path issues exactly one off() pass and clears all nine events
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachUnregisterOnce_023', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachUnregisterOnce_023');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.listeners.total()).assertEqual(0);
      expect(allEventsCount(runtime, 0)).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionDetachUnregisterOnce_023');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0240
     * @tc.name sessionDetachAfterShowOnly024
     * @tc.desc Detaching a shown but silent editor clears isShow without issuing a hide call from the detach path
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachAfterShowOnly_024', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachAfterShowOnly_024');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.hideCalls).assertEqual(0);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachAfterShowOnly_024');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0250
     * @tc.name sessionDetachAfterOnOnly025
     * @tc.desc Detaching a listening editor clears isOn and empties the registry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachAfterOnOnly_025', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachAfterOnOnly_025');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.registerAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachAfterOnOnly_025');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0260
     * @tc.name sessionDetachKeepsAttachCounter026
     * @tc.desc The detach path never rewrites the attach call counter
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachKeepsAttachCounter_026', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachKeepsAttachCounter_026');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      let before: number = runtime.attachCalls;
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'attach before/after', before.toString() + '/' + runtime.attachCalls.toString());
      expect(runtime.attachCalls).assertEqual(before);
      expect(runtime.attachCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachKeepsAttachCounter_026');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0270
     * @tc.name sessionDetachPathLength027
     * @tc.desc The detach path records exactly four ordered steps
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachPathLength_027', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachPathLength_027');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.operations = [];
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'operations', runtime.operationText());
      expect(runtime.operations.length).assertEqual(4);
      expect(runtime.operations[0]).assertEqual('off');
      expect(runtime.operations[3]).assertEqual('detach');
      TestLogger.end(TAG_SESSION, 'sessionDetachPathLength_027');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0280
     * @tc.name sessionTwoDetachesEightSteps028
     * @tc.desc Two detach paths append eight ordered steps to the log
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionTwoDetachesEightSteps_028', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionTwoDetachesEightSteps_028');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.runDetachPath();
      runtime.runDetachPath();
      TestLogger.value(TAG_SESSION, 'operations', runtime.operationText());
      expect(runtime.operations.length).assertEqual(8);
      expect(runtime.detachCalls).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionTwoDetachesEightSteps_028');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0290
     * @tc.name sessionDetachThenAttachKeepsSilence029
     * @tc.desc Re-attaching after a detach does not resurrect listeners until on is tapped again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachThenAttachKeepsSilence_029', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenAttachKeepsSilence_029');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.registerAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachThenAttachKeepsSilence_029');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0300
     * @tc.name sessionDetachThenOnBlocked030
     * @tc.desc After detaching, an on tap answers with the noattach toast and registers nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachThenOnBlocked_030', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenOnBlocked_030');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      let operation: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.registerAllCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachThenOnBlocked_030');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0310
     * @tc.name sessionDetachThenShowBlocked031
     * @tc.desc After detaching, a show tap answers with the noattach toast and calls nothing
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionDetachThenShowBlocked_031', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachThenShowBlocked_031');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      let operation: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.TOAST_NO_ATTACH);
      expect(runtime.showCalls).assertEqual(0);
      expect(runtime.hideCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachThenShowBlocked_031');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0320
     * @tc.name sessionDetachAfterEditorClick032
     * @tc.desc Detaching a session opened by an editor tap clears both derived flags and the registry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachAfterEditorClick_032', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachAfterEditorClick_032');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertFalse();
      expect(runtime.state.isShow).assertFalse();
      expect(runtime.state.isOn).assertFalse();
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.detachCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionDetachAfterEditorClick_032');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0330
     * @tc.name sessionDetachIssuesNoShowCalls033
     * @tc.desc The detach path does not call showTextInput or hideTextInput explicitly
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachIssuesNoShowCalls_033', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachIssuesNoShowCalls_033');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      let shows: number = runtime.showCalls;
      let hides: number = runtime.hideCalls;
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'show/hide', shows.toString() + '/' + runtime.showCalls.toString());
      expect(runtime.showCalls).assertEqual(shows);
      expect(runtime.hideCalls).assertEqual(hides);
      TestLogger.end(TAG_SESSION, 'sessionDetachIssuesNoShowCalls_033');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0340
     * @tc.name sessionDetachKeepsStopCounter034
     * @tc.desc Detaching does not call stopInputSession
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDetachKeepsStopCounter_034', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDetachKeepsStopCounter_034');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'stop calls', runtime.stopSessionCalls.toString());
      expect(runtime.stopSessionCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDetachKeepsStopCounter_034');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0350
     * @tc.name sessionOnRegistersNineTotal035
     * @tc.desc One on tap raises the registration total to exactly nine
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionOnRegistersNineTotal_035', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnRegistersNineTotal_035');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'total/size', runtime.listeners.total().toString() + '/' +
        runtime.listeners.size().toString());
      expect(runtime.listeners.total()).assertEqual(9);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(allEventsCount(runtime, 1)).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionOnRegistersNineTotal_035');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0360
     * @tc.name sessionOnOffOnCounters036
     * @tc.desc Two on taps around an off tap register twice, unregister once and end with nine listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnOffOnCounters_036', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnOffOnCounters_036');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionOnOffOnCounters_036');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0370
     * @tc.name sessionOffWithoutRegistration037
     * @tc.desc An off tap still issues one unregistration pass when no listener was installed
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOffWithoutRegistration_037', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOffWithoutRegistration_037');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'unreg calls', runtime.unregisterAllCalls.toString());
      expect(runtime.unregisterAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionOffWithoutRegistration_037');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0380
     * @tc.name sessionOnAfterReattach038
     * @tc.desc Detaching and attaching again leaves on available and registers nine listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnAfterReattach_038', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnAfterReattach_038');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.registerAllCalls).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionOnAfterReattach_038');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0390
     * @tc.name sessionRegistrySizeAfterOn039
     * @tc.desc The registry reports nine distinct events and nine registrations after one on tap
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionRegistrySizeAfterOn_039', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionRegistrySizeAfterOn_039');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'size', runtime.listeners.size().toString());
      expect(runtime.listeners.size()).assertEqual(ListenerRegistry.EVENTS.length);
      expect(runtime.listeners.total()).assertEqual(ListenerRegistry.EVENTS.length);
      TestLogger.end(TAG_SESSION, 'sessionRegistrySizeAfterOn_039');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0400
     * @tc.name sessionShowDoesNotTouchRegistry040
     * @tc.desc Showing and hiding the keyboard never changes the listener registry
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionShowDoesNotTouchRegistry_040', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionShowDoesNotTouchRegistry_040');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      let before: number = runtime.listeners.total();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'before/after', before.toString() + '/' + runtime.listeners.total().toString());
      expect(runtime.listeners.total()).assertEqual(before);
      expect(before).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionShowDoesNotTouchRegistry_040');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0410
     * @tc.name sessionThreeOnCycles041
     * @tc.desc Two register taps around one off tap leave two registration passes and one removal pass
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionThreeOnCycles_041', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionThreeOnCycles_041');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.unregisterAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionThreeOnCycles_041');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0420
     * @tc.name sessionDoubleRegisterAccumulates042
     * @tc.desc The registry counts two callbacks per event when initListener runs twice without off
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDoubleRegisterAccumulates_042', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDoubleRegisterAccumulates_042');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      runtime.listeners.registerAll();
      TestLogger.value(TAG_SESSION, 'total/size', runtime.listeners.total().toString() + '/' +
        runtime.listeners.size().toString());
      expect(runtime.listeners.total()).assertEqual(18);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(eventCount(runtime, 'insertText')).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionDoubleRegisterAccumulates_042');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0430
     * @tc.name sessionDoubleRegisterThenOff043
     * @tc.desc A single off pass removes both callbacks of every doubly registered event
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionDoubleRegisterThenOff_043', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionDoubleRegisterThenOff_043');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.listeners.registerAll();
      runtime.listeners.registerAll();
      runtime.listeners.unregisterAll();
      TestLogger.value(TAG_SESSION, 'total', runtime.listeners.total().toString());
      expect(runtime.listeners.total()).assertEqual(0);
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionDoubleRegisterThenOff_043');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0440
     * @tc.name sessionOnAfterDetachOn044
     * @tc.desc Registering, detaching and registering again yields nine listeners and two register passes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionOnAfterDetachOn_044', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOnAfterDetachOn_044');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(allEventsCount(runtime, 1)).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionOnAfterDetachOn_044');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0450
     * @tc.name sessionEditorClickAfterOff045
     * @tc.desc Tapping the editor after an off tap registers the nine callbacks again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickAfterOff_045', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickAfterOff_045');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.registerAllCalls).assertEqual(2);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionEditorClickAfterOff_045');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0460
     * @tc.name sessionEditorClickTwiceNoDuplicate046
     * @tc.desc Tapping the already attached editor twice keeps one registration pass
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickTwiceNoDuplicate_046', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickTwiceNoDuplicate_046');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.listeners.total()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickTwiceNoDuplicate_046');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0470
     * @tc.name sessionEditorClickFlags047
     * @tc.desc Tapping the editor from idle turns all three flags on and issues one attach and one show call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionEditorClickFlags_047', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickFlags_047');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isShow).assertTrue();
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.attachCalls).assertEqual(1);
      expect(runtime.showCalls).assertEqual(1);
      expect(runtime.updateAttributeCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickFlags_047');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0480
     * @tc.name sessionEditorClickTwiceCounters048
     * @tc.desc Two editor taps issue two attach, two show and two updateAttribute calls without duplicating listeners
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickTwiceCounters_048', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickTwiceCounters_048');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.showCalls).assertEqual(2);
      expect(runtime.updateAttributeCalls).assertEqual(2);
      expect(runtime.registerAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickTwiceCounters_048');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0490
     * @tc.name sessionEditorClickOrder049
     * @tc.desc The editor tap records updateAttribute, attach, showTextInput and initListener in that order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickOrder_049', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickOrder_049');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      let text: string = runtime.operationText();
      TestLogger.value(TAG_SESSION, 'operations', text);
      expect(text).assertEqual('updateAttribute,attach,showTextInput,initListener');
      TestLogger.end(TAG_SESSION, 'sessionEditorClickOrder_049');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0500
     * @tc.name sessionEditorClickWhileListening050
     * @tc.desc Tapping the editor after an on tap only repeats attach and show calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickWhileListening_050', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickWhileListening_050');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      let registers: number = runtime.registerAllCalls;
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.registerAllCalls).assertEqual(registers);
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.showCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickWhileListening_050');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0510
     * @tc.name sessionEditorClickAfterDetach051
     * @tc.desc Tapping the editor after a detach restores all flags and registers the callbacks again
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickAfterDetach_051', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickAfterDetach_051');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickAttach();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isOn).assertTrue();
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.registerAllCalls).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickAfterDetach_051');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0520
     * @tc.name sessionEditorClickKeepsOptions052
     * @tc.desc The editor tap leaves the dropdown indices and the cursor rectangle untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickKeepsOptions_052', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickKeepsOptions_052');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.state.selectInputType(2);
      runtime.state.selectEnterKey(1);
      runtime.state.setCursorField('top', '40');
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.inputTypeIndex).assertEqual(2);
      expect(runtime.state.enterKeyIndex).assertEqual(1);
      expect(runtime.state.cursorInfo.top).assertEqual(40);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickKeepsOptions_052');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0530
     * @tc.name sessionEditorClickLabels053
     * @tc.desc The editor tap flips all three labels to detach, hide and off
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionEditorClickLabels_053', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickLabels_053');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'labels', runtime.state.attachLabel() + '/' + runtime.state.showLabel() + '/' +
        runtime.state.onLabel());
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_HIDE);
      expect(runtime.state.onLabel()).assertEqual(STRING_OFF);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickLabels_053');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0540
     * @tc.name sessionEditorClickThenHide054
     * @tc.desc After an editor tap the show button hides the keyboard
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionEditorClickThenHide_054', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickThenHide_054');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      let operation: string = runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.HIDE);
      expect(runtime.hideCalls).assertEqual(1);
      expect(runtime.state.isShow).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionEditorClickThenHide_054');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0550
     * @tc.name sessionEditorClickThenOff055
     * @tc.desc After an editor tap the on button unregisters the nine callbacks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionEditorClickThenOff_055', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickThenOff_055');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      let operation: string = runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'operation', operation);
      expect(operation).assertEqual(PageOperation.UNLISTEN);
      expect(runtime.listeners.size()).assertEqual(0);
      expect(runtime.unregisterAllCalls).assertEqual(1);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickThenOff_055');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0560
     * @tc.name sessionEditorClickNoDetach056
     * @tc.desc The editor tap never calls controller.detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorClickNoDetach_056', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorClickNoDetach_056');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'detach calls', runtime.detachCalls.toString());
      expect(runtime.detachCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionEditorClickNoDetach_056');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0570
     * @tc.name sessionStopOnce057
     * @tc.desc aboutToDisappear issues one stopInputSession call
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionStopOnce_057', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopOnce_057');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'stop calls', runtime.stopSessionCalls.toString());
      expect(runtime.stopSessionCalls).assertEqual(1);
      expect(runtime.operations[runtime.operations.length - 1]).assertEqual('stopInputSession');
      TestLogger.end(TAG_SESSION, 'sessionStopOnce_057');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0580
     * @tc.name sessionStopTwice058
     * @tc.desc Two disappear cycles issue two stopInputSession calls
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopTwice_058', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopTwice_058');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.stopSession();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'stop calls', runtime.stopSessionCalls.toString());
      expect(runtime.stopSessionCalls).assertEqual(2);
      expect(runtime.operations.length).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionStopTwice_058');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0590
     * @tc.name sessionStopKeepsFlags059
     * @tc.desc stopInputSession does not rewrite the three flags
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopKeepsFlags_059', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopKeepsFlags_059');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.state.isShow).assertTrue();
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionStopKeepsFlags_059');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0600
     * @tc.name sessionStopKeepsRegistry060
     * @tc.desc stopInputSession does not unregister the nine callbacks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopKeepsRegistry_060', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopKeepsRegistry_060');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'registry size', runtime.listeners.size().toString());
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.unregisterAllCalls).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionStopKeepsRegistry_060');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0610
     * @tc.name sessionStopKeepsToasts061
     * @tc.desc stopInputSession leaves the recorded toast list untouched
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionStopKeepsToasts_061', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionStopKeepsToasts_061');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickShow();
      runtime.stopSession();
      TestLogger.value(TAG_SESSION, 'toasts', runtime.toasts.length.toString());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.operations.length).assertEqual(2);
      TestLogger.end(TAG_SESSION, 'sessionStopKeepsToasts_061');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0620
     * @tc.name sessionConsistentIdle062
     * @tc.desc An idle runtime satisfies the show/on imply attach and registry invariants
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentIdle_062', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentIdle_062');
      let runtime: SessionRuntime = new SessionRuntime();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.state.isAttached).assertFalse();
      TestLogger.end(TAG_SESSION, 'sessionConsistentIdle_062');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0630
     * @tc.name sessionConsistentAfterAttach063
     * @tc.desc Attaching without showing or listening keeps the runtime consistent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentAfterAttach_063', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentAfterAttach_063');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.listeners.size()).assertEqual(0);
      TestLogger.end(TAG_SESSION, 'sessionConsistentAfterAttach_063');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0640
     * @tc.name sessionConsistentAfterShow064
     * @tc.desc Showing an attached editor keeps the runtime consistent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentAfterShow_064', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentAfterShow_064');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickShow();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.state.isShow).assertTrue();
      expect(runtime.state.isAttached).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionConsistentAfterShow_064');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_0650
     * @tc.name sessionConsistentAfterListen065
     * @tc.desc Listening on an attached editor keeps the runtime consistent and the registry full
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionConsistentAfterListen_065', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionConsistentAfterListen_065');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'consistent', runtime.isConsistent().toString());
      expect(runtime.isConsistent()).assertTrue();
      expect(runtime.listeners.size()).assertEqual(ListenerRegistry.EVENTS.length);
      TestLogger.end(TAG_SESSION, 'sessionConsistentAfterListen_065');
      await yieldToEventLoop();
      done();
    });
  });
}
