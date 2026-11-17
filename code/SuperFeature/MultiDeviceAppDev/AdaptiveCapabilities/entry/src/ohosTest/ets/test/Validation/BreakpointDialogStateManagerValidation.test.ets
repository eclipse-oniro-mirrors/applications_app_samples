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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import { BreakpointModel } from '../Shared/BreakpointModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[BreakpointTests]';

export default function breakpointDialogStateManagerValidationSuite() {
  describe('BreakpointDialogStateManagerValidationSuite', () => {
    let m: BreakpointModel = new BreakpointModel();

    beforeEach(() => {
      m = new BreakpointModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0010
     * @tc.name    BreakpointDialogStateManagerValidation001
     * @tc.desc    Width 0vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(0)).assertEqual('xs');
      m.applyWidth(0);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0020
     * @tc.name    BreakpointDialogStateManagerValidation002
     * @tc.desc    Width 1vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1)).assertEqual('xs');
      m.applyWidth(1);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0030
     * @tc.name    BreakpointDialogStateManagerValidation003
     * @tc.desc    Each breakpoint definition resolves to itself and owns its lower bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      for (let k = 0; k < m.getDefinitions().length; k++) {
        const def = m.getDefinitions()[k];
        expect(def.name.length).assertLarger(0);
        expect(def.size >= 0).assertEqual(true);
        expect(m.resolve(def.size)).assertEqual(def.name);
        const range: number[] = m.rangeOf(def.name);
        expect(range[0]).assertEqual(def.size);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0040
     * @tc.name    BreakpointDialogStateManagerValidation004
     * @tc.desc    Width 319vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(319)).assertEqual('xs');
      m.applyWidth(319);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0050
     * @tc.name    BreakpointDialogStateManagerValidation005
     * @tc.desc    Width 320vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(320)).assertEqual('sm');
      m.applyWidth(320);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0060
     * @tc.name    BreakpointDialogStateManagerValidation006
     * @tc.desc    Adjacent breakpoint ranges share a boundary with no gaps
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      for (let k = 1; k < names.length; k++) {
        const prevRange: number[] = m.rangeOf(names[k - 1]);
        const currRange: number[] = m.rangeOf(names[k]);
        expect(prevRange[1]).assertEqual(currRange[0]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0070
     * @tc.name    BreakpointDialogStateManagerValidation007
     * @tc.desc    Width 480vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(480)).assertEqual('sm');
      m.applyWidth(480);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0080
     * @tc.name    BreakpointDialogStateManagerValidation008
     * @tc.desc    Width 599vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(599)).assertEqual('sm');
      m.applyWidth(599);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0090
     * @tc.name    BreakpointDialogStateManagerValidation009
     * @tc.desc    Columns gutter margin and font never decrease as breakpoint grows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const ordered: string[] = m.getBreakpointNames();
      let prevColumns: number = -1;
      let prevGutter: number = -1;
      let prevMargin: number = -1;
      let prevFont: number = -1;
      for (let k = 0; k < ordered.length; k++) {
        const profile = m.profileOf(ordered[k]);
        expect(profile.columns >= prevColumns).assertEqual(true);
        expect(profile.gutterVp >= prevGutter).assertEqual(true);
        expect(profile.marginVp >= prevMargin).assertEqual(true);
        expect(profile.fontFp >= prevFont).assertEqual(true);
        prevColumns = profile.columns;
        prevGutter = profile.gutterVp;
        prevMargin = profile.marginVp;
        prevFont = profile.fontFp;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0100
     * @tc.name    BreakpointDialogStateManagerValidation010
     * @tc.desc    Width 601vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(601)).assertEqual('md');
      m.applyWidth(601);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0110
     * @tc.name    BreakpointDialogStateManagerValidation011
     * @tc.desc    Width 720vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(720)).assertEqual('md');
      m.applyWidth(720);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0120
     * @tc.name    BreakpointDialogStateManagerValidation012
     * @tc.desc    History forms a linked chain with strictly increasing sequence numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      const sweep: number[] = [0, 400, 700, 900, 500, 100];
      for (let k = 0; k < sweep.length; k++) {
        m.applyWidth(sweep[k]);
      }
      const trail = m.getHistory();
      for (let k = 1; k < trail.length; k++) {
        expect(trail[k].seq).assertEqual(trail[k - 1].seq + 1);
        expect(trail[k].from).assertEqual(trail[k - 1].to);
      }
      if (trail.length > 0) {
        expect(trail[trail.length - 1].to).assertEqual(m.getCurrent());
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0130
     * @tc.name    BreakpointDialogStateManagerValidation013
     * @tc.desc    Width 840vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(840)).assertEqual('lg');
      m.applyWidth(840);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0140
     * @tc.name    BreakpointDialogStateManagerValidation014
     * @tc.desc    Width 841vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(841)).assertEqual('lg');
      m.applyWidth(841);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0150
     * @tc.name    BreakpointDialogStateManagerValidation015
     * @tc.desc    Five register and five unregister calls leave zero listeners
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const regBefore: number = m.getRegisterCalls();
      const unregBefore: number = m.getUnregisterCalls();
      for (let k = 0; k < 5; k++) {
        m.register();
      }
      for (let k = 0; k < 5; k++) {
        m.unregister();
      }
      expect(m.getRegisterCalls()).assertEqual(regBefore + 5);
      expect(m.getUnregisterCalls()).assertEqual(unregBefore + 5);
      expect(m.getListenerCount()).assertEqual(0);
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0160
     * @tc.name    BreakpointDialogStateManagerValidation016
     * @tc.desc    Width 1440vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1440)).assertEqual('lg');
      m.applyWidth(1440);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0170
     * @tc.name    BreakpointDialogStateManagerValidation017
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0180
     * @tc.name    BreakpointDialogStateManagerValidation018
     * @tc.desc    Wider breakpoints produce narrower individual columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const wide: number = m.columnWidth(1440, 'lg');
      const narrow: number = m.columnWidth(1440, 'sm');
      expect(wide > 0).assertEqual(true);
      expect(narrow > 0).assertEqual(true);
      expect(wide < narrow).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0190
     * @tc.name    BreakpointDialogStateManagerValidation019
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0200
     * @tc.name    BreakpointDialogStateManagerValidation020
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0210
     * @tc.name    BreakpointDialogStateManagerValidation021
     * @tc.desc    Clamping preserves legal widths and never returns a negative value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const raw: number[] = [-100, -1, 0, 319, 320, 599, 600, 839, 840, 2000];
      for (let k = 0; k < raw.length; k++) {
        const clamped: number = m.clampWidth(raw[k]);
        expect(clamped >= 0).assertEqual(true);
        if (raw[k] >= 0) {
          expect(clamped).assertEqual(raw[k]);
        }
        expect(m.resolve(clamped).length).assertLarger(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0220
     * @tc.name    BreakpointDialogStateManagerValidation022
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0230
     * @tc.name    BreakpointDialogStateManagerValidation023
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0240
     * @tc.name    BreakpointDialogStateManagerValidation024
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0250
     * @tc.name    BreakpointDialogStateManagerValidation025
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0260
     * @tc.name    BreakpointDialogStateManagerValidation026
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0270
     * @tc.name    BreakpointDialogStateManagerValidation027
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0280
     * @tc.name    BreakpointDialogStateManagerValidation028
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0290
     * @tc.name    BreakpointDialogStateManagerValidation029
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0300
     * @tc.name    BreakpointDialogStateManagerValidation030
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0310
     * @tc.name    BreakpointDialogStateManagerValidation031
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0320
     * @tc.name    BreakpointDialogStateManagerValidation032
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0330
     * @tc.name    BreakpointDialogStateManagerValidation033
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0340
     * @tc.name    BreakpointDialogStateManagerValidation034
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0350
     * @tc.name    BreakpointDialogStateManagerValidation035
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0360
     * @tc.name    BreakpointDialogStateManagerValidation036
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0370
     * @tc.name    BreakpointDialogStateManagerValidation037
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0380
     * @tc.name    BreakpointDialogStateManagerValidation038
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0390
     * @tc.name    BreakpointDialogStateManagerValidation039
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0400
     * @tc.name    BreakpointDialogStateManagerValidation040
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0410
     * @tc.name    BreakpointDialogStateManagerValidation041
     * @tc.desc    Breakpoint thresholds are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isThresholdAscending()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0420
     * @tc.name    BreakpointDialogStateManagerValidation042
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0430
     * @tc.name    BreakpointDialogStateManagerValidation043
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0440
     * @tc.name    BreakpointDialogStateManagerValidation044
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0450
     * @tc.name    BreakpointDialogStateManagerValidation045
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0460
     * @tc.name    BreakpointDialogStateManagerValidation046
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0470
     * @tc.name    BreakpointDialogStateManagerValidation047
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0480
     * @tc.name    BreakpointDialogStateManagerValidation048
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0490
     * @tc.name    BreakpointDialogStateManagerValidation049
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0500
     * @tc.name    BreakpointDialogStateManagerValidation050
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0510
     * @tc.name    BreakpointDialogStateManagerValidation051
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0520
     * @tc.name    BreakpointDialogStateManagerValidation052
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0530
     * @tc.name    BreakpointDialogStateManagerValidation053
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0540
     * @tc.name    BreakpointDialogStateManagerValidation054
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0550
     * @tc.name    BreakpointDialogStateManagerValidation055
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0560
     * @tc.name    BreakpointDialogStateManagerValidation056
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0570
     * @tc.name    BreakpointDialogStateManagerValidation057
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0580
     * @tc.name    BreakpointDialogStateManagerValidation058
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0590
     * @tc.name    BreakpointDialogStateManagerValidation059
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0600
     * @tc.name    BreakpointDialogStateManagerValidation060
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0610
     * @tc.name    BreakpointDialogStateManagerValidation061
     * @tc.desc    Breakpoint thresholds are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isThresholdAscending()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0620
     * @tc.name    BreakpointDialogStateManagerValidation062
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0630
     * @tc.name    BreakpointDialogStateManagerValidation063
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0640
     * @tc.name    BreakpointDialogStateManagerValidation064
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0650
     * @tc.name    BreakpointDialogStateManagerValidation065
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0660
     * @tc.name    BreakpointDialogStateManagerValidation066
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0670
     * @tc.name    BreakpointDialogStateManagerValidation067
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0680
     * @tc.name    BreakpointDialogStateManagerValidation068
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0690
     * @tc.name    BreakpointDialogStateManagerValidation069
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0700
     * @tc.name    BreakpointDialogStateManagerValidation070
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0710
     * @tc.name    BreakpointDialogStateManagerValidation071
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0720
     * @tc.name    BreakpointDialogStateManagerValidation072
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0730
     * @tc.name    BreakpointDialogStateManagerValidation073
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0740
     * @tc.name    BreakpointDialogStateManagerValidation074
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0750
     * @tc.name    BreakpointDialogStateManagerValidation075
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0760
     * @tc.name    BreakpointDialogStateManagerValidation076
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0770
     * @tc.name    BreakpointDialogStateManagerValidation077
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0780
     * @tc.name    BreakpointDialogStateManagerValidation078
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0790
     * @tc.name    BreakpointDialogStateManagerValidation079
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0800
     * @tc.name    BreakpointDialogStateManagerValidation080
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0810
     * @tc.name    BreakpointDialogStateManagerValidation081
     * @tc.desc    Breakpoint thresholds are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isThresholdAscending()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0820
     * @tc.name    BreakpointDialogStateManagerValidation082
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0830
     * @tc.name    BreakpointDialogStateManagerValidation083
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0840
     * @tc.name    BreakpointDialogStateManagerValidation084
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0850
     * @tc.name    BreakpointDialogStateManagerValidation085
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0860
     * @tc.name    BreakpointDialogStateManagerValidation086
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0870
     * @tc.name    BreakpointDialogStateManagerValidation087
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0880
     * @tc.name    BreakpointDialogStateManagerValidation088
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0890
     * @tc.name    BreakpointDialogStateManagerValidation089
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0900
     * @tc.name    BreakpointDialogStateManagerValidation090
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0910
     * @tc.name    BreakpointDialogStateManagerValidation091
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0920
     * @tc.name    BreakpointDialogStateManagerValidation092
     * @tc.desc    Extra unregister never drives listener count negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const base: number = m.getListenerCount();
      m.unregister();
      expect(m.getListenerCount()).assertEqual(base);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0930
     * @tc.name    BreakpointDialogStateManagerValidation093
     * @tc.desc    Breakpoint names follow xs/sm/md/lg order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const names: string[] = m.getBreakpointNames();
      expect(names[0]).assertEqual('xs');
      expect(names[3]).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0940
     * @tc.name    BreakpointDialogStateManagerValidation094
     * @tc.desc    Breakpoint definition table has four entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.getDefinitions().length).assertEqual(4);
      expect(m.getDefinitions()[0].size).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0950
     * @tc.name    BreakpointDialogStateManagerValidation095
     * @tc.desc    Breakpoint history forms a linked from/to chain
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(0);
      m.applyWidth(500);
      m.applyWidth(700);
      const h = m.getHistory();
      for (let k = 1; k < h.length; k++) {
        expect(h[k].from).assertEqual(h[k - 1].to);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0960
     * @tc.name    BreakpointDialogStateManagerValidation096
     * @tc.desc    Same-tier width changes raise no change event
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.clearHistory();
      m.applyWidth(700);
      const c0: number = m.getChangeCount();
      m.clearHistory();
      m.applyWidth(700);
      const c1: number = m.getChangeCount();
      expect(c1).assertEqual(0);
      expect(c0 >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0970
     * @tc.name    BreakpointDialogStateManagerValidation097
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0980
     * @tc.name    BreakpointDialogStateManagerValidation098
     * @tc.desc    MD breakpoint range is [600, 840)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('md');
      expect(r[0]).assertEqual(600);
      expect(r[1]).assertEqual(840);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0990
     * @tc.name    BreakpointDialogStateManagerValidation099
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1000
     * @tc.name    BreakpointDialogStateManagerValidation100
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointDialogStateManagerValidation100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

