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

import { describe, it, expect } from '@ohos/hypium';

const STATE_IDLE: string = 'idle';

const STATE_HOVER: string = 'hover';

const STATE_PRESSED: string = 'pressed';

const STATE_FOCUSED: string = 'focused';

const STATE_DISABLED: string = 'disabled';

const LONG_PRESS_MS: number = 500;

const DOUBLE_CLICK_MS: number = 300;

const MAX_LABEL_LENGTH: number = 64;

interface ButtonSpec {
  label: string;
  enabled: boolean;
  focusable: boolean;
  primary: boolean;
}

// Holds button configuration and derived properties
class ButtonModel {
  private label: string;
  private enabled: boolean;
  private focusable: boolean;
  private primary: boolean;

  constructor(spec: ButtonSpec) {
    this.label = spec.label;
    this.enabled = spec.enabled;
    this.focusable = spec.focusable;
    this.primary = spec.primary;
  }

  public getLabel(): string {
    return this.label;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public isFocusable(): boolean {
    return this.focusable && this.enabled;
  }

  public isPrimary(): boolean {
    return this.primary;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public setLabel(label: string): boolean {
    if (label.length === 0 || label.length > MAX_LABEL_LENGTH) {
      return false;
    }
    this.label = label;
    return true;
  }

  public isValid(): boolean {
    return this.label.length > 0 && this.label.length <= MAX_LABEL_LENGTH;
  }
}

// Tracks visual state transitions for a button
class ButtonStateMachine {
  private state: string = STATE_IDLE;
  private transitions: number = 0;

  public onFocus(): string {
    if (this.state === STATE_DISABLED) {
      return this.state;
    }
    this.state = STATE_FOCUSED;
    this.transitions++;
    return this.state;
  }

  public onBlur(): string {
    if (this.state === STATE_FOCUSED) {
      this.state = STATE_IDLE;
      this.transitions++;
    }
    return this.state;
  }

  public onHover(entering: boolean): string {
    if (this.state === STATE_DISABLED) {
      return this.state;
    }
    if (entering && this.state === STATE_IDLE) {
      this.state = STATE_HOVER;
      this.transitions++;
    } else if (!entering && this.state === STATE_HOVER) {
      this.state = STATE_IDLE;
      this.transitions++;
    }
    return this.state;
  }

  public onDown(): string {
    if (this.state === STATE_DISABLED) {
      return this.state;
    }
    this.state = STATE_PRESSED;
    this.transitions++;
    return this.state;
  }

  public onUp(): string {
    if (this.state === STATE_PRESSED) {
      this.state = STATE_IDLE;
      this.transitions++;
    }
    return this.state;
  }

  public disable(): string {
    this.state = STATE_DISABLED;
    this.transitions++;
    return this.state;
  }

  public getState(): string {
    return this.state;
  }

  public getTransitionCount(): number {
    return this.transitions;
  }

  public isPressed(): boolean {
    return this.state === STATE_PRESSED;
  }

  public reset(): void {
    this.state = STATE_IDLE;
    this.transitions = 0;
  }
}

// Recognizes click, long press and double click on buttons
class ButtonPressHandler {
  private pressedAt: number = 0;
  private pressing: boolean = false;
  private lastClickAt: number = 0;
  private clicks: number = 0;
  private longPresses: number = 0;
  private doubleClicks: number = 0;

  public onDown(now: number): void {
    this.pressedAt = now;
    this.pressing = true;
  }

  public onUp(now: number): string {
    if (!this.pressing) {
      return 'none';
    }
    this.pressing = false;
    const duration = now - this.pressedAt;
    if (duration >= LONG_PRESS_MS) {
      this.longPresses++;
      return 'longPress';
    }
    this.clicks++;
    if (this.lastClickAt > 0 && now - this.lastClickAt <= DOUBLE_CLICK_MS) {
      this.doubleClicks++;
      this.lastClickAt = 0;
      return 'doubleClick';
    }
    this.lastClickAt = now;
    return 'click';
  }

  public getClicks(): number {
    return this.clicks;
  }

  public getLongPresses(): number {
    return this.longPresses;
  }

  public getDoubleClicks(): number {
    return this.doubleClicks;
  }

  public isPressing(): boolean {
    return this.pressing;
  }

  public cancel(): void {
    this.pressing = false;
  }

  public reset(): void {
    this.pressedAt = 0;
    this.pressing = false;
    this.lastClickAt = 0;
    this.clicks = 0;
    this.longPresses = 0;
    this.doubleClicks = 0;
  }
}

// Manages a focusable group of buttons
class ButtonGroup {
  private buttons: ButtonModel[] = [];
  private focusIndex: number = 0;

  public add(spec: ButtonSpec): boolean {
    if (spec.label.length === 0) {
      return false;
    }
    this.buttons.push(new ButtonModel(spec));
    return true;
  }

  public size(): number {
    return this.buttons.length;
  }

  public focusNext(): string {
    if (this.buttons.length === 0) {
      return '';
    }
    for (let i = 1; i <= this.buttons.length; i++) {
      const index = (this.focusIndex + i) % this.buttons.length;
      if (this.buttons[index].isFocusable()) {
        this.focusIndex = index;
        return this.buttons[index].getLabel();
      }
    }
    return '';
  }

  public focusPrevious(): string {
    if (this.buttons.length === 0) {
      return '';
    }
    for (let i = 1; i <= this.buttons.length; i++) {
      const index = (this.focusIndex - i + this.buttons.length) % this.buttons.length;
      if (this.buttons[index].isFocusable()) {
        this.focusIndex = index;
        return this.buttons[index].getLabel();
      }
    }
    return '';
  }

  public focusedLabel(): string {
    if (this.buttons.length === 0) {
      return '';
    }
    return this.buttons[this.focusIndex].getLabel();
  }

  public activate(): boolean {
    if (this.buttons.length === 0) {
      return false;
    }
    return this.buttons[this.focusIndex].isEnabled();
  }

  public enabledCount(): number {
    return this.buttons.filter((button: ButtonModel) => button.isEnabled()).length;
  }

  public focusableCount(): number {
    return this.buttons.filter((button: ButtonModel) => button.isFocusable()).length;
  }

  public reset(): void {
    this.buttons = [];
    this.focusIndex = 0;
  }
}

export default function buttonInteractionTest() {
  describe('ButtonInteraction_Test', () => {

    it('model_should_expose_spec_values', 0, () => {
      const button = new ButtonModel({ label: 'submit', enabled: true, focusable: true, primary: true });
      expect(button.getLabel()).assertEqual('submit');
      expect(button.isEnabled()).assertTrue();
      expect(button.isFocusable()).assertTrue();
      expect(button.isPrimary()).assertTrue();
      expect(button.isValid()).assertTrue();
    });

    it('model_should_block_focus_when_disabled', 0, () => {
      const button = new ButtonModel({ label: 'submit', enabled: false, focusable: true, primary: false });
      expect(button.isEnabled()).assertFalse();
      expect(button.isFocusable()).assertFalse();
      button.setEnabled(true);
      expect(button.isFocusable()).assertTrue();
    });

    it('model_should_validate_labels', 0, () => {
      const button = new ButtonModel({ label: 'ok', enabled: true, focusable: true, primary: false });
      expect(button.setLabel('')).assertFalse();
      expect(button.getLabel()).assertEqual('ok');
      expect(button.setLabel('a'.repeat(MAX_LABEL_LENGTH))).assertTrue();
      expect(button.setLabel('a'.repeat(MAX_LABEL_LENGTH + 1))).assertFalse();
    });

    it('state_machine_should_focus_and_blur', 0, () => {
      const machine = new ButtonStateMachine();
      expect(machine.getState()).assertEqual(STATE_IDLE);
      expect(machine.onFocus()).assertEqual(STATE_FOCUSED);
      expect(machine.onBlur()).assertEqual(STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(2);
    });

    it('state_machine_should_hover', 0, () => {
      const machine = new ButtonStateMachine();
      expect(machine.onHover(true)).assertEqual(STATE_HOVER);
      expect(machine.onHover(false)).assertEqual(STATE_IDLE);
      expect(machine.onHover(false)).assertEqual(STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(2);
    });

    it('state_machine_should_press_and_release', 0, () => {
      const machine = new ButtonStateMachine();
      expect(machine.onDown()).assertEqual(STATE_PRESSED);
      expect(machine.isPressed()).assertTrue();
      expect(machine.onUp()).assertEqual(STATE_IDLE);
      expect(machine.isPressed()).assertFalse();
      expect(machine.onUp()).assertEqual(STATE_IDLE);
    });

    it('state_machine_should_ignore_input_when_disabled', 0, () => {
      const machine = new ButtonStateMachine();
      machine.disable();
      expect(machine.getState()).assertEqual(STATE_DISABLED);
      expect(machine.onFocus()).assertEqual(STATE_DISABLED);
      expect(machine.onDown()).assertEqual(STATE_DISABLED);
      expect(machine.onHover(true)).assertEqual(STATE_DISABLED);
      machine.reset();
      expect(machine.getState()).assertEqual(STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    it('press_handler_should_recognize_click', 0, () => {
      const handler = new ButtonPressHandler();
      handler.onDown(1000);
      expect(handler.isPressing()).assertTrue();
      expect(handler.onUp(1100)).assertEqual('click');
      expect(handler.getClicks()).assertEqual(1);
      expect(handler.getLongPresses()).assertEqual(0);
    });

    it('press_handler_should_recognize_long_press', 0, () => {
      const handler = new ButtonPressHandler();
      handler.onDown(1000);
      expect(handler.onUp(1000 + LONG_PRESS_MS)).assertEqual('longPress');
      expect(handler.getLongPresses()).assertEqual(1);
      expect(handler.getClicks()).assertEqual(0);
    });

    it('press_handler_should_recognize_double_click', 0, () => {
      const handler = new ButtonPressHandler();
      handler.onDown(1000);
      expect(handler.onUp(1050)).assertEqual('click');
      handler.onDown(1200);
      expect(handler.onUp(1250)).assertEqual('doubleClick');
      expect(handler.getClicks()).assertEqual(2);
      expect(handler.getDoubleClicks()).assertEqual(1);
    });

    it('press_handler_should_not_group_slow_clicks', 0, () => {
      const handler = new ButtonPressHandler();
      handler.onDown(1000);
      handler.onUp(1050);
      handler.onDown(2000);
      expect(handler.onUp(2050)).assertEqual('click');
      expect(handler.getDoubleClicks()).assertEqual(0);
      expect(handler.getClicks()).assertEqual(2);
    });

    it('press_handler_should_ignore_up_without_down', 0, () => {
      const handler = new ButtonPressHandler();
      expect(handler.onUp(1000)).assertEqual('none');
      expect(handler.getClicks()).assertEqual(0);
      handler.onDown(1000);
      handler.cancel();
      expect(handler.isPressing()).assertFalse();
      expect(handler.onUp(1100)).assertEqual('none');
      handler.reset();
      expect(handler.isPressing()).assertFalse();
    });

    it('group_should_skip_disabled_buttons', 0, () => {
      const group = new ButtonGroup();
      expect(group.add({ label: 'a', enabled: false, focusable: true, primary: false })).assertTrue();
      expect(group.add({ label: 'b', enabled: true, focusable: true, primary: false })).assertTrue();
      expect(group.add({ label: 'c', enabled: true, focusable: true, primary: false })).assertTrue();
      expect(group.size()).assertEqual(3);
      expect(group.enabledCount()).assertEqual(2);
      expect(group.focusableCount()).assertEqual(2);
      expect(group.focusNext()).assertEqual('b');
      expect(group.focusedLabel()).assertEqual('b');
    });

    it('group_should_cycle_focus', 0, () => {
      const group = new ButtonGroup();
      group.add({ label: 'a', enabled: true, focusable: true, primary: false });
      group.add({ label: 'b', enabled: true, focusable: true, primary: false });
      expect(group.focusNext()).assertEqual('b');
      expect(group.focusNext()).assertEqual('a');
      expect(group.focusPrevious()).assertEqual('b');
      expect(group.activate()).assertTrue();
    });

    it('group_should_handle_empty_state', 0, () => {
      const group = new ButtonGroup();
      expect(group.size()).assertEqual(0);
      expect(group.focusNext()).assertEqual('');
      expect(group.focusPrevious()).assertEqual('');
      expect(group.focusedLabel()).assertEqual('');
      expect(group.activate()).assertFalse();
      expect(group.add({ label: '', enabled: true, focusable: true, primary: false })).assertFalse();
      group.reset();
      expect(group.size()).assertEqual(0);
    });

    it('group_should_not_focus_all_disabled', 0, () => {
      const group = new ButtonGroup();
      group.add({ label: 'a', enabled: false, focusable: true, primary: false });
      group.add({ label: 'b', enabled: false, focusable: true, primary: false });
      expect(group.focusNext()).assertEqual('');
      expect(group.focusPrevious()).assertEqual('');
      expect(group.activate()).assertFalse();
      expect(group.enabledCount()).assertEqual(0);
    });

    it('button_flow_should_press_and_activate', 0, () => {
      const machine = new ButtonStateMachine();
      const handler = new ButtonPressHandler();
      const group = new ButtonGroup();
      group.add({ label: 'submit', enabled: true, focusable: true, primary: true });
      machine.onFocus();
      handler.onDown(1000);
      machine.onDown();
      expect(machine.isPressed()).assertTrue();
      handler.onUp(1100);
      machine.onUp();
      expect(machine.getState()).assertEqual(STATE_IDLE);
      expect(handler.getClicks()).assertEqual(1);
      expect(group.activate()).assertTrue();
    });

    it('button_constants_should_be_stable', 0, () => {
      expect(STATE_IDLE).assertEqual('idle');
      expect(STATE_HOVER).assertEqual('hover');
      expect(STATE_PRESSED).assertEqual('pressed');
      expect(STATE_FOCUSED).assertEqual('focused');
      expect(STATE_DISABLED).assertEqual('disabled');
      expect(LONG_PRESS_MS).assertEqual(500);
      expect(DOUBLE_CLICK_MS).assertEqual(300);
      expect(MAX_LABEL_LENGTH).assertEqual(64);
    });
  });
}

