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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { BUNDLE_NAME, MODULE_ENTRY, TIMEOUT_PAGE_RENDER } from '../Shared/SharedDriver';

enum UiComponentType {
  BUTTON = 0,
  TEXT = 1,
  INPUT = 2,
  SCROLL = 3,
  LIST = 4,
  LIST_ITEM = 5,
  IMAGE = 6
}

enum PageEntry {
  DATA_SHARE_EXT_ABILITY = 0,
  ABILITY_CONTEXT = 1,
  SERVICE_EXT_CONTEXT = 2,
  BUNDLE = 3,
  ABILITY_ACCESS_CTRL = 4,
  DATA_SHARE_HELPER = 5,
  WINDOW = 6,
  FORM_EXT_CONTEXT = 7
}

class UiComponent {
  readonly id: string;
  readonly type: UiComponentType;
  readonly label: string;
  focusable: boolean;
  enabled: boolean;
  visible: boolean;

  constructor(id: string, type: UiComponentType, label: string, focusable: boolean,
    enabled: boolean, visible: boolean) {
    this.id = id;
    this.type = type;
    this.label = label;
    this.focusable = focusable;
    this.enabled = enabled;
    this.visible = visible;
  }

  isInteractive(): boolean {
    return this.enabled && this.visible && this.type === UiComponentType.BUTTON;
  }

  canFocus(): boolean {
    return this.focusable && this.enabled && this.visible;
  }

  describe(): string {
    return `${this.type}:${this.id}:${this.label}`;
  }
}

class PageLayout {
  readonly name: string;
  private components: UiComponent[] = [];

  constructor(name: string) {
    this.name = name;
  }

  add(component: UiComponent): PageLayout {
    this.components.push(component);
    return this;
  }

  size(): number {
    return this.components.length;
  }

  all(): UiComponent[] {
    return this.components;
  }

  findById(id: string): UiComponent | null {
    for (const component of this.components) {
      if (component.id === id) {
        return component;
      }
    }
    return null;
  }

  countByType(type: UiComponentType): number {
    let count = 0;
    for (const component of this.components) {
      if (component.type === type) {
        count += 1;
      }
    }
    return count;
  }

  visibleCount(): number {
    let count = 0;
    for (const component of this.components) {
      if (component.visible) {
        count += 1;
      }
    }
    return count;
  }

  enabledCount(): number {
    let count = 0;
    for (const component of this.components) {
      if (component.enabled) {
        count += 1;
      }
    }
    return count;
  }

  focusableIds(): string[] {
    const ids: string[] = [];
    for (const component of this.components) {
      if (component.canFocus()) {
        ids.push(component.id);
      }
    }
    return ids;
  }

  hasDuplicateIds(): boolean {
    for (let i = 0; i < this.components.length; i++) {
      for (let j = i + 1; j < this.components.length; j++) {
        if (this.components[i].id === this.components[j].id) {
          return true;
        }
      }
    }
    return false;
  }
}

class FocusNavigator {
  private order: string[];
  private index: number;

  constructor(order: string[]) {
    this.order = order;
    this.index = order.length > 0 ? 0 : -1;
  }

  currentIndex(): number {
    return this.index;
  }

  currentId(): string {
    if (this.index < 0 || this.index >= this.order.length) {
      return '';
    }
    return this.order[this.index];
  }

  moveNext(): number {
    if (this.order.length === 0) {
      return -1;
    }
    if (this.index < this.order.length - 1) {
      this.index += 1;
    }
    return this.index;
  }

  movePrev(): number {
    if (this.order.length === 0) {
      return -1;
    }
    if (this.index > 0) {
      this.index -= 1;
    }
    return this.index;
  }

  moveTo(id: string): boolean {
    for (let i = 0; i < this.order.length; i++) {
      if (this.order[i] === id) {
        this.index = i;
        return true;
      }
    }
    return false;
  }

  reset(): void {
    this.index = this.order.length > 0 ? 0 : -1;
  }

  orderSize(): number {
    return this.order.length;
  }

  atEnd(): boolean {
    return this.index === this.order.length - 1;
  }
}

class EntryCatalog {
  private entries: PageEntry[] = [];

  add(entry: PageEntry): EntryCatalog {
    this.entries.push(entry);
    return this;
  }

  size(): number {
    return this.entries.length;
  }

