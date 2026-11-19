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

import { describe, it, expect, beforeEach, afterEach } from '@ohos/hypium';
import { selectionManager } from '@kit.BasicServicesKit';
import { SelectionModel } from '../../../../main/ets/models/SelectionModel';
import { SelectionFixture, PanelDouble, requireInfo } from '../Shared/SelectionFixture';
import { yieldToEventLoop } from '../Shared/TestScheduler';

export default function SelectionShowRecovery(): void {
  describe('SelectionShowRecovery', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00378_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0,
        startDisplayY: 0,
        endDisplayX: 40,
        endDisplayY: 20,
        startWindowX: -10,
        startWindowY: -10,
        endWindowX: 30,
        endWindowY: 10,
        displayID: 1,
        windowID: 4,
        bundleName: "com.example.editor"
      };
      fixture.content = "true";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(4);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0);
      expect(fixture.panel.positions[0][1]).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00379_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1,
        startDisplayY: 1,
        endDisplayX: 41,
        endDisplayY: 21,
        startWindowX: -9,
        startWindowY: -9,
        endWindowX: 31,
        endWindowY: 11,
        displayID: 1,
        windowID: 5,
        bundleName: "com.example.editor"
      };
      fixture.content = "null";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1);
      expect(actual.startDisplayY).assertEqual(1);
      expect(actual.endDisplayX).assertEqual(41);
      expect(actual.endDisplayY).assertEqual(21);
      expect(actual.startWindowX).assertEqual(-9);
      expect(actual.startWindowY).assertEqual(-9);
      expect(actual.endWindowX).assertEqual(31);
      expect(actual.endWindowY).assertEqual(11);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("null");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1);
      expect(fixture.panel.positions[0][1]).assertEqual(1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00380_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -1,
        startDisplayY: -1,
        endDisplayX: 39,
        endDisplayY: 19,
        startWindowX: -11,
        startWindowY: -11,
        endWindowX: 29,
        endWindowY: 9,
        displayID: 1,
        windowID: 6,
        bundleName: "com.example.editor"
      };
      fixture.content = "undefined";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-1);
      expect(actual.startDisplayY).assertEqual(-1);
      expect(actual.endDisplayX).assertEqual(39);
      expect(actual.endDisplayY).assertEqual(19);
      expect(actual.startWindowX).assertEqual(-11);
      expect(actual.startWindowY).assertEqual(-11);
      expect(actual.endWindowX).assertEqual(29);
      expect(actual.endWindowY).assertEqual(9);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("undefined");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(-1);
      expect(fixture.panel.positions[0][1]).assertEqual(-1);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00381_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0,
        startDisplayY: 1080,
        endDisplayX: 40,
        endDisplayY: 1100,
        startWindowX: -10,
        startWindowY: 1070,
        endWindowX: 30,
        endWindowY: 1090,
        displayID: 1,
        windowID: 7,
        bundleName: "com.example.editor"
      };
      fixture.content = "[]";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0);
      expect(actual.startDisplayY).assertEqual(1080);
      expect(actual.endDisplayX).assertEqual(40);
      expect(actual.endDisplayY).assertEqual(1100);
      expect(actual.startWindowX).assertEqual(-10);
      expect(actual.startWindowY).assertEqual(1070);
      expect(actual.endWindowX).assertEqual(30);
      expect(actual.endWindowY).assertEqual(1090);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("[]");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(0);
      expect(fixture.panel.positions[0][1]).assertEqual(1080);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00382_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1920,
        startDisplayY: 0,
        endDisplayX: 1960,
        endDisplayY: 20,
        startWindowX: 1910,
        startWindowY: -10,
        endWindowX: 1950,
        endWindowY: 10,
        displayID: 1,
        windowID: 8,
        bundleName: "com.example.editor"
      };
      fixture.content = "{}";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1920);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(1960);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(1910);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(1950);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("{}");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1920);
      expect(fixture.panel.positions[0][1]).assertEqual(0);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

    it('SEL_00383_showError', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 1919,
        startDisplayY: 1079,
        endDisplayX: 1959,
        endDisplayY: 1099,
        startWindowX: 1909,
        startWindowY: 1069,
        endWindowX: 1949,
        endWindowY: 1089,
        displayID: 1,
        windowID: 9,
        bundleName: "com.example.editor"
      };
      fixture.content = "[1,2,3]";
      await fixture.ability.createSelectionPanel();
      fixture.panel.failShow = true;
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(1919);
      expect(actual.startDisplayY).assertEqual(1079);
      expect(actual.endDisplayX).assertEqual(1959);
      expect(actual.endDisplayY).assertEqual(1099);
      expect(actual.startWindowX).assertEqual(1909);
      expect(actual.startWindowY).assertEqual(1069);
      expect(actual.endWindowX).assertEqual(1949);
      expect(actual.endWindowY).assertEqual(1089);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.editor");
      expect(fixture.model.getSelectionContent()).assertEqual("[1,2,3]");
      expect(fixture.panel.paths[0]).assertEqual('pages/MenuPanel');
      expect(fixture.panel.positions[0][0]).assertEqual(1919);
      expect(fixture.panel.positions[0][1]).assertEqual(1079);
      expect(fixture.panel.count('show')).assertEqual(1);
      expect(fixture.panel.visible).assertFalse();
      fixture.panel.failShow = false;
      await fixture.ability.onSelected(info);
      expect(fixture.panel.count('move')).assertEqual(2);
      expect(fixture.panel.count('show')).assertEqual(2);
      expect(fixture.panel.visible).assertTrue();
    });

  });
}
