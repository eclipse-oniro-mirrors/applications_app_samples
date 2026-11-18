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

}

export default function pageSessionLifecycleTest003(): void {
  describe('CustomInputTextPageSessionLifecycleTest003', () => {
    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1290
     * @tc.name sessionToastThenAttachOnWorks129
     * @tc.desc A blocked on followed by attach and on records one toast and one registration
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionToastThenAttachOnWorks_129', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionToastThenAttachOnWorks_129');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.toasts.length).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(1);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionToastThenAttachOnWorks_129');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1300
     * @tc.name sessionEditorFullLifecycle130
     * @tc.desc A long editor-centred flow ends with three attach calls and nine listeners after one detach
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionEditorFullLifecycle_130', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionEditorFullLifecycle_130');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickEditor();
      runtime.clickShow();
      runtime.clickShow();
      runtime.clickOn();
      runtime.clickOn();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickEditor();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.attachCalls).assertEqual(3);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.showCalls).assertEqual(3);
      expect(runtime.hideCalls).assertEqual(1);
      expect(runtime.registerAllCalls).assertEqual(3);
      expect(runtime.listeners.size()).assertEqual(9);
      TestLogger.end(TAG_SESSION, 'sessionEditorFullLifecycle_130');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1310
     * @tc.name sessionLongScenarioConsistency131
     * @tc.desc Every transition of an eight-step mixed flow keeps the runtime consistent
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionLongScenarioConsistency_131', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionLongScenarioConsistency_131');
      let runtime: SessionRuntime = new SessionRuntime();
      let consistent: number = 0;
      runtime.clickAttach();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickShow();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickOn();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickShow();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickAttach();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickShow();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickAttach();
      if (runtime.isConsistent()) {
        consistent++;
      }
      runtime.clickOn();
      if (runtime.isConsistent()) {
        consistent++;
      }
      TestLogger.value(TAG_SESSION, 'consistent steps', consistent.toString());
      expect(consistent).assertEqual(8);
      TestLogger.end(TAG_SESSION, 'sessionLongScenarioConsistency_131');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1320
     * @tc.name sessionClearThenOnRegisters132
     * @tc.desc Clearing a full registry and tapping on again restores the nine callbacks
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(CASE_PREFIX + 'sessionClearThenOnRegisters_132', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionClearThenOnRegisters_132');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.listeners.registerAll();
      runtime.listeners.clear();
      runtime.clickOn();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.listeners.size()).assertEqual(9);
      expect(runtime.state.isOn).assertTrue();
      TestLogger.end(TAG_SESSION, 'sessionClearThenOnRegisters_132');
      await yieldToEventLoop();
      done();
    });

    /**
     * @tc.number SUB_SAMPLE_CUSTOM_INPUT_TEXT_SESSION_1330
     * @tc.name sessionOddAttachEndsAttached133
     * @tc.desc Three attach taps flip the flag on, off and on, ending attached with two attach and one detach call and idle show and on labels
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(CASE_PREFIX + 'sessionOddAttachEndsAttached_133', 0, async (done: Function) => {
      TestLogger.begin(TAG_SESSION, 'sessionOddAttachEndsAttached_133');
      let runtime: SessionRuntime = new SessionRuntime();
      runtime.clickAttach();
      runtime.clickAttach();
      runtime.clickAttach();
      TestLogger.value(TAG_SESSION, 'state', runtime.describe());
      expect(runtime.state.isAttached).assertTrue();
      expect(runtime.attachCalls).assertEqual(2);
      expect(runtime.detachCalls).assertEqual(1);
      expect(runtime.state.attachLabel()).assertEqual(STRING_DETACH);
      expect(runtime.state.showLabel()).assertEqual(STRING_SHOW);
      expect(runtime.state.onLabel()).assertEqual(STRING_ON);
      TestLogger.end(TAG_SESSION, 'sessionOddAttachEndsAttached_133');
      await yieldToEventLoop();
      done();
    });
  });
}