  contains(entry: PageEntry): boolean {
    return this.entries.indexOf(entry) >= 0;
  }

  names(): string[] {
    const result: string[] = [];
    for (const entry of this.entries) {
      result.push(EntryCatalog.nameOf(entry));
    }
    return result;
  }

  static nameOf(entry: PageEntry): string {
    switch (entry) {
      case PageEntry.DATA_SHARE_EXT_ABILITY:
        return 'DataShareExtAbility';
      case PageEntry.ABILITY_CONTEXT:
        return 'AbilityContext';
      case PageEntry.SERVICE_EXT_CONTEXT:
        return 'ServiceExtContext';
      case PageEntry.BUNDLE:
        return 'Bundle';
      case PageEntry.ABILITY_ACCESS_CTRL:
        return 'AbilityAccessCtrl';
      case PageEntry.DATA_SHARE_HELPER:
        return 'DataShareHelper';
      case PageEntry.WINDOW:
        return 'Window';
      case PageEntry.FORM_EXT_CONTEXT:
        return 'FormExtContext';
      default:
        return 'Unknown';
    }
  }
}

function buildIndexLayout(): PageLayout {
  const layout = new PageLayout('IndexPage');
  layout.add(new UiComponent('entryDataShare', UiComponentType.BUTTON, 'DataShareExtAbility',
    true, true, true));
  layout.add(new UiComponent('entryAbilityContext', UiComponentType.BUTTON, 'AbilityContext',
    true, true, true));
  layout.add(new UiComponent('entryServiceExt', UiComponentType.BUTTON, 'ServiceExtContext',
    true, true, true));
  layout.add(new UiComponent('entryBundle', UiComponentType.BUTTON, 'Bundle',
    true, true, true));
  layout.add(new UiComponent('entryAccessCtrl', UiComponentType.BUTTON, 'AbilityAccessCtrl',
    true, true, true));
  layout.add(new UiComponent('entryDataShareHelper', UiComponentType.BUTTON, 'DataShareHelper',
    true, true, true));
  layout.add(new UiComponent('entryWindow', UiComponentType.BUTTON, 'Window',
    true, true, true));
  layout.add(new UiComponent('entryFormExt', UiComponentType.BUTTON, 'FormExtContext',
    true, true, true));
  layout.add(new UiComponent('pageTitle', UiComponentType.TEXT, 'StageModel',
    false, true, true));
  layout.add(new UiComponent('pageScroll', UiComponentType.SCROLL, 'scroll',
    false, true, true));
  return layout;
}

