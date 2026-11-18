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

export default function SelectionRepeatedContent(): void {
  describe('SelectionRepeatedContent', () => {
    let fixture: SelectionFixture;

    beforeEach(async () => {
      await yieldToEventLoop();
      fixture = new SelectionFixture();
      fixture.install();
    });

    afterEach(() => {
      fixture.restore();
    });

    it('SEL_00402_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 0.5,
        startDisplayY: 0.25,
        endDisplayX: 40.5,
        endDisplayY: 20.25,
        startWindowX: -9.5,
        startWindowY: -9.75,
        endWindowX: 30.5,
        endWindowY: 10.25,
        displayID: 1,
        windowID: 6,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("Hello World");
      expect(fixture.model.getSelectionContent()).assertEqual("Hello World");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(11);
      fixture.model.setSelectionContent("🇨🇳");
      expect(fixture.model.getSelectionContent()).assertEqual("🇨🇳");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("Hello World");
      expect(fixture.model.getSelectionContent()).assertEqual("Hello World");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(0.5);
      expect(actual.startDisplayY).assertEqual(0.25);
      expect(actual.endDisplayX).assertEqual(40.5);
      expect(actual.endDisplayY).assertEqual(20.25);
      expect(actual.startWindowX).assertEqual(-9.5);
      expect(actual.startWindowY).assertEqual(-9.75);
      expect(actual.endWindowX).assertEqual(30.5);
      expect(actual.endWindowY).assertEqual(10.25);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(6);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00403_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 100.125,
        startDisplayY: 200.875,
        endDisplayX: 140.125,
        endDisplayY: 220.875,
        startWindowX: 90.125,
        startWindowY: 190.875,
        endWindowX: 130.125,
        endWindowY: 210.875,
        displayID: 1,
        windowID: 7,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("Welcome");
      expect(fixture.model.getSelectionContent()).assertEqual("Welcome");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(7);
      fixture.model.setSelectionContent("👍🏽");
      expect(fixture.model.getSelectionContent()).assertEqual("👍🏽");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("Welcome");
      expect(fixture.model.getSelectionContent()).assertEqual("Welcome");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(100.125);
      expect(actual.startDisplayY).assertEqual(200.875);
      expect(actual.endDisplayX).assertEqual(140.125);
      expect(actual.endDisplayY).assertEqual(220.875);
      expect(actual.startWindowX).assertEqual(90.125);
      expect(actual.startWindowY).assertEqual(190.875);
      expect(actual.endWindowX).assertEqual(130.125);
      expect(actual.endWindowY).assertEqual(210.875);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(7);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00404_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: 32767,
        startDisplayY: 32767,
        endDisplayX: 32807,
        endDisplayY: 32787,
        startWindowX: 32757,
        startWindowY: 32757,
        endWindowX: 32797,
        endWindowY: 32777,
        displayID: 1,
        windowID: 8,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("Selection service");
      expect(fixture.model.getSelectionContent()).assertEqual("Selection service");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(17);
      fixture.model.setSelectionContent("a‍b");
      expect(fixture.model.getSelectionContent()).assertEqual("a‍b");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("Selection service");
      expect(fixture.model.getSelectionContent()).assertEqual("Selection service");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(32767);
      expect(actual.startDisplayY).assertEqual(32767);
      expect(actual.endDisplayX).assertEqual(32807);
      expect(actual.endDisplayY).assertEqual(32787);
      expect(actual.startWindowX).assertEqual(32757);
      expect(actual.startWindowY).assertEqual(32757);
      expect(actual.endWindowX).assertEqual(32797);
      expect(actual.endWindowY).assertEqual(32777);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(8);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

    it('SEL_00405_content', 0, async () => {
      const info: selectionManager.SelectionInfo = {
        selectionType: 3,
        startDisplayX: -32768,
        startDisplayY: -32768,
        endDisplayX: -32728,
        endDisplayY: -32748,
        startWindowX: -32778,
        startWindowY: -32778,
        endWindowX: -32738,
        endWindowY: -32758,
        displayID: 1,
        windowID: 9,
        bundleName: "com.selection.selectionapplication"
      };
      fixture.model.setSelectionInfo(info);
      expect(fixture.model.getSelectionContent()).assertUndefined();
      fixture.model.setSelectionContent("two words");
      expect(fixture.model.getSelectionContent()).assertEqual("two words");
      const first = fixture.model.getSelectionContent();
      if (first === undefined) {
        throw new Error('Content setter dropped the value');
      }
      expect(first.length).assertEqual(9);
      fixture.model.setSelectionContent("a​b");
      expect(fixture.model.getSelectionContent()).assertEqual("a​b");
      fixture.model.setSelectionContent('');
      expect(fixture.model.getSelectionContent()).assertEqual('');
      fixture.model.setSelectionContent("two words");
      expect(fixture.model.getSelectionContent()).assertEqual("two words");
      const actual = requireInfo(fixture.model);
      expect(actual.selectionType).assertEqual(3);
      expect(actual.startDisplayX).assertEqual(-32768);
      expect(actual.startDisplayY).assertEqual(-32768);
      expect(actual.endDisplayX).assertEqual(-32728);
      expect(actual.endDisplayY).assertEqual(-32748);
      expect(actual.startWindowX).assertEqual(-32778);
      expect(actual.startWindowY).assertEqual(-32778);
      expect(actual.endWindowX).assertEqual(-32738);
      expect(actual.endWindowY).assertEqual(-32758);
      expect(actual.displayID).assertEqual(1);
      expect(actual.windowID).assertEqual(9);
      expect(actual.bundleName).assertEqual("com.selection.selectionapplication");
      expect(actual === info).assertTrue();
      expect(fixture.contentCalls).assertEqual(0);
      expect(fixture.creates.length).assertEqual(0);
    });

  });
}
