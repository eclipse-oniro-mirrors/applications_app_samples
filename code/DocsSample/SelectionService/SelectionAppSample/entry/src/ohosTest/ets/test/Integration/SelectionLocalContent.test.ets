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

export default function SelectionLocalContent(): void {
  describe('SelectionLocalContent', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00038_noPanel', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -2147483648,
        startDisplayY: 0,
        endDisplayX: -2147483608,
        endDisplayY: 20,
        startWindowX: -2147483658,
        startWindowY: -10,
        endWindowX: -2147483618,
        endWindowY: 10,
        displayID: 0,
        windowID: 5,
        bundleName: "com.example.browser"
      };
      fixture.content = "👍🏽";
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-2147483648);
      expect(actual.startDisplayY).assertEqual(0);
      expect(actual.endDisplayX).assertEqual(-2147483608);
      expect(actual.endDisplayY).assertEqual(20);
      expect(actual.startWindowX).assertEqual(-2147483658);
      expect(actual.startWindowY).assertEqual(-10);
      expect(actual.endWindowX).assertEqual(-2147483618);
      expect(actual.endWindowY).assertEqual(10);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(5);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "true";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("true");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

    it('SEL_00039_noPanel', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 800,
        startDisplayY: 600,
        endDisplayX: 840,
        endDisplayY: 620,
        startWindowX: 790,
        startWindowY: 590,
        endWindowX: 830,
        endWindowY: 610,
        displayID: 0,
        windowID: 6,
        bundleName: "com.example.browser"
      };
      fixture.content = "a‍b";
      await fixture.ability.onSelected(info);
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(800);
      expect(actual.startDisplayY).assertEqual(600);
      expect(actual.endDisplayX).assertEqual(840);
      expect(actual.endDisplayY).assertEqual(620);
      expect(actual.startWindowX).assertEqual(790);
      expect(actual.startWindowY).assertEqual(590);
      expect(actual.endWindowX).assertEqual(830);
      expect(actual.endWindowY).assertEqual(610);
      expect(actual.displayID).assertEqual(0);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.example.browser");
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
      expect(fixture.contentCalls).assertEqual(1);
      expect(fixture.creates.length).assertEqual(0);
      expect(fixture.panel.calls.length).assertEqual(0);
      expect(fixture.panel.visible).assertFalse();
      expect(fixture.model.getSelectionPanel()).assertUndefined();
      fixture.content = "null";
      await fixture.ability.onSelected(info);
      expect(fixture.contentCalls).assertEqual(2);
      expect(fixture.model.getSelectionContent()).assertEqual("null");
      expect(fixture.panel.calls.length).assertEqual(0);
    });

  });
}