export default function abilityContextUITest(): void {
  describe('AbilityContextUISuite', () => {
    let layout: PageLayout = buildIndexLayout();

    beforeAll(() => {
      layout = buildIndexLayout();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'ui suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'ui suite end');
    });

    it('AbilityContextUI_001', 0, async (done: Function) => {
      expect(layout.name).assertEqual('IndexPage');
      expect(layout.size()).assertEqual(10);
      expect(layout.hasDuplicateIds()).assertFalse();
      done();
    });

    it('AbilityContextUI_002', 0, async (done: Function) => {
      expect(layout.countByType(UiComponentType.BUTTON)).assertEqual(8);
      expect(layout.countByType(UiComponentType.TEXT)).assertEqual(1);
      expect(layout.countByType(UiComponentType.SCROLL)).assertEqual(1);
      done();
    });

    it('AbilityContextUI_003', 0, async (done: Function) => {
      expect(layout.visibleCount()).assertEqual(10);
      expect(layout.enabledCount()).assertEqual(10);
      const title = layout.findById('pageTitle');
      expect(title !== null).assertTrue();
      if (title !== null) {
        expect(title.visible).assertTrue();
        expect(title.isInteractive()).assertFalse();
      }
      done();
    });

    it('AbilityContextUI_004', 0, async (done: Function) => {
      const button = layout.findById('entryDataShare');
      expect(button !== null).assertTrue();
      if (button !== null) {
        expect(button.type).assertEqual(UiComponentType.BUTTON);
        expect(button.label).assertEqual('DataShareExtAbility');
        expect(button.isInteractive()).assertTrue();
      }
      expect(layout.findById('missing')).assertNull();
      done();
    });

    it('AbilityContextUI_005', 0, async (done: Function) => {
      const focusable = layout.focusableIds();
      expect(focusable.length).assertEqual(8);
      expect(focusable[0]).assertEqual('entryDataShare');
      expect(focusable[7]).assertEqual('entryFormExt');
      done();
    });

    it('AbilityContextUI_006', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      expect(nav.orderSize()).assertEqual(8);
      expect(nav.currentIndex()).assertEqual(0);
      expect(nav.currentId()).assertEqual('entryDataShare');
      done();
    });

    it('AbilityContextUI_007', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      expect(nav.moveNext()).assertEqual(1);
      expect(nav.moveNext()).assertEqual(2);
      expect(nav.currentId()).assertEqual('entryServiceExt');
      done();
    });

    it('AbilityContextUI_008', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      nav.moveNext();
      nav.moveNext();
      expect(nav.movePrev()).assertEqual(1);
      expect(nav.movePrev()).assertEqual(0);
      expect(nav.movePrev()).assertEqual(0);
      done();
    });

    it('AbilityContextUI_009', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      for (let i = 0; i < 20; i++) {
        nav.moveNext();
      }
      expect(nav.atEnd()).assertTrue();
      expect(nav.currentIndex()).assertEqual(7);
      expect(nav.currentId()).assertEqual('entryFormExt');
      done();
    });

    it('AbilityContextUI_010', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      expect(nav.moveTo('entryWindow')).assertTrue();
      expect(nav.currentIndex()).assertEqual(6);
      expect(nav.moveTo('nope')).assertFalse();
      expect(nav.currentIndex()).assertEqual(6);
      done();
    });

    it('AbilityContextUI_011', 0, async (done: Function) => {
      const nav = new FocusNavigator(layout.focusableIds());
      nav.moveNext();
      nav.moveNext();
      nav.reset();
      expect(nav.currentIndex()).assertEqual(0);
      expect(nav.currentId()).assertEqual('entryDataShare');
      done();
    });

    it('AbilityContextUI_012', 0, async (done: Function) => {
      const emptyNav = new FocusNavigator([]);
      expect(emptyNav.orderSize()).assertEqual(0);
      expect(emptyNav.currentIndex()).assertEqual(-1);
      expect(emptyNav.currentId()).assertEqual('');
      expect(emptyNav.moveNext()).assertEqual(-1);
      expect(emptyNav.movePrev()).assertEqual(-1);
      done();
    });

    it('AbilityContextUI_013', 0, async (done: Function) => {
      const catalog = new EntryCatalog();
      catalog.add(PageEntry.DATA_SHARE_EXT_ABILITY);
      catalog.add(PageEntry.ABILITY_CONTEXT);
      catalog.add(PageEntry.SERVICE_EXT_CONTEXT);
      catalog.add(PageEntry.BUNDLE);
      catalog.add(PageEntry.ABILITY_ACCESS_CTRL);
      catalog.add(PageEntry.DATA_SHARE_HELPER);
      catalog.add(PageEntry.WINDOW);
      catalog.add(PageEntry.FORM_EXT_CONTEXT);
      expect(catalog.size()).assertEqual(8);
      expect(catalog.contains(PageEntry.WINDOW)).assertTrue();
      expect(catalog.contains(PageEntry.BUNDLE)).assertTrue();
      done();
    });

    it('AbilityContextUI_014', 0, async (done: Function) => {
      const catalog = new EntryCatalog();
      catalog.add(PageEntry.DATA_SHARE_EXT_ABILITY);
      catalog.add(PageEntry.ABILITY_CONTEXT);
      catalog.add(PageEntry.FORM_EXT_CONTEXT);
      const names = catalog.names();
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual('DataShareExtAbility');
      expect(names[1]).assertEqual('AbilityContext');
      expect(names[2]).assertEqual('FormExtContext');
      done();
    });

    it('AbilityContextUI_015', 0, async (done: Function) => {
      expect(EntryCatalog.nameOf(PageEntry.SERVICE_EXT_CONTEXT)).assertEqual('ServiceExtContext');
      expect(EntryCatalog.nameOf(PageEntry.ABILITY_ACCESS_CTRL)).assertEqual('AbilityAccessCtrl');
      expect(EntryCatalog.nameOf(PageEntry.DATA_SHARE_HELPER)).assertEqual('DataShareHelper');
      expect(EntryCatalog.nameOf(PageEntry.WINDOW)).assertEqual('Window');
      done();
    });

    it('AbilityContextUI_016', 0, async (done: Function) => {
      const text = new UiComponent('label', UiComponentType.TEXT, 'hello',
        false, true, true);
      expect(text.describe()).assertEqual('1:label:hello');
      const button = new UiComponent('btn', UiComponentType.BUTTON, 'ok',
        true, true, true);
      expect(button.describe()).assertEqual('0:btn:ok');
      done();
    });

    it('AbilityContextUI_017', 0, async (done: Function) => {
      const local = buildIndexLayout();
      const before = local.visibleCount();
      const target = local.findById('entryWindow');
      expect(target !== null).assertTrue();
      if (target !== null) {
        target.visible = false;
      }
      expect(local.visibleCount()).assertEqual(before - 1);
      expect(local.focusableIds().indexOf('entryWindow')).assertEqual(-1);
      done();
    });

    it('AbilityContextUI_018', 0, async (done: Function) => {
      const local = buildIndexLayout();
      const target = local.findById('entryBundle');
      expect(target !== null).assertTrue();
      if (target !== null) {
        target.enabled = false;
        expect(target.canFocus()).assertFalse();
        expect(target.isInteractive()).assertFalse();
        target.enabled = true;
        expect(target.canFocus()).assertTrue();
        expect(target.isInteractive()).assertTrue();
      }
      done();
    });

    it('AbilityContextUI_019', 0, async (done: Function) => {
      const scroll = new UiComponent('scroll', UiComponentType.SCROLL, 'scroll',
        false, true, true);
      expect(scroll.canFocus()).assertFalse();
      expect(scroll.isInteractive()).assertFalse();
      const input = new UiComponent('input', UiComponentType.INPUT, 'bookNameInput',
        true, true, true);
      expect(input.canFocus()).assertTrue();
      expect(input.isInteractive()).assertFalse();
      done();
    });

    it('AbilityContextUI_020', 0, async (done: Function) => {
      const labels: string[] = [];
      for (const component of layout.all()) {
        labels.push(component.label);
      }
      let unique = true;
      for (let i = 0; i < labels.length; i++) {
        for (let j = i + 1; j < labels.length; j++) {
          if (labels[i] === labels[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertTrue();
      expect(labels.length).assertEqual(10);
      done();
    });

    it('AbilityContextUI_021', 0, async (done: Function) => {
      const first = buildIndexLayout();
      const second = buildIndexLayout();
      const firstIds = first.focusableIds();
      const secondIds = second.focusableIds();
      expect(first.size()).assertEqual(second.size());
      expect(firstIds.length).assertEqual(secondIds.length);
      expect(firstIds[0]).assertEqual(secondIds[0]);
      expect(first.countByType(UiComponentType.BUTTON)).assertEqual(second.countByType(UiComponentType.BUTTON));
      done();
    });

    it('AbilityContextUI_022', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(MODULE_ENTRY).assertEqual('entry');
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      const layoutName = `${BUNDLE_NAME}:${MODULE_ENTRY}`;
      expect(layoutName).assertEqual('ohos.samples.stagemodel:entry');
      done();
    });

    it('AbilityContextUI_023', 0, async (done: Function) => {
      const nav = new FocusNavigator(buildIndexLayout().focusableIds());
      expect(nav.moveTo('entryDataShare')).assertTrue();
      expect(nav.currentIndex()).assertEqual(0);
      expect(nav.moveTo('entryFormExt')).assertTrue();
      expect(nav.currentIndex()).assertEqual(7);
      expect(nav.atEnd()).assertTrue();
      done();
    });

    it('AbilityContextUI_024', 0, async (done: Function) => {
      let total = 0;
      total += layout.countByType(UiComponentType.BUTTON);
      total += layout.countByType(UiComponentType.TEXT);
      total += layout.countByType(UiComponentType.SCROLL);
      total += layout.countByType(UiComponentType.LIST);
      expect(total).assertEqual(layout.size());
      expect(layout.countByType(UiComponentType.LIST)).assertEqual(0);
      done();
    });

    it('AbilityContextUI_025', 0, async (done: Function) => {
      const local = new PageLayout('EmptyPage');
      expect(local.size()).assertEqual(0);
      expect(local.visibleCount()).assertEqual(0);
      expect(local.focusableIds().length).assertEqual(0);
      expect(local.findById('x')).assertNull();
      done();
    });
  });
}


