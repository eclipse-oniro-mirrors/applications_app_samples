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

export default function SelectionContentSequence(): void {
  describe('SelectionContentSequence', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00514_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 2560,
        startDisplayY: 1440,
        endDisplayX: 2600,
        endDisplayY: 1460,
        startWindowX: 2550,
        startWindowY: 1430,
        endWindowX: 2590,
        endWindowY: 1450,
        displayID: 3,
        windowID: 8,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("\t");
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(1);
      fixture.model.setSelectionContent("éèêë");
      expect(fixture.model.getSelectionContent()).assertEqual("éèêë");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("\t");
      expect(fixture.model.getSelectionContent()).assertEqual("\t");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(2560);
      expect(actual.startDisplayY).assertEqual(1440);
      expect(actual.endDisplayX).assertEqual(2600);
      expect(actual.endDisplayY).assertEqual(1460);
      expect(actual.startWindowX).assertEqual(2550);
      expect(actual.startWindowY).assertEqual(1430);
      expect(actual.endWindowX).assertEqual(2590);
      expect(actual.endWindowY).assertEqual(1450);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00515_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 2,
        startDisplayX: 7680,
        startDisplayY: 4320,
        endDisplayX: 7720,
        endDisplayY: 4340,
        startWindowX: 7670,
        startWindowY: 4310,
        endWindowX: 7710,
        endWindowY: 4330,
        displayID: 3,
        windowID: 9,
        bundleName: "com.example.reader"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("\n");
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(1);
      fixture.model.setSelectionContent("😀");
      expect(fixture.model.getSelectionContent()).assertEqual("😀");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("\n");
      expect(fixture.model.getSelectionContent()).assertEqual("\n");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(2);
      expect(actual.startDisplayX).assertEqual(7680);
      expect(actual.startDisplayY).assertEqual(4320);
      expect(actual.endDisplayX).assertEqual(7720);
      expect(actual.endDisplayY).assertEqual(4340);
      expect(actual.startWindowX).assertEqual(7670);
      expect(actual.startWindowY).assertEqual(4310);
      expect(actual.endWindowX).assertEqual(7710);
      expect(actual.endWindowY).assertEqual(4330);
      expect(actual.displayID).assertEqual(3);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.example.reader");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

  });
}
