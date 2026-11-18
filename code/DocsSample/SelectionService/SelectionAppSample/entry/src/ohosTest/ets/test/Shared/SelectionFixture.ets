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

import { getSelectionServiceObject } from './SelectionServiceObject';
import { MockKit, when, ArgumentMatchers, expect } from '@ohos/hypium';
import { selectionManager, PanelInfo, SelectionExtensionContext } from '@kit.BasicServicesKit';
import { Want } from '@kit.AbilityKit';
import { SelectionModel } from '../../../../main/ets/models/SelectionModel';
import SelectionExtAbility from '../../../../main/ets/selectionextability/SelectionExtAbility';

export class PanelDouble implements selectionManager.Panel {
  calls: string[] = [];
  paths: string[] = [];
  positions: number[][] = [];
  visible: boolean = false;
  failContent: boolean = false;
  failMove: boolean = false;
  failShow: boolean = false;
  throwShow: boolean = false;
  failListen: boolean = false;
  hiddenListener: (() => void) | undefined;
  destroyedListener: (() => void) | undefined;

  async setUiContent(page: string): Promise<void> {
    this.calls.push('content');
    this.paths.push(page);
    if (this.failContent) {
      throw new Error('Injected content failure');
    }
  }

  show(): Promise<void> {
    this.calls.push('show');
    if (this.throwShow) {
      throw new Error('Injected synchronous show failure');
    }
    if (this.failShow) {
      return Promise.reject(new Error('Injected show failure'));
    }
    this.visible = true;
    return Promise.resolve();
  }

  async hide(): Promise<void> {
    this.calls.push('hide');
    this.visible = false;
    if (this.hiddenListener !== undefined) {
      this.hiddenListener();
    }
  }

  async startMoving(): Promise<void> {
    this.calls.push('startMoving');
  }

  async moveToGlobalDisplay(x: number, y: number): Promise<void> {
    this.calls.push('move');
    this.positions.push([x, y]);
    if (this.failMove) {
      throw new Error('Injected move failure');
    }
  }

  on(type: 'hidden' | 'destroyed', callback: () => void): void {
    this.calls.push('on:' + type);
    if (this.failListen) {
      throw new Error('Injected listener failure');
    }
    if (type === 'hidden') {
      this.hiddenListener = callback;
    } else {
      this.destroyedListener = callback;
    }
  }

  off(type: 'hidden' | 'destroyed', callback?: () => void): void {
    this.calls.push('off:' + type);
    if (type === 'hidden') {
      this.hiddenListener = undefined;
    } else {
      this.destroyedListener = undefined;
    }
  }

  emitDestroyed(): void {
    this.visible = false;
    if (this.destroyedListener !== undefined) {
      this.destroyedListener();
    }
  }

  count(operation: string): number {
    return this.calls.filter((value: string) => value === operation).length;
  }
}

export class ContextDouble {
  wants: Want[] = [];
  rejectStart: boolean = false;

  async startAbility(want: Want): Promise<void> {
    this.wants.push(want);
    if (this.rejectStart) {
      throw new Error('Injected start failure');
    }
  }
}

export class SelectionFixture {
  model: SelectionModel = SelectionModel.getInstance();
  ability: SelectionExtAbility = new SelectionExtAbility();
  panel: PanelDouble = new PanelDouble();
  contextDouble: ContextDouble = new ContextDouble();
  context: SelectionExtensionContext = this.contextDouble as Object as SelectionExtensionContext;
  creates: PanelInfo[] = [];
  contexts: Object[] = [];
  destroyed: (selectionManager.Panel | undefined)[] = [];
  events: string[] = [];
  content: string = '';
  contentCalls: number = 0;
  rejectContent: boolean = false;
  rejectCreate: boolean = false;
  selected: ((info: selectionManager.SelectionInfo) => void) | undefined;
  private serviceObject: Object = getSelectionServiceObject();
  private mocks: MockKit = new MockKit();
  private previousInstance: SelectionModel | undefined;
  private installed: boolean = false;

  install(): void {
    this.previousInstance = globalThis.instance;
    globalThis.instance = undefined;
    this.model = SelectionModel.getInstance();
    this.ability.context = this.context;
    this.installed = true;
    const createMock = this.mocks.mockFunc(this.serviceObject, selectionManager.createPanel);
    when(createMock)(ArgumentMatchers.any, ArgumentMatchers.any).afterAction(
      async (context: Object, info: PanelInfo): Promise<selectionManager.Panel> => {
        this.creates.push(info);
        this.contexts.push(context);
        this.events.push('create');
        if (this.rejectCreate) {
          throw new Error('Injected create failure');
        }
        return this.panel;
      });
    const contentMock = this.mocks.mockFunc(this.serviceObject, selectionManager.getSelectionContent);
    when(contentMock)().afterAction(async (): Promise<string> => {
      this.contentCalls++;
      this.events.push('getContent');
      if (this.rejectContent) {
        throw new Error('Injected selection content failure');
      }
      return this.content;
    });
    const onMock = this.mocks.mockFunc(this.serviceObject, selectionManager.on);
    when(onMock)(ArgumentMatchers.anyString, ArgumentMatchers.anyFunction).afterAction(
      (event: string, callback: (info: selectionManager.SelectionInfo) => void): void => {
        this.events.push(event);
        this.selected = callback;
      });
    const destroyMock = this.mocks.mockFunc(this.serviceObject, selectionManager.destroyPanel);
    when(destroyMock)(ArgumentMatchers.any).afterAction(
      async (panel: selectionManager.Panel | undefined): Promise<void> => {
        this.destroyed.push(panel);
        this.events.push('destroy');
      });
  }

  restore(): void {
    if (!this.installed) {
      return;
    }
    this.mocks.clear(this.serviceObject);
    globalThis.instance = this.previousInstance;
    this.installed = false;
  }

  async settle(): Promise<void> {
    /** Flush the fixed, bounded promise chain used by the production callbacks. */
    /** Device UI work uses SharedDriver polling instead of relying on this helper. */
    for (let i = 0; i < 12; i++) {
      await Promise.resolve();
    }
  }

  async emitSelection(info: selectionManager.SelectionInfo): Promise<void> {
    const callback = this.selected;
    if (callback === undefined) {
      throw new Error('selectionCompleted listener is missing');
    }
    callback(info);
    await this.settle();
  }
}

export function makeSelectionInfo(type: selectionManager.SelectionType,
  x: number, y: number, bundle: string, displayId: number, windowId: number): selectionManager.SelectionInfo {
  return {
    selectionType: type,
    startDisplayX: x,
    startDisplayY: y,
    endDisplayX: x + 40,
    endDisplayY: y + 20,
    startWindowX: x - 10,
    startWindowY: y - 10,
    endWindowX: x + 30,
    endWindowY: y + 10,
    displayID: displayId,
    windowID: windowId,
    bundleName: bundle
  };
}

export function requireInfo(model: SelectionModel): selectionManager.SelectionInfo {
  const info = model.getSelectionInfo();
  expect(info === undefined).assertFalse();
  if (info === undefined) {
    throw new Error('Selection info was not stored');
  }
  return info;
}
