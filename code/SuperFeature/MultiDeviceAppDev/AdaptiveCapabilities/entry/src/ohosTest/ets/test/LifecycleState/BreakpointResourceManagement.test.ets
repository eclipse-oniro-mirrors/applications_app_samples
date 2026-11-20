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

export default function breakpointResourceManagementSuite() {
  describe('BreakpointResourceManagementSuite', () => {
    let m: BreakpointModel = new BreakpointModel();

    beforeEach(() => {
      m = new BreakpointModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0100
     * @tc.name    BreakpointResourceManagement001
     * @tc.desc    Width 0vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(0)).assertEqual('xs');
      m.applyWidth(0);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0200
     * @tc.name    BreakpointResourceManagement002
     * @tc.desc    Width 1vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1)).assertEqual('xs');
      m.applyWidth(1);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0300
     * @tc.name    BreakpointResourceManagement003
     * @tc.desc    Each breakpoint definition resolves to itself and owns its lower bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement003', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0400
     * @tc.name    BreakpointResourceManagement004
     * @tc.desc    Width 319vp resolves to breakpoint xs
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(319)).assertEqual('xs');
      m.applyWidth(319);
      expect(m.getCurrent()).assertEqual('xs');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0500
     * @tc.name    BreakpointResourceManagement005
     * @tc.desc    Width 320vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(320)).assertEqual('sm');
      m.applyWidth(320);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0600
     * @tc.name    BreakpointResourceManagement006
     * @tc.desc    Adjacent breakpoint ranges share a boundary with no gaps
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement006', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0700
     * @tc.name    BreakpointResourceManagement007
     * @tc.desc    Width 480vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(480)).assertEqual('sm');
      m.applyWidth(480);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0800
     * @tc.name    BreakpointResourceManagement008
     * @tc.desc    Width 599vp resolves to breakpoint sm
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(599)).assertEqual('sm');
      m.applyWidth(599);
      expect(m.getCurrent()).assertEqual('sm');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_0900
     * @tc.name    BreakpointResourceManagement009
     * @tc.desc    Columns gutter margin and font never decrease as breakpoint grows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement009', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1000
     * @tc.name    BreakpointResourceManagement010
     * @tc.desc    Width 601vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(601)).assertEqual('md');
      m.applyWidth(601);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1100
     * @tc.name    BreakpointResourceManagement011
     * @tc.desc    Width 720vp resolves to breakpoint md
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(720)).assertEqual('md');
      m.applyWidth(720);
      expect(m.getCurrent()).assertEqual('md');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1200
     * @tc.name    BreakpointResourceManagement012
     * @tc.desc    History forms a linked chain with strictly increasing sequence numbers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement012', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1300
     * @tc.name    BreakpointResourceManagement013
     * @tc.desc    Width 840vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(840)).assertEqual('lg');
      m.applyWidth(840);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1400
     * @tc.name    BreakpointResourceManagement014
     * @tc.desc    Width 841vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(841)).assertEqual('lg');
      m.applyWidth(841);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1500
     * @tc.name    BreakpointResourceManagement015
     * @tc.desc    Five register and five unregister calls leave zero listeners
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement015', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1600
     * @tc.name    BreakpointResourceManagement016
     * @tc.desc    Width 1440vp resolves to breakpoint lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.resolve(1440)).assertEqual('lg');
      m.applyWidth(1440);
      expect(m.getCurrent()).assertEqual('lg');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1700
     * @tc.name    BreakpointResourceManagement017
     * @tc.desc    SM breakpoint range is [320, 600)
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('sm');
      expect(r[0]).assertEqual(320);
      expect(r[1]).assertEqual(600);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1800
     * @tc.name    BreakpointResourceManagement018
     * @tc.desc    Wider breakpoints produce narrower individual columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const wide: number = m.columnWidth(1440, 'lg');
      const narrow: number = m.columnWidth(1440, 'sm');
      expect(wide > 0).assertEqual(true);
      expect(narrow > 0).assertEqual(true);
      expect(wide < narrow).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_1900
     * @tc.name    BreakpointResourceManagement019
     * @tc.desc    LG breakpoint range has open upper bound
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('lg');
      expect(r[0]).assertEqual(840);
      expect(r[1]).assertEqual(Number.MAX_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2000
     * @tc.name    BreakpointResourceManagement020
     * @tc.desc    Unknown breakpoint returns negative range
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      const r: number[] = m.rangeOf('nope');
      expect(r[0]).assertEqual(-1);
      expect(r[1]).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2100
     * @tc.name    BreakpointResourceManagement021
     * @tc.desc    Clamping preserves legal widths and never returns a negative value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement021', 0, async () => {
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
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2200
     * @tc.name    BreakpointResourceManagement022
     * @tc.desc    Layout profiles grow monotonically with breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isProfileMonotonic()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2300
     * @tc.name    BreakpointResourceManagement023
     * @tc.desc    XS profile uses 2 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('xs').columns).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2400
     * @tc.name    BreakpointResourceManagement024
     * @tc.desc    LG profile uses 12 columns
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.profileOf('lg').columns).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2500
     * @tc.name    BreakpointResourceManagement025
     * @tc.desc    Negative width clamps to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(-1)).assertEqual(0);
      expect(m.clampWidth(-999)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2600
     * @tc.name    BreakpointResourceManagement026
     * @tc.desc    Non-negative width is preserved by clamp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.clampWidth(0)).assertEqual(0);
      expect(m.clampWidth(1440)).assertEqual(1440);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2700
     * @tc.name    BreakpointResourceManagement027
     * @tc.desc    Widths 500 and 599 share the same breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(500, 599)).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2800
     * @tc.name    BreakpointResourceManagement028
     * @tc.desc    Widths 599 and 600 differ in breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.isSameBreakpoint(599, 600)).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_2900
     * @tc.name    BreakpointResourceManagement029
     * @tc.desc    LG column width is positive at 1000vp
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(1000, 'lg') > 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3000
     * @tc.name    BreakpointResourceManagement030
     * @tc.desc    Column width never becomes negative
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      expect(m.columnWidth(10, 'lg') >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_BREAKPOINT_3100
     * @tc.name    BreakpointResourceManagement031
     * @tc.desc    Register and unregister calls stay balanced
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('BreakpointResourceManagement031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      m.register();
      m.register();
      m.unregister();
      m.unregister();
      expect(m.isListenerBalanced()).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

